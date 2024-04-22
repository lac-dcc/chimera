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

library UNISIM;
use UNISIM.Vcomponents.all;

entity CLOCKGEN is
  port (
    CLKIN_IN        : in  std_logic;
    RST_IN          : in  std_logic;
    --
		O_CLK_36M       : out std_logic;
		O_CLK_18M       : out std_logic;
		O_CLK_12M       : out std_logic;
		O_CLK_06M       : out std_logic;
		O_CLK_06Mn      : out std_logic
  );
end;

architecture RTL of CLOCKGEN is

  signal state                    : std_logic_vector(1 downto 0) := (others => '0');
  signal CLKIN_IBUFG              : std_logic := '0';
  signal CLKFB_IN                 : std_logic := '0';
  signal CLK0_BUF                 : std_logic := '0';
  signal CLKFX_BUF                : std_logic := '0';
  signal CLK_36M                  : std_logic := '0';
  signal CLK_12M                  : std_logic := '0';
  signal CLK_18M                  : std_logic := '0';
  signal CLK_6M                   : std_logic := '0';
  signal CLK_6Mn                  : std_logic := '0';
  signal I_DCM_LOCKED             : std_logic := '0';




begin

    dcm_inst : DCM_SP
      generic map (
        DLL_FREQUENCY_MODE    => "LOW",
        DUTY_CYCLE_CORRECTION => TRUE,
        CLKOUT_PHASE_SHIFT    => "NONE",
        PHASE_SHIFT           => 0,
        CLKFX_MULTIPLY        => 8,
        CLKFX_DIVIDE          => 7,
        CLKDV_DIVIDE          => 2.0,
        STARTUP_WAIT          => FALSE,
        CLKIN_PERIOD          => 31.25
       )
      port map (
        CLKIN    => CLKIN_IBUFG,
        CLKFB    => CLKFB_IN,
        DSSEN    => '0',
        PSINCDEC => '0',
        PSEN     => '0',
        PSCLK    => '0',
        RST      => RST_IN,
        CLK0     => CLK0_BUF,
        CLK90    => open,
        CLK180   => open,
        CLK270   => open,
        CLK2X    => open,
        CLK2X180 => open,
        CLKDV    => open,
        CLKFX    => CLKFX_BUF,
        CLKFX180 => open,
        LOCKED   => I_DCM_LOCKED,
        PSDONE   => open
       );


  IBUFG0 : IBUFG port map (I=> CLKIN_IN,  O => CLKIN_IBUFG);
  BUFG0  : BUFG  port map (I=> CLK0_BUF,  O => CLKFB_IN);
  BUFG1  : BUFG  port map (I=> CLKFX_BUF, O => CLK_36M);
  O_CLK_12M       <= CLK_12M;
  O_CLK_06M       <= CLK_6M;
  O_CLK_06Mn      <= CLK_6Mn;
  O_CLK_18M       <= CLK_18M;
  O_CLK_36M       <= CLK_36M;

-- 2/3 clock divider(duty 33%)
-- I_CLK   1010101010101010101
-- c_ff10  0011110011110011110
-- c_ff11  0011000011000011000
-- c_ff20  0000110000110000110
-- c_ff21  0110000110000110000
-- O_12M   0000110110110110110

-- 2/3 clock         (duty 66%)
process(CLK_36M)
begin
	if rising_edge(CLK_36M) then
		if (I_DCM_LOCKED = '1') then
			case state is
				when "00" => state <= "01";
				when "01" => state <= "10";
				when "10" => state <= "00";
				when "11" => state <= "00";
        when others => null;
			end case;

			if (state = "10") then
				CLK_12M <= '0';
			else
				CLK_12M <= '1';
			end if;
		else
			state <= "00";
			CLK_12M <= '0';
		end if;
	end if;
end process;

process(CLK_36M)
begin
	if rising_edge(CLK_36M) then
		if (I_DCM_LOCKED = '1') then
			CLK_18M <= not CLK_18M;
		else
			CLK_18M <= '0';
		end if;
	end if;
end process;

-- 1/3 clock divider (duty 50%)
process(CLK_12M)
begin
	if rising_edge(CLK_12M) then
		CLK_6M  <= not CLK_6M;
		CLK_6Mn <= CLK_6M;
	end if;
end process;

end RTL;
