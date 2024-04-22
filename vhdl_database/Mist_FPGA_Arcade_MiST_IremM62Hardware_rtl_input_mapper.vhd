library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

library work;
use work.pace_pkg.all;

entity inputmapper is
  generic
  (
    NUM_DIPS    : integer := 8;
    NUM_INPUTS  : integer := 2
  );
  port
  (
    clk       : in std_logic;
    rst_n     : in std_logic;
    jamma     : in from_JAMMA_t;

    -- user outputs
    dips      : in std_logic_vector(NUM_DIPS-1 downto 0);
    inputs    : out from_MAPPED_INPUTS_t(0 to NUM_INPUTS-1)
  );
end inputmapper;

architecture SYN of inputmapper is

begin

  process (clk, rst_n)
    variable jamma_v : from_MAPPED_INPUTS_t(0 to NUM_INPUTS-1);
  begin

       -- note: all inputs are active LOW

      if rst_n = '0' then
        for i in 0 to NUM_INPUTS-1 loop
          jamma_v(i).d := (others =>'1');
        end loop;
        
      elsif rising_edge (clk) then

        -- handle JAMMA inputs
        jamma_v(0).d(0) := jamma.p(1).start;
        jamma_v(0).d(1) := jamma.p(2).start;
        jamma_v(0).d(2) := '1';--jamma.service;
        jamma_v(0).d(3) := jamma.coin(1);
      --unused
      --unused
      --unused
      --unused

        jamma_v(1).d(0) := jamma.p(1).right;
        jamma_v(1).d(1) := jamma.p(1).left;
        jamma_v(1).d(2) := jamma.p(1).down;
        jamma_v(1).d(3) := jamma.p(1).up;
      --unused
        jamma_v(1).d(5) := jamma.p(1).button(2);
      --unused
        jamma_v(1).d(7) := jamma.p(1).button(1);

        jamma_v(2).d(0) := jamma.p(2).right;
        jamma_v(2).d(1) := jamma.p(2).left;
        jamma_v(2).d(2) := jamma.p(2).down;
        jamma_v(2).d(3) := jamma.p(2).up;
        jamma_v(2).d(4) := jamma.coin(2);
        jamma_v(2).d(5) := jamma.p(2).button(2);
        --unused
        jamma_v(2).d(7) := jamma.p(2).button(1);
      end if; -- rising_edge (clk)

      -- assign outputs
      inputs(0).d <= jamma_v(0).d;
      inputs(1).d <= jamma_v(1).d;
      inputs(2).d <= jamma_v(2).d;
      inputs(3).d <= dips(7 downto 0); -- DSW1
      inputs(4).d <= jamma.service & "1111100";
--	PORT_START("DSW2")
--	PORT_DIPNAME( 0x01, 0x01, DEF_STR( Flip_Screen ) ) PORT_DIPLOCATION("SW2:1")
--	PORT_DIPSETTING(    0x01, DEF_STR( Off ) )
--	PORT_DIPSETTING(    0x00, DEF_STR( On ) )
--	PORT_DIPNAME( 0x02, 0x00, DEF_STR( Cabinet ) ) PORT_DIPLOCATION("SW2:2")
--	PORT_DIPSETTING(    0x00, DEF_STR( Upright ) )
--	PORT_DIPSETTING(    0x02, DEF_STR( Cocktail ) )
--	PORT_DIPNAME( 0x04, 0x04, "Coin Mode" ) PORT_DIPLOCATION("SW2:3")
--	PORT_DIPSETTING(    0x04, "Mode 1" )
--	PORT_DIPSETTING(    0x00, "Mode 2" )
--	/* Bits 4,5,6 are different in each game, see below */
--	PORT_DIPUNUSED_DIPLOC( 0x38, 0x38, "SW2:4,5,6" )
--	PORT_DIPNAME( 0x40, 0x40, "Invulnerability (Cheat)" ) PORT_DIPLOCATION("SW2:7")
--	PORT_DIPSETTING(    0x40, DEF_STR( Off ) )
--	PORT_DIPSETTING(    0x00, DEF_STR( On ) )
--	PORT_SERVICE_DIPLOC( 0x80, IP_ACTIVE_LOW, "SW2:8" )

  end process;

end architecture SYN;


