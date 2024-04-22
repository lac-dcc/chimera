library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

library work;
use work.zpu_config.all;
use work.zpuino_config.all;
use work.zpuinopkg.all;
use work.zpupkg.all;
use work.wishbonepkg.all;

entity memctrl_wb is
  generic (
    C3_NUM_DQ_PINS          : integer := 16;
    C3_MEM_ADDR_WIDTH       : integer := 13; 
    C3_MEM_BANKADDR_WIDTH   : integer := 2
  );
  port (
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;

    wb_dat_o: out std_logic_vector(31 downto 0);
    wb_dat_i: in std_logic_vector(31 downto 0);
    wb_adr_i: in std_logic_vector(maxIOBit downto minIOBit);
    wb_we_i:  in std_logic;
    wb_cyc_i: in std_logic;
    wb_stb_i: in std_logic;
    wb_sel_i: in std_logic_vector(3 downto 0);
    wb_cti_i: in std_logic_vector(2 downto 0);
    wb_bte_i: in std_logic_vector(1 downto 0);
    wb_ack_o: out std_logic;
    wb_stall_o: out std_logic;

    mcb3_dram_dq                            : inout  std_logic_vector(C3_NUM_DQ_PINS-1 downto 0);
    mcb3_dram_a                             : out std_logic_vector(C3_MEM_ADDR_WIDTH-1 downto 0);
    mcb3_dram_ba                            : out std_logic_vector(C3_MEM_BANKADDR_WIDTH-1 downto 0);
    mcb3_dram_cke                           : out std_logic;
    mcb3_dram_ras_n                         : out std_logic;
    mcb3_dram_cas_n                         : out std_logic;
    mcb3_dram_we_n                          : out std_logic;
    mcb3_dram_dm                            : out std_logic;
    mcb3_dram_udqs                          : inout  std_logic;
    mcb3_rzq                                : inout  std_logic;
    mcb3_dram_udm                           : out std_logic;
    mcb3_dram_dqs                           : inout  std_logic;
    mcb3_dram_ck                            : out std_logic;
    mcb3_dram_ck_n                          : out std_logic;

    clkin:  in std_logic;
    rstin:  in std_logic;
    clkout: out std_logic;
    --clk1out:out std_logic;
    rstout: out std_logic
  );
end entity memctrl_wb;

