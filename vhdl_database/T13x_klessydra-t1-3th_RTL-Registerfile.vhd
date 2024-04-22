----------------------------------------------------------------------------------------------------------------
--  Stage ID - (Instruction decode and registerfile read)                                                     --
--  Author(s): Abdallah Cheikh abdallah.cheikh@uniroma1.it (abdallah93.as@gmail.com)                          --
--                                                                                                            --
--  Date Modified: 07-04-2020                                                                                  --
----------------------------------------------------------------------------------------------------------------
--  Registerfiles of the incoming hart are read in this stage in parallel with the decoding                   --
--  Two types of registerfiles can be generaated for XILINX FPGAs LUTAM based or FF based dpeneding on the    --
--  setting of the generic variaabble chosen                                                                  --
--  The scratchpad memory mapper also exists in this stage, which maps the address to the corresponding SPM   --
--  This pipeline stage always takes one cycle latency                                                        --
----------------------------------------------------------------------------------------------------------------

-- ieee packages ------------
library ieee;
use ieee.math_real.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use std.textio.all;

-- local packages ------------
use work.riscv_klessydra.all;
--use work.klessydra_parameters.all;

-- pipeline  pinout --------------------
entity REGISTERFILE is
  generic(
    THREAD_POOL_SIZE           : integer;
    LUTRAM_RF                  : natural;
    accl_en                    : natural;
    SPM_NUM		               : natural;  
    Addr_Width                 : natural;
    SPM_STRT_ADDR              : std_logic_vector(31 downto 0);
    RF_SIZE                    : natural;
    RF_CEIL                    : natural;
    SPM_ADDR_WID               : natural
    );
  port (
    -- clock, reset active low
    clk_i                      : in  std_logic;
    rst_ni                     : in  std_logic;
	-- Branch Control Signals
	harc_ID                    : in  integer range THREAD_POOL_SIZE-1 downto 0;
    pc_ID                      : in  std_logic_vector(31 downto 0);  -- pc_ID is PC entering ID stage
	core_busy_IE               : in  std_logic;
	core_busy_LS               : in  std_logic;
    ls_parallel_exec           : in  std_logic;
    dsp_parallel_exec          : in  std_logic;
    dsp_to_jump                : in  std_logic;
    instr_rvalid_ID            : in  std_logic;
	instr_word_ID_lat          : in  std_logic_vector(31 downto 0);
	LS_WB_EN                   : in  std_logic;
	IE_WB_EN                   : in  std_logic;
	MUL_WB_EN                  : in  std_logic;
	IE_WB                      : in  std_logic_vector(31 downto 0);
	MUL_WB                     : in  std_logic_vector(31 downto 0);
	LS_WB                      : in  std_logic_vector(31 downto 0);
	instr_word_LS_WB           : in  std_logic_vector(31 downto 0);
	instr_word_IE_WB           : in  std_logic_vector(31 downto 0);
	harc_LS_WB                 : in  integer range THREAD_POOL_SIZE-1 downto 0;
	harc_IE_WB                 : in  integer range THREAD_POOL_SIZE-1 downto 0;
    RS1_Data_IE                : out std_logic_vector(31 downto 0);
    RS2_Data_IE                : out std_logic_vector(31 downto 0);
    RD_Data_IE                 : out std_logic_vector(31 downto 0);
    rs1_to_sc                  : out std_logic_vector(SPM_ADDR_WID-1 downto 0);
    rs2_to_sc                  : out std_logic_vector(SPM_ADDR_WID-1 downto 0);
    rd_to_sc                   : out std_logic_vector(SPM_ADDR_WID-1 downto 0);
    data_addr_internal_IE      : out std_logic_vector(31 downto 0);
	regfile                    : out array_3d(THREAD_POOL_SIZE-1 downto 0)(RF_SIZE-1 downto 0)(31 downto 0)
    );
end entity;  ------------------------------------------


