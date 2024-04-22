--------------------------------------------------------------------------------------------------------
--  Control and Status Units --                                                                       --
--  Author(s): Abdallah Cheikh abdallah.cheikh@uniroma1.it (abdallah93.as@gmail.com)                  --
--             Gianmarco Cerutti                                                                      --
--                                                                                                    --
--  Date Modified: 02-04-2020                                                                         --
--------------------------------------------------------------------------------------------------------
--  Manages CSR instructions and CSR automatic updates following traps and special instructions.      --
--  Note: In the present version, gives priority to CSR automatic updates over CSR instr. execution   --
--  Note: The CSRegisters are replicated along with the related logic, as in the pc update logic.     --
--  The CSR has a set of performance counters such that when enabled can count the number of cycles,  --
--  instructions, load-store instructions, jumps, branches, and taken branches                        --
--  Custom CSRs are implemented for the accelerator unit                                              --
--------------------------------------------------------------------------------------------------------

--package riscv_kless is new work.riscv_klessydra;

-- ieee packages ------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use std.textio.all;

-- local packages ------------
use work.riscv_klessydra.all;
--use work.riscv_kless.all;


entity CSR_Unit is
  generic (
    THREAD_POOL_SIZE      : integer;
    ACCL_NUM              : natural;
    Addr_Width            : natural;
    replicate_accl_en     : natural;
    accl_en               : natural;
    MCYCLE_EN             : natural;
    MINSTRET_EN           : natural;
    MHPMCOUNTER_EN        : natural;
    RF_CEIL               : natural;
    count_all             : natural
  );
  port (
    pc_IE                       : in  std_logic_vector(31 downto 0);
    ie_except_data              : in  std_logic_vector(31 downto 0);
    ls_except_data              : in  std_logic_vector(31 downto 0);
    dsp_except_data             : in  array_2d(ACCL_NUM - 1 downto 0)(31 downto 0);
    served_ie_except_condition  : in  std_logic_vector(THREAD_POOL_SIZE -1 downto 0);
    served_ls_except_condition  : in  std_logic_vector(THREAD_POOL_SIZE -1 downto 0);
    served_dsp_except_condition : in  std_logic_vector(THREAD_POOL_SIZE -1 downto 0);
    harc_EXEC                   : in  integer range THREAD_POOL_SIZE -1 downto 0;
    harc_to_csr                 : in  integer range THREAD_POOL_SIZE -1 downto 0;
    instr_word_IE               : in  std_logic_vector(31 downto 0);
    served_except_condition     : in  std_logic_vector(THREAD_POOL_SIZE -1 downto 0);
    served_mret_condition       : in  std_logic_vector(THREAD_POOL_SIZE -1 downto 0);
    served_irq                  : in  std_logic_vector(THREAD_POOL_SIZE -1 downto 0);
    pc_except_value_wire        : in  array_2d(THREAD_POOL_SIZE -1 downto 0)(31 downto 0);
    dbg_req_o                   : in  std_logic;
    data_addr_internal          : in  std_logic_vector(31 downto 0);
    jump_instr                  : in  std_logic;
    branch_instr                : in  std_logic;
    set_branch_condition        : in  std_logic;
    csr_instr_req               : in  std_logic;
    misaligned_err              : in  std_logic;
    WFI_Instr                   : in  std_logic;
    csr_wdata_i                 : in  std_logic_vector (31 downto 0);
    csr_op_i                    : in  std_logic_vector (2 downto 0);
    csr_addr_i                  : in  std_logic_vector (11 downto 0);
    csr_instr_done              : out std_logic;
    csr_access_denied_o         : out std_logic;
    csr_rdata_o                 : out std_logic_vector (31 downto 0);
    MVSIZE                      : out array_2d(THREAD_POOL_SIZE-1 downto 0)(Addr_Width downto 0); 
    MVTYPE                      : out array_2d(THREAD_POOL_SIZE-1 downto 0)(3 downto 0); -- CSR Size follows the RVV standard
    MPSCLFAC                    : out array_2d(THREAD_POOL_SIZE-1 downto 0)(4 downto 0);
    MSTATUS                     : out array_2d(THREAD_POOL_SIZE-1 downto 0)(1 downto 0);
    MEPC                        : out array_2d(THREAD_POOL_SIZE-1 downto 0)(31 downto 0);
    MCAUSE                      : out array_2d(THREAD_POOL_SIZE-1 downto 0)(31 downto 0);
    MIP                         : out array_2d(THREAD_POOL_SIZE-1 downto 0)(31 downto 0);
    MTVEC                       : out array_2d(THREAD_POOL_SIZE-1 downto 0)(31 downto 0);
    PCER                        : out array_2d(THREAD_POOL_SIZE-1 downto 0)(31 downto 0);
    fetch_enable_i              : in  std_logic;
    clk_i                       : in  std_logic;
    rst_ni                      : in  std_logic;
    cluster_id_i                : in  std_logic_vector(5 downto 0);
    instr_rvalid_i              : in  std_logic;
    instr_rvalid_IE             : in  std_logic;
    data_we_o                   : in  std_logic;
    data_req_o                  : in  std_logic;
    data_gnt_i                  : in  std_logic;
    irq_i                       : in  std_logic;
    irq_id_i                    : in  std_logic_vector(4 downto 0);
    irq_id_o                    : out std_logic_vector(4 downto 0);
    irq_ack_o                   : out std_logic
    );
end entity;


