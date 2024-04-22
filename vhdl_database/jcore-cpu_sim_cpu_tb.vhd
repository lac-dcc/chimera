library work;
library ieee;

use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.std_logic_textio.all;

use work.bridge_pkg.all;
use work.cpu2j0_pack.all;
use work.monitor_pkg.all;
use work.data_bus_pkg.all;
#if CONFIG_PREFETCHER == 1
use work.cpu_prefetch_pack.all;
#endif
#if CONFIG_RING_BUS == 1
use work.ring_bus_pack.all;
use work.examples_pack.all;
#endif

#include "cpu_signals.h"

entity cpu_tb is
end cpu_tb;

architecture behaviour of cpu_tb is
  type instrd_bus_i_t is array(instr_bus_device_t'left to instr_bus_device_t'right) of cpu_data_i_t;
  type instrd_bus_o_t is array(instr_bus_device_t'left to instr_bus_device_t'right) of cpu_data_o_t;

  signal instr_master_o : cpu_instruction_o_t;
  signal instr_master_i : cpu_instruction_i_t := (( others => 'Z' ),'0');
  signal instr_slaves_i : instr_bus_i_t;
  signal instr_slaves_o : instr_bus_o_t;
  signal instrd_slaves_i : instrd_bus_i_t;
  signal instrd_slaves_o : instrd_bus_o_t;

  signal data_master_o : cpu_data_o_t;
  signal data_master_i : cpu_data_i_t := (( others => 'Z' ),'0');
  signal data_slaves_i : data_bus_i_t;
  signal data_slaves_o : data_bus_o_t;

  signal debug_i : cpu_debug_i_t := (
          en => '0',
          cmd => BREAK,
          ir => (others => '0'),
          d => (others => '0'),
          d_en => '0'
          );
  signal debug_i_cmd : std_logic_vector(1 downto 0) := "00";
  signal debug_o : cpu_debug_o_t;

  signal event_req_i : std_logic_vector(2 downto 0) := ( others => '1' );
  signal event_ack_o : std_logic;
  signal event_info_i : std_logic_vector(11 downto 0) := ( others => '0' );
  signal slp_o : std_logic;

  signal event_i : cpu_event_i_t;
  signal event_o : cpu_event_o_t;
  signal copro_i : cop_i_t;
  signal copro_o : cop_o_t;
  
  signal clk : std_logic := '1';
  signal rst : std_logic := '1';

  constant clk_period : time := CLK_PERIOD ns;

  signal dummy : bit;

#if CONFIG_PREFETCHER == 1
  signal pre_ci : prefetch_cpu_i_t;
  signal pre_co : prefetch_cpu_o_t;
  signal pre_mi : prefetch_mem_i_t;
  signal pre_mo : prefetch_mem_o_t;
#endif

  signal pio_data_o : cpu_data_o_t := NULL_DATA_O;
  signal pio_data_i : cpu_data_i_t := (ack => '0', d => (others => '0'));

#if CONFIG_RING_BUS == 1
  signal bus_start : rbus_word_8b := IDLE_8B;
  signal stall_start : std_logic := '0';

  signal bus_end : rbus_word_8b := IDLE_8B;
  signal stall_end : std_logic := '0';
#endif

#if CONFIG_PREFETCHER == 1
  function to_data_o(p : prefetch_mem_o_t)
  return cpu_data_o_t is
    variable r : cpu_data_o_t;
  begin
    r.en := p.en;
    r.rd := p.en;
    r.wr := '0';
    r.a := p.a;
    r.we := "0000";
    r.d := (others => '0');
    return r;
  end function to_data_o;
#endif

  signal data_select : data_bus_device_t;
begin
  rst <= '1', '0' after 10 ns;
  clk <= '0' after clk_period/2 when clk = '1' else '1' after clk_period/2;

  process (data_master_o)
    variable dev : data_bus_device_t;
  begin
    if data_master_o.en = '0' then
      dev := DEV_NONE;
    else
      dev := decode_data_address(data_master_o.a);
      -- Make SRAM the default. Would prefer not to do this, but not
      -- sure how many things depend on defaulting to SRAM. For example,
      -- my build of sdboot has a 4 byte stack at 0x300000 and loading
      -- it in gdb prints errors.
      if dev = DEV_NONE then
        dev := DEV_SRAM;
      end if;
    end if;
    data_select <= dev;
  end process;

  data_buses(master_i => data_master_i, master_o => data_master_o,
             selected => data_select,
             slaves_i => data_slaves_i, slaves_o => data_slaves_o);

  data_slaves_i(DEV_NONE) <= loopback_bus(data_slaves_o(DEV_NONE));
  data_slaves_i(DEV_SPI) <= loopback_bus(data_slaves_o(DEV_SPI));

  instruction_buses(master_i => instr_master_i, master_o => instr_master_o,
                    selected => decode_instr_address(instr_master_o.a),
                    slaves_i => instr_slaves_i, slaves_o => instr_slaves_o);
