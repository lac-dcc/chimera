----------------------------------------------------------------------------------------------------------------
--  Stage ID - (Instruction decode and registerfile read)                                                     --
--  Author(s): Abdallah Cheikh abdallah.cheikh@uniroma1.it (abdallah93.as@gmail.com)                          --
--                                                                                                            --
--  Date Modified: 07-04-2020                                                                                 --
----------------------------------------------------------------------------------------------------------------
--  Does operation decoding, and issues the result in a one-hot decoding form to the next stage               --
--  In this stage we detect based on the incoming instruction whether superscalar execution can be enabled.   --
--  This pipeline stage always takes one cycle latency                                                        --
----------------------------------------------------------------------------------------------------------------

-- package riscv_kless is new work.riscv_klessydra;

-- ieee packages ------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use std.textio.all;

-- local packages ------------
use work.riscv_klessydra.all;
--use work.riscv_kless.all;
--use work.klessydra_parameters.all;

-- pipeline  pinout --------------------
entity ID_STAGE is
  generic(
    THREAD_POOL_SIZE           : integer;
    RV32M                      : natural;
    superscalar_exec_en        : natural;
    accl_en                    : natural;
    replicate_accl_en          : natural;
    SPM_NUM		                 : natural;  
    Addr_Width                 : natural;
    SPM_STRT_ADDR              : std_logic_vector(31 downto 0);
    ACCL_NUM                   : natural;
    RF_SIZE                    : natural;
    RF_CEIL                    : natural;
    SPM_ADDR_WID               : natural
    );
  port (
	-- Branch Control Signals
    comparator_en              : out std_logic;
    ls_instr_req               : out std_logic;
    ie_instr_req               : out std_logic;
    dsp_instr_req              : out std_logic_vector(ACCL_NUM-1 downto 0);
    decoded_instruction_IE     : out std_logic_vector(EXEC_UNIT_INSTR_SET_SIZE-1 downto 0);
    decoded_instruction_LS     : out std_logic_vector(LS_UNIT_INSTR_SET_SIZE-1 downto 0);
    decoded_instruction_DSP    : out std_logic_vector(DSP_UNIT_INSTR_SET_SIZE-1 downto 0);
    data_be_ID                 : out std_logic_vector(3 downto 0);
    data_width_ID              : out std_logic_vector(1 downto 0);
    amo_store                  : in  std_logic;
    amo_load                   : out std_logic;
    amo_load_skip              : out std_logic;
    load_op                    : out std_logic;
    store_op                   : out std_logic;
    instr_word_IE              : out std_logic_vector(31 downto 0);
    harc_ID                    : in  integer range THREAD_POOL_SIZE-1 downto 0;
    pc_ID                      : in  std_logic_vector(31 downto 0);  -- pc_ID is PC entering ID stage
    core_busy_IE               : in  std_logic;
    core_busy_LS               : in  std_logic;
    busy_LS                    : in  std_logic;
    busy_DSP                   : in  std_logic_vector(ACCL_NUM-1 downto 0);
    busy_ID                    : out std_logic;
    ls_parallel_exec           : out std_logic;
    dsp_parallel_exec          : out std_logic;
    dsp_to_jump                : out std_logic;
    pc_IE                      : out std_logic_vector(31 downto 0);  -- pc_IE is pc entering stage IE ***
    instr_rvalid_ID            : in  std_logic; 
    instr_rvalid_IE            : out std_logic;  -- validity bit at IE input
    halt_IE                    : out std_logic;
    halt_LSU                   : out std_logic;
    instr_word_ID_lat          : in  std_logic_vector(31 downto 0);
    spm_rs1                    : out std_logic;
    spm_rs2                    : out std_logic;
    signed_op                  : out std_logic;
    harc_EXEC                  : out integer range THREAD_POOL_SIZE-1 downto 0;
    vec_read_rs1_ID            : out std_logic;
    vec_read_rs2_ID            : out std_logic;
    vec_write_rd_ID            : out std_logic;
    vec_width_ID               : out std_logic_vector(1 downto 0);
    -- clock, reset active low
    clk_i                      : in  std_logic;
    rst_ni                     : in  std_logic
    );
end entity;  ------------------------------------------