architecture rtl of memctrl_wb is

  component memctrl is
  generic
  (
            C3_P0_MASK_SIZE           : integer := 4;
          C3_P0_DATA_PORT_SIZE      : integer := 32;
          C3_P1_MASK_SIZE           : integer := 4;
          C3_P1_DATA_PORT_SIZE      : integer := 32;
    C3_MEMCLK_PERIOD        : integer := 5000; 
                                       -- Memory data transfer clock period.
    C3_RST_ACT_LOW          : integer := 0; 
                                       -- # = 1 for active low reset,
                                       -- # = 0 for active high reset.
    C3_INPUT_CLK_TYPE       : string := "SINGLE_ENDED"; 
                                       -- input clock type DIFFERENTIAL or SINGLE_ENDED.
    C3_CALIB_SOFT_IP        : string := "FALSE";
                                       -- # = TRUE, Enables the soft calibration logic,
                                       -- # = FALSE, Disables the soft calibration logic.
    C3_SIMULATION           : string := "TRUE";
                                       -- # = TRUE, Simulating the design. Useful to reduce the simulation time,
                                       -- # = FALSE, Implementing the design.
    DEBUG_EN                : integer := 0; 
                                       -- # = 1, Enable debug signals/controls,
                                       --   = 0, Disable debug signals/controls.
    C3_MEM_ADDR_ORDER       : string := "ROW_BANK_COLUMN"; 
                                       -- The order in which user address is provided to the memory controller,
                                       -- ROW_BANK_COLUMN or BANK_ROW_COLUMN.
    C3_NUM_DQ_PINS          : integer := 16; 
                                       -- External memory data width.
    C3_MEM_ADDR_WIDTH       : integer := 13; 
                                       -- External memory address width.
    C3_MEM_BANKADDR_WIDTH   : integer := 2 
                                       -- External memory bank address width.
  );
   
  port
  (

   mcb3_dram_dq                            : inout  std_logic_vector(C3_NUM_DQ_PINS-1 downto 0);
   mcb3_dram_a                             : out std_logic_vector(C3_MEM_ADDR_WIDTH-1 downto 0);
   mcb3_dram_ba                            : out std_logic_vector(C3_MEM_BANKADDR_WIDTH-1 downto 0);
   mcb3_dram_cke                           : out std_logic;
   mcb3_dram_ras_n                         : out std_logic;
   mcb3_dram_cas_n                         : out std_logic;
   mcb3_dram_we_n                          : out std_logic;
   mcb3_dram_dm                            : out std_logic;
   mcb3_dram_udqs                          : inout  std_logic;
   mcb3_rzq                                : inout  std_logic;
   mcb3_dram_udm                           : out std_logic;
   c3_sys_clk                              : in  std_logic;
   c3_sys_rst_i                            : in  std_logic;
   c3_calib_done                           : out std_logic;
   c3_clk0                                 : out std_logic;
   --c3_clk1                                 : out std_logic;
   c3_rst0                                 : out std_logic;
   mcb3_dram_dqs                           : inout  std_logic;
   mcb3_dram_ck                            : out std_logic;
   mcb3_dram_ck_n                          : out std_logic;
   c3_p0_cmd_clk                           : in std_logic;
   c3_p0_cmd_en                            : in std_logic;
   c3_p0_cmd_instr                         : in std_logic_vector(2 downto 0);
   c3_p0_cmd_bl                            : in std_logic_vector(5 downto 0);
   c3_p0_cmd_byte_addr                     : in std_logic_vector(29 downto 0);
   c3_p0_cmd_empty                         : out std_logic;
   c3_p0_cmd_full                          : out std_logic;
   c3_p0_wr_clk                            : in std_logic;
   c3_p0_wr_en                             : in std_logic;
   c3_p0_wr_mask                           : in std_logic_vector(C3_P0_MASK_SIZE - 1 downto 0);
   c3_p0_wr_data                           : in std_logic_vector(C3_P0_DATA_PORT_SIZE - 1 downto 0);
   c3_p0_wr_full                           : out std_logic;
   c3_p0_wr_empty                          : out std_logic;
   c3_p0_wr_count                          : out std_logic_vector(6 downto 0);
   c3_p0_wr_underrun                       : out std_logic;
   c3_p0_wr_error                          : out std_logic;
   c3_p0_rd_clk                            : in std_logic;
   c3_p0_rd_en                             : in std_logic;
   c3_p0_rd_data                           : out std_logic_vector(C3_P0_DATA_PORT_SIZE - 1 downto 0);
   c3_p0_rd_full                           : out std_logic;
   c3_p0_rd_empty                          : out std_logic;
   c3_p0_rd_count                          : out std_logic_vector(6 downto 0);
   c3_p0_rd_overflow                       : out std_logic;
   c3_p0_rd_error                          : out std_logic
  );
  end component;

  signal sysclk: std_logic;


  constant INSTR_NOP:     std_logic_vector(2 downto 0) := "000";
  constant INSTR_READ:    std_logic_vector(2 downto 0) := "001";
  constant INSTR_WRITE:   std_logic_vector(2 downto 0) := "010";
  constant INSTR_NONE:    std_logic_vector(2 downto 0) := "XXX";

  signal cmd_en: std_logic;
  signal cmd_full: std_logic;
  signal cmd_instr: std_logic_vector(2 downto 0);
  signal cmd_bl:  std_logic_vector(5 downto 0);
  signal cmd_addr: std_logic_vector(29 downto 0);

  signal wr_en: std_logic;
  signal wr_full: std_logic;
  signal wr_mask: std_logic_vector(3 downto 0);
  signal wr_data: std_logic_vector(31 downto 0);

  signal rd_en: std_logic;
  signal rd_empty: std_logic;
  signal rd_data: std_logic_vector(31 downto 0);

  type state_type is (
    IDLE,
    WRITE,
    WRITEPIPE,
    READ,
    READPIPE
  );

 -- constant READBURSTSIZE: std_logic_vector(5 downto 0) := "010000";

  type regs_type is record
    state: state_type;
    bl: std_logic_vector(5 downto 0);
    addr: std_logic_vector(29 downto 0);
  end record;

  signal r: regs_type;

