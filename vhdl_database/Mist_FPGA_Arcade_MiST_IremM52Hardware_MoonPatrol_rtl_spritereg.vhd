Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.sprite_pkg.all;

entity sptReg is

	generic
	(
		INDEX			: natural
	);
	port
	(
    reg_i     : in to_SPRITE_REG_t;
    reg_o     : out from_SPRITE_REG_t
	);

end sptReg;

architecture SYN of sptReg is

  alias clk       : std_logic is reg_i.clk;
  alias clk_ena   : std_logic is reg_i.clk_ena;

begin

  process (clk, clk_ena)
  begin
    if rising_edge(clk) and clk_ena = '1' then
      if reg_i.a(7 downto 2) = std_logic_vector(to_unsigned(INDEX, 6)) then
        if reg_i.wr = '1' then
          case reg_i.a(1 downto 0) is
            when "00" =>
              reg_o.y(7 downto 0) <= reg_i.d;
            when "01" =>
              -- actually only 32 colours, but encoded as 64???
              reg_o.colour(5 downto 0) <= reg_i.d(5 downto 0);
              reg_o.xflip <= reg_i.d(6);
              reg_o.yflip <= reg_i.d(7);
            when "10" =>
              -- 128 sprite tiles
              reg_o.n(6 downto 0) <= reg_i.d(6 downto 0);
            when others =>
              reg_o.x(7 downto 0) <= reg_i.d;
          end case;
        end if; -- reg_i.wr='1'
      end if; -- reg_i.a()=INDEX
    end if;
  end process;

  reg_o.x(reg_o.x'left downto 8) <= (others => '0');
  reg_o.y(reg_o.y'left downto 8) <= (others => '0');
  reg_o.n(reg_o.n'left downto 7) <= (others => '0');
  reg_o.colour(reg_o.colour'left downto 6) <= (others => '0');
  reg_o.pri <= '1';

end SYN;