architecture CSR of CSR_Unit is

  subtype harc_range is integer range THREAD_POOL_SIZE - 1 downto 0;
  subtype accl_range is integer range ACCL_NUM - 1 downto 0;

  signal pc_IE_replicated	: array_2d(harc_range)(31 downto 0);	
	
  -- Control Status Register (CSR) signals 
  signal PCCRs       : array_2d(harc_range)(31 downto 0);  -- still not implemented
  signal PCMR        : array_2d(harc_range)(31 downto 0);  -- still not implemented
  signal MESTATUS    : array_2d(harc_range)(2  downto 0);
  signal MCPUID      : array_2d(harc_range)(8  downto 0);
  signal MIMPID      : array_2d(harc_range)(15 downto 0);
  signal MHARTID     : array_2d(harc_range)(9  downto 0);
  signal MIRQ        : array_2d(harc_range)(31 downto 0);  -- extension, maps external irqs
  signal MBADADDR    : array_2d(harc_range)(31 downto 0);  -- misaligned address containers

  signal MCYCLE        : array_2d(harc_range)(31 downto 0);
  signal MINSTRET      : array_2d(harc_range)(31 downto 0);
  signal MHPMCOUNTER3  : array_2d(harc_range)(31 downto 0);
  signal MHPMCOUNTER6  : array_2d(harc_range)(31 downto 0);
  signal MHPMCOUNTER7  : array_2d(harc_range)(31 downto 0);
  signal MHPMCOUNTER8  : array_2d(harc_range)(31 downto 0);
  signal MHPMCOUNTER9  : array_2d(harc_range)(31 downto 0);
  signal MHPMCOUNTER10 : array_2d(harc_range)(31 downto 0);
  signal MHPMCOUNTER11 : array_2d(harc_range)(31 downto 0);
  signal MCYCLEH       : array_2d(harc_range)(31 downto 0);
  signal MINSTRETH     : array_2d(harc_range)(31 downto 0);
  signal MHPMEVENT3    : std_logic_vector(harc_range);       
  signal MHPMEVENT6    : std_logic_vector(harc_range);
  signal MHPMEVENT7    : std_logic_vector(harc_range);
  signal MHPMEVENT8    : std_logic_vector(harc_range);
  signal MHPMEVENT9    : std_logic_vector(harc_range);
  signal MHPMEVENT10   : std_logic_vector(harc_range);
  signal MHPMEVENT11   : std_logic_vector(harc_range);
  -- auxiliary irq fixed connection signals
  signal MIP_7         : std_logic;
  signal MIP_11        : std_logic;

  -- Interface signals from EXEC unit to CSR management unit

  -- CSR management unit internal signal
  signal csr_instr_req_replicated       : std_logic_vector(harc_range);
  signal csr_instr_done_replicated      : std_logic_vector(harc_range);
  signal csr_access_denied_o_replicated : std_logic_vector(harc_range);
  signal csr_rdata_o_replicated         : array_2d(harc_range)(31 downto 0);

  -- wire only signals (For Synopsis Comaptibility)
  signal MSTATUS_internal       : array_2d(harc_range)(1 downto 0);
  signal MEPC_internal          : array_2d(harc_range)(31 downto 0);
  signal MCAUSE_internal        : array_2d(harc_range)(31 downto 0);
  signal MIP_internal           : array_2d(harc_range)(31 downto 0);
  signal MTVEC_internal         : array_2d(harc_range)(31 downto 0);
  signal irq_ack_o_internal     : std_logic;
  signal trap_hndlr         	: std_logic_vector(harc_range);

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



  MSTATUS       <= MSTATUS_internal;
  MEPC          <= MEPC_internal;
  MCAUSE        <= MCAUSE_internal;
  MIP           <= MIP_internal;
  MTVEC         <= MTVEC_internal;
  irq_ack_o     <= irq_ack_o_internal;

  -- here we start replicating the logic ------------------------------------------------------
  CSR_updating_logic : for h in harc_range generate

    -- hardwired read-only connections  
    -- note: MCPUID, MIMPID, MHARTID replicated only for easy coding, they return same value for all threads
    MCPUID(h) <= std_logic_vector(to_unsigned(256, 9));  -- xx move init value in pkg
    MIMPID(h) <= std_logic_vector(to_unsigned(32768, 16));  -- xx move init value in pkg

    -- irq request vector shifted by 2 bits, used in interrupt handler routine
    MIRQ(h) <= "0000000000000000000000000" & irq_id_i & "00";
    pc_IE_replicated(h) <= pc_IE when harc_EXEC = h else (others =>'0');
    csr_instr_req_replicated(h) <= '1' when csr_instr_req = '1' and harc_to_csr = h else '0';
    trap_hndlr(h)               <= '1' when pc_IE_replicated(h) = MTVEC_RESET_VALUE  else '0';
    MHARTID(h)                  <= std_logic_vector(resize(unsigned(cluster_id_i) & to_unsigned(h, THREAD_ID_SIZE), 10));

    CSR_unit_op : process(clk_i, rst_ni)  -- single cycle unit, one process, fully synchronous 
    begin

      if rst_ni = '0' then
        if accl_en = 1 then
          MVSIZE(h)                         <= (others => '0');
          MVTYPE(h)                         <= MVTYPE_RESET_VALUE;
          MPSCLFAC(h)                       <= MPSCLFAC_RESET_VALUE;
        end if;
        MSTATUS_internal(h)                 <= MSTATUS_RESET_VALUE;
        MESTATUS(h)                         <= MESTATUS_RESET_VALUE;
        MEPC_internal(h)                    <= MEPC_RESET_VALUE;
        MCAUSE_internal(h)                  <= MCAUSE_RESET_VALUE;
        MTVEC_internal(h)                   <= MTVEC_RESET_VALUE;
        PCER(h)                             <= PCER_RESET_VALUE;
        --Reset of counters and related registers
        if (MCYCLE_EN = 1) then
          MCYCLE(h)                         <= x"00000000";
          MCYCLEH(h)                        <= x"00000000";
        end if;
        if (MINSTRET_EN = 1) then
          MINSTRET(h)                       <= x"00000000";
          MINSTRETH(h)                      <= x"00000000";
        end if;
        if (MHPMCOUNTER_EN = 1) then
          MHPMCOUNTER3(h)                   <= x"00000000";
          MHPMCOUNTER6(h)                   <= x"00000000";
          MHPMCOUNTER7(h)                   <= x"00000000";
          MHPMCOUNTER8(h)                   <= x"00000000";
          MHPMCOUNTER9(h)                   <= x"00000000";
          MHPMCOUNTER10(h)                  <= x"00000000";
          MHPMEVENT3(h)                     <= PCER_RESET_VALUE(2);
          MHPMEVENT6(h)                     <= PCER_RESET_VALUE(5);
          MHPMEVENT7(h)                     <= PCER_RESET_VALUE(6);
          MHPMEVENT8(h)                     <= PCER_RESET_VALUE(7);
          MHPMEVENT9(h)                     <= PCER_RESET_VALUE(8);
          MHPMEVENT10(h)                    <= PCER_RESET_VALUE(9);
        end if;
        MIP_internal(h)                   <= MIP_RESET_VALUE;

        csr_instr_done_replicated(h)      <= '0';
        csr_access_denied_o_replicated(h) <= '0';
        csr_rdata_o_replicated(h)         <= (others => '0');

      elsif rising_edge(clk_i) then
        -- CSR updating for all possible sources follows.
        --       ext. int., sw int., timer int., exceptions.
        --       We update CSR following this order, the software interrupt vector manager follows
        --       the same order, so that CSRs are consistent with interrupt service.
        -- Interrupt-caused CSR updating  ---------------------------------
        -- note: PC just udpdated, MIP_internals can't have been cleared yet.

        --------------------------------------------------------------------------------------------------------------------------------------------------
        --  ██╗██████╗  ██████╗     ██╗███████╗██╗  ██╗ ██████╗███████╗██████╗ ████████╗    ██╗  ██╗ █████╗ ███╗   ██╗██████╗ ██╗     ███████╗██████╗   --
        --  ██║██╔══██╗██╔═══██╗   ██╔╝██╔════╝╚██╗██╔╝██╔════╝██╔════╝██╔══██╗╚══██╔══╝    ██║  ██║██╔══██╗████╗  ██║██╔══██╗██║     ██╔════╝██╔══██╗  --
        --  ██║██████╔╝██║   ██║  ██╔╝ █████╗   ╚███╔╝ ██║     █████╗  ██████╔╝   ██║       ███████║███████║██╔██╗ ██║██║  ██║██║     █████╗  ██████╔╝  --
        --  ██║██╔══██╗██║▄▄ ██║ ██╔╝  ██╔══╝   ██╔██╗ ██║     ██╔══╝  ██╔═══╝    ██║       ██╔══██║██╔══██║██║╚██╗██║██║  ██║██║     ██╔══╝  ██╔══██╗  --
        --  ██║██║  ██║╚██████╔╝██╔╝   ███████╗██╔╝ ██╗╚██████╗███████╗██║        ██║       ██║  ██║██║  ██║██║ ╚████║██████╔╝███████╗███████╗██║  ██║  --
        --  ╚═╝╚═╝  ╚═╝ ╚══▀▀═╝ ╚═╝    ╚══════╝╚═╝  ╚═╝ ╚═════╝╚══════╝╚═╝        ╚═╝       ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝  --
        --------------------------------------------------------------------------------------------------------------------------------------------------        
                                                                                                                    
        -- synchronous assignment to MIP_internal bits:
        -- this is Pulpino-specific assignment, i.e. the timer-related IRQ vector value
        if h = 0 and unsigned(irq_id_i) >= 28 and irq_i = '1' then
          MIP_internal(h)(7) <= '1';
        else
          MIP_internal(h)(7) <= '0';        -- only harc 0 interruptible
        end if;
        -- this detects the other IRQ vector values in Pulpino
        if h = 0 and unsigned(irq_id_i) < 28 and irq_i = '1' then
          MIP_internal(h)(11) <= '1';
        else
          MIP_internal(h)(11) <= '0';       -- only harc 0 interruptible
        end if;
        -- the MIP_internal(h)(3), MSIP bit, software interrupt, is assigned above

        if served_irq(h) = '1' and MIP_internal(h)(11) = '1' then
          -- it is the MEIP bit, ext. irq
          MCAUSE_internal(h) <= "1" & std_logic_vector(to_unsigned(11, 31));  -- ext. irq
          MESTATUS(h)(2 downto 1)    <= MSTATUS_internal(h);
          if trap_hndlr(h) = '0' then
            MEPC_internal(h) <= pc_IE;
          end if;     
          if WFI_Instr = '1' then
            MCAUSE_internal(h)(30) <= '1'; -- 
          else
            MCAUSE_internal(h)(30) <= '0';
          end if;
          MSTATUS_internal(h)(0) <= '0';    -- interrupt disabled
          MSTATUS_internal(h)(1) <= MSTATUS_internal(h)(0);
        elsif served_irq(h) = '1' and MIP_internal(h)(3) = '1' then
          -- it is the MSIP bit, sw interrupt req
          MCAUSE_internal(h) <= "1" & std_logic_vector(to_unsigned(3, 31));  -- sw interrupt
          MIP_internal(h)(3) <= '0'; -- we reset the sw int. request just being served
          MESTATUS(h)(2 downto 1)    <= MSTATUS_internal(h);
          if trap_hndlr(h) = '0' then
            MEPC_internal(h) <= pc_IE;
          end if;     
          if WFI_Instr = '1' then
            MCAUSE_internal(h)(30) <= '1';
          else
            MCAUSE_internal(h)(30) <= '0';
          end if;
          MSTATUS_internal(h)(0) <= '0';    -- interrupt disabled
          MSTATUS_internal(h)(1) <= MSTATUS_internal(h)(0);
        elsif served_irq(h) = '1' and MIP_internal(h)(7) = '1' then
          -- it is the MSIP bit, timer interrupt req
          MCAUSE_internal(h) <= "1" & std_logic_vector(to_unsigned(7, 31));  -- timer interrupt
          MESTATUS(h)(2 downto 1)    <= MSTATUS_internal(h);
          if trap_hndlr(h) = '0' then
            MEPC_internal(h) <= pc_IE;
          end if;   
          if WFI_Instr = '1' then
            MCAUSE_internal(h)(30) <= '1';
          else
            MCAUSE_internal(h)(30) <= '0';
          end if;
          MSTATUS_internal(h)(0) <= '0';    -- interrupt disabled
          MSTATUS_internal(h)(1) <= MSTATUS_internal(h)(0);
          
        --  Exception-caused CSR updating ----------------------------------
        elsif served_except_condition(h) = '1' then
          if served_dsp_except_condition(h) = '1' then
            if replicate_accl_en = 1 then
              MCAUSE_internal(h)     <= dsp_except_data(h);  -- passed from DSP Unit
            elsif replicate_accl_en = 0 then
              MCAUSE_internal(h)     <= dsp_except_data(0);  -- passed from DSP Unit
            end if;
          elsif served_ls_except_condition(h) = '1' then
            MCAUSE_internal(h)     <= ls_except_data;  -- passed from LS unit
          elsif served_ie_except_condition(h) = '1' then
            MCAUSE_internal(h)     <= ie_except_data;  -- passed from IE Stage
          end if;
          MESTATUS(h)(2 downto 1)        <= MSTATUS_internal(h);
          MEPC_internal(h)   <= pc_except_value_wire(h);
          MSTATUS_internal(h)(0) <= '0';  -- interrupt disabled      
          MSTATUS_internal(h)(1) <= '1';
          if misaligned_err = '1' then
            MBADADDR(h) <= data_addr_internal;
          end if;

        -- mret-caused CSR updating ----------------------------------------
        elsif served_mret_condition(h) = '1' then
          MSTATUS_internal(h)(1) <= '1';
          MSTATUS_internal(h)(0) <= MSTATUS_internal(h)(1);
        -- CSR instruction handling ----------------------------------------      
        elsif(csr_instr_done_replicated(h) = '1') then
          csr_instr_done_replicated(h)      <= '0';
          csr_access_denied_o_replicated(h) <= '0';
        elsif csr_instr_req_replicated(h) = '1' then
          csr_instr_done_replicated(h) <= '1';

          -----------------------------------------------------------------------------
          --   ██████╗███████╗██████╗     ██████╗ ██████╗     ██╗██╗    ██╗██████╗   --
          --  ██╔════╝██╔════╝██╔══██╗    ██╔══██╗██╔══██╗   ██╔╝██║    ██║██╔══██╗  --
          --  ██║     ███████╗██████╔╝    ██████╔╝██║  ██║  ██╔╝ ██║ █╗ ██║██████╔╝  --
          --  ██║     ╚════██║██╔══██╗    ██╔══██╗██║  ██║ ██╔╝  ██║███╗██║██╔══██╗  --
          --  ╚██████╗███████║██║  ██║    ██║  ██║██████╔╝██╔╝   ╚███╔███╔╝██║  ██║  --
          --   ╚═════╝╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═════╝ ╚═╝     ╚══╝╚══╝ ╚═╝  ╚═╝  --
          -----------------------------------------------------------------------------

          if (csr_op_i /= "000" and csr_op_i /= "100") then  -- check for valid operation 
            case csr_addr_i is

              -- Vector size register, custom CSR reg for the hardware accelerator that defines the vector size in bytes
              when MVSIZE_addr =>
                if accl_en = 1 then
                  case csr_op_i is
                    when CSRRW|CSRRWI =>
                      csr_rdata_o_replicated(h)(Addr_Width downto 0) <= MVSIZE(h);
                      csr_rdata_o_replicated(h)(31 downto Addr_Width +1) <= (others => '0');
                      MVSIZE(h) <= csr_wdata_i(Addr_Width downto 0);
                    when CSRRS|CSRRSI =>
                      csr_rdata_o_replicated(h)(Addr_Width downto 0) <= MVSIZE(h);
                      csr_rdata_o_replicated(h)(31 downto Addr_Width +1) <= (others => '0');
                      if(rs1(instr_word_IE) /= 0) then
                        MVSIZE(h) <= (MVSIZE(h) or csr_wdata_i(Addr_Width downto 0));
                      end if;
                    when CSRRC|CSRRCI =>
                      csr_rdata_o_replicated(h)(Addr_Width downto 0) <= MVSIZE(h);
                      csr_rdata_o_replicated(h)(31 downto Addr_Width +1) <= (others => '0');
                      if(rs1(instr_word_IE) /= 0) then
                        MVSIZE(h) <= (MVSIZE(h) and not(csr_wdata_i(Addr_Width downto 0)));
                      end if;
                    when others =>
                      null;
                  end case;
                end if;

              -- Vector type register, custom CSR reg for the hardware accelerator that defines the vector type (8-bit, 16-bit, 32-bit)
              when MVTYPE_addr =>
                if accl_en = 1 then
                  case csr_op_i is
                    when CSRRW|CSRRWI =>
                      csr_rdata_o_replicated(h)(3 downto 0) <= MVTYPE(h);
                      csr_rdata_o_replicated(h)(31 downto 4) <= (others => '0');
                      MVTYPE(h)(3 downto 2) <= csr_wdata_i(1 downto 0);
                    when CSRRS|CSRRSI =>
                      csr_rdata_o_replicated(h)(3 downto 0) <= MVTYPE(h);
                      csr_rdata_o_replicated(h)(31 downto 4) <= (others => '0');
                      if(rs1(instr_word_IE) /= 0) then
                        MVTYPE(h)(3 downto 2) <= (MVTYPE(h)(3 downto 2) or csr_wdata_i(1 downto 0));
                      end if;
                    when CSRRC|CSRRCI =>
                      csr_rdata_o_replicated(h)(3 downto 0) <= MVTYPE(h);
                      csr_rdata_o_replicated(h)(31 downto 4) <= (others => '0');
                      if(rs1(instr_word_IE) /= 0) then
                        MVTYPE(h)(3 downto 2) <= (MVTYPE(h)(3 downto 2) and not(csr_wdata_i(1 downto 0)));
                      end if;
                    when others =>
                      null;
                  end case;
                end if;

              -- Vector scaling register, custom CSR reg for the hardware accelerator that defines how much the vector needs to be scaled
              when MPSCLFAC_addr =>
                if accl_en = 1 then
                  case csr_op_i is
                    when CSRRW|CSRRWI =>
                      csr_rdata_o_replicated(h)(4 downto 0)  <= MPSCLFAC(h);
                      csr_rdata_o_replicated(h)(31 downto 5) <= (others => '0');
                      MPSCLFAC(h) <= csr_wdata_i(4 downto 0);
                    when CSRRS|CSRRSI =>
                      csr_rdata_o_replicated(h)(4 downto 0)  <= MPSCLFAC(h);
                      csr_rdata_o_replicated(h)(31 downto 5) <= (others => '0');
                      if(rs1(instr_word_IE) /= 0) then
                        MPSCLFAC(h) <= (MPSCLFAC(h) or csr_wdata_i(4 downto 0));
                      end if;
                    when CSRRC|CSRRCI =>
                      csr_rdata_o_replicated(h)(4 downto 0)  <= MPSCLFAC(h);
                      csr_rdata_o_replicated(h)(31 downto 5) <= (others => '0');
                      if(rs1(instr_word_IE) /= 0) then
                        MPSCLFAC(h) <= (MPSCLFAC(h) and not(csr_wdata_i(4 downto 0)));
                      end if;
                    when others =>
                      null;
                  end case;
                end if;

              when MSTATUS_addr =>
                case csr_op_i is
                  when CSRRW|CSRRWI =>
                    csr_rdata_o_replicated(h) <= (13 to 31 => '0') & "11" & "000" & MSTATUS_internal(h)(1) & "000" & MSTATUS_internal(h)(0) & "000";
                    MSTATUS_internal(h)(1)    <= csr_wdata_i(7);
                    MSTATUS_internal(h)(0)    <= csr_wdata_i(3);
                  when CSRRS|CSRRSI =>
                    csr_rdata_o_replicated(h) <= (13 to 31 => '0') & "11" & "000" & MSTATUS_internal(h)(1) & "000" & MSTATUS_internal(h)(0) & "000";
                    if(rs1(instr_word_IE) /= 0) then
                      MSTATUS_internal(h)(1) <= (MSTATUS_internal(h)(1) or csr_wdata_i(7));
                      MSTATUS_internal(h)(0) <= (MSTATUS_internal(h)(0) or csr_wdata_i(3));
                    end if;
                  when CSRRC|CSRRCI =>
                    csr_rdata_o_replicated(h) <= (13 to 31 => '0') & "11" & "000" & MSTATUS_internal(h)(1) & "000" & MSTATUS_internal(h)(0) & "000";
                    if(rs1(instr_word_IE) /= 0) then
                      MSTATUS_internal(h)(1) <= MSTATUS_internal(h)(1) and (not csr_wdata_i(7));
                      MSTATUS_internal(h)(0) <= MSTATUS_internal(h)(0) and (not csr_wdata_i(3));
                    end if;
                  when others =>
                    null;
                end case;

              when MIP_addr =>
                case csr_op_i is
                  when CSRRW|CSRRWI =>
                    csr_rdata_o_replicated(h) <= (11 => MIP_internal(h)(11), 7 => MIP_internal(h)(7), 3 => MIP_internal(h)(3), others => '0');
                    MIP_internal(h)(3)             <= csr_wdata_i(3);
                  when CSRRS|CSRRSI =>
                    csr_rdata_o_replicated(h) <= (11 => MIP_internal(h)(11), 7 => MIP_internal(h)(7), 3 => MIP_internal(h)(3), others => '0');
                    if(rs1(instr_word_IE) /= 0) then
                      MIP_internal(h)(3) <= (MIP_internal(h)(3) or csr_wdata_i(3));
                    end if;
                  when CSRRC|CSRRCI =>
                    csr_rdata_o_replicated(h) <= (11 => MIP_internal(h)(11), 7 => MIP_internal(h)(7), 3 => MIP_internal(h)(3), others => '0');
                    if(rs1(instr_word_IE) /= 0) then
                      MIP_internal(h)(3) <= (MIP_internal(h)(3) and (not csr_wdata_i(3)));
                    end if;
                  when others =>
                    null;
                end case;

              when MEPC_addr =>
                case csr_op_i is
                  when CSRRW|CSRRWI =>
                    csr_rdata_o_replicated(h) <= MEPC_internal(h);
                    MEPC_internal(h)              <= csr_wdata_i;
                  when CSRRS|CSRRSI =>
                    csr_rdata_o_replicated(h) <= MEPC_internal(h);
                    if(rs1(instr_word_IE) /= 0) then
                      MEPC_internal(h) <= (MEPC_internal(h) or csr_wdata_i);
                    end if;
                  when CSRRC|CSRRCI =>
                    csr_rdata_o_replicated(h) <= MEPC_internal(h);
                    if(rs1(instr_word_IE) /= 0) then
                      MEPC_internal(h) <= (MEPC_internal(h) and not(csr_wdata_i));
                    end if;
                  when others =>
                    null;
                end case;

              when MTVEC_addr =>
                case csr_op_i is
                  when CSRRW|CSRRWI =>
                    csr_rdata_o_replicated(h) <= MTVEC_internal(h);
                    MTVEC_internal(h)         <= csr_wdata_i;
                  when CSRRS|CSRRSI =>
                    csr_rdata_o_replicated(h) <= MTVEC_internal(h);
                    if(rs1(instr_word_IE) /= 0) then
                      MTVEC_internal(h) <= (MTVEC_internal(h) or csr_wdata_i);
                    end if;
                  when CSRRC|CSRRCI =>
                    csr_rdata_o_replicated(h) <= MTVEC_internal(h);
                    if(rs1(instr_word_IE) /= 0) then
                      MTVEC_internal(h) <= (MTVEC_internal(h) and not(csr_wdata_i));
                    end if;
                  when others =>
                    null;
                end case;

              when MCAUSE_addr =>
                case csr_op_i is
                  when CSRRW|CSRRWI =>
                    csr_rdata_o_replicated(h)  <= MCAUSE_internal(h);
                    MCAUSE_internal(h)(31)         <= csr_wdata_i(31);
                    MCAUSE_internal(h)(4 downto 0) <= csr_wdata_i(4 downto 0);
                    MCAUSE_internal(h)(8) <= csr_wdata_i(8);
                  when CSRRS|CSRRSI =>
                    csr_rdata_o_replicated(h) <= MCAUSE_internal(h);
                    if(rs1(instr_word_IE) /= 0) then
                      MCAUSE_internal(h)(31)         <= (MCAUSE_internal(h)(31) or csr_wdata_i(31));
                      MCAUSE_internal(h)(4 downto 0) <= (MCAUSE_internal(h)(4 downto 0) or csr_wdata_i(4 downto 0));
                      MCAUSE_internal(h)(8) <= (MCAUSE_internal(h)(8) or csr_wdata_i(8));
                    end if;
                  when CSRRC|CSRRCI =>
                    csr_rdata_o_replicated(h) <= MCAUSE_internal(h);
                    if(rs1(instr_word_IE) /= 0) then
                      MCAUSE_internal(h)(4 downto 0) <= (MCAUSE_internal(h)(4 downto 0) and not(csr_wdata_i(4 downto 0)));
                      MCAUSE_internal(h)(31)         <= (MCAUSE_internal(h)(31) and not(csr_wdata_i(31)));
                      MCAUSE_internal(h)(8)         <= (MCAUSE_internal(h)(8) and not(csr_wdata_i(8)));
                    end if;
                  when others =>
                    null;
                end case;

              when MESTATUS_addr =>
                case csr_op_i is
                  when CSRRW|CSRRWI =>
                    csr_rdata_o_replicated(h) <= (13 to 31 => '0') & "11" & "000" & MESTATUS(h)(2) & "000" & MESTATUS(h)(1) & "00" & MESTATUS(h)(0);
                    MESTATUS(h)(0)            <= csr_wdata_i(0);
                  when CSRRS|CSRRSI =>
                    csr_rdata_o_replicated(h) <= (13 to 31 => '0') & "11" & "000" & MESTATUS(h)(2) & "000" & MESTATUS(h)(1) & "00" & MESTATUS(h)(0);
                    if(rs1(instr_word_IE) /= 0) then
                      MESTATUS(h)(0) <= (MESTATUS(h)(0) or csr_wdata_i(0));
                    end if;
                  when CSRRC|CSRRCI =>
                    csr_rdata_o_replicated(h) <= (13 to 31 => '0') & "11" & "000" & MESTATUS(h)(2) & "000" & MESTATUS(h)(1) & "00" & MESTATUS(h)(0);
                    if(rs1(instr_word_IE) /= 0) then
                      MESTATUS(h)(0) <= (MESTATUS(h)(0) and (not csr_wdata_i(0)));
                    end if;
                  when others =>
                    null;
                end case;
 
              when MCPUID_addr =>       -- read only
                case csr_op_i is
                  when CSRRC|CSRRS|CSRRCI|CSRRSI =>
                    if(rs1(instr_word_IE) = 0) then
                      csr_rdata_o_replicated(h) <= (9 to 31 => '0') & MCPUID(h);
                    else
                      csr_access_denied_o_replicated(h) <= '1';
                    end if;
                  when CSRRW|CSRRWI =>
                    csr_access_denied_o_replicated(h) <= '1';
                  when others =>
                    null;
                end case;

              when MIMPID_addr =>       -- read only
                case csr_op_i is
                  when CSRRC|CSRRS|CSRRCI|CSRRSI =>
                    if(rs1(instr_word_IE) = 0) then
                      csr_rdata_o_replicated(h) <= (16 to 31 => '0') & MIMPID(h);
                    else
                      csr_access_denied_o_replicated(h) <= '1';
                    end if;
                  when CSRRW|CSRRWI =>
                    csr_access_denied_o_replicated(h) <= '1';
                  when others =>
                    null;
                end case;

              when MHARTID_addr =>      -- read only
                case csr_op_i is
                  when CSRRC|CSRRS|CSRRCI|CSRRSI =>
                    if(rs1(instr_word_IE) = 0) then
                      csr_rdata_o_replicated(h) <= (10 to 31 => '0') & MHARTID(h);
                    else
                      csr_access_denied_o_replicated(h) <= '1';
                    end if;
                  when CSRRW|CSRRWI =>
                    csr_access_denied_o_replicated(h) <= '1';
                  when others =>
                    null;
                end case;

              when MIRQ_addr =>         -- read only
                case csr_op_i is
                  when CSRRC|CSRRS|CSRRCI|CSRRSI =>
                    if(rs1(instr_word_IE) = 0) then
                      csr_rdata_o_replicated(h) <= MIRQ(h);
                    else
                      csr_access_denied_o_replicated(h) <= '1';
                    end if;
                  when CSRRW|CSRRWI =>
                    csr_access_denied_o_replicated(h) <= '1';
                  when others =>
                    null;
                end case;

              when BADADDR_addr =>      -- read only
                case csr_op_i is
                  when CSRRC|CSRRS|CSRRCI|CSRRSI =>
                    if(rs1(instr_word_IE) = 0) then
                      csr_rdata_o_replicated(h) <= MBADADDR(h);
                    else
                      csr_access_denied_o_replicated(h) <= '1';
                    end if;
                  when CSRRW|CSRRWI =>
                    csr_access_denied_o_replicated(h) <= '1';
                  when others =>
                    null;
                end case;

              when MCYCLE_addr =>
                if (MCYCLE_EN = 1) then
                  case csr_op_i is
                    when CSRRW|CSRRWI =>
                      csr_rdata_o_replicated(h) <= MCYCLE(h);
                      MCYCLE(h)                 <= csr_wdata_i;
                    when CSRRS|CSRRSI =>
                      csr_rdata_o_replicated(h) <= MCYCLE(h);
                      if(rs1(instr_word_IE) /= 0) then
                        MCYCLE(h) <= (MCYCLE(h) or csr_wdata_i);
                      end if;
                    when CSRRC|CSRRCI =>
                      csr_rdata_o_replicated(h) <= MCYCLE(h);
                      if(rs1(instr_word_IE) /= 0) then
                        MCYCLE(h) <= (MCYCLE(h) and not(csr_wdata_i));
                      end if;
                    when others =>
                      null;
                  end case;
                else
                  csr_rdata_o_replicated(h) <= (others => '0');
                end if;

              when MCYCLEH_addr =>
                if (MCYCLE_EN = 1) then
                  case csr_op_i is
                    when CSRRW|CSRRWI =>
                      csr_rdata_o_replicated(h) <= MCYCLEH(h);
                      MCYCLEH(h)                <= csr_wdata_i;
                    when CSRRS|CSRRSI =>
                      csr_rdata_o_replicated(h) <= MCYCLEH(h);
                      if(rs1(instr_word_IE) /= 0) then
                        MCYCLEH(h) <= (MCYCLEH(h) or csr_wdata_i);
                      end if;
                    when CSRRC|CSRRCI =>
                      csr_rdata_o_replicated(h) <= MCYCLEH(h);
                      if(rs1(instr_word_IE) /= 0) then
                        MCYCLEH(h) <= (MCYCLEH(h) and not(csr_wdata_i));
                      end if;
                    when others =>
                      null;
                  end case;
                else
                  csr_rdata_o_replicated(h) <= (others => '0');
                end if;

              when MINSTRET_addr =>
                if (MINSTRET_EN = 1) then
                  case csr_op_i is
                    when CSRRW|CSRRWI =>
                      csr_rdata_o_replicated(h) <= std_logic_vector(unsigned(MINSTRET(h))-1);  --old value in reading
                      MINSTRET(h)               <= csr_wdata_i;
                    when CSRRS|CSRRSI =>
                      csr_rdata_o_replicated(h) <= std_logic_vector(unsigned(MINSTRET(h))-1);
                      if(rs1(instr_word_IE) /= 0) then
                        MINSTRET(h) <= (MINSTRET(h) or csr_wdata_i);
                      end if;
                    when CSRRC|CSRRCI =>
                      csr_rdata_o_replicated(h) <= std_logic_vector(unsigned(MINSTRET(h))-1);
                      if(rs1(instr_word_IE) /= 0) then
                        MINSTRET(h) <= (MINSTRET(h) and not(csr_wdata_i));
                      end if;
                    when others =>
                      null;
                  end case;
                else
                  csr_rdata_o_replicated(h) <= (others => '0');
                end if;

              when MINSTRETH_addr =>
                if (MINSTRET_EN = 1) then
                  case csr_op_i is
                    when CSRRW|CSRRWI =>
                      if(MINSTRET(h) = x"00000000" and MINSTRETH(h) /= x"00000000") then
                        csr_rdata_o_replicated(h) <= std_logic_vector(unsigned(MINSTRETH(h))-1);
                      else
                        csr_rdata_o_replicated(h) <= MINSTRETH(h);
                      end if;
                      MINSTRETH(h) <= csr_wdata_i;
                    when CSRRS|CSRRSI =>
                      if(MINSTRET(h) = x"00000000" and MINSTRETH(h) /= x"00000000") then
                        csr_rdata_o_replicated(h) <= std_logic_vector(unsigned(MINSTRETH(h))-1);
                      else
                        csr_rdata_o_replicated(h) <= MINSTRETH(h);
                      end if;
                      if(rs1(instr_word_IE) /= 0) then
                        MINSTRETH(h) <= (MINSTRETH(h) or csr_wdata_i);
                      end if;
                    when CSRRC|CSRRCI =>
                      if(MINSTRET(h) = x"00000000" and MINSTRETH(h) /= x"00000000") then
                        csr_rdata_o_replicated(h) <= std_logic_vector(unsigned(MINSTRETH(h))-1);
                      else
                        csr_rdata_o_replicated(h) <= MINSTRETH(h);
                      end if;
                      if(rs1(instr_word_IE) /= 0) then
                        MINSTRETH(h) <= (MINSTRETH(h) and not(csr_wdata_i));
                      end if;
                    when others =>
                      null;
                  end case;
                else
                  csr_rdata_o_replicated(h) <= (others => '0');
                end if;

              when MHPMCOUNTER3_addr =>
                if (MHPMCOUNTER_EN = 1) then
                  case csr_op_i is
                    when CSRRW|CSRRWI =>
                      csr_rdata_o_replicated(h) <= MHPMCOUNTER3(h);
                      MHPMCOUNTER3(h)           <= csr_wdata_i;
                    when CSRRS|CSRRSI =>
                      csr_rdata_o_replicated(h) <= MHPMCOUNTER3(h);
                      if(rs1(instr_word_IE) /= 0) then
                        MHPMCOUNTER3(h) <= (MHPMCOUNTER3(h) or csr_wdata_i);
                      end if;
                    when CSRRC|CSRRCI =>
                      csr_rdata_o_replicated(h) <= MHPMCOUNTER3(h);
                      if(rs1(instr_word_IE) /= 0) then
                        MHPMCOUNTER3(h) <= (MHPMCOUNTER3(h) and not(csr_wdata_i));
                      end if;
                    when others =>
                      null;
                  end case;
                else
                  csr_rdata_o_replicated(h) <= (others => '0');
                end if;


              when MHPMCOUNTER6_addr =>
                if (MHPMCOUNTER_EN = 1) then
                  case csr_op_i is
                    when CSRRW|CSRRWI =>
                      csr_rdata_o_replicated(h) <= MHPMCOUNTER6(h);
                      MHPMCOUNTER6(h)           <= csr_wdata_i;
                    when CSRRS|CSRRSI =>
                      csr_rdata_o_replicated(h) <= MHPMCOUNTER6(h);
                      if(rs1(instr_word_IE) /= 0) then
                        MHPMCOUNTER6(h) <= (MHPMCOUNTER6(h) or csr_wdata_i);
                      end if;
                    when CSRRC|CSRRCI =>
                      csr_rdata_o_replicated(h) <= MHPMCOUNTER6(h);
                      if(rs1(instr_word_IE) /= 0) then
                        MHPMCOUNTER6(h) <= (MHPMCOUNTER6(h) and not(csr_wdata_i));
                      end if;
                    when others =>
                      null;
                  end case;
                else
                  csr_rdata_o_replicated(h) <= (others => '0');
                end if;

              when MHPMCOUNTER7_addr =>
                if (MHPMCOUNTER_EN = 1) then
                  case csr_op_i is
                    when CSRRW|CSRRWI =>
                      csr_rdata_o_replicated(h) <= MHPMCOUNTER7(h);
                      MHPMCOUNTER7(h)           <= csr_wdata_i;
                    when CSRRS|CSRRSI =>
                      csr_rdata_o_replicated(h) <= MHPMCOUNTER7(h);
                      if(rs1(instr_word_IE) /= 0) then
                        MHPMCOUNTER7(h) <= (MHPMCOUNTER7(h) or csr_wdata_i);
                      end if;
                    when CSRRC|CSRRCI =>
                      csr_rdata_o_replicated(h) <= MHPMCOUNTER7(h);
                      if(rs1(instr_word_IE) /= 0) then
                        MHPMCOUNTER7(h) <= (MHPMCOUNTER7(h) and not(csr_wdata_i));
                      end if;
                    when others =>
                      null;
                  end case;
                else
                  csr_rdata_o_replicated(h) <= (others => '0');
                end if;

              when MHPMCOUNTER8_addr =>
                if (MHPMCOUNTER_EN = 1) then
                  case csr_op_i is
                    when CSRRW|CSRRWI =>
                      csr_rdata_o_replicated(h) <= MHPMCOUNTER8(h);
                      MHPMCOUNTER8(h)           <= csr_wdata_i;
                    when CSRRS|CSRRSI =>
                      csr_rdata_o_replicated(h) <= MHPMCOUNTER8(h);
                      if(rs1(instr_word_IE) /= 0) then
                        MHPMCOUNTER8(h) <= (MHPMCOUNTER8(h) or csr_wdata_i);
                      end if;
                    when CSRRC|CSRRCI =>
                      csr_rdata_o_replicated(h) <= MHPMCOUNTER8(h);
                      if(rs1(instr_word_IE) /= 0) then
                        MHPMCOUNTER8(h) <= (MHPMCOUNTER8(h) and not(csr_wdata_i));
                      end if;
                    when others =>
                      null;
                  end case;
                else
                  csr_rdata_o_replicated(h) <= (others => '0');
                end if;

              when MHPMCOUNTER9_addr =>
                if (MHPMCOUNTER_EN = 1) then
                  case csr_op_i is
                    when CSRRW|CSRRWI =>
                      csr_rdata_o_replicated(h) <= MHPMCOUNTER9(h);
                      MHPMCOUNTER9(h)           <= csr_wdata_i;
                    when CSRRS|CSRRSI =>
                      csr_rdata_o_replicated(h) <= MHPMCOUNTER9(h);
                      if(rs1(instr_word_IE) /= 0) then
                        MHPMCOUNTER9(h) <= (MHPMCOUNTER9(h) or csr_wdata_i);
                      end if;
                    when CSRRC|CSRRCI =>
                      csr_rdata_o_replicated(h) <= MHPMCOUNTER9(h);
                      if(rs1(instr_word_IE) /= 0) then
                        MHPMCOUNTER9(h) <= (MHPMCOUNTER9(h) and not(csr_wdata_i));
                      end if;
                    when others =>
                      null;
                  end case;
                else
                  csr_rdata_o_replicated(h) <= (others => '0');
                end if;

              when MHPMCOUNTER10_addr =>
                if (MHPMCOUNTER_EN = 1) then
                  case csr_op_i is
                    when CSRRW|CSRRWI =>
                      csr_rdata_o_replicated(h) <= MHPMCOUNTER10(h);
                      MHPMCOUNTER10(h)          <= csr_wdata_i;
                    when CSRRS|CSRRSI =>
                      csr_rdata_o_replicated(h) <= MHPMCOUNTER10(h);
                      if(rs1(instr_word_IE) /= 0) then
                        MHPMCOUNTER10(h) <= (MHPMCOUNTER10(h) or csr_wdata_i);
                      end if;
                    when CSRRC|CSRRCI =>
                      csr_rdata_o_replicated(h) <= MHPMCOUNTER10(h);
                      if(rs1(instr_word_IE) /= 0) then
                        MHPMCOUNTER10(h) <= (MHPMCOUNTER10(h) and not(csr_wdata_i));
                      end if;
                    when others =>
                      null;
                  end case;
                else
                  csr_rdata_o_replicated(h) <= (others => '0');
                end if;


              when PCER_addr =>
                if (MHPMCOUNTER_EN = 1 or MCYCLE_EN = 1 or MINSTRET_EN = 1) then
                  case csr_op_i is
                    when CSRRW|CSRRWI =>
                      csr_rdata_o_replicated(h) <= PCER(h);
                      PCER(h)                   <= csr_wdata_i;
                      MHPMEVENT3(h)             <= csr_wdata_i(2); 
                      MHPMEVENT6(h)             <= csr_wdata_i(5);
                      MHPMEVENT7(h)             <= csr_wdata_i(6);
                      MHPMEVENT8(h)             <= csr_wdata_i(7);
                      MHPMEVENT9(h)             <= csr_wdata_i(8);
                      MHPMEVENT10(h)            <= csr_wdata_i(9);

                    when CSRRS|CSRRSI =>
                      csr_rdata_o_replicated(h) <= PCER(h);
                      if(rs1(instr_word_IE) /= 0) then
                        PCER(h)        <= (PCER(h) or csr_wdata_i);
                        MHPMEVENT3(h)  <= (PCER(h)(2) or csr_wdata_i(2));
                        MHPMEVENT6(h)  <= (PCER(h)(5) or csr_wdata_i(5));
                        MHPMEVENT7(h)  <= (PCER(h)(6) or csr_wdata_i(6));
                        MHPMEVENT8(h)  <= (PCER(h)(7) or csr_wdata_i(7));
                        MHPMEVENT9(h)  <= (PCER(h)(8) or csr_wdata_i(8));
                        MHPMEVENT10(h) <= (PCER(h)(9) or csr_wdata_i(9));

                      end if;
                    when CSRRC|CSRRCI =>
                      csr_rdata_o_replicated(h) <= PCER(h);
                      if(rs1(instr_word_IE) /= 0) then
                        PCER(h)        <= (PCER(h) and not(csr_wdata_i));
                        MHPMEVENT3(h)  <= (PCER(h)(2) and not (csr_wdata_i(2)));
                        MHPMEVENT6(h)  <= (PCER(h)(5) and not (csr_wdata_i(5)));
                        MHPMEVENT7(h)  <= (PCER(h)(6) and not (csr_wdata_i(6)));
                        MHPMEVENT8(h)  <= (PCER(h)(7) and not (csr_wdata_i(7)));
                        MHPMEVENT9(h)  <= (PCER(h)(8) and not (csr_wdata_i(8)));
                        MHPMEVENT10(h) <= (PCER(h)(9) and not (csr_wdata_i(9)));
                      end if;
                    when others =>
                      null;
                  end case;
                else
                  csr_rdata_o_replicated(h) <= (others => '0');
                end if;

              when MHPMEVENT3_addr =>
                if (MHPMCOUNTER_EN = 1) then
                  case csr_op_i is
                    when CSRRW|CSRRWI =>
                      csr_rdata_o_replicated(h) <= (2 => MHPMEVENT3(h), others => '0');
                      MHPMEVENT3(h)             <= csr_wdata_i(2);
                      PCER(h)(2)                <= csr_wdata_i(2);
                    when CSRRS|CSRRSI =>
                      csr_rdata_o_replicated(h) <= (2 => MHPMEVENT3(h), others => '0');
                      if(rs1(instr_word_IE) /= 0) then
                        MHPMEVENT3(h) <= (MHPMEVENT3(h) or csr_wdata_i(2));
                        PCER(h)(2)    <= (PCER(h)(2) or csr_wdata_i(2));
                      end if;
                    when CSRRC|CSRRCI =>
                      csr_rdata_o_replicated(h) <= (2 => MHPMEVENT3(h), others => '0');
                      if(rs1(instr_word_IE) /= 0) then
                        MHPMEVENT3(h) <= (MHPMEVENT3(h) and not(csr_wdata_i(2)));
                      end if;
                    when others =>
                      null;
                  end case;
                else
                  csr_rdata_o_replicated(h) <= (others => '0');
                end if;

              when MHPMEVENT6_addr =>
                if (MHPMCOUNTER_EN = 1) then
                  case csr_op_i is
                    when CSRRW|CSRRWI =>
                      csr_rdata_o_replicated(h) <= (5 => MHPMEVENT6(h), others => '0');
                      MHPMEVENT6(h)             <= csr_wdata_i(5);
                      PCER(h)(5)                <= csr_wdata_i(5);
                    when CSRRS|CSRRSI =>
                      csr_rdata_o_replicated(h) <= (5 => MHPMEVENT6(h), others => '0');
                      if(rs1(instr_word_IE) /= 0) then
                        MHPMEVENT6(h) <= (MHPMEVENT6(h) or csr_wdata_i(5));
                        PCER(h)(5)    <= (PCER(h)(5) or csr_wdata_i(5));
                      end if;
                    when CSRRC|CSRRCI =>
                      csr_rdata_o_replicated(h) <= (5 => MHPMEVENT6(h), others => '0');
                      if(rs1(instr_word_IE) /= 0) then
                        MHPMEVENT6(h) <= (MHPMEVENT6(h) and not(csr_wdata_i(5)));
                      end if;
                    when others =>
                      null;
                  end case;
                else
                  csr_rdata_o_replicated(h) <= (others => '0');
                end if; 

              when MHPMEVENT7_addr =>
                if (MHPMCOUNTER_EN = 1) then
                  case csr_op_i is
                    when CSRRW|CSRRWI =>
                      csr_rdata_o_replicated(h) <= (6 => MHPMEVENT7(h), others => '0');
                      MHPMEVENT7(h)             <= csr_wdata_i(6);
                      PCER(h)(6)                <= csr_wdata_i(6);
                    when CSRRS|CSRRSI =>
                      csr_rdata_o_replicated(h) <= (6 => MHPMEVENT7(h), others => '0');
                      if(rs1(instr_word_IE) /= 0) then
                        MHPMEVENT7(h) <= (MHPMEVENT7(h) or csr_wdata_i(6));
                        PCER(h)(6)    <= (PCER(h)(6) or csr_wdata_i(6));
                      end if;
                    when CSRRC|CSRRCI =>
                      csr_rdata_o_replicated(h) <= (6 => MHPMEVENT7(h), others => '0');
                      if(rs1(instr_word_IE) /= 0) then
                        MHPMEVENT7(h) <= (MHPMEVENT7(h) and not(csr_wdata_i(6)));
                      end if;
                    when others =>
                      null;
                  end case;
                else
                  csr_rdata_o_replicated(h) <= (others => '0');
                end if;

              when MHPMEVENT8_addr =>
                if (MHPMCOUNTER_EN = 1) then
                  case csr_op_i is
                    when CSRRW|CSRRWI =>
                      csr_rdata_o_replicated(h) <= (7 => MHPMEVENT8(h), others => '0');
                      MHPMEVENT8(h)             <= csr_wdata_i(7);
                      PCER(h)(7)                <= csr_wdata_i(7);
                    when CSRRS|CSRRSI =>
                      csr_rdata_o_replicated(h) <= (7 => MHPMEVENT8(h), others => '0');
                      if(rs1(instr_word_IE) /= 0) then
                        MHPMEVENT8(h) <= (MHPMEVENT8(h) or csr_wdata_i(7));
                        PCER(h)(7)    <= (PCER(h)(7) or csr_wdata_i(7));
                      end if;
                    when CSRRC|CSRRCI =>
                      csr_rdata_o_replicated(h) <= (7 => MHPMEVENT8(h), others => '0');
                      if(rs1(instr_word_IE) /= 0) then
                        MHPMEVENT8(h) <= (MHPMEVENT8(h) and not(csr_wdata_i(7)));
                      end if;
                    when others =>
                      null;
                  end case;
                else
                  csr_rdata_o_replicated(h) <= (others => '0');
                end if;

              when MHPMEVENT9_addr =>
                if (MHPMCOUNTER_EN = 1) then
                  case csr_op_i is
                    when CSRRW|CSRRWI =>
                      csr_rdata_o_replicated(h) <= (8 => MHPMEVENT9(h), others => '0');
                      MHPMEVENT9(h)             <= csr_wdata_i(8);
                      PCER(h)(8)                <= csr_wdata_i(8);
                    when CSRRS|CSRRSI =>
                      csr_rdata_o_replicated(h) <= (8 => MHPMEVENT9(h), others => '0');
                      if(rs1(instr_word_IE) /= 0) then
                        MHPMEVENT9(h) <= (MHPMEVENT9(h) or csr_wdata_i(8));
                        PCER(h)(8)    <= (PCER(h)(8) or csr_wdata_i(8));
                      end if;
                    when CSRRC|CSRRCI =>
                      csr_rdata_o_replicated(h) <= (8 => MHPMEVENT9(h), others => '0');
                      if(rs1(instr_word_IE) /= 0) then
                        MHPMEVENT9(h) <= (MHPMEVENT9(h) and not(csr_wdata_i(8)));
                      end if;
                    when others =>
                      null;
                  end case;
                else
                  csr_rdata_o_replicated(h) <= (others => '0');
                end if;

              when MHPMEVENT10_addr =>
                if (MHPMCOUNTER_EN = 1) then
                  case csr_op_i is
                    when CSRRW|CSRRWI =>
                      csr_rdata_o_replicated(h) <= (9 => MHPMEVENT10(h), others => '0');
                      MHPMEVENT10(h)            <= csr_wdata_i(9);
                      PCER(h)(9)                <= csr_wdata_i(9);
                    when CSRRS|CSRRSI =>
                      csr_rdata_o_replicated(h) <= (9 => MHPMEVENT10(h), others => '0');
                      if(rs1(instr_word_IE) /= 0) then
                        MHPMEVENT10(h) <= (MHPMEVENT10(h) or csr_wdata_i(9));
                        PCER(h)(9)     <= (PCER(h)(9) or csr_wdata_i(9));
                      end if;
                    when CSRRC|CSRRCI =>
                      csr_rdata_o_replicated(h) <= (9 => MHPMEVENT10(h), others => '0');
                      if(rs1(instr_word_IE) /= 0) then
                        MHPMEVENT10(h) <= (MHPMEVENT10(h) and not(csr_wdata_i(9)));
                      end if;
                    when others =>
                      null;
                  end case;
                else
                  csr_rdata_o_replicated(h) <= (others => '0');
                end if;

              when others =>  -- invalid CSR address. ignored. May raise exception in future.
                csr_rdata_o_replicated(h) <= (others => '0');  -- unhandled situation
                                                               -- default value
            end case;
          else
            null;  -- invalid CSR operation, ignored. May raise exception in future.
          end if;  -- csr_op_i
        end if;  -- trap conditions, csr_instr_done, csr_instr_req

        ------------------------------------------------------------------------------------------------------------------------------------------------------
        --  ██████╗ ███████╗██████╗ ███████╗     ██████╗███╗   ██╗████████╗    ██╗███╗   ██╗ ██████╗██████╗ ███████╗███╗   ███╗███████╗███╗   ██╗████████╗  --
        --  ██╔══██╗██╔════╝██╔══██╗██╔════╝    ██╔════╝████╗  ██║╚══██╔══╝    ██║████╗  ██║██╔════╝██╔══██╗██╔════╝████╗ ████║██╔════╝████╗  ██║╚══██╔══╝  --
        --  ██████╔╝█████╗  ██████╔╝█████╗      ██║     ██╔██╗ ██║   ██║       ██║██╔██╗ ██║██║     ██████╔╝█████╗  ██╔████╔██║█████╗  ██╔██╗ ██║   ██║     --
        --  ██╔═══╝ ██╔══╝  ██╔══██╗██╔══╝      ██║     ██║╚██╗██║   ██║       ██║██║╚██╗██║██║     ██╔══██╗██╔══╝  ██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║     --
        --  ██║     ███████╗██║  ██║██║         ╚██████╗██║ ╚████║   ██║       ██║██║ ╚████║╚██████╗██║  ██║███████╗██║ ╚═╝ ██║███████╗██║ ╚████║   ██║     --
        --  ╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝          ╚═════╝╚═╝  ╚═══╝   ╚═╝       ╚═╝╚═╝  ╚═══╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝     --
        ------------------------------------------------------------------------------------------------------------------------------------------------------                                                                                                                                      

        -- PERFORMANCE COUNTER AUTOMATIC UPDATING --

        if dbg_req_o = '0' then
          --THIS BIG CONDITION CHECKS WRITING TO THE CSR. IF A COUNTER IS WRITTEN, YOU DON'T HAVE TO INCREMENT IT.
          --The problems are only during writing on MCYCLE/H and MINSTRET/H or on any other counters that count csr instructions.

          if (MCYCLE_EN = 1) then
            if (PCER(h)(0) = '1'
                    and not(csr_instr_req = '1'
                    and (csr_addr_i = (MCYCLE_addr) or csr_addr_i = MCYCLEH_addr)
                    and (csr_op_i = CSRRWI
                    or   csr_op_i = CSRRW
                    or  (csr_op_i = CSRRS and rs1(instr_word_IE) /= 0)
                    or  (csr_op_i = CSRRSI and rs1(instr_word_IE) /= 0)
                    or  (csr_op_i = CSRRC and rs1(instr_word_IE) /= 0)
                    or  (csr_op_i = CSRRCI and rs1(instr_word_IE) /= 0)))) then  --cycle counter
              if harc_EXEC = h or count_all = 1 then -- count_all is bypass and enables counting regardless of the hart executing
                if(MCYCLE(h) = x"FFFFFFFF") then
                  MCYCLEH(h) <= std_logic_vector(unsigned(MCYCLEH(h))+1);
                  MCYCLE(h)  <= x"00000000";
                else
                  MCYCLE(h) <= std_logic_vector(unsigned(MCYCLE(h))+1);
                end if;
              end if;
            end if;
          end if;

          if (MINSTRET_EN = 1) then
            if (PCER(h)(1) = '1'
                    and not(csr_instr_req = '1'
                    and (csr_addr_i = (MINSTRET_addr) or csr_addr_i = MINSTRETH_addr)
                    and (csr_op_i = CSRRWI
                    or   csr_op_i = CSRRW
                    or  (csr_op_i = CSRRS and rs1(instr_word_IE) /= 0)
                    or  (csr_op_i = CSRRSI and rs1(instr_word_IE) /= 0)
                    or  (csr_op_i = CSRRC and rs1(instr_word_IE) /= 0)
                    or  (csr_op_i = CSRRCI and rs1(instr_word_IE) /= 0)))) then --instruction counter
              if harc_EXEC = h or count_all = 1 then -- count_all is bypass and enables counting regardless of the hart executing            
                if(instr_rvalid_IE = '1' ) then
                  if (MINSTRET(h) = x"FFFFFFFF") then
                    MINSTRETH(h) <= std_logic_vector(unsigned(MINSTRETH(h))+1);
                    MINSTRET(h)  <= x"00000000";
                  else
                    MINSTRET(h) <= std_logic_vector(unsigned(MINSTRET(h))+1);
                  end if;
                end if;
              end if;
            end if;
          end if;

          if (PCER(h)(2) = '1') then    --load/store access stall
            if (MHPMCOUNTER_EN = 1) then
              if (data_req_o = '1' and data_gnt_i = '0') then
                MHPMCOUNTER3(h) <= std_logic_vector(unsigned(MHPMCOUNTER3(h))+1);
              end if;
            end if;
          end if;

          if(PCER(h)(5) = '1') then     --load access 
            if (MHPMCOUNTER_EN = 1) then
              if harc_EXEC = h or count_all = 1 then -- count_all is bypass and enables counting regardless of the hart executing
                if (data_req_o = '1' and data_gnt_i = '1' and data_we_o = '0') then
                  MHPMCOUNTER6(h) <= std_logic_vector(unsigned(MHPMCOUNTER6(h))+1);
                end if;
              end if;
            end if;
          end if;

          if(PCER(h)(6) = '1') then     --store access 
            if (MHPMCOUNTER_EN = 1) then
              if harc_EXEC = h or count_all = 1 then  -- count_all is bypass and enables counting regardless of the hart executing
                if (data_req_o = '1' and data_gnt_i = '1' and data_we_o = '1') then
                  MHPMCOUNTER7(h) <= std_logic_vector(unsigned(MHPMCOUNTER7(h))+1);
                end if;
              end if;
            end if;
          end if;

          if(PCER(h)(7) = '1') then     --jump 
            if (MHPMCOUNTER_EN = 1) then
              if harc_EXEC = h or count_all = 1 then -- count_all is bypass and enables counting regardless of the hart executing
                if (jump_instr = '1') then
                  MHPMCOUNTER8(h) <= std_logic_vector(unsigned(MHPMCOUNTER8(h))+1);
                end if;
              end if;
            end if;
          end if;

          if(PCER(h)(8) = '1') then     --branch 
            if (MHPMCOUNTER_EN = 1) then
              if harc_EXEC = h or count_all = 1 then -- count_all is bypass and enables counting regardless of the hart executing
                if (branch_instr = '1') then
                  MHPMCOUNTER9(h) <= std_logic_vector(unsigned(MHPMCOUNTER9(h))+1);
                end if;
              end if;
            end if;
          end if;

          if(PCER(h)(9) = '1') then     --btaken
            if (MHPMCOUNTER_EN = 1) then
              if harc_EXEC = h or count_all = 1 then -- count_all is bypass and enables counting regardless of the hart executing
                if (branch_instr = '1' and set_branch_condition = '1') then
                  MHPMCOUNTER10(h) <= std_logic_vector(unsigned(MHPMCOUNTER10(h))+1);
                end if;
              end if;
            end if;
          end if;

        end if;  --debug_req_o='0'
      end if;  -- reset or clk'event
    end process;

  end generate CSR_updating_logic;
  -- end of replicated logic ------------------------------------------------------------