begin

  clkout<=sysclk;

  ctrl: memctrl
  port map (
      c3_sys_clk      => clkin,
      c3_sys_rst_i    => rstin,
      c3_clk0         => sysclk,
--      c3_clk1         => clk1out,
      c3_rst0         => rstout,

      c3_p0_rd_clk    => sysclk,
      c3_p0_wr_clk    => sysclk,
      c3_p0_cmd_clk   => sysclk,

      c3_p0_cmd_en    => cmd_en,
      c3_p0_cmd_instr => cmd_instr,
      c3_p0_cmd_bl    => cmd_bl,
      c3_p0_cmd_byte_addr => cmd_addr,
      c3_p0_cmd_full  => cmd_full,

      c3_p0_wr_en     => wr_en,
      c3_p0_wr_mask   => wr_mask,
      c3_p0_wr_data   => wr_data,
      c3_p0_wr_full   => wr_full,

      c3_p0_rd_en     => rd_en,
      c3_p0_rd_data   => rd_data,
      c3_p0_rd_empty  => rd_empty,

      mcb3_dram_dq    =>      mcb3_dram_dq,
      mcb3_dram_a     =>      mcb3_dram_a,
      mcb3_dram_ba    =>      mcb3_dram_ba,
      mcb3_dram_cke   =>      mcb3_dram_cke,
      mcb3_dram_ras_n =>      mcb3_dram_ras_n,
      mcb3_dram_cas_n =>      mcb3_dram_cas_n,
      mcb3_dram_we_n  =>      mcb3_dram_we_n,
      mcb3_dram_dm    =>      mcb3_dram_dm,
      mcb3_dram_udqs  =>      mcb3_dram_udqs,
      mcb3_rzq        =>      mcb3_rzq,
      mcb3_dram_udm   =>      mcb3_dram_udm,
      mcb3_dram_dqs   =>      mcb3_dram_dqs,
      mcb3_dram_ck    =>      mcb3_dram_ck,
      mcb3_dram_ck_n  =>      mcb3_dram_ck_n

   );

  wr_data <= wb_dat_i;
  wb_dat_o <= rd_data;
  wr_mask <= not wb_sel_i;

  process(sysclk,
    wb_cyc_i, wb_adr_i, wb_stb_i, wb_adr_i, wb_cti_i,
    wr_full, rd_empty, r
  )
    variable canprocess: boolean;
    variable w: regs_type;
    variable bsize: std_logic_vector(5 downto 0);
  begin
    wr_en     <= '0';
    rd_en     <= '0';
    cmd_en    <= '0';
    cmd_addr  <= (others => 'X');
    cmd_bl    <= (others => 'X');
    cmd_instr <= INSTR_NONE;

    wb_stall_o <= '0';
    wb_ack_o <= '0';
    w := r;

    case r.state is
      when IDLE =>
        if wb_cyc_i='1' and wb_stb_i='1' then
          if wb_we_i='1' then
            if wr_full='1' then
              wb_stall_o<='1';
            else
              w.addr := (others => '0');
              w.addr(wb_adr_i'HIGH downto 2) := wb_adr_i(wb_adr_i'HIGH downto 2);
              wr_en <= '1';

              -- Dispatch
              case wb_cti_i is
                when CTI_CYCLE_INCRADDR =>
                  w.state := WRITEPIPE;
                  w.bl := (others => '0');
                when others =>
                  w.state := WRITE;
              end case;

            end if;
          else
            -- Read process
            wb_stall_o <= cmd_full;

            cmd_en <= '1';
            cmd_instr <= INSTR_READ;
            cmd_addr <= (others => '0');
            cmd_addr(wb_adr_i'HIGH downto 2) <= wb_adr_i(wb_adr_i'HIGH downto 2);

            w.addr := (others => '0');
            w.addr(wb_adr_i'HIGH downto 2) := wb_adr_i(wb_adr_i'HIGH downto 2);

            case wb_cti_i is
              when CTI_CYCLE_INCRADDR =>
                if cmd_full='0' then
                  w.state := READPIPE;
                end if;
                case wb_bte_i is
                  when BTE_BURST_LINEAR =>
                    bsize := "000000";
                  when BTE_BURST_4BEATWRAP => bsize := "000011";
                  when BTE_BURST_8BEATWRAP => bsize := "000111";
                  when BTE_BURST_16BEATWRAP => bsize := "001111";
                  when others => null;
                end case;
                cmd_bl <= bsize;
                w.bl := bsize;
              when others =>
                if cmd_full='0' then
                  w.state := READ;
                end if;
                cmd_bl <= "000000";
                w.bl := (others => 'X');
            end case;

          end if;
        end if;

      when READ =>
        -- Let requests come in ?!?!.
        wb_stall_o<='1';
        wb_ack_o <= not rd_empty;
        rd_en<='1';

        if rd_empty='0' then
          -- Only one request...
          w.state := IDLE;
        end if;

      when READPIPE =>
        -- Let requests come in ?!?!.
        wb_stall_o<='0';
        wb_ack_o <= not rd_empty;
        rd_en<='1';
        if rd_empty='0' then
          if r.bl="000000" then
            --wb_ack_o<='0';
            w.state := IDLE;
          else
            w.bl := std_logic_vector(unsigned(r.bl) - 1);
          end if;
        end if;

        -- TODO: Check for aborted requests.


      when WRITE =>
        wb_stall_o<='1';

        cmd_en  <='1';
        cmd_bl  <= "000000";
        cmd_instr <= INSTR_WRITE;
        cmd_addr <= r.addr;

        if cmd_full='0' then
          wb_ack_o<='1';
          w.state := IDLE;
        end if;

      when WRITEPIPE =>

        wb_stall_o <= '0'; -- FIFO can never be empty...

        -- This should use CTI end of burst
        wr_en <= wb_stb_i;

        if wb_cti_i = CTI_CYCLE_ENDOFBURST then
          -- Finished. Set up write command.
          cmd_en<='1';
          cmd_bl<=r.bl;
          cmd_instr<=INSTR_WRITE;
          w.state := IDLE;

        end if;
      

    end case;

    if rising_edge(sysclk) then
      r<=w;
    end if;

  end process;

end rtl;