-- Klessydra T03x (4 stages) pipeline implementation -----------------------
architecture RF of REGISTERFILE is

  subtype harc_range is integer range THREAD_POOL_SIZE - 1 downto 0;

  signal regfile_lutram_rs1  : array_2d((THREAD_POOL_SIZE*RF_SIZE)-1 downto 0)(31 downto 0);
  signal regfile_lutram_rs2  : array_2d((THREAD_POOL_SIZE*RF_SIZE)-1 downto 0)(31 downto 0);
  signal regfile_lutram_rd   : array_2d((THREAD_POOL_SIZE*RF_SIZE)-1 downto 0)(31 downto 0);

  attribute ram_style : string;
  attribute ram_style of RS1_Data_IE        : signal is "reg";
  attribute ram_style of RS2_Data_IE        : signal is "reg";
  attribute ram_style of RD_Data_IE         : signal is "reg";
  attribute ram_style of regfile_lutram_rs1 : signal is "distributed";
  attribute ram_style of regfile_lutram_rs2 : signal is "distributed";
  attribute ram_style of regfile_lutram_rd  : signal is "distributed";

  signal ID_rs1_to_sc           : std_logic_vector(SPM_ADDR_WID-1 downto 0);
  signal ID_rs2_to_sc           : std_logic_vector(SPM_ADDR_WID-1 downto 0);
  signal ID_rd_to_sc            : std_logic_vector(SPM_ADDR_WID-1 downto 0);

  -- instruction operands
  signal RS1_Addr_IE            : std_logic_vector(4 downto 0);   -- debugging signals
  signal RS2_Addr_IE            : std_logic_vector(4 downto 0);   -- debugging signals
  signal RD_Addr_IE             : std_logic_vector(4 downto 0);   -- debugging signals
  signal RD_EN                  : std_logic;
  signal WB_RD                  : std_logic_vector(31 downto 0);
  signal WB_EN                  : std_logic;
  signal harc_WB                : harc_range;
  signal instr_word_WB          : std_logic_vector(31 downto 0);

  function rs1 (signal instr : in std_logic_vector(31 downto 0)) return integer is
  begin
    return to_integer(unsigned(instr(15+(RF_CEIL-1) downto 15)));
  end;

  function rs2 (signal instr : in std_logic_vector(31 downto 0)) return integer is
  begin
    return to_integer(unsigned(instr(20+(RF_CEIL-1) downto 20)));
  end;

  function rd (signal instr : in std_logic_vector(31 downto 0)) return integer is
  begin
    return to_integer(unsigned(instr(7+(RF_CEIL-1) downto 7)));
  end;