#if CONFIG_RING_BUS == 1
  m : rbus_data_master port map (
    clk => clk,
    rst => rst,
    data_i => data_slaves_o(DEV_PIO),
    data_o => data_slaves_i(DEV_PIO),
    bus_o => bus_start,
    stall_i => stall_start,
    bus_i => bus_end,
    stall_o => stall_end
  );

  n : data_bus_adapter port map (
    clk => clk,
    rst => rst,
    bus_i => bus_start,
    stall_o => stall_start,
    bus_o => bus_end,
    stall_i => stall_end,
    data_o => pio_data_o,
    data_i => pio_data_i,
    irq => '0'
  );
#else
  pio_data_o <= data_slaves_o(DEV_PIO);
  data_slaves_i(DEV_PIO) <= pio_data_i;
#endif

  with debug_i_cmd select
    debug_i.cmd <=
    BREAK when "00",
    STEP when "01",
    INSERT when "10",
    CONTINUE when others;

#if CONFIG_PREFETCHER == 1
  pre_ci.en <= instr_slaves_o(DEV_SRAM).en;
  pre_ci.a <= instr_slaves_o(DEV_SRAM).a & "0";
  instr_slaves_i(DEV_SRAM).ack <= pre_co.ack;
  instr_slaves_i(DEV_SRAM).d <= pre_co.d;

  prefetcher: prefetch port map (rst => rst, clk => clk,
                                 ca => pre_ci, cy => pre_co, ma => pre_mi, my => pre_mo);

  pre_mi.ack <= instrd_slaves_i(DEV_SRAM).ack;
  pre_mi.d <= instrd_slaves_i(DEV_SRAM).d;
  instrd_slaves_o(DEV_SRAM) <= to_data_o(pre_mo);
#else
  -- Splice all slave instruction buses to data bus equivalents because C side of
  -- the simulator uses the data bus signals.
  splice_instr_data_bus(instr_slaves_o(DEV_SRAM), instr_slaves_i(DEV_SRAM),
                        instrd_slaves_o(DEV_SRAM), instrd_slaves_i(DEV_SRAM));
#endif
  splice_instr_data_bus(instr_slaves_o(DEV_DDR), instr_slaves_i(DEV_DDR),
                        instrd_slaves_o(DEV_DDR), instrd_slaves_i(DEV_DDR));

  cpu1: configuration work.cpu_sim
            port map(clk => clk, rst => rst,
                     db_o => data_master_o, db_i => data_master_i,
                     inst_o => instr_master_o, inst_i => instr_master_i,
                     debug_o => debug_o, debug_i => debug_i,
                     event_i => event_i, event_o => event_o,
                     cop_o => copro_o, cop_i => copro_i);

  -- FIXME: Old CPU interface wrapper
  event_i.en  <= '0'       when event_req_i = "111" else '1';
  event_i.cmd <= INTERRUPT when event_req_i = "000" else
                 INTERRUPT when event_req_i = "001" else
                 ERROR     when event_req_i = "010" else
                 ERROR     when event_req_i = "011" else
                 BREAK     when event_req_i = "100" else
                 RESET_CPU;
  event_i.msk <= '0' when event_req_i = "000" else '1';
  event_i.lvl <= event_info_i(11 downto 8);
  event_i.vec <= event_info_i( 7 downto 0);

  event_ack_o <= event_o.ack;
  slp_o       <= event_o.slp;

  copro1: entity work.cpusim_miniaic2(fullrw)
          port map (clk_sys => clk, rst_i => rst, cpa => copro_o, cpy => copro_i);

  mon_mem_bus: bus_monitor generic map (memblock => "data sram")
          port map(clk => clk, rst => rst,
                   cpu_bus_o => data_slaves_o(DEV_SRAM),
                   cpu_bus_i => data_slaves_i(DEV_SRAM));

  mon_instr_sram_bus: bus_monitor generic map (memblock => "instruction sram fetch")
     		 port map(clk => clk, rst => rst,
                 cpu_bus_o => instrd_slaves_o(DEV_SRAM),
                 cpu_bus_i => instrd_slaves_i(DEV_SRAM));

  mon_instr_ddr_bus: bus_monitor generic map (memblock => "instruction ddr fetch")
     		 port map(clk => clk, rst => rst,
                 cpu_bus_o => instrd_slaves_o(DEV_DDR),
                 cpu_bus_i => instrd_slaves_i(DEV_DDR));


#include "sim_macros.h"
end behaviour;
