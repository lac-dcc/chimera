--------------------------------------------------------------------------------------------------------
--  Debug Unit --                                                                                     --
--  Author(s): Gianmarco Cerutti                                                                      --
--             Abdallah Cheikh abdallah.cheikh@uniroma1.it (abdallah93.as@gmail.com)                  --
--                                                                                                    --
--  Date Modified: 17-11-2019                                                                         --
--------------------------------------------------------------------------------------------------------
--  Debug Unit halts and sigle steps the core, it can read the current and next program counters,     --
--  The register file can also be accessed by the debug unit.                                         --
--------------------------------------------------------------------------------------------------------

-- ieee packages ------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use std.textio.all;

-- local packages ------------
use work.riscv_klessydra.all;
--use work.klessydra_parameters.all;

entity Debug_UNIT is
  generic(
      THREAD_POOL_SIZE         : integer;
      LUTRAM_RF                : natural;
      ACCL_NUM                 : natural;
      RF_SIZE                  : natural
      );
  port(
      set_branch_condition     : in  std_logic;
      ie_except_condition      : in  std_logic;
      ls_except_condition      : in  std_logic;
      dsp_except_condition     : in  std_logic_vector(ACCL_NUM-1 downto 0);
      set_except_condition     : in  std_logic;
      set_mret_condition       : in  std_logic;
      served_irq               : in  std_logic_vector(THREAD_POOL_SIZE-1 downto 0);
      irq_pending              : in  std_logic_vector(THREAD_POOL_SIZE-1 downto 0);
      taken_branch_pc_lat      : in  array_2D(THREAD_POOL_SIZE-1 downto 0)(31 downto 0);
      incremented_pc           : in  array_2D(THREAD_POOL_SIZE-1 downto 0)(31 downto 0);
      MTVEC                    : in  array_2D(THREAD_POOL_SIZE-1 downto 0)(31 downto 0);
      MIP                      : in  array_2D(THREAD_POOL_SIZE-1 downto 0)(31 downto 0);
      MSTATUS                  : in  array_2d(THREAD_POOL_SIZE-1 downto 0)(1 downto 0);
      MCAUSE                   : in  array_2D(THREAD_POOL_SIZE-1 downto 0)(31 downto 0);
      mepc_incremented_pc      : in  array_2D(THREAD_POOL_SIZE-1 downto 0)(31 downto 0) := (others => (others => '0'));
      mepc_interrupt_pc        : in  array_2D(THREAD_POOL_SIZE-1 downto 0)(31 downto 0) := (others => (others => '0'));
      regfile                  : in  array_3d(THREAD_POOL_SIZE-1 downto 0)(RF_SIZE-1 downto 0)(31 downto 0);
      pc_IE                    : in  std_logic_vector (31 downto 0);
      pc_ID                    : in  std_logic_vector (31 downto 0);
      harc_ID                  : in  integer range THREAD_POOL_SIZE-1 downto 0;
      ebreak_instr             : in  std_logic;
      dbg_ack_i                : in  std_logic;
      taken_branch             : in  std_logic;
      taken_branch_pending     : in  std_logic_vector(THREAD_POOL_SIZE-1 downto 0);
      dbg_req_o                : out std_logic;
      clk_i                    : in  std_logic;
      rst_ni                   : in  std_logic;
      debug_req_i              : in  std_logic;
      debug_gnt_o              : out std_logic;
      debug_rvalid_o           : out std_logic;
      debug_addr_i             : in  std_logic_vector(14 downto 0);
      debug_we_i               : in  std_logic;
      debug_wdata_i            : in  std_logic_vector(31 downto 0);
      debug_rdata_o            : out std_logic_vector(31 downto 0);
      debug_halted_o           : out std_logic;
      debug_halt_i             : in  std_logic;
      debug_resume_i           : in  std_logic
      );
end entity;

architecture DBG of Debug_Unit is



  type fsm_DBU_states is (RUNNING, HALT_REQ, HALT, SINGLE_STEP_REQ, SINGLE_STEP);
  signal state_DBU       : fsm_DBU_states;
  signal nextstate_DBU   : fsm_DBU_states;
  signal dbg_halt_req    : std_logic;
  signal dbg_resume_core : std_logic;
  signal dbg_ssh         : std_logic;
  signal dbg_sse         : std_logic;

  -- wire only signals (For Synopsis Comaptibility)
  signal dbg_halted_o_wire : std_logic;