begin

  RF_FF : if LUTRAM_RF = 0 generate

  RF_ACCESS : process(clk_i, rst_ni, instr_word_ID_lat)  -- synch single state process
  begin
    if rst_ni = '0' then
      for h in harc_range loop
        regfile(h)(0) <= (others => '0');
      end loop;
    elsif rising_edge(clk_i) then
      if core_busy_IE = '1' or core_busy_LS = '1' or ls_parallel_exec = '0'  or dsp_parallel_exec = '0' then -- the instruction pipeline is halted
      elsif instr_rvalid_ID = '0' then -- wait for a valid instruction
      else  -- process the incoming instruction 

        data_addr_internal_IE <= std_logic_vector(signed(regfile(harc_ID)(rs1(instr_word_ID_lat))) + signed(S_immediate(instr_word_ID_lat)));

        ------------------------------------------------------------
        --  ██████╗ ███████╗ ██████╗ ███████╗██╗██╗     ███████╗  --
        --  ██╔══██╗██╔════╝██╔════╝ ██╔════╝██║██║     ██╔════╝  --
        --  ██████╔╝█████╗  ██║  ███╗█████╗  ██║██║     █████╗    --
        --  ██╔══██╗██╔══╝  ██║   ██║██╔══╝  ██║██║     ██╔══╝    --
        --  ██║  ██║███████╗╚██████╔╝██║     ██║███████╗███████╗  --
        --  ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚══════╝  --
        ------------------------------------------------------------

        ----- REGISTERFILE READ IS DONE HERE --------------------------------------------------------------------------------------------------------------
        RS1_Data_IE <= regfile(harc_ID)(rs1(instr_word_ID_lat));
        RS2_Data_IE <= regfile(harc_ID)(rs2(instr_word_ID_lat));
        if accl_en = 1 then
          if dsp_to_jump = '0' then
            RD_Data_IE <= regfile(harc_ID)(rd(instr_word_ID_lat)); -- only the DSP unit reads the accelerator
          else
            RD_Data_IE <= regfile(harc_ID)(0);
          end if;
        end if;
       -- pragma translate_off
        RD_Data_IE  <= regfile(harc_ID)(rd(instr_word_ID_lat)); -- reading the 'rd' data here is only for debugging purposes if the acclerator is disabled
        RS1_Addr_IE <= std_logic_vector(to_unsigned(rs1(instr_word_ID_lat), 5)); -- debugging signals
        RS2_Addr_IE <= std_logic_vector(to_unsigned(rs2(instr_word_ID_lat), 5)); -- debugging signals
        RD_Addr_IE  <= std_logic_vector(to_unsigned(rd(instr_word_ID_lat), 5)); -- debugging signals
       -- pragma translate_on
       ----------------------------------------------------------------------------------------------------------------------------------------------------
      end if;  -- instr. conditions

      if WB_EN = '1' then
        regfile(harc_WB)(rd(instr_word_WB)) <= WB_RD;
      end if;
    end if;  -- clk
  end process;

  end generate;

  RF_LUTRAM : if LUTRAM_RF = 1 generate

  RF_RD_EN : process(all)  -- synch single state process
  begin
    RD_EN <= '0';
    if core_busy_IE = '1' or core_busy_LS = '1' or ls_parallel_exec = '0'  or dsp_parallel_exec = '0' then -- the instruction pipeline is halted
    elsif instr_rvalid_ID = '0' then -- wait for a valid instruction
    else  -- process the incoming instruction 
      RD_EN <= '1';
    end if;  -- instr. conditions
  end process;

  RS1_ACCESS : process(clk_i)  -- synch single state process
  begin
    if rising_edge(clk_i) then
      if RD_EN = '1' then 
        data_addr_internal_IE <= std_logic_vector(signed(regfile_lutram_rs1(32*harc_ID+rs1(instr_word_ID_lat))) + signed(S_immediate(instr_word_ID_lat)));
        if rs1(instr_word_ID_lat) /= 0 then
          RS1_Data_IE <= regfile_lutram_rs1(32*harc_ID+rs1(instr_word_ID_lat));
        else
          RS1_Data_IE <= (others => '0');
        end if;
      -- pragma translate_off
       RD_Data_IE  <= regfile_lutram_rs1(32*harc_ID+rd(instr_word_ID_lat)); -- reading the 'rd' data here is only for debugging purposes when the acclerator is disabled
       RS1_Addr_IE <= std_logic_vector(to_unsigned(rs1(instr_word_ID_lat), 5)); -- debugging signals
       RS2_Addr_IE <= std_logic_vector(to_unsigned(rs2(instr_word_ID_lat), 5)); -- debugging signals
       RD_Addr_IE  <= std_logic_vector(to_unsigned(rd(instr_word_ID_lat), 5)); -- debugging signals
      -- pragma translate_on
      end if;  -- instr. conditions
      if WB_EN = '1' then
        regfile_lutram_rs1(32*harc_WB+rd(instr_word_WB)) <= WB_RD;
      end if;
    end if;  -- clk
  end process;

  RS2_ACCESS : process(clk_i)  -- synch single state process
  begin
    if rising_edge(clk_i) then
      if RD_EN = '1' then 
        if rs2(instr_word_ID_lat) /= 0 then
          RS2_Data_IE <= regfile_lutram_rs2(32*harc_ID+rs2(instr_word_ID_lat));
        else
          RS2_Data_IE <= (others => '0');
        end if;
      end if;  -- instr. conditions
      if WB_EN = '1' then
        regfile_lutram_rs2(32*harc_WB+rd(instr_word_WB)) <= WB_RD;
      end if;
    end if;  -- clk
  end process;

  RD_LUTRAM : if accl_en = 1 generate
  RD_ACCESS : process(clk_i)  -- synch single state process
  begin
    if rising_edge(clk_i) then
      if accl_en = 1 then
        if RD_EN = '1' then
          RD_Data_IE <= regfile_lutram_rd(32*harc_ID+rd(instr_word_ID_lat)); -- only the DSP unit reads the accelerator
        end if;  -- instr. conditions
      end if;
      if WB_EN = '1' then
        regfile_lutram_rd(32*harc_WB+rd(instr_word_WB)) <= WB_RD;
      end if;
    end if;  -- clk
  end process;

  end generate;
  end generate;
