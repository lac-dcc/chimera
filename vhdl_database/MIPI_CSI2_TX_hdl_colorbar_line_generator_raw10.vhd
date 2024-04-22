----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2023 11:26:52 AM
-- Design Name: 
-- Module Name: colorbar_line_generator_raw10 - Behavioral
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
library ieee;
use ieee.std_logic_textio.all;
use std.textio.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;
use work.Common.all;

entity colorbar_line_generator_raw10 is
    Generic (	
    N_MIPI_LANES : integer := 2;
    PIXELS_8BIT_PER_LINE : integer := 3240;
    PIXEL_COUNTER_WIDTH_BITS : integer := 12; --max PIXELS_8BIT_PER_LINE = 4095
    BUS_WIDTH : integer := 8; --8 bits for now
    ADD_DEBUG_OVERLAY : integer := 1
);
    Port (
    clk : in std_logic; --every clock sends video_data_out 
    rst : in  std_logic;
    hs_active : in  std_logic;
    line_numer : in  std_logic; --0= line 1, 1 = line 2
    overlay_frame_number : in unsigned(15 downto 0);
    video_data_out : out std_logic_vector(N_MIPI_LANES*BUS_WIDTH -1 downto 0)
    );
end colorbar_line_generator_raw10;

architecture Behavioral of colorbar_line_generator_raw10 is

---Internal
type pattern_state_type is (PS_IDLE,PS_SKIP_Bytes1_2,PS_SKIP_Bytes3_4,PS_TRANSMIT);	
signal pattern_state_reg, pattern_state_next : pattern_state_type := PS_IDLE;
signal pixel_counter_reg,pixel_counter_next :  unsigned (PIXEL_COUNTER_WIDTH_BITS - 1 downto 0);

type RomType is array(0 to PIXELS_8BIT_PER_LINE - 1) of std_logic_vector(BUS_WIDTH - 1 downto 0);

impure function InitRomFromFile (RomFileName : in string) return RomType is

     FILE RomFile : text open read_mode is RomFileName;
     variable RomFileLine : line;
     variable ROM : RomType;
begin
     for i in RomType'range loop
       readline (RomFile, RomFileLine);
       hread (RomFileLine, ROM(i));
     end loop;
     return ROM;
end function;

signal line_1 : RomType := InitRomFromFile("line_1_two_lanes_data.txt"); --line 1 BG
signal line_2 : RomType := InitRomFromFile("line_2_two_lanes_data.txt"); --line 2 GR

begin


 raw10_clocks : process(clk,rst)
 begin
     if (rst = '1') then 
         pattern_state_reg <= PS_IDLE;               
         --video_data_out <= (others => '0');
        
         pixel_counter_reg <= (others => '0');
     elsif (clk'event and clk = '1') then         
         pattern_state_reg <= pattern_state_next;
      
         pixel_counter_reg <= pixel_counter_next;    
     end if;                             
 end process raw10_clocks;  
 
 
 
line_send_fsmd : process(pattern_state_reg,pixel_counter_reg,hs_active,line_numer)
 
 begin
     pattern_state_next <= pattern_state_reg;
     pixel_counter_next  <= pixel_counter_reg;
     video_data_out <= (others => '0'); --TODO: think what should be here
      
      
     case pattern_state_reg is
         when PS_IDLE =>
            pattern_state_next <=  PS_IDLE;
            
             if (hs_active = '1') then
                 --start frame trigger received  This one is related to SoT Packet          
                 --pattern_state_next <= PS_SKIP_Bytes1_2;      
                 pattern_state_next <=  PS_TRANSMIT;
                 pixel_counter_next <= (others => '0');
             end if;
             
          when PS_SKIP_Bytes1_2 =>
                --This one for byte1 and byte2 in 2lanes configuration
               -- pattern_state_next <=  PS_SKIP_Bytes3_4;
                  --pattern_state_next <=  PS_TRANSMIT;    
          when PS_SKIP_Bytes3_4 =>
                --This one for byte3 and byte4 in 2lanes configuration
                pattern_state_next <=  PS_TRANSMIT;                
          when PS_TRANSMIT =>
                               
                if (line_numer = '0') then
                    video_data_out(15 downto 8) <=  line_1(to_integer(pixel_counter_reg - 10*ADD_DEBUG_OVERLAY*(overlay_frame_number(PIXEL_COUNTER_WIDTH_BITS - 1 downto 0))) + 1);
                    video_data_out(7 downto 0)  <=  line_1(to_integer(pixel_counter_reg - 10*ADD_DEBUG_OVERLAY*(overlay_frame_number(PIXEL_COUNTER_WIDTH_BITS - 1 downto 0))));
                else
                    video_data_out(15 downto 8) <=  line_2(to_integer(pixel_counter_reg - 10*ADD_DEBUG_OVERLAY*overlay_frame_number(PIXEL_COUNTER_WIDTH_BITS - 1 downto 0)) + 1 );
                    video_data_out(7 downto 0)  <=  line_2(to_integer(pixel_counter_reg - 10*ADD_DEBUG_OVERLAY*overlay_frame_number(PIXEL_COUNTER_WIDTH_BITS - 1 downto 0)));               
                end if;
                
                --TODO: fix it,very confusing + code duplication
                if (ADD_DEBUG_OVERLAY = 1 and to_integer(pixel_counter_reg) - overlay_frame_number < 5 ) then
                    if (line_numer = '0') then
                        video_data_out(15 downto 8) <= not line_1(to_integer(pixel_counter_reg - 10*(overlay_frame_number(PIXEL_COUNTER_WIDTH_BITS - 1 downto 0))) + 1);
                        video_data_out(7 downto 0)  <= not line_1(to_integer(pixel_counter_reg - 10*(overlay_frame_number(PIXEL_COUNTER_WIDTH_BITS - 1 downto 0))));
                    else
                        video_data_out(15 downto 8) <= not line_2(to_integer(pixel_counter_reg - 10*(overlay_frame_number(PIXEL_COUNTER_WIDTH_BITS - 1 downto 0))) + 1 );
                        video_data_out(7 downto 0)  <= not line_2(to_integer(pixel_counter_reg - 10*(overlay_frame_number(PIXEL_COUNTER_WIDTH_BITS - 1 downto 0))));               
                    end if;
                end if; 
                    
                pixel_counter_next <= pixel_counter_reg + 2;
                if (pixel_counter_reg = PIXELS_8BIT_PER_LINE - 2) then
                    pattern_state_next <=  PS_IDLE;
                end if;           
     end case; --pattern_state_reg                          
  
 end process line_send_fsmd;


end Behavioral;
