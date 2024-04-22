----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:43:24 02/17/2015 
-- Design Name: 
-- Module Name:    papilio1_top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
--use IEEE.NUMERIC_STD.ALL;
USE ieee.STD_LOGIC_UNSIGNED.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY papilio1_top IS
    Port ( rx : in  STD_LOGIC;
           tx : out  STD_LOGIC;
           W1A : inout  STD_LOGIC_VECTOR (15 downto 0);
           W1B : inout  STD_LOGIC_VECTOR (15 downto 0);
           W2C : inout  STD_LOGIC_VECTOR (15 downto 0);
           clk : in  STD_LOGIC);
END papilio1_top ;

ARCHITECTURE struct OF papilio1_top IS
   signal   CLOCK_40MHZ :     std_logic;
   signal   CTS         :      std_logic  := '1';
   signal   PIN3        :      std_logic;
   signal   RXD         :      std_logic;
   signal   LED1        :     std_logic;
   signal   LED2N       :     std_logic;
   signal   LED3N       :     std_logic;
   signal   PIN4        :     std_logic;
   signal   RTS         :     std_logic;
   signal   TXD         :     std_logic;

COMPONENT drigmorn1_top 
  PORT( 
      CLOCK_40MHZ : IN     std_logic;
      CTS         : IN     std_logic  := '1';
      PIN3        : IN     std_logic;
      RXD         : IN     std_logic;
      LED1        : OUT    std_logic;
      LED2N       : OUT    std_logic;
      LED3N       : OUT    std_logic;
      PIN4        : OUT    std_logic;
      RTS         : OUT    std_logic;
      TXD         : OUT    std_logic
   );
END component ;
   
BEGIN
	w1a(0) <= TXD;
	tx <= TXD;
	RXD <= rx;
	CTS <= '1';
	w1b(1) <= 'Z';
	PIN3 <= not w1b(1); -- por

	Inst_dcm32to40: entity work.dcm32to40 PORT MAP(
		CLKIN_IN => clk,
		CLKFX_OUT => CLOCK_40MHZ,
		CLKIN_IBUFG_OUT => open,
		CLK0_OUT => open
	);
	drigmorn1_top0 : drigmorn1_top
   PORT map( 
      CLOCK_40MHZ => CLOCK_40MHZ,
      CTS => CTS,
      PIN3 => PIN3,
      RXD => RXD,
      LED1 => LED1,
      LED2N => LED2N,
      LED3N => LED3N,
      PIN4 => PIN4,
      RTS => RTS,
      TXD => TXD
   );
END struct;