-----------------------------------------------------------------------------------------------------
-- Stage WB - (WRITEBACK)
-----------------------------------------------------------------------------------------------------

  harc_WB <= harc_LS_WB when LS_WB_EN = '1' else harc_IE_WB;
  instr_word_WB <= instr_word_LS_WB when LS_WB_EN = '1' else instr_word_IE_WB when (IE_WB_EN = '1' or MUL_WB_EN = '1') else (others => '0');
  WB_EN <= '1' when (LS_WB_EN = '1' or IE_WB_EN = '1' or MUL_WB_EN = '1') else '0';
  WB_RD <= IE_WB when IE_WB_EN = '1' else LS_WB when LS_WB_EN = '1' else MUL_WB when MUL_WB_EN = '1' else (others => '0');  

--------------------------------------------------------------------- end of WB Stage ----------------
------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
--  ███████╗██████╗ ███╗   ███╗    ███╗   ███╗ █████╗ ██████╗ ██████╗ ███████╗██████╗   --
--  ██╔════╝██╔══██╗████╗ ████║    ████╗ ████║██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗  --
--  ███████╗██████╔╝██╔████╔██║    ██╔████╔██║███████║██████╔╝██████╔╝█████╗  ██████╔╝  --
--  ╚════██║██╔═══╝ ██║╚██╔╝██║    ██║╚██╔╝██║██╔══██║██╔═══╝ ██╔═══╝ ██╔══╝  ██╔══██╗  --
--  ███████║██║     ██║ ╚═╝ ██║    ██║ ╚═╝ ██║██║  ██║██║     ██║     ███████╗██║  ██║  --
--  ╚══════╝╚═╝     ╚═╝     ╚═╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝     ╚══════╝╚═╝  ╚═╝  --
------------------------------------------------------------------------------------------                                                           

  spm_mapper : if accl_en = 1 generate 
  RF_FF : if LUTRAM_RF = 0 generate
  Spm_Addr_Mapping : process(all)
  begin
  ID_rs1_to_sc <= std_logic_vector(to_unsigned(SPM_NUM, SPM_ADDR_WID));  -- we assign SPM_NUM to rs1_to_sc as a default case which is out of range (0 to SPM_NUM-1)
  ID_rs2_to_sc <= std_logic_vector(to_unsigned(SPM_NUM, SPM_ADDR_WID));  -- we assign SPM_NUM to rs2_to_sc as a default case which is out of range (0 to SPM_NUM-1)
  ID_rd_to_sc  <= std_logic_vector(to_unsigned(SPM_NUM, SPM_ADDR_WID));  -- we assign SPM_NUM to rd_to_sc  as a default case which is out of range (0 to SPM_NUM-1)
    for i in 0 to SPM_NUM-1 loop -- Decode the address and assign and set the scratchpad number (0 to SPM_NUM-1) to the operand
      if regfile(harc_ID)(rs1(instr_word_ID_lat))(31 downto Addr_Width) >= std_logic_vector(unsigned(SPM_STRT_ADDR(31 downto Addr_Width)) + (i)) and
         regfile(harc_ID)(rs1(instr_word_ID_lat))(31 downto Addr_Width) <  std_logic_vector(unsigned(SPM_STRT_ADDR(31 downto Addr_Width)) + (i+1)) then
        ID_rs1_to_sc <= std_logic_vector(to_unsigned(i, SPM_ADDR_WID));
      end if;
      if regfile(harc_ID)(rs2(instr_word_ID_lat))(31 downto Addr_Width) >= std_logic_vector(unsigned(SPM_STRT_ADDR(31 downto Addr_Width)) + (i)) and
         regfile(harc_ID)(rs2(instr_word_ID_lat))(31 downto Addr_Width) <  std_logic_vector(unsigned(SPM_STRT_ADDR(31 downto Addr_Width)) + (i+1)) then
        ID_rs2_to_sc <= std_logic_vector(to_unsigned(i, SPM_ADDR_WID));
      end if;
      if regfile(harc_ID)(rd(instr_word_ID_lat))(31 downto Addr_Width)  >= std_logic_vector(unsigned(SPM_STRT_ADDR(31 downto Addr_Width)) + (i)) and
         regfile(harc_ID)(rd(instr_word_ID_lat))(31 downto Addr_Width)  <  std_logic_vector(unsigned(SPM_STRT_ADDR(31 downto Addr_Width)) + (i+1)) then
        ID_rd_to_sc <= std_logic_vector(to_unsigned(i, SPM_ADDR_WID));
      end if;
    end loop;
  end process;
  end generate;
  
  RF_LUTRAM : if LUTRAM_RF = 1 generate
  Spm_Addr_Mapping : process(all)
  begin
  ID_rs1_to_sc <= std_logic_vector(to_unsigned(SPM_NUM, SPM_ADDR_WID));  -- we assign SPM_NUM to rs1_to_sc as a default case which is out of range (0 to SPM_NUM-1)
  ID_rs2_to_sc <= std_logic_vector(to_unsigned(SPM_NUM, SPM_ADDR_WID));  -- we assign SPM_NUM to rs2_to_sc as a default case which is out of range (0 to SPM_NUM-1)
  ID_rd_to_sc  <= std_logic_vector(to_unsigned(SPM_NUM, SPM_ADDR_WID));  -- we assign SPM_NUM to rd_to_sc  as a default case which is out of range (0 to SPM_NUM-1)
    for i in 0 to SPM_NUM-1 loop -- Decode the address and assign and set the scratchpad number (0 to SPM_NUM-1) to the operand
      if regfile_lutram_rs1(32*harc_ID+rs1(instr_word_ID_lat))(31 downto Addr_Width) >= std_logic_vector(unsigned(SPM_STRT_ADDR(31 downto Addr_Width)) + (i)) and
         regfile_lutram_rs1(32*harc_ID+rs1(instr_word_ID_lat))(31 downto Addr_Width) <  std_logic_vector(unsigned(SPM_STRT_ADDR(31 downto Addr_Width)) + (i+1)) then
        ID_rs1_to_sc <= std_logic_vector(to_unsigned(i, SPM_ADDR_WID));
      end if;
      if regfile_lutram_rs2(32*harc_ID+rs2(instr_word_ID_lat))(31 downto Addr_Width) >= std_logic_vector(unsigned(SPM_STRT_ADDR(31 downto Addr_Width)) + (i)) and
         regfile_lutram_rs2(32*harc_ID+rs2(instr_word_ID_lat))(31 downto Addr_Width) <  std_logic_vector(unsigned(SPM_STRT_ADDR(31 downto Addr_Width)) + (i+1)) then
        ID_rs2_to_sc <= std_logic_vector(to_unsigned(i, SPM_ADDR_WID));
      end if;
      if regfile_lutram_rd(32*harc_ID+rd(instr_word_ID_lat))(31 downto Addr_Width)  >= std_logic_vector(unsigned(SPM_STRT_ADDR(31 downto Addr_Width)) + (i)) and
         regfile_lutram_rd(32*harc_ID+rd(instr_word_ID_lat))(31 downto Addr_Width)  <  std_logic_vector(unsigned(SPM_STRT_ADDR(31 downto Addr_Width)) + (i+1)) then
        ID_rd_to_sc <= std_logic_vector(to_unsigned(i, SPM_ADDR_WID));
      end if;
    end loop;
  end process;
  end generate;

  Spm_Addr_Mapping_Synch : process(clk_i, rst_ni)
  begin
    if rst_ni = '0' then
    elsif rising_edge(clk_i) then
      rs1_to_sc <= ID_rs1_to_sc;
      rs2_to_sc <= ID_rs2_to_sc;
      rd_to_sc  <= ID_rd_to_sc;
    end if;
  end process;
  
  end generate;

---------------------------------------------------------------------- end of ID stage -----------
--------------------------------------------------------------------------------------------------
end RF;
--------------------------------------------------------------------------------------------------
-- END of ID architecture ------------------------------------------------------------------------
-----------