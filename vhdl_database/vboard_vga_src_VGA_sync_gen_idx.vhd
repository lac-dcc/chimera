library ieee;
context ieee.ieee_std_context;

entity VGA_syn_gen_idx is
  generic (
    G_PULSE  : natural;
    G_FRONT  : natural;
    G_LENGTH : natural;
    G_BACK   : natural;
    G_POL    : boolean
  );
  port (
    CLK:  in  std_logic;
    EN:   in  std_logic;
    RST:  in  std_logic;
    SYNC: out std_logic;
    IDX:  out integer range -1 to G_LENGTH-1;
    TC:   out std_logic
  );
end entity;


architecture arch of VGA_syn_gen_idx is

  type limits_t is array (natural range 0 to 3) of integer;
  constant h_lim : limits_t := (G_LENGTH-1, G_BACK-1, G_PULSE-1, G_FRONT-1);

  signal st : natural range 0 to 3;
  signal p_tc, p_s: std_logic;
  signal cnt: natural range 0 to G_LENGTH-1 := 0;

begin

  proc_st: process(CLK)
  begin
    if rising_edge(CLK) then
      if RST then
        st <= 2;
      else
        if EN and p_tc then
          st <= 0 when st = 3 else st + 1;
        end if;
      end if;
    end if;
  end process;

  proc_cnt: process(clk)
  begin
    if rising_edge(clk) then
      if RST then
        cnt <= 0;
      else
        if EN then
          cnt <= 0 when p_tc = '1' else cnt + 1;
        end if;
      end if;
    end if;
  end process;

  p_tc <=     '1' when cnt = h_lim(st) else '0';
  p_s  <= not RST when  st = 2         else '0';

  SYNC <= not p_s when G_POL  else p_s;
  IDX  <=     cnt when st = 0 else -1;
  TC   <=    p_tc when st = 3 else '0';

end architecture;