--here we OR the signals coming from different CS logic replicas
  process(all)
    variable wire1, wire2 : std_logic;
  begin
    wire1 := '0'; wire2 := '0';
    for h in harc_range loop
      wire1 := wire1 or csr_instr_done_replicated(h);
      wire2 := wire2 or csr_access_denied_o_replicated(h);
    end loop;
    csr_instr_done      <= wire1;
    csr_access_denied_o <= wire2;
  end process;

-- this is a mux choosing the csr data output corresponding to the actual harc executed
  csr_rdata_o <= csr_rdata_o_replicated(harc_EXEC);


-- small fsm using the served_irq signals coming from different PC updating logic replicas
-- to operate on the irq_ack signals  
  irq_ack_manager : process(clk_i, rst_ni)
    variable wire1 : std_logic;
  begin
    if rst_ni = '0' then
      irq_ack_o_internal <= '0';
    elsif rising_edge(clk_i) then
      wire1 := '0';
      for h in harc_range loop
        wire1 := wire1 or served_irq(h);
      end loop;
      case irq_ack_o_internal is
        when '0' =>
          if wire1 = '0' then
            irq_ack_o_internal <= '0';
          else
            irq_ack_o_internal <= '1';
            irq_id_o       <= irq_id_i;
          end if;
        when '1' =>
          irq_ack_o_internal <= '0';
        when others => null;
      end case;
    end if;
  end process irq_ack_manager;

------------------------------------------------------------------------ end of CSE Unit ---------
--------------------------------------------------------------------------------------------------  

end CSR;
--------------------------------------------------------------------------------------------------
-- END of CSR Unit  architecture -----------------------------------------------------------------
--------------------------------------------------------------------------------------------------
