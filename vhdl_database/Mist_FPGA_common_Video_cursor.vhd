--===========================================================================--
--                                                                           --
--  S Y N T H E S I Z A B L E    CRTC6845   C O R E                          --
--                                                                           --
--  www.opencores.org - January 2000                                         --
--  This IP core adheres to the GNU public license.                          --
--                                                                           --
--  VHDL model of MC6845 compatible CRTC                                     --
--                                                                           --
--  This model doesn't implement interlace mode. Everything else is          --
--  (probably) according to original MC6845 data sheet (except VTOTADJ).     --
--                                                                           --
--  Implementation in Xilinx Virtex XCV50-6 runs at 50 MHz (character clock).--
--  With external pixel	generator this CRTC could handle 450MHz pixel rate   --
--  (see MC6845 datasheet for typical application).	                     --
--                                                                           --
--  Author: Damjan Lampret, lampret@opencores.org                            --
--                                                                           --
--  TO DO:                                                                   --
--                                                                           --
--   - fix REG_INIT and remove non standard signals at topl level entity.    --
--     Allow fixed registers values (now set with REG_INIT). Anyway cleanup  --
--     required.                                                             --
--                                                                           --
--   - split design in four units (horizontal sync, vertical sync, bus       --
--     interface and the rest)                                               --
--                                                                           --
--   - synthesis with Synplify pending (there are some problems with         --
--     UNSIGNED and BIT_LOGIC_VECTOR types in some units !)                  --
--                                                                           --
--   - testbench                                                             --
--                                                                           --
--   - interlace mode support, extend VSYNC for V.Total Adjust value (R5)    --
--                                                                           --
--   - verification in a real application                                    --
--                                                                           --
--===========================================================================--

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity cursor_ctrl is
    generic (
      RA_WIDTH : natural := 5
    );
    port (
    	RESETn : in STD_LOGIC;
    	CLK    : in STD_LOGIC;
	RA     : in STD_LOGIC_VECTOR (RA_WIDTH-1 downto 0);
	CURSOR : out STD_LOGIC;
	ACTIVE : in STD_LOGIC;
        CURST  : in STD_LOGIC_VECTOR (6 downto 0);
        CUREND : in STD_LOGIC_VECTOR (4 downto 0)
    );
end cursor_ctrl;

architecture cursor_ctrl_behav of cursor_ctrl is

signal CTR_BLINK : UNSIGNED (4 downto 0);
begin

blink_ctr_p:
process (CLK, RESETn)
begin
	if RESETn = '0' then
		CTR_BLINK <= (others => '0');
	elsif rising_edge(CLK) then
		CTR_BLINK <= CTR_BLINK + 1;
	end if;
end process;

cursor_p:
process (ACTIVE, CURST, CUREND, RA, CTR_BLINK)
begin
	if RA >= CURST(4 downto 0) and RA <= CUREND and ACTIVE = '1' then
		case CURST(6 downto 5) is
			when "00" =>
				CURSOR <= '1';
			when "10" =>
				CURSOR <= CTR_BLINK(3);
			when "11" =>
				CURSOR <= CTR_BLINK(4);
			when others =>
				CURSOR <= '0';
		end case;		
	else
		CURSOR <= '0';
	end if;
end process;

end cursor_ctrl_behav;

