library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;
use work.zpuino_config.all;

entity zpuino_debug_core is
  port (
    clk:            in std_logic;
    rst:            in std_logic;

    dbg_in:         in zpu_dbg_out_type;
    dbg_out:        out zpu_dbg_in_type;
    dbg_reset:      out std_logic;

    jtag_data_chain_out:  out std_logic_vector(98 downto 0);
    jtag_ctrl_chain_in:   in std_logic_vector(11 downto 0)
  );
end entity;

architecture behave of zpuino_debug_core is

  signal enter_ss: std_logic :='0';
  signal step: std_logic := '0';

  signal status_injection_ready: std_logic;
  signal status_injectmode: std_logic;

  type state_type is (
    state_idle,
    state_debug,
    state_enter_inject,
    state_flush,
    state_inject,
    state_leave_inject,
    state_step
  );

  type dbgregs_type is record
    state: state_type;
    step:        std_logic;
    inject:     std_logic;
    freeze: std_logic;
    injectmode: std_logic;
    reset:       std_logic;
    flush:       std_logic;
    opcode: std_logic_vector(7 downto 0);
  end record;

  signal dbgr: dbgregs_type;


  signal injected: std_logic;

  signal inject_q_in: std_logic := '0';
  signal inject_q: std_logic := '0';

  alias jtag_debug:  std_logic is jtag_ctrl_chain_in(0);
  alias jtag_inject: std_logic is jtag_ctrl_chain_in(1);
  alias jtag_step: std_logic is jtag_ctrl_chain_in(2);
  alias jtag_reset: std_logic is jtag_ctrl_chain_in(3);
  alias jtag_opcode: std_logic_vector(7 downto 0) is jtag_ctrl_chain_in(11 downto 4);

  signal pc_i: std_logic_vector(wordSize-1 downto 0);
  signal sp_i: std_logic_vector(wordSize-1 downto 0);


begin

  pc_i(wordSize-1 downto dbg_in.pc'high+1) <= (others => '0');
  pc_i(dbg_in.pc'high downto dbg_in.pc'low) <= dbg_in.pc;

  sp_i(wordSize-1 downto dbg_in.sp'high+1) <= (others => '0');
  sp_i(dbg_in.sp'high downto dbg_in.sp'low) <= dbg_in.sp;
  sp_i(dbg_in.sp'low-1 downto 0) <= (others => '0');

  -- jtag chain output
  jtag_data_chain_out <=
    dbg_in.idim &
    sp_i &
    dbg_in.stacka &
    pc_i &
    dbg_in.brk &
    status_injection_ready
    ;


  status_injection_ready <= '1' when dbgr.state = state_debug else '0';

  process(clk, rst, dbgr, dbg_in.valid, jtag_debug, jtag_opcode,
          inject_q, dbg_in.ready, dbg_in.pc, dbg_in.idim, jtag_ctrl_chain_in)
    variable w: dbgregs_type;
  begin

    w := dbgr;

    if rst='1' then
      w.state := state_idle;
      w.reset := '0';
      w.flush := '0';
      w.injectmode := '0';
      w.inject := '0';
      w.step := '0';
      w.freeze := '0';
      injected <= '0';
    else
      injected <= '0';

      case dbgr.state is

        when state_idle =>
          w.freeze := '0';

          --if jtag_debug='1' then
          --  w.freeze := '1';
          --  w.state := state_debug;
          --end if;

          if jtag_debug='1' then

            --if dbg_ready='1' then
            w.injectmode := '1';
            --w.opcode := jtag_opcode;
            -- end if;

            -- Wait for pipeline to finish
            if dbg_in.valid='0' and dbg_in.ready='1' then
              --report "Enter PC " & hstr(dbg_pc) & " IDIM flag " & chr(dbg_idim) severity note;
              w.state:=state_debug;
            end if;
            --end if;
          end if;

        when state_debug =>

          w.step := '0';

          if inject_q='1' then
            w.state := state_enter_inject;
            w.injectmode := '1';
            w.opcode := jtag_opcode;
          elsif jtag_debug='0' then
            w.flush:='1';
            w.state := state_leave_inject;
          end if;

        when state_leave_inject =>
          w.flush := '0';
          w.injectmode:='0';
          w.state := state_idle;

        when state_enter_inject =>
          -- w.state := state_flush;
          w.state := state_inject;

        when state_flush =>
          w.flush := '1';
          w.state := state_inject;

        when state_inject =>
          w.inject := '1';
          w.flush := '0';

          -- Here ?
          injected <= '1';

          w.state := state_step;

        when state_step =>

          injected <= '0';
          w.inject := '0';

          if dbg_in.valid='1' then
          --  w.step := '1';
            w.state := state_debug;
          end if;

        when others =>

      end case;
    end if;

    if rising_edge(clk) then
      dbgr <= w;
    end if;

  end process;

  
  dbg_out.freeze      <= dbgr.freeze;
  --dbg_reset           <= dbgr.reset;
  dbg_out.inject      <= dbgr.inject;
  dbg_out.injectmode  <= dbgr.injectmode;-- and dbg_ready;
  dbg_out.step        <= dbgr.step;
  dbg_out.flush       <= dbgr.flush;
  dbg_out.opcode      <= dbgr.opcode;


  process(clk)
  begin
    if rising_edge(clk) then
      dbg_reset <= jtag_ctrl_chain_in(3);
    end if;
  end process;

  -- Synchronization stuff

  process(jtag_inject, clk, injected, inject_q_in)
  begin
    if injected='1' then
      inject_q <= '0';
      inject_q_in <= '0';
    else
      if rising_edge(jtag_inject) then
        inject_q_in <= '1';
      --else
      --  inject_q_in <= inject_q_in;
      end if;

      if rising_edge(clk) then
        inject_q <= inject_q_in;
      end if;
      
    end if;
  end process;

end behave;
