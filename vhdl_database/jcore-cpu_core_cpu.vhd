library ieee;
use ieee.std_logic_1164.all;
use work.cpu2j0_pack.all;
use work.decode_pack.all;
use work.cpu2j0_components_pack.all;
use work.datapath_pack.all;
use work.mult_pkg.all;

entity cpu is
 generic ( 
   COPRO_DECODE : boolean := true);
 port ( 
   clk          : in  std_logic;
   rst          : in  std_logic;
   db_o         : out cpu_data_o_t;
   db_lock      : out std_logic;
   db_i         : in  cpu_data_i_t;
   inst_o       : out cpu_instruction_o_t;
   inst_i       : in  cpu_instruction_i_t;
   debug_o      : out cpu_debug_o_t;
   debug_i      : in  cpu_debug_i_t;
   event_o      : out cpu_event_o_t;
   event_i      : in  cpu_event_i_t;
   cop_o        : out cop_o_t;
   cop_i        : in  cop_i_t);
end entity cpu;

architecture stru of cpu is 
   signal slot, if_stall : std_logic;
   signal mac_i : mult_i_t;
   signal mac_o : mult_o_t;
   signal reg : reg_ctrl_t;
   signal func : func_ctrl_t;
   signal mem : mem_ctrl_t;
   signal instr : instr_ctrl_t;
   signal mac : mac_ctrl_t;
   signal pc : pc_ctrl_t;
   signal buses : buses_ctrl_t;
   signal t_bcc : std_logic;
   signal ibit : std_logic_vector(3 downto 0);
   signal if_dr : std_logic_vector(15 downto 0);
   signal enter_debug, debug, mask_int : std_logic;
   signal event_ack    : std_logic;
   signal slp_o        : std_logic;
   signal sr : sr_ctrl_t;
   signal illegal_delay_slot : std_logic;
   signal illegal_instr : std_logic;
   signal coproc : coproc_ctrl_t;
   signal coproc_decode : coproc_ctrl_t;
   signal copreg : std_logic_vector(7 downto 0);
begin

   event_o.ack  <= event_ack;
   event_o.lvl  <= ibit;
   event_o.slp  <= slp_o;
   event_o.dbg  <= debug;

   u_decode: decode
     port map (clk => clk, rst => rst, slot => slot,
      enter_debug => enter_debug, debug => debug,
      if_dr => if_dr, if_stall => if_stall,
      illegal_delay_slot => illegal_delay_slot,
      illegal_instr => illegal_instr,
      mac_busy => mac_o.busy,
      reg => reg, func => func, sr => sr, mac => mac, mem => mem, instr => instr, pc => pc,
      buses => buses,
      coproc => coproc_decode, copreg => copreg,
      t_bcc => t_bcc,
      event_i => event_i, event_ack => event_ack,
      ibit => ibit,
      slp => slp_o,
      mask_int => mask_int);
   u_mult : mult port map (clk => clk, rst => rst, slot => slot, a => mac_i, y => mac_o);
      mac_i.wr_m1 <= mac.com1; mac_i.command <= mac.com2;
      mac_i.wr_mach <= mac.wrmach; mac_i.wr_macl <= mac.wrmacl;

   u_datapath : datapath port map (clk => clk, rst => rst, slot => slot,
      debug => debug, enter_debug => enter_debug,
      db_lock => db_lock, db_o => db_o, db_i => db_i, inst_o => inst_o, inst_i => inst_i,
      debug_o => debug_o, debug_i => debug_i,
      reg => reg, func => func, sr_ctrl => sr, mac => mac, mem => mem, pc_ctrl => pc,
      buses => buses, coproc => coproc, instr => instr,
      macin1 => mac_i.in1, macin2 => mac_i.in2, mach => mac_o.mach, macl => mac_o.macl,
      mac_s => mac_i.s,
      t_bcc => t_bcc, ibit => ibit, if_dr => if_dr, if_stall => if_stall,
      mask_int => mask_int,
      illegal_delay_slot => illegal_delay_slot,
      illegal_instr => illegal_instr,
      copreg => copreg,
      cop_i => cop_i, cop_o => cop_o);

  coproc.cpu_data_mux <= coproc_decode.cpu_data_mux when COPRO_DECODE
                         else DBUS;
  coproc.coproc_cmd <= coproc_decode.coproc_cmd when COPRO_DECODE
                         else NOP;
end architecture stru;
