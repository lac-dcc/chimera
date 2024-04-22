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

	process (clk, reg_i)
    variable i : integer range 0 to 31;
	begin
    -- sprite registers $2020-$207F, 4 bytes per sprite
    i := to_integer(unsigned(reg_i.a(6 downto 2))) - 32/4;
		if rising_edge(clk) then
      if i = INDEX then
        if reg_i.wr = '1' then
          case reg_i.a(1 downto 0) is
            when "00" =>
              reg_o.y <= std_logic_vector(RESIZE(unsigned(reg_i.d), reg_o.y'length));
            when "01" =>
              reg_o.yflip <= not reg_i.d(7);
              reg_o.xflip <= not reg_i.d(6);
              reg_o.n(8) <= reg_i.d(5);
              reg_o.colour <= std_logic_vector(RESIZE(unsigned(reg_i.d(4 downto 0)),
                                                reg_o.colour'length));
            when "10" =>
              reg_o.n(7 downto 0) <= reg_i.d;
            when others =>
              reg_o.x <= std_logic_vector(RESIZE(unsigned(reg_i.d), reg_o.x'length));
          end case;
        end if;
      end if;
		end if;
	end process;
	
  -- usused bits
  reg_o.n(reg_o.n'left downto 9) <= (others => '0');
  
  reg_o.pri <= '1';

end SYN;

