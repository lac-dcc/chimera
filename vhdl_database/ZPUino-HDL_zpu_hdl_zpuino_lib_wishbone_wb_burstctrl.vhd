library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
library work;
use work.wishbonepkg.all;

entity wb_burstctrl is
  generic (
    WIDTH_BITS: natural := 16
  );
  port (
    clk:  in std_logic;
    rst:  in std_logic;

    sob:  in std_logic;

    rnext: out std_logic;
    wnext: out std_logic;

    stb:  out std_logic;
    cyc:  out std_logic;
    cti:  out std_logic_vector(2 downto 0);
    stall:in std_logic;
    ack:  in std_logic;

    req:  out std_logic;
    eob:  out std_logic
  );

end entity wb_burstctrl;

architecture behave of wb_burstctrl is

  type state_type is ( IDLE, BURST );
  type regs_type is record
    state:  state_type;
    req:    std_logic;
  end record;
  signal r: regs_type;
  signal shr_shift: std_logic;
  signal shr_msb:   std_logic;
  signal shw_shift: std_logic;
  signal shw_msb:   std_logic;
  signal shw_last:  std_logic;
  signal sh_clr:    std_logic;
begin


  cti <= CTI_CYCLE_INCRADDR when shw_last='0' else CTI_CYCLE_ENDOFBURST;

  process(clk,rst,r,sob,stall,ack,shw_msb,shr_msb)
    variable w: regs_type;
    variable rstcnt: std_logic;
    variable shiftr, shiftw: std_logic;
  begin
    w := r;
    rstcnt := '0';
    shiftr := '0';
    shiftw := '0';

    case r.state is

      when IDLE =>
        --cyc <= '0';
        stb <= 'X';

        if sob='1' then
          w.state := BURST;
          w.req   := '1';
          shiftw := '1';
          shiftr := '1';
        end if;

        wnext <= '0';
        rnext <= '0';
      when BURST =>

        stb <= shw_msb;

        if shw_msb='1' then
          -- Still writing
          if stall='0' then
            shiftw := '1';
            wnext <= '1';
          else
            wnext <= '0';
          end if;
        else
          wnext <= '0';
        end if;

        if ack='1' then
          rnext <= '1';
          shiftr := '1';
          if shr_msb='0' then
            w.state := IDLE;
            w.req := '0';
            rstcnt := '1';
          end if;
        else
          rnext <= '0';
        end if;
      when others =>
    end case;

    if rst='1' then
      w.state := IDLE;
      w.req   := '0';
    end if;

    shr_shift <= shiftr;
    shw_shift <= shiftw;
    sh_clr <= rstcnt;

    if rising_edge(clk) then
      r <= w;
    end if;

  end process;

  req <= r.req;
  cyc <= r.req;
  eob <= (not shr_msb) and ack;

  shr: entity work.wb_burstctrl_shreg
    generic map (
      WIDTH_BITS => WIDTH_BITS-1
    )
    port map (
      clk => clk,
      rst => rst,
      clr => sh_clr,
      shift => shr_shift,
      msb => shr_msb,
      last  => open
    );

  shw: entity work.wb_burstctrl_shreg
    generic map (
      WIDTH_BITS => WIDTH_BITS
    )
    port map (
      clk => clk,
      rst => rst,
      clr => sh_clr,
      shift => shw_shift,
      msb => shw_msb,
      last => shw_last
    );

end behave;
