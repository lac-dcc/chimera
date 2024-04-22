-----------------------------------------------------------------------
-- FPGA MOONCRESTA CLOCK GEN
--
-- Version : 1.00
--
-- Copyright(c) 2004 Katsumi Degawa , All rights reserved
--
-- Important !
--
-- This program is freeware for non-commercial use.
-- The author does not guarantee this program.
-- You can use this at your own risk.
--
-----------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

entity CLOCKGEN is
port (
	CLKIN_IN        : in  std_logic;
	RST_IN          : in  std_logic;
	--
	O_CLK_24M       : out std_logic;
	O_CLK_18M       : out std_logic;
	O_CLK_12M       : out std_logic;
	O_CLK_06M       : out std_logic
);
end;

architecture RTL of CLOCKGEN is
	signal state                    : std_logic_vector(1 downto 0) := (others => '0');
	signal ctr1                     : std_logic_vector(1 downto 0) := (others => '0');
	signal ctr2                     : std_logic_vector(2 downto 0) := (others => '0');
	signal CLKFB_IN                 : std_logic := '0';
	signal CLK0_BUF                 : std_logic := '0';
	signal CLKFX_BUF                : std_logic := '0';
	signal CLK_72M                  : std_logic := '0';
	signal I_DCM_LOCKED             : std_logic := '0';

begin
	dcm_inst : DCM_SP
	generic map (
		CLKFX_MULTIPLY => 9,
		CLKFX_DIVIDE   => 4,
		CLKIN_PERIOD   => 31.25
	)
	port map (
		CLKIN    => CLKIN_IN,
		CLKFB    => CLKFB_IN,
		RST      => RST_IN,
		CLK0     => CLK0_BUF,
		CLKFX    => CLKFX_BUF,
		LOCKED   => I_DCM_LOCKED
	);

	BUFG0  : BUFG  port map (I=> CLK0_BUF,  O => CLKFB_IN);
	BUFG1  : BUFG  port map (I=> CLKFX_BUF, O => CLK_72M);
	O_CLK_06M <= ctr2(2);
	O_CLK_12M <= ctr2(1);
	O_CLK_24M <= ctr2(0);
	O_CLK_18M <= ctr1(1);

	-- generate all clocks, 36Mhz, 18Mhz, 24Mhz, 12Mhz and 6Mhz
	process(CLK_72M)
	begin
		if rising_edge(CLK_72M) then
			if (I_DCM_LOCKED = '0') then
				state <= "00";
				ctr1 <= (others=>'0');
				ctr2 <= (others=>'0');
			else
				ctr1 <= ctr1 + 1;
				case state is
					when "00" => state <= "01"; ctr2 <= ctr2 + 1;
					when "01" => state <= "10"; ctr2 <= ctr2 + 1;
					when "10" => state <= "00";
					when "11" => state <= "00";
					when others => null;
				end case;
			end if;
		end if;
	end process;
end RTL;
