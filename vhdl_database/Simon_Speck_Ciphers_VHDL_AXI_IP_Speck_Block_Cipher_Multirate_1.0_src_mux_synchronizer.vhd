-- Mux_Synchronizer.vhd
-- Copyright 2016 Michael Calvin McCoy
-- calvin.mccoy@gmail.com
-- see LICENSE.md
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity MUX_SYNCHRONIZER is
	Generic(BUS_SIZE : integer range 0 to 256 := 128);
    
    Port (  CLK_A, CLK_B, RST : in std_logic;
			DATA_BUS_A_IN : in  std_logic_vector (BUS_SIZE - 1 downto 0);
			DATA_BUS_B_OUT : out  std_logic_vector (BUS_SIZE - 1 downto 0));
			
end MUX_SYNCHRONIZER;

architecture Behavioral of MUX_SYNCHRONIZER is

signal begin_sync : std_logic_vector(5 downto 0);
signal data_input_buffer : std_logic_vector(BUS_SIZE - 1 downto 0);
signal sync_chain : std_logic_vector(1 downto 0);

begin

CLK_A_PROCESS : process(CLK_A)
    begin
        if(CLK_A'event and CLK_A = '1') then
            
            data_input_buffer <= DATA_BUS_A_IN;
            
            if (RST = '1' or data_input_buffer /= DATA_BUS_A_IN) then
                begin_sync <= (OTHERS => '1');
            else
                begin_sync <= begin_sync(4 downto 0) & '0';
            end if;
        end if;
    end process;
    
CLK_B_PROCESS : process(CLK_B)
    begin
        if(CLK_B'event and CLK_B = '1') then
            sync_chain <= sync_chain(0) & begin_sync(5);
            
            if (sync_chain(1) = '1') then 
                DATA_BUS_B_OUT <= data_input_buffer;
            end if; 
        end if;
    end process;
    
end Behavioral;