-- Klessydra T03x (4 stages) pipeline implementation -----------------------
architecture DECODE of ID_STAGE is

  subtype harc_range is integer range THREAD_POOL_SIZE - 1 downto 0;
  subtype accl_range is integer range ACCL_NUM - 1 downto 0; 

  signal harc_ID_to_DSP         : accl_range;
  signal dsp_instr_req_wire     : std_logic_vector(accl_range);
  -- instruction operands
  signal S_Imm_IE                : std_logic_vector(11 downto 0);  -- debugging signals
  signal I_Imm_IE                : std_logic_vector(11 downto 0);  -- debugging signals
  signal B_Imm_IE                : std_logic_vector(11 downto 0);  -- debugging signals
  signal CSR_ADDR_IE             : std_logic_vector(11 downto 0);  -- debugging signals

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

  fsm_ID_sync : process(clk_i, rst_ni, instr_word_ID_lat)  -- synch single state process
    variable OPCODE_wires  : std_logic_vector (6 downto 0);
    variable FUNCT3_wires  : std_logic_vector (2 downto 0);
    variable FUNCT7_wires  : std_logic_vector (6 downto 0);
    variable FUNCT12_wires : std_logic_vector (11 downto 0);
  begin
    OPCODE_wires  := OPCODE(instr_word_ID_lat);
    FUNCT3_wires  := FUNCT3(instr_word_ID_lat);
    FUNCT7_wires  := FUNCT7(instr_word_ID_lat);
    FUNCT12_wires := FUNCT12(instr_word_ID_lat);
    if rst_ni = '0' then
      pc_IE           <= (others => '0');
      harc_EXEC       <= 0;
      instr_rvalid_IE <= '0';
      ie_instr_req    <= '0';
      ls_instr_req    <= '0';
      comparator_en   <= '0'; 
    elsif rising_edge(clk_i) then
      ls_instr_req <= '0';
      ie_instr_req <= '0';
      if core_busy_IE = '1' or core_busy_LS = '1' or ls_parallel_exec = '0'  or dsp_parallel_exec = '0' then -- the instruction pipeline is halted
        halt_IE  <= '1';
        halt_LSU <= '1';
        instr_rvalid_IE <= '0';
      elsif instr_rvalid_ID = '0' then -- wait for a valid instruction
        instr_rvalid_IE <= '0';
        halt_IE  <= '0';
        halt_LSU <= '0';
      else  -- process the incoming instruction 
        halt_IE  <= '0';
        halt_LSU <= '0';
        instr_rvalid_IE  <= '1';
        if dsp_to_jump = '0' then
          instr_word_IE  <= instr_word_ID_lat;
        else
          instr_word_IE  <= x"0000_006F";
        end if;
        -- pc propagation
        pc_IE            <= pc_ID;
        -- harc propagation
        harc_EXEC        <= harc_ID;
        --S_Imm_IE           <= std_logic_vector(to_unsigned(S_immediate(instr_word_ID_lat), 12));
        --I_Imm_IE           <= std_logic_vector(to_unsigned(to_integer(unsigned(I_immediate(instr_word_ID_lat))), 12));
        --B_Imm_IE           <= std_logic_vector(to_unsigned(to_integer(unsigned(B_immediate(instr_word_ID_lat))), 12));
        --CSR_ADDR_IE        <= std_logic_vector(to_unsigned(to_integer(unsigned(CSR_ADDR(instr_word_ID_lat))), 12));

        comparator_en    <= '0';
        ie_instr_req     <= '0';
        amo_load_skip    <= '0';
        amo_load         <= '0';
        load_op          <= '0';
        store_op         <= '0';
        signed_op        <= '0';
        if accl_en = 1 then
          spm_rs1          <= '0';
          spm_rs2          <= '0';
          vec_write_rd_ID  <= '0';
          vec_read_rs1_ID  <= '0';
          vec_read_rs2_ID  <= '0';
          vec_width_ID     <= "00";
        end if;

        -----------------------------------------------------------------------------------------------------------
        --  ██╗███╗   ██╗███████╗████████╗██████╗     ██████╗ ███████╗ ██████╗ ██████╗ ██████╗ ███████╗██████╗   --
        --  ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗    ██╔══██╗██╔════╝██╔════╝██╔═══██╗██╔══██╗██╔════╝██╔══██╗  --
        --  ██║██╔██╗ ██║███████╗   ██║   ██████╔╝    ██║  ██║█████╗  ██║     ██║   ██║██║  ██║█████╗  ██████╔╝  --
        --  ██║██║╚██╗██║╚════██║   ██║   ██╔══██╗    ██║  ██║██╔══╝  ██║     ██║   ██║██║  ██║██╔══╝  ██╔══██╗  --
        --  ██║██║ ╚████║███████║   ██║   ██║  ██║    ██████╔╝███████╗╚██████╗╚██████╔╝██████╔╝███████╗██║  ██║  --
        --  ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝    ╚═════╝ ╚══════╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝  --
        -----------------------------------------------------------------------------------------------------------

        -- process the instruction
        -- read data from the operand registers
        -- Decode Starts here

        case OPCODE_wires is
			
          when OP_IMM =>
            ie_instr_req <= '1';
            if(rd(instr_word_ID_lat) /= 0) then
              case FUNCT3_wires is
                when ADDI =>            -- ADDI instruction
                  decoded_instruction_IE <= ADDI_pattern;
                when SLTI =>            -- SLTI instruction
                  decoded_instruction_IE <= SLTI_pattern;
                when SLTIU =>           -- SLTIU instruction
                  decoded_instruction_IE <= SLTIU_pattern;
                when ANDI =>            -- ANDI instruction
                  decoded_instruction_IE <= ANDI_pattern;
                when ORI =>             -- ORI instruction
                  decoded_instruction_IE <= ORI_pattern;
                when XORI =>            -- XORI instruction
                  decoded_instruction_IE <= XORI_pattern;
                when SLLI =>            -- SLLI instruction
                  decoded_instruction_IE <= SLLI_pattern;
                when SRLI_SRAI =>
                  case FUNCT7_wires is
                    when SRLI7 =>       -- SRLI instruction
                      decoded_instruction_IE <= SRLI7_pattern;
                    when SRAI7 =>       -- SRAI instruction
                      decoded_instruction_IE <= SRAI7_pattern;
                    when others =>  -- ILLEGAL_INSTRUCTION                                      
                      decoded_instruction_IE <= ILL_pattern;
                  end case;  -- FUNCT7_wires cases
                when others =>  -- ILLEGAL_INSTRUCTION                                  
                  decoded_instruction_IE <= ILL_pattern;
              end case;  -- FUNCT3_wires cases   
            else                -- R0_INSTRUCTION                             
              decoded_instruction_IE <= NOP_pattern;
            end if;  -- if rd(instr_word_ID_lat) /=0
				
          when LUI =>                   -- LUI instruction
            ie_instr_req <= '1';
            if (rd(instr_word_ID_lat) /= 0) then
              decoded_instruction_IE <= LUI_pattern;
            else                        -- R0_INSTRUCTION
              decoded_instruction_IE <= NOP_pattern;
            end if;
				
          when AUIPC =>                 -- AUIPC instruction
            ie_instr_req <= '1';
            if (rd(instr_word_ID_lat) /= 0) then
              decoded_instruction_IE <= AUIPC_pattern;
            else                        -- R0_INSTRUCTION
              decoded_instruction_IE <= NOP_pattern;
            end if;

          when OP =>
            ie_instr_req <= '1';
            if (rd(instr_word_ID_lat) /= 0) then
              case FUNCT7_wires is
                when OP_I1 =>
                  case FUNCT3_wires is
                    when ADD => --ADD instruction
                      decoded_instruction_IE <= ADD7_pattern;
                    when SLT =>             -- SLT instruction 
                      comparator_en <= '1';
                      decoded_instruction_IE <= SLT_pattern;
                    when SLTU =>            -- SLTU instruction
                      comparator_en <= '1';
                      decoded_instruction_IE <= SLTU_pattern;
                    when ANDD =>            -- AND instruction
                      decoded_instruction_IE <= ANDD_pattern;
                    when ORR =>             -- OR instruction
                      decoded_instruction_IE <= ORR_pattern;
                    when XORR =>            -- XOR instruction        
                      decoded_instruction_IE <= XORR_pattern;
                    when SLLL =>            -- SLL instruction        
                      decoded_instruction_IE <= SLLL_pattern;
                    when SRLL =>       -- SRL instruction   
                      decoded_instruction_IE <= SRLL7_pattern;
                    when others =>  -- ILLEGAL_INSTRUCTION                                      
                      decoded_instruction_IE <= ILL_pattern;
                  end case;
                when OP_I2 =>
                  case FUNCT3_wires is
                    when SUB7 =>
                      decoded_instruction_IE <= SUB7_pattern;
                    when SRAA =>
                      decoded_instruction_IE <= SRAA7_pattern;
                    when others =>  -- ILLEGAL_INSTRUCTION                                      
                      decoded_instruction_IE <= ILL_pattern;
                  end case;
                when OP_M  =>                 -- MUL/DIV instructions
                  if RV32M = 1 then
                    case FUNCT3_wires is
                      when MUL =>
                        comparator_en <= '1';
                        decoded_instruction_IE <= MUL_pattern;
                      when MULH =>
                        comparator_en <= '1';
                        signed_op <= '1';
                        decoded_instruction_IE <= MULH_pattern;
                      when MULHSU =>
                        comparator_en <= '1';
                        signed_op <= '1';
                        decoded_instruction_IE <= MULHSU_pattern;
                      when MULHU =>
                        comparator_en <= '1';
                        decoded_instruction_IE <= MULHU_pattern;
                      when DIV =>
                        comparator_en <= '1';
                        signed_op <= '1';
                        decoded_instruction_IE <= DIV_pattern;
                      when DIVU =>
                        comparator_en <= '1';
                        decoded_instruction_IE <= DIVU_pattern;
                      when REMD =>
                        comparator_en <= '1';
                        signed_op <= '1';
                        decoded_instruction_IE <= REM_pattern;
                      when REMDU =>
                        comparator_en <= '1';
                        decoded_instruction_IE <= REMU_pattern;
                      when others =>
                        decoded_instruction_IE <= ILL_pattern;
                    end case;
                  else
                    decoded_instruction_IE <= ILL_pattern;                  
                  end if;
                when others =>  -- ILLEGAL_INSTRUCTION                                      
                  decoded_instruction_IE <= ILL_pattern;
              end case;
            else                        -- R0_INSTRUCTION
              decoded_instruction_IE <= NOP_pattern;
            end if;

          when JAL =>                   -- JAL instruction
            ie_instr_req <= '1';
            decoded_instruction_IE <= JAL_pattern;

          when JALR =>                  -- JAL instruction
            ie_instr_req <= '1';
            decoded_instruction_IE <= JALR_pattern;

          when BRANCH =>      -- BRANCH instruction         
            ie_instr_req <= '1';
            case FUNCT3_wires is
              when BEQ =>               -- BEQ instruction   
                comparator_en <= '1';
                decoded_instruction_IE <= BEQ_pattern;
              when BNE =>               -- BNE instruction
                comparator_en <= '1';
                decoded_instruction_IE <= BNE_pattern;
              when BLT =>               -- BLT instruction   
                comparator_en <= '1';
                decoded_instruction_IE <= BLT_pattern;
              when BLTU =>              -- BLTU instruction
                comparator_en <= '1';
                decoded_instruction_IE <= BLTU_pattern;
              when BGE =>               -- BGE instruction
                comparator_en <= '1';
                decoded_instruction_IE <= BGE_pattern;
              when BGEU =>              -- BGEU instruction
                comparator_en <= '1';
                decoded_instruction_IE <= BGEU_pattern;
              when others =>  -- ILLEGAL_INSTRUCTION                      
                decoded_instruction_IE <= ILL_pattern;
            end case;  -- FUNCT3_wires cases

          when LOAD =>                  -- LOAD instruction
            load_op <= '1';
            if (rd(instr_word_ID_lat) /= 0) then  -- is all in the next_state process
              case FUNCT3_wires is
                when LW =>
                  ls_instr_req <= '1';
                  data_width_ID <= "10";
                  data_be_ID   <= "1111";
                  decoded_instruction_LS <= LW_pattern;
                when LH =>
                  ls_instr_req <= '1';
                  data_width_ID <= "01";
                  data_be_ID <= "0011";
                  decoded_instruction_LS <= LH_pattern;
                when LHU =>
                  ls_instr_req <= '1';
                  data_width_ID <= "01";
                  data_be_ID <= "0011";
                  decoded_instruction_LS <= LHU_pattern;
                when LB =>
                  ls_instr_req <= '1';
                  data_width_ID <= "00";
                  data_be_ID <= "0001";
                  decoded_instruction_LS <= LB_pattern;
                when LBU =>
                  ls_instr_req <= '1';
                  data_width_ID <= "00";
                  data_be_ID <= "0001";
                  decoded_instruction_LS <= LBU_pattern;
                when others =>          -- ILLEGAL_INSTRUCTION
                  ie_instr_req <= '1';
                  decoded_instruction_IE <= ILL_pattern;
              end case;
            else                        -- R0_INSTRUCTION
              ie_instr_req <= '1';
              decoded_instruction_IE <= NOP_pattern;
            end if;

          when STORE =>                 -- STORE instruction
            store_op <= '1';
            case FUNCT3_wires is
              when SW =>                -- is all in the next_state process
                ls_instr_req <= '1';
                ie_instr_req <= '1';
                data_width_ID <= "10";
                data_be_ID <= "1111";
                decoded_instruction_LS <= SW_pattern;
                decoded_instruction_IE <= SW_MIP_pattern;
              when SH =>
                ls_instr_req <= '1';
                data_width_ID <= "01";
                data_be_ID <= "0011";
                decoded_instruction_LS <= SH_pattern;
              when SB =>
                ls_instr_req <= '1';
                data_width_ID <= "00";
                data_be_ID <= "0001";
                decoded_instruction_LS <= SB_pattern;
              when others =>  -- ILLEGAL_INSTRUCTION
                ie_instr_req <= '1';
                decoded_instruction_IE <= ILL_pattern;
            end case;

          when MISC_MEM =>
            ie_instr_req <= '1';
            case FUNCT3_wires is
              when FENCE =>             -- FENCE instruction
                decoded_instruction_IE <= FENCE_pattern;
              when FENCEI =>            -- FENCEI instruction
                decoded_instruction_IE <= FENCEI_pattern;
              when others =>            -- ILLEGAL_INSTRUCTION
                decoded_instruction_IE <= ILL_pattern;
            end case;  -- FUNCT3_wires cases

          when SYSTEM =>
            ie_instr_req <= '1';
            case FUNCT3_wires is
              when PRIV =>
                if (rs1(instr_word_ID_lat) = 0 and rd(instr_word_ID_lat) = 0) then
                  case FUNCT12_wires is
                    when ECALL =>       -- ECALL instruction
                      decoded_instruction_IE <= ECALL_pattern;
                    when EBREAK =>      -- EBREAK instruction       
                      decoded_instruction_IE <= EBREAK_pattern;
                    when mret =>        -- mret instruction   
                      decoded_instruction_IE <= MRET_pattern;
                    when WFI =>         -- WFI instruction     
                      decoded_instruction_IE <= WFI_pattern;
                    when others =>  -- ILLEGAL_INSTRUCTION                                              
                      decoded_instruction_IE <= ILL_pattern;
                  end case;  -- FUNCT12_wires cases
                else  -- ILLEGAL_INSTRUCTION                            
                  decoded_instruction_IE <= ILL_pattern;
                end if;
              when CSRRW =>
                decoded_instruction_IE <= CSRRW_pattern;
              when CSRRS =>
                if(rd(instr_word_ID_lat) /= 0) then
                  decoded_instruction_IE <= CSRRS_pattern;
                else                    -- R0_INSTRUCTION
                  decoded_instruction_IE <= NOP_pattern;
                end if;
              when CSRRC =>
                if(rd(instr_word_ID_lat) /= 0) then
                  decoded_instruction_IE <= CSRRC_pattern;
                else                    -- R0_INSTRUCTION
                  decoded_instruction_IE <= NOP_pattern;
                end if;
              when CSRRWI =>
                decoded_instruction_IE <= CSRRWI_pattern;
              when CSRRSI =>
                if(rd(instr_word_ID_lat) /= 0) then
                  decoded_instruction_IE <= CSRRSI_pattern;
                else                    -- R0_INSTRUCTION
                  decoded_instruction_IE <= NOP_pattern; -- AAA highly likely not to be a NOP
                end if;
              when CSRRCI =>
                if(rd(instr_word_ID_lat) /= 0) then
                  decoded_instruction_IE <= CSRRCI_pattern;
                else                    -- R0_INSTRUCTION
                  decoded_instruction_IE <= NOP_pattern;
                end if;
              when others =>  -- ILLEGAL_INSTRUCTION                      
                decoded_instruction_IE <= ILL_pattern;
            end case;  -- FUNCT3_wires cases

          when AMO =>
            data_width_ID <= "10";
            case FUNCT3_wires is
              when SINGLE =>
                ls_instr_req <= '1';
                decoded_instruction_LS <= AMOSWAP_pattern;
                if(rd(instr_word_ID_lat) /= 0) then
                  amo_load_skip          <= '0';
                  if amo_store = '1' then
                    amo_load <= '0';
                  elsif amo_store = '0' then
                    amo_load <= '1';
                  end if;
                elsif (rd(instr_word_ID_lat) = 0) then
                  amo_load_skip          <= '1';
                end if;
              when others =>            -- ILLEGAL_INSTRUCTION
                ie_instr_req <= '1';
                decoded_instruction_IE <= ILL_pattern;
            end case;

          when KMEM =>
            if accl_en = 1 then
              case FUNCT7_wires is
                when KMEMLD =>          -- KMEMLD_INSTRUCTION
                  ls_instr_req <= '1';
                  decoded_instruction_LS <= KMEMLD_pattern;
                when KMEMSTR =>         -- KMEMSTR_INSTRUCTION
                  ls_instr_req <= '1';
                  decoded_instruction_LS <= KMEMSTR_pattern;
                when KBCASTLD =>         -- KBCASTLD_INSTRUCTION
                  ls_instr_req <= '1';
                  decoded_instruction_LS <= KBCASTLD_pattern;
                when others =>            -- ILLEGAL_INSTRUCTION
                  ie_instr_req <= '1';
                  decoded_instruction_IE <= ILL_pattern;
              end case;
            end if;

          when KDSP =>
            if accl_en = 1 then
              if busy_DSP(harc_ID_to_DSP) = '0' then
                case FUNCT7_wires is
                  when KADDV =>           -- KADDV_INSTRUCTION
                    vec_write_rd_ID <= '1';
                    vec_read_rs1_ID <= '1';
                    vec_read_rs2_ID <= '1';
                    spm_rs1 <= '1';
                    spm_rs2 <= '1';
                    decoded_instruction_DSP <= KADDV_pattern;
                  when KSUBV =>           -- KSUBV_INSTRUCTION
                    vec_write_rd_ID <= '1';
                    vec_read_rs1_ID <= '1';
                    vec_read_rs2_ID <= '1';
                    spm_rs1 <= '1';
                    spm_rs2 <= '1';
                    decoded_instruction_DSP <= KSUBV_pattern;
                  when KVMUL =>           -- KVMUL_INSTRUCTION
                    vec_write_rd_ID <= '1';
                    vec_read_rs1_ID <= '1';
                    vec_read_rs2_ID <= '1';
                    spm_rs1 <= '1';
                    spm_rs2 <= '1';
                    decoded_instruction_DSP <= KVMUL_pattern;
                  when KVRED =>           -- KVRED_INSTRUCTION
                    vec_read_rs1_ID <= '1';
                    spm_rs1 <= '1';
                    decoded_instruction_DSP <= KVRED_pattern;
                  when KDOTP =>           -- KDOTP_INSTRUCTION
                    vec_read_rs1_ID <= '1';
                    vec_read_rs2_ID <= '1';
                    spm_rs1 <= '1';
                    spm_rs2 <= '1';
                    decoded_instruction_DSP <= KDOTP_pattern;
                  when KDOTPPS =>           -- KDOTPPS_INSTRUCTION
                    vec_read_rs1_ID <= '1';
                    vec_read_rs2_ID <= '1';
                    spm_rs1 <= '1';
                    spm_rs2 <= '1';
                    decoded_instruction_DSP <= KDOTPPS_pattern;
                  when KSVADDSC =>           -- KSVADDSC_INSTRUCTION
                    vec_read_rs1_ID <= '1';
                    vec_write_rd_ID  <= '1';
                    spm_rs1 <= '1';
                    spm_rs2 <= '1';
                    decoded_instruction_DSP <= KSVADDSC_pattern;
                  when KSVADDRF =>           -- KSVADDRF_INSTRUCTION
                    vec_read_rs1_ID <= '1';
                    vec_write_rd_ID <= '1';
                    spm_rs1 <= '1';
                    decoded_instruction_DSP <= KSVADDRF_pattern;
                  when KSVMULSC =>           -- KSVMULSC_INSTRUCTION
                    vec_read_rs1_ID <= '1';
                    vec_write_rd_ID  <= '1';
                    spm_rs1 <= '1';
                    spm_rs2 <= '1';
                    decoded_instruction_DSP <= KSVMULSC_pattern;
                  when KSVMULRF =>           -- KSVMULRF_INSTRUCTION
                    vec_read_rs1_ID <= '1';
                    vec_write_rd_ID <= '1';
                    spm_rs1 <= '1';
                    decoded_instruction_DSP <= KSVMULRF_pattern;
                  when KSRAV =>           -- KSRAV_INSTRUCTION
                    vec_read_rs1_ID <= '1';
                    vec_write_rd_ID  <= '1';
                    spm_rs1 <= '1';
                    decoded_instruction_DSP <= KSRAV_pattern;
                  when KSRLV =>           -- KSRLV_INSTRUCTION
                    vec_read_rs1_ID <= '1';
                    vec_write_rd_ID <= '1';
                    spm_rs1 <= '1';
                    decoded_instruction_DSP <= KSRLV_pattern;
                  when KRELU =>           -- KRELU_INSTRUCTION
                    vec_read_rs1_ID <= '1';
                    vec_write_rd_ID <= '1';
                    spm_rs1 <= '1';
                    decoded_instruction_DSP <= KRELU_pattern;
                  when KVSLT =>
                    vec_write_rd_ID <= '1';
                    vec_read_rs1_ID <= '1';
                    vec_read_rs2_ID <= '1';
                    spm_rs1 <= '1';
                    spm_rs2 <= '1';
                    decoded_instruction_DSP <= KVSLT_pattern;
                  when KSVSLT =>
                    vec_write_rd_ID <= '1';
                    vec_read_rs1_ID <= '1';
                    spm_rs1 <= '1';
                    decoded_instruction_DSP <= KSVSLT_pattern;
                  when KBCAST =>           -- KBCAST_INSTRUCTION
                    vec_write_rd_ID <= '1';
                    decoded_instruction_DSP <= KBCAST_pattern;
                  when KVCP =>           -- KVCP_INSTRUCTION
                    spm_rs1 <= '1';
                    vec_read_rs1_ID  <= '1';
                    vec_write_rd_ID  <= '1';
                    decoded_instruction_DSP <= KVCP_pattern;
                  when others =>            -- ILLEGAL_INSTRUCTION
                    ie_instr_req <= '1';
                    decoded_instruction_IE <= ILL_pattern;
                end case;
              else
                ie_instr_req <= '1';
                decoded_instruction_IE <= JAL_pattern;
              end if;
            end if;
 
          when others =>                -- ILLEGAL_INSTRUCTION
            ie_instr_req <= '1';
            decoded_instruction_IE <= ILL_pattern;

        end case;  -- OPCODE_wires cases                           
        -- Decode OF INSTRUCTION (END) --------------------------

      end if;  -- instr. conditions
    end if;  -- clk
  end process;