begin

  debug_halted_o <= dbg_halted_o_wire;

  --DEBUG_UNIT--
  --There are two processes, one handle the minterface between the external and the core, and one memorize the debug state.

  DBU_interface_handler : process(clk_i, rst_ni)
  begin
    if(rst_ni = '0') then
      debug_rvalid_o  <= '0';
      debug_rdata_o   <= (others => '0');
      dbg_halt_req    <= '0';
      dbg_sse         <= '0';
      dbg_ssh         <= '1';
      dbg_resume_core <= '0';
    elsif rising_edge(clk_i) then
      dbg_ssh <= '1';
      if (debug_req_i = '1') then
        debug_rvalid_o <= '1';
        if(debug_we_i = '0') then       --read access
          case debug_addr_i(13 downto 8) is
            when "000000" =>            --debug register always accessible
              case debug_addr_i(6 downto 2) is
                when "00000" =>
                  debug_rdata_o <= (0      => dbg_halted_o_wire,
                                    16     => dbg_sse,
                                    others => '0');
                when "00001" =>
                  debug_rdata_o <= (0 => dbg_ssh, others => '0');
                when others =>
                  null;
              end case;
            when "100000" =>  --debug regster accessible only when core is halted, that's why there is a condition on dbg_halted_o_wire
              if dbg_halted_o_wire = '1' then
                case debug_addr_i(2) is
                  when '1' =>           --previous pc 
                    debug_rdata_o <= pc_ie;
                  when '0' =>           -- next pc
                    debug_rdata_o <= pc_id;
                  when others =>
                    null;
                end case;
              end if;
            when "000100" => --Read the GPR
              if LUTRAM_RF = 0 then
                debug_rdata_o <= regfile(harc_ID)(to_integer(unsigned(debug_addr_i(6 downto 2))));
              end if;
            when others =>
              null;
          end case;
        else                            -- write access
          debug_rvalid_o <= '0';
          case debug_addr_i(13 downto 8) is
            when "000000" =>            --debug register always accessible
              case debug_addr_i(6 downto 2) is
                when "00000" => -- debug control
                  if (debug_wdata_i(16) = '1') then
                    if dbg_halted_o_wire = '0' then
                      dbg_halt_req <= '1';
                    else
                      dbg_halt_req <= '0';
                    end if;
                  else
                    if dbg_halted_o_wire = '1' then
                      dbg_resume_core <= '1';
                      dbg_halt_req    <= '0';
                    end if;
                  end if;
                  if(debug_wdata_i(0) = '1') then
                    dbg_sse <= '1';
                  else
                    dbg_sse <= '0';
                  end if;
                when "00001" =>  -- debug hit
                  if (debug_wdata_i(0) = '0') then
                    if dbg_sse = '1' and dbg_halted_o_wire = '1' then
                      dbg_ssh <= '0';
                    end if;
                  end if;
                when others =>
                  null;
              end case;
            when others =>
              null;
          end case;
        end if;
      end if;
    end if;
  end process;

  DBU_combination_access : process (all)
  begin
    if (debug_req_i = '1') then
      debug_gnt_o <= '1';
    else
      debug_gnt_o <= '0';
    end if;
  end process;

  --DEBUG_UNIT_NEXTSTATE
  fsm_Debug_Unit_nextstate : process(all)
  begin
    dbg_req_o         <= '0';
    dbg_halted_o_wire <= '0';
    nextstate_DBU     <= RUNNING;
    case state_DBU is
      when RUNNING =>
        if ebreak_instr = '1' then
          if dbg_sse = '1' then
            nextstate_DBU <= SINGLE_STEP;
          else
            nextstate_DBU <= HALT;
          end if;
        elsif dbg_halt_req = '1' then
          dbg_req_o <= '1';
          if dbg_sse = '1' then
            nextstate_DBU <= SINGLE_STEP_REQ;
          else
            nextstate_DBU <= HALT_REQ;
          end if;
        end if;
      when HALT_REQ =>
        dbg_req_o         <= '1';
        if dbg_ack_i = '1' then
          nextstate_DBU <= HALT;
        else
          if dbg_resume_core = '0' then
            if dbg_sse = '1' then
              nextstate_DBU <= SINGLE_STEP_REQ;
            else
              nextstate_DBU <= HALT_REQ;
            end if;
          end if;
        end if;  --dbg_ack_i 
      when HALT =>
        dbg_req_o         <= '1';
        dbg_halted_o_wire <= '1';
        if dbg_resume_core = '0' then
          if dbg_sse = '1' then
            nextstate_DBU <= SINGLE_STEP;
          else
            nextstate_DBU <= HALT;
          end if;
        end if;
      when SINGLE_STEP_REQ =>
        dbg_req_o         <= '1';
        if dbg_ack_i = '1' then
          nextstate_DBU <= SINGLE_STEP;
        else
          if dbg_sse = '0' then
            nextstate_DBU <= HALT_REQ;
          else
            nextstate_DBU <= SINGLE_STEP_REQ;
          end if;
        end if;
      when SINGLE_STEP =>
        if dbg_sse = '0' then
          if dbg_resume_core = '0' then
            dbg_req_o         <= '1';
            dbg_halted_o_wire <= '1';
            nextstate_DBU     <= HALT;
          end if;
        elsif dbg_ssh = '0' then -- when a signle step is hit, the debug halt is stopped for one exact cycle
          nextstate_DBU     <= SINGLE_STEP_REQ;
        else
          dbg_req_o         <= '1';
          dbg_halted_o_wire <= '1';
          nextstate_DBU     <= SINGLE_STEP;
        end if;
      when others =>
        null;
    end case;
  end process;


  fsm_DBU_register_state : process(clk_i, rst_ni)
  begin
    if rst_ni = '0' then
      state_DBU <= RUNNING;
    elsif rising_edge(clk_i) then
      state_DBU <= nextstate_DBU;
    end if;
  end process;

------------------------------------------------------------------------ end of DBG Unit ---------
--------------------------------------------------------------------------------------------------  

end DBG;
--------------------------------------------------------------------------------------------------
-- END of DBG Unit  architecture -----------------------------------------------------------------
--------------------------------------------------------------------------------------------------
