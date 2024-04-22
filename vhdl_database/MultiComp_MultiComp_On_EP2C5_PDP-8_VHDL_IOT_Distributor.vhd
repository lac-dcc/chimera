----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:33:50 03/21/2011 
-- Design Name: 
-- Module Name:    IOT_Distributor - Behavioral 
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IOT_Distributor is
    Port ( -- interface to device 3
           ready_3 : in  STD_LOGIC;
           clear_3 : out  STD_LOGIC;
           clearacc_3 : in  STD_LOGIC;
           dataout_3 : out  STD_LOGIC_VECTOR (7 downto 0);
           datain_3 : in  STD_LOGIC_VECTOR (7 downto 0);
           load_3 : out  STD_LOGIC;
           -- interface to device 4
           ready_4 : in  STD_LOGIC;
           clear_4 : out  STD_LOGIC;
           clearacc_4 : in  STD_LOGIC;
           dataout_4 : out  STD_LOGIC_VECTOR (7 downto 0);
           datain_4 : in  STD_LOGIC_VECTOR (7 downto 0);
           load_4 : out  STD_LOGIC;          
           -- interface to CPU
           skip_flag : out  STD_LOGIC;
           bit1_cp2 : in  STD_LOGIC;
           clearacc : out  STD_LOGIC;
           dataout : in  STD_LOGIC_VECTOR (7 downto 0);
           datain : out  STD_LOGIC_VECTOR (7 downto 0);
           bit2_cp3 : in  STD_LOGIC;
           io_address : in  STD_LOGIC_VECTOR (2 downto 0));
end IOT_Distributor;

architecture Behavioral of IOT_Distributor is

begin

-- multiplexers
skip_flag <= ready_3 when io_address = "011" else
             ready_4 when io_address = "100" else
                                 '0';
                                 
clearacc <= clearacc_3 when io_address = "011" else
            clearacc_4 when io_address = "100" else
                                '0';
                                
datain <= datain_3 when io_address = "011" else
          datain_4 when io_address = "100" else
                         "00000000";
                         
-- pass through
        dataout_3 <= dataout;
        dataout_4 <= dataout;

-- demultiplexers
clear_3 <= bit1_cp2 when io_address = "011" else '0';
clear_4 <= bit1_cp2 when io_address = "100" else '0';

load_3 <= bit2_cp3 when io_address = "011" else '0';
load_4 <= bit2_cp3 when io_address = "100" else '0';

end Behavioral;

