--	(c) 2012 d18c7db(a)hotmail
--
--	This program is free software; you can redistribute it and/or modify it under
--	the terms of the GNU General Public License version 3 or, at your option,
--	any later version as published by the Free Software Foundation.
--
--	This program is distributed in the hope that it will be useful,
--	but WITHOUT ANY WARRANTY; without even the implied warranty of
--	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--
-- For full details, see the GNU General Public License at www.gnu.org/licenses

--------------------------------------------------------------------------------

-- ###########################################################################
-- ##### PAGE 2 schema - input switches, watchdog and NMI                #####
-- ###########################################################################
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

entity switches is
	port (
		I_AB         : in  std_logic_vector(2 downto 0);
		I_CLK        : in  std_logic;
		I_DB0        : in  std_logic;
		I_CS_B000_n  : in  std_logic;
		I_MERD_n     : in  std_logic;
		I_MEWR_n     : in  std_logic;
		I_SW1        : in  std_logic_vector(7 downto 0); -- DIP switch 1
		I_SW2        : in  std_logic_vector(7 downto 0); -- DIP switch 2
		I_P1         : in  std_logic_vector(7 downto 0); -- Player 1 controls
		I_P2         : in  std_logic_vector(7 downto 0); -- Player 2 controls
		I_SYS        : in  std_logic_vector(7 downto 0); -- Coin1/2, Start1/2 contacts
		--
		O_DB         : out std_logic_vector(7 downto 0) := (others => '0');
		O_WDCLR      : out std_logic := '0';
		O_NMION      : out std_logic := '0';
		O_FLIP       : out std_logic := '0'
	);
end switches;

architecture RTL of switches is
	signal s_b0001wr_n	: std_logic := '1'; -- 0xb000 - 0xb001 wr io select
	signal s_b0001rd_n	: std_logic := '1'; -- 0xb000 - 0xb001 rd io select
	signal s_b0023wr_n	: std_logic := '1'; -- 0xb002 - 0xb003 wr io select
	signal s_b0023rd_n	: std_logic := '1'; -- 0xb002 - 0xb003 rd io select
	signal s_b0045wr_n	: std_logic := '1'; -- 0xb004 - 0xb005 wr io select
	signal s_b0045rd_n	: std_logic := '1'; -- 0xb004 - 0xb005 rd io select
begin
	-- chip 3N6 moved to p9 audio board

	-- chips 3S page 2
	U3S5 : process(I_CLK)
	begin
		if rising_edge(I_CLK) then
			if s_b0045wr_n = '0' then
				O_FLIP <= I_DB0;
			end if;
		end if;
	end process;

	U3S9 : process(I_CLK)
	begin
		if rising_edge(I_CLK) then
			if s_b0001wr_n = '0' then
				O_NMION <= I_DB0;
			end if;
		end if;
	end process;

	-- chip 3R8 page 2
	O_WDCLR    <= not (s_b0023rd_n and s_b0023wr_n);

	-- chips 3N3, 3N11, 3P page 2
	s_b0001rd_n <= ( I_MERD_n or I_CS_B000_n or      I_AB(2)  or      I_AB(1)  );
	s_b0023rd_n <= ( I_MERD_n or I_CS_B000_n or      I_AB(2)  or (not I_AB(1)) );
	s_b0045rd_n <= ( I_MERD_n or I_CS_B000_n or (not I_AB(2)) or      I_AB(1)  );

	s_b0001wr_n <= ( I_MEWR_n or I_CS_B000_n or      I_AB(2)  or      I_AB(1)  );
	s_b0023wr_n <= ( I_MEWR_n or I_CS_B000_n or      I_AB(2)  or (not I_AB(1)) );
	s_b0045wr_n <= ( I_MEWR_n or I_CS_B000_n or (not I_AB(2)) or      I_AB(1)  );

	-- chips 2N, 2P, 2M, 2S, 2R page 2
	O_DB <=
		I_P1  when (s_b0001rd_n = '0') and (I_AB(0) = '0') else
		I_P2  when (s_b0001rd_n = '0') and (I_AB(0) = '1') else
		I_SYS when (s_b0023rd_n = '0') and (I_AB(0) = '0') else
		I_SW1 when (s_b0045rd_n = '0') and (I_AB(0) = '0') else
		I_SW2 when (s_b0045rd_n = '0') and (I_AB(0) = '1') else
		x"FF";
end RTL;
