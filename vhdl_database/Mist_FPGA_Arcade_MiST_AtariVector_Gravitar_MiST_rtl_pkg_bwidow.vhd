
-- Black Widow arcade hardware implemented in an FPGA
-- (C) 2012 Jeroen Domburg (jeroen AT spritesmods.com)
-- 
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.


library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;


package pkg_bwidow is

component bwidow is
  port(
		reset_h   : in    std_logic;
		clk			: in    std_logic; --12 MHz
		clk_25		: in	std_logic;
		analog_sound_out    : out std_logic_vector(7 downto 0);
		analog_x_out    : out std_logic_vector(9 downto 0);
		analog_y_out    : out std_logic_vector(9 downto 0);
		analog_z_out    : out std_logic_vector(7 downto 0);
		BEAM_ENA          : out   std_logic;
		rgb_out    : out std_logic_vector(2 downto 0);
		buttons				 : in std_logic_vector(14 downto 0);
		SW_B4				 : in std_logic_vector(7 downto 0);
		SW_D4				 : in std_logic_vector(7 downto 0);
		dn_addr           : in 	std_logic_vector(15 downto 0);
		dn_data         	 : in 	std_logic_vector(7 downto 0);
		dn_wr				 : in 	std_logic	;
		dbg				 : out std_logic_vector(15 downto 0)
		);
end component;





component pokey is
  port (
  ADDR      : in  std_logic_vector(3 downto 0);
  DIN       : in  std_logic_vector(7 downto 0);
  DOUT      : out std_logic_vector(7 downto 0);
  DOUT_OE_L : out std_logic;
  RW_L      : in  std_logic;
  CS        : in  std_logic; -- used as enable
  CS_L      : in  std_logic;
  --
  AUDIO_OUT : out std_logic_vector(7 downto 0);
  --
  PIN       : in  std_logic_vector(7 downto 0);
  ENA       : in  std_logic;
  CLK       : in  std_logic  -- note 6 Mhz
  );
end component;

--component rom_pgma is
--  port (
--    CLK         : in    std_logic;
--    ADDR        : in    std_logic_vector(11 downto 0);
--    DATA        : out   std_logic_vector(7 downto 0)
--    );
--end component;
--component rom_pgmb is
--  port (
--    CLK         : in    std_logic;
--    ADDR        : in    std_logic_vector(11 downto 0);
--    DATA        : out   std_logic_vector(7 downto 0)
--    );
--end component;
--component rom_pgmc is
--  port (
--    CLK         : in    std_logic;
--    ADDR        : in    std_logic_vector(11 downto 0);
--    DATA        : out   std_logic_vector(7 downto 0)
--    );
--end component;
--component rom_pgmd is
--  port (
--    CLK         : in    std_logic;
--    ADDR        : in    std_logic_vector(11 downto 0);
--    DATA        : out   std_logic_vector(7 downto 0)
--    );
--end component;
--component rom_pgme is
--  port (
--    CLK         : in    std_logic;
--    ADDR        : in    std_logic_vector(11 downto 0);
--    DATA        : out   std_logic_vector(7 downto 0)
--    );
--end component;
--component rom_pgmf is
--  port (
--    CLK         : in    std_logic;
--    ADDR        : in    std_logic_vector(11 downto 0);
--    DATA        : out   std_logic_vector(7 downto 0)
--    );
--end component;
--
--
--component rom_veca is
--  port (
--    CLK         : in    std_logic;
--    ADDR        : in    std_logic_vector(10 downto 0);
--    DATA        : out   std_logic_vector(7 downto 0)
--    );
--end component;
--component rom_vecb is
--  port (
--    CLK         : in    std_logic;
--    ADDR        : in    std_logic_vector(11 downto 0);
--    DATA        : out   std_logic_vector(7 downto 0)
--    );
--end component;
--component rom_vecc is
--  port (
--    CLK         : in    std_logic;
--    ADDR        : in    std_logic_vector(11 downto 0);
--    DATA        : out   std_logic_vector(7 downto 0)
--    );
--end component;
--component rom_vecd is
--  port (
--    CLK         : in    std_logic;
--    ADDR        : in    std_logic_vector(11 downto 0);
--    DATA        : out   std_logic_vector(7 downto 0)
--    );
--end component;
--
--
--component ram2k is
--    Port ( addr : in  STD_LOGIC_VECTOR (10 downto 0);
--           data_in : in  STD_LOGIC_VECTOR (7 downto 0);
--           data_out : out  STD_LOGIC_VECTOR (7 downto 0);
--           rw_l : in  STD_LOGIC;
--           cs_l : in  STD_LOGIC;
--           ena : in  STD_LOGIC;
--           clk : in  STD_LOGIC);
--end component;

component earom is
    Port ( reset_l : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           addr : in  STD_LOGIC_VECTOR (5 downto 0);
           data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           data_out : out  STD_LOGIC_VECTOR (7 downto 0);
           write_l : in  STD_LOGIC;
           con_l : in  STD_LOGIC);
end component;

component avg is
    Port ( cpu_data_in : out  STD_LOGIC_VECTOR (7 downto 0);
           cpu_data_out : in  STD_LOGIC_VECTOR (7 downto 0);
           cpu_addr : in  STD_LOGIC_VECTOR (13 downto 0);
           cpu_cs_l : in  STD_LOGIC;
           cpu_rw_l : in  STD_LOGIC;
			  vgrst : in STD_LOGIC; 
			  vggo : in STD_LOGIC;
			  halted : out STD_LOGIC;
           xout : out  STD_LOGIC_VECTOR (9 downto 0);
           yout : out  STD_LOGIC_VECTOR (9 downto 0);
           zout : out  STD_LOGIC_VECTOR (7 downto 0);
           rgbout : out  STD_LOGIC_VECTOR (2 downto 0);
				dbg	: out std_logic_vector(15 downto 0);
			  clken: in STD_LOGIC;
			  clk_25 : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  dn_addr           : in 	std_logic_vector(15 downto 0);
			  dn_data         	 : in 	std_logic_vector(7 downto 0);
			  dn_wr				 : in 	std_logic			  
		);
end component;

component vector_drawer is
    Port ( clk : in  STD_LOGIC;
			  clk_ena: in STD_LOGIC;
           scale : in  STD_LOGIC_VECTOR (12 downto 0);
           rel_x : in  STD_LOGIC_VECTOR (12 downto 0);
           rel_y : in  STD_LOGIC_VECTOR (12 downto 0);
			  zero: in STD_LOGIC;
           draw : in  STD_LOGIC;
			  done : out STD_LOGIC;
           xout : out  STD_LOGIC_VECTOR (9 downto 0);
           yout : out  STD_LOGIC_VECTOR (9 downto 0)
	 );
end component;

--component vecram_filled is --Used for debugging, not in normal operations.
--    Port ( addr : in  STD_LOGIC_VECTOR (10 downto 0);
--           data_in : in  STD_LOGIC_VECTOR (7 downto 0);
--           data_out : out  STD_LOGIC_VECTOR (7 downto 0);
--           rw_l : in  STD_LOGIC;
--           cs_l : in  STD_LOGIC;
--           ena : in  STD_LOGIC;
--           clk : in  STD_LOGIC);
--end component;

component spotkiller is
    Port ( poweringup : out STD_LOGIC;
			  reset: in STD_LOGIC;
			  clk_12 : in  STD_LOGIC;
           xin : in  STD_LOGIC_VECTOR(9 downto 0);
           yin : in  STD_LOGIC_VECTOR(9 downto 0);
           crtenable : out  STD_LOGIC);
end component;

end pkg_bwidow;