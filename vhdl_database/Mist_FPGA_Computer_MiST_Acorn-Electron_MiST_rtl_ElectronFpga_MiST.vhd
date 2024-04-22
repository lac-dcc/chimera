--------------------------------------------------------------------------------
-- Copyright (c) 2015 David Banks
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    
-- \   \   \/    
--  \   \         
--  /   /         Filename  : ElectronFpga.vhf
-- /___/   /\     Timestamp : 28/07/2015
-- \   \  /  \ 
--  \___\/\___\ 
--
--Design Name: ElectronFpga
--Device: Spartan6 LX9

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ElectronFpga_MiST is
    port (
        CLOCK_27      : in    std_logic;

        VGA_R            : out   std_logic_vector (2 downto 0);
        VGA_G          : out   std_logic_vector (2 downto 0);
        VGA_B           : out   std_logic_vector (2 downto 0);
        VGA_VS          : out   std_logic;
        VGA_HS          : out   std_logic;
        AUDIO_L         : out   std_logic;
        AUDIO_R         : out   std_logic;
        casIn          : in    std_logic;
        casOut         : out   std_logic;
        LED           : out   std_logic;
        SDMISO         : in    std_logic;
        SDSS           : out   std_logic;
        SDCLK          : out   std_logic;
        SDMOSI         : out   std_logic
     );
end;

architecture behavioral of ElectronFpga_MiST is

    signal clk_16M00  : std_logic;
    signal clk_33M33  : std_logic;
    signal clk_40M00  : std_logic;
    signal ERSTn      : std_logic;   
    signal ps2_clk    : std_logic;
    signal ps2_data   : std_logic;	 
    signal pwrup_RSTn : std_logic;
    signal reset_ctr  : std_logic_vector (7 downto 0) := (others => '0');
	 


    
begin

pll_inst : entity work.pll 
	PORT MAP (
		inclk0	 => CLOCK_27,
		c0	 => clk_40M00,
		c1	 => clk_16M00,
		c2	 => clk_33M33
	);

	 
    inst_ElectronFpga_core : entity work.ElectronFpga_core
     port map (
        clk_16M00         => clk_16M00,
        clk_33M33         => clk_33M33,
        clk_40M00         => clk_40M00,
        ps2_clk           => ps2_clk,
        ps2_data          => ps2_data,
        ERSTn             => ERSTn,
        red               => VGA_R,
        green             => VGA_G,
        blue              => VGA_B,
        vsync             => VGA_VS,
        hsync             => VGA_HS,
        audiol            => AUDIO_L,
        audioR            => AUDIO_R,
        casIn             => casIn,
        casOut            => casOut,
        LED1              => LED,
        SDMISO            => SDMISO,
        SDSS              => SDSS,
        SDCLK             => SDCLK,
        SDMOSI            => SDMOSI
    );  
    
    ERSTn      <= pwrup_RSTn;

    -- This internal counter forces power up reset to happen
    -- This is needed by the GODIL to initialize some of the registers
    ResetProcess : process (clk_16M00)
    begin
        if rising_edge(clk_16M00) then
            if (pwrup_RSTn = '0') then
                reset_ctr <= reset_ctr + 1;
            end if;
        end if;
    end process;
    pwrup_RSTn <= reset_ctr(7);
    
end behavioral;
