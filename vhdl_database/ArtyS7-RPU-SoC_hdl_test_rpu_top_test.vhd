----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.06.2020 15:42:05
-- Design Name: 
-- Module Name: rpu_top_test - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library work;
use work.constants.all;


entity rpu_top_test is
--  Port ( );
end rpu_top_test;

architecture Behavioral of rpu_top_test is

    component rpu_top is
        Port ( 
        -- Input 100MHz clock
        CLK100MHZ : in STD_LOGIC;
        -- Input 12MHz clock
        CLK12MHZ : in STD_LOGIC;
        
        -- USB Uart (used for debug)
        uart_rxd_out : out STD_LOGIC;
        
        -- Input switches from board
        sw : in STD_LOGIC_VECTOR (3 downto 0);
        button : in STD_LOGIC_VECTOR (3 downto 0);
        
        -- Output leds to board
        led : out STD_LOGIC_VECTOR (3 downto 0);
             
        -- SPI master interface 1
        O_spim1_sclk: out STD_LOGIC;
        I_spim1_miso: in STD_LOGIC;
        O_spim1_mosi: out STD_LOGIC;
        O_spim1_cs:   out STD_LOGIC;
        O_spim1_cd:   out STD_LOGIC;
        
    --    -- DDR3 interface
    --    ddr3_dq       : inout std_logic_vector(15 downto 0);
    --    ddr3_dqs_p    : inout std_logic_vector(1 downto 0);
    --    ddr3_dqs_n    : inout std_logic_vector(1 downto 0);
    --
    --    ddr3_addr     : out   std_logic_vector(13 downto 0);
    --    ddr3_ba       : out   std_logic_vector(2 downto 0);
    --    ddr3_ras_n    : out   std_logic;
    --    ddr3_cas_n    : out   std_logic;
    --    ddr3_we_n     : out   std_logic;
    --    ddr3_reset_n  : out   std_logic;
    --    ddr3_ck_p     : out   std_logic_vector(0 downto 0);
    --    ddr3_ck_n     : out   std_logic_vector(0 downto 0);
    --    ddr3_cke      : out   std_logic_vector(0 downto 0);
    --    ddr3_cs_n     : out   std_logic_vector(0 downto 0);
    --    ddr3_dm       : out   std_logic_vector(1 downto 0);
    --    ddr3_odt      : out   std_logic_vector(0 downto 0);
        
        -- HDMI (DVI-D) video output
        hdmi_out_p : out STD_LOGIC_VECTOR(3 downto 0);
        hdmi_out_n : out STD_LOGIC_VECTOR(3 downto 0)
    );
    end component;

        -- Input 100MHz clock
        signal S_CLK100MHZ :   STD_LOGIC := '0';
        -- Input 12MHz clock
        signal S_CLK12MHZ :   STD_LOGIC := '0';
        
        -- USB Uart (used for debug)
        signal S_uart_rxd_out :   STD_LOGIC := '0';
        
        -- Input switches from board
        signal S_sw :   STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
        signal S_button :  STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
        
        -- Output leds to board
        signal S_led :   STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
             
        -- SPI master interface 1
        signal S_O_spim1_sclk:   STD_LOGIC := '0';
        signal S_I_spim1_miso:   STD_LOGIC := '0';
        signal S_O_spim1_mosi:   STD_LOGIC := '0';
        signal S_O_spim1_cs:     STD_LOGIC := '0';
        signal S_O_spim1_cd:     STD_LOGIC := '0';
        
        -- HDMI (DVI-D) video output
        signal S_hdmi_out_p :   STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
        signal S_hdmi_out_n :   STD_LOGIC_VECTOR(3 downto 0) := (others => '0');

    constant I_12clk_period : time := 30 ns;
    constant I_100clk_period : time := 4 ns;
begin

   rpu_soc: rpu_top PORT MAP (
         CLK100MHZ => S_CLK100MHZ,
         CLK12MHZ => S_CLK12MHZ,
         
         uart_rxd_out  => S_uart_rxd_out,
         sw => S_sw,
         button  => S_button,
         led => S_led,
         O_spim1_sclk => S_O_spim1_sclk,
         I_spim1_miso => S_I_spim1_miso,
         O_spim1_mosi => S_O_spim1_mosi,
         O_spim1_cs => S_O_spim1_cs,
         O_spim1_cd => S_O_spim1_cd,
         hdmi_out_p  => S_hdmi_out_p,
         hdmi_out_n  => S_hdmi_out_n
        );

    
               
    CLK12MHZclk: process
    begin
            S_CLK12MHZ <= '0';
            wait for I_12clk_period/2;
            S_CLK12MHZ <= '1';
            wait for I_12clk_period/2;
    end process;
    
        
               
    CLK100MHZclk: process
    begin
            S_CLK100MHZ <= '0';
            wait for I_100clk_period/2;
            S_CLK100MHZ <= '1';
            wait for I_100clk_period/2;
    end process;
    
         -- Stimulus process
    stim_proc: process
    begin        
       -- hold reset state for 100 ns.
       wait for 100 ns;    
  
       
    end process;

end Behavioral;
