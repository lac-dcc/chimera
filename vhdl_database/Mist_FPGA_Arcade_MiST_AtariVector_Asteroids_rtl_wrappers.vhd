library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ASTEROIDS_PROG_ROM_0 is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end ASTEROIDS_PROG_ROM_0;

architecture SYN of ASTEROIDS_PROG_ROM_0 is
begin

	rom_inst : entity work.sprom
		generic map
		(
			numwords_a		=> 2048,
			widthad_a			=> 11,
			init_file			=> "../../../../src/platform/asteroids/roms/prog_rom_0.hex"
		)
		port map
		(
			clock					=> CLK,
			address				=> ADDR,
			q							=> DATA
		);

end SYN;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ASTEROIDS_PROG_ROM_1 is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end ASTEROIDS_PROG_ROM_1;

architecture SYN of ASTEROIDS_PROG_ROM_1 is
begin

	rom_inst : entity work.sprom
		generic map
		(
			numwords_a		=> 2048,
			widthad_a			=> 11,
			init_file			=> "../../../../src/platform/asteroids/roms/prog_rom_1.hex"
		)
		port map
		(
			clock					=> CLK,
			address				=> ADDR,
			q							=> DATA
		);

end SYN;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ASTEROIDS_PROG_ROM_2 is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end ASTEROIDS_PROG_ROM_2;

architecture SYN of ASTEROIDS_PROG_ROM_2 is
begin

	rom_inst : entity work.sprom
		generic map
		(
			numwords_a		=> 2048,
			widthad_a			=> 11,
			init_file			=> "../../../../src/platform/asteroids/roms/prog_rom_2.hex"
		)
		port map
		(
			clock					=> CLK,
			address				=> ADDR,
			q							=> DATA
		);

end SYN;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ASTEROIDS_PROG_ROM_3 is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end ASTEROIDS_PROG_ROM_3;

architecture SYN of ASTEROIDS_PROG_ROM_3 is
begin

	rom_inst : entity work.sprom
		generic map
		(
			numwords_a		=> 2048,
			widthad_a			=> 11,
			init_file			=> "../../../../src/platform/asteroids/roms/prog_rom_3.hex"
		)
		port map
		(
			clock					=> CLK,
			address				=> ADDR,
			q							=> DATA
		);

end SYN;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAMB4_S4 is
  port 
	(
    do   	: out std_logic_vector(3 downto 0);
    di   	: in std_logic_vector(3 downto 0);
    addr 	: in std_logic_vector(9 downto 0);
    we   	: in std_logic;
    en   	: in std_logic;
    rst  	: in std_logic;
    clk  	: in std_logic
  );
end RAMB4_S4;

architecture SYN of RAMB4_S4 is
begin

	ram_inst : entity work.spram
		generic map
		(
			numwords_a		=> 1024,
			widthad_a			=> 10,
			width_a				=> 4
		)
		port map
		(
			clock					=> clk,
			address				=> addr,
			q							=> do,
			wren					=> we,
			data					=> di
		);

end SYN;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ASTEROIDS_VEC_ROM_1 is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end ASTEROIDS_VEC_ROM_1;

architecture SYN of ASTEROIDS_VEC_ROM_1 is
begin

	rom_inst : entity work.sprom
		generic map
		(
			numwords_a		=> 2048,
			widthad_a			=> 11,
			init_file			=> "../../../../src/platform/asteroids/roms/vec_rom_1.hex"
		)
		port map
		(
			clock					=> CLK,
			address				=> ADDR,
			q							=> DATA
		);

end SYN;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ASTEROIDS_VEC_ROM_2 is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end ASTEROIDS_VEC_ROM_2;

architecture SYN of ASTEROIDS_VEC_ROM_2 is
begin

	rom_inst : entity work.sprom
		generic map
		(
			numwords_a		=> 2048,
			widthad_a			=> 11,
			init_file			=> "../../../../src/platform/asteroids/roms/vec_rom_2.hex"
		)
		port map
		(
			clock					=> CLK,
			address				=> ADDR,
			q							=> DATA
		);

end SYN;