---------------------------------------------------------------------------------------------------------------------------------------------------------------
--  ███████╗██╗   ██╗██████╗ ███████╗██████╗ ███████╗ ██████╗ █████╗ ██╗      █████╗ ██████╗     ███████╗███╗   ██╗ █████╗ ██████╗ ██╗     ███████╗██████╗   --
--  ██╔════╝██║   ██║██╔══██╗██╔════╝██╔══██╗██╔════╝██╔════╝██╔══██╗██║     ██╔══██╗██╔══██╗    ██╔════╝████╗  ██║██╔══██╗██╔══██╗██║     ██╔════╝██╔══██╗  --
--  ███████╗██║   ██║██████╔╝█████╗  ██████╔╝███████╗██║     ███████║██║     ███████║██████╔╝    █████╗  ██╔██╗ ██║███████║██████╔╝██║     █████╗  ██████╔╝  --
--  ╚════██║██║   ██║██╔═══╝ ██╔══╝  ██╔══██╗╚════██║██║     ██╔══██║██║     ██╔══██║██╔══██╗    ██╔══╝  ██║╚██╗██║██╔══██║██╔══██╗██║     ██╔══╝  ██╔══██╗  --
--  ███████║╚██████╔╝██║     ███████╗██║  ██║███████║╚██████╗██║  ██║███████╗██║  ██║██║  ██║    ███████╗██║ ╚████║██║  ██║██████╔╝███████╗███████╗██║  ██║  --
--  ╚══════╝ ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝    ╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝  --
---------------------------------------------------------------------------------------------------------------------------------------------------------------

  harc_ID_to_DSP <= 0 when replicate_accl_en= 0 else harc_ID;

  Superscalar_Enable : if superscalar_exec_en = 1 generate
  fsm_ID_comb : process(all)
  variable OPCODE_wires  : std_logic_vector (6 downto 0);
  begin
    OPCODE_wires  := OPCODE(instr_word_ID_lat);	
    -- parallelism enablers, halts the pipeline when it is zero. -------------------
    ls_parallel_exec  <= '0' when (OPCODE_wires = LOAD or OPCODE_wires = STORE or OPCODE_wires = AMO or OPCODE_wires = KMEM) and busy_LS = '1' else '1';
    dsp_parallel_exec <= '0' when (OPCODE_wires = KMEM or OPCODE_wires = AMO) and busy_DSP(harc_ID_to_DSP) = '1' else '1';
    dsp_to_jump       <= '1' when OPCODE_wires = KDSP and busy_DSP(harc_ID_to_DSP) = '1' else '0';
    if core_busy_IE = '1' or core_busy_LS = '1' or ls_parallel_exec = '0'  or dsp_parallel_exec = '0' then
      busy_ID <= '1';  -- wait for the stall to finish, block new instructions 
    elsif core_busy_IE = '0' and core_busy_LS = '0' and ls_parallel_exec = '1'  and dsp_parallel_exec = '1' then
      busy_ID <= '0';  -- wait for a valid instruction or process the instruction       
    end if; 
  end process;
  end generate;

  Superscalar_Disable: if superscalar_exec_en = 0 generate
  fsm_ID_comb : process(all)
  variable OPCODE_wires  : std_logic_vector (6 downto 0);
  begin
    OPCODE_wires  := OPCODE(instr_word_ID_lat);	
    ls_parallel_exec  <= '0' when busy_LS = '1' else '1';
    dsp_parallel_exec <= '0' when unsigned(busy_DSP) /= 0 else '1';
    dsp_to_jump       <= '1' when OPCODE_wires = KDSP and busy_DSP(harc_ID_to_DSP) = '1' else '0';
    if core_busy_IE = '1' or core_busy_LS = '1' or ls_parallel_exec = '0'  or dsp_parallel_exec = '0' then
      busy_ID <= '1';  -- wait for the stall to finish, block new instructions 
    elsif core_busy_IE = '0' and core_busy_LS = '0' and ls_parallel_exec = '1'  and dsp_parallel_exec = '1' then
      busy_ID <= '0';  -- wait for a valid instruction or process the instruction       
    end if; 
  end process;
  end generate;

  process(all)
  begin
    dsp_instr_req_wire <= (others => '0');
    if core_busy_IE = '0' and core_busy_LS = '0' and ls_parallel_exec = '1' and dsp_parallel_exec = '1' and  instr_rvalid_ID = '1' then
      if OPCODE(instr_word_ID_lat) = KDSP then
        dsp_instr_req_wire(harc_ID_to_DSP) <=  '1';
      end if;
    end if;
  end process;--------------------------------------------------------------------------------

  process(clk_i, rst_ni)
  begin
    if rst_ni = '0' then
    elsif rising_edge(clk_i) then
      dsp_instr_req <= dsp_instr_req_wire;
    end if;
  end process;

---------------------------------------------------------------------- end of ID stage -----------
--------------------------------------------------------------------------------------------------
end DECODE;
--------------------------------------------------------------------------------------------------
-- END of ID architecture ------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------