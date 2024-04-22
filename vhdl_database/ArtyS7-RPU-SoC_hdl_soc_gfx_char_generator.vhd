----------------------------------------------------------------------------------
-- Company: Domipheus Labs
-- Engineer: Colin Riley
-- 
-- Design Name:    Text-mode output generator
-- Target Devices: Tested on Spartan7
--
-- Runs 1 glyph width in front of real data, using that to prefetch next char data.
--
-- pixel shading runs on rising edge of pixel clock. data prefetch runs on falling edge
--
-- Copyright 2018 Colin Riley
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity char_generator is
    Port ( 
        I_clk_pixel : in  STD_LOGIC;
			  
		-- Inputs from VGA signal generator
		-- This should be 8 pixels earlier than what is being output.
        I_blank : in  STD_LOGIC;
        I_x : in  STD_LOGIC_VECTOR (11 downto 0);
        I_y : in  STD_LOGIC_VECTOR (11 downto 0);
        
        -- Request data for a glyph row from FRAM
        O_FRAM_ADDR : out STD_LOGIC_VECTOR (15 downto 0);
        I_FRAM_DATA : in STD_LOGIC_VECTOR (15 downto 0);
        
        -- Request data from textual memory TRAM
        O_TRAM_ADDR : out STD_LOGIC_VECTOR (15 downto 0);
        I_TRAM_DATA : in STD_LOGIC_VECTOR (15 downto 0);
        
        -- The data for the relevant requested pixel
        O_R : out STD_LOGIC_VECTOR (7 downto 0);
        O_G : out STD_LOGIC_VECTOR (7 downto 0);
        O_B : out STD_LOGIC_VECTOR (7 downto 0)
    );
end char_generator;

architecture Behavioral of char_generator is
    -- state tracks the location in our data prefetch state machine
	signal state: integer := 0;
	
	-- The blinking speed of characters is controlled by this counter
	signal blinker_count: unsigned(31 downto 0) := X"00000000";
	
	-- _us is the result of the address computation,
	-- whereas the logic_vector is the latched output to memory
	signal fram_addr_us: unsigned(15 downto 0):= X"0000";
	signal fram_addr: std_logic_vector( 15 downto 0) := X"0000";
	signal fram_data_latched: std_logic_vector(15 downto 0);
	signal fram_data_latched_next: std_logic_vector(15 downto 0);
    signal fram_offset: integer := 0;
	
	-- Font ram addresses for glyphs above, text ram for ascii and
	-- attributes below.
	signal tram_addr_us: unsigned(15 downto 0):= X"0000";
	signal tram_addr: std_logic_vector( 15 downto 0) := X"0000";
	signal tram_data_latched: std_logic_vector(15 downto 0);
    signal tram_data_latched_next: std_logic_vector(15 downto 0);
	signal tram_request: integer := 0;
	
	-- Current fg and bg colours
	signal colour_fg: std_logic_vector(23 downto 0) := X"FFFFFF"; 
	signal colour_bg: std_logic_vector(23 downto 0) := X"FFFFFF"; 
    signal colour_fg_next: std_logic_vector(23 downto 0) := X"FFFFFF"; 
    signal colour_bg_next: std_logic_vector(23 downto 0) := X"FFFFFF"; 
	
	-- outputs for our pixel colour
	signal r: std_logic_vector(7 downto 0) := X"00";
	signal g: std_logic_vector(7 downto 0) := X"00";
    signal b: std_logic_vector(7 downto 0) := X"00";
	
    signal x_latched :  STD_LOGIC_VECTOR (11 downto 0)  := X"FFF";
    signal y_latched :  STD_LOGIC_VECTOR (11 downto 0) := X"FFF";
                   
    type colour_rom_t is array (0 to 15) of std_logic_vector(23 downto 0);
    -- ROM definition
    constant colours: colour_rom_t:=(  
       X"000000", -- 0 Black
       X"0000AA", -- 1 Blue
       X"00AA00", -- 2 Green
       X"00AAAA", -- 3 Cyan
       X"AA0000", -- 4 Red
       X"AA00AA", -- 5 Magenta
       X"AA5500", -- 6 Brown
       X"AAAAAA", -- 7 Light Gray
       X"555555", -- 8 Dark Gray
       X"5555FF", -- 9 Light Blue
       X"55FF55", -- a Light Green
       X"55FFFF", -- b Light Cyan
       X"FF5555", -- c Light Red
       X"FF55FF", -- d Light Magenta
       X"FFFF00", -- e Yellow
       X"FFFFFF"  -- f White
    );
	
begin
    
    fram_offset <= 7 - to_integer(unsigned(I_x(2 downto 0)));
    tram_addr <= std_logic_vector(tram_addr_us);
    O_TRAM_ADDR <= tram_addr(14 downto 0) & '0';
    O_FRAM_ADDR <= fram_addr(15 downto 0);

    O_r <= r;
    O_g <= g;
    O_b <= b;
    
        
    shading: process(I_clk_pixel)
    begin
        if rising_edge(I_clk_pixel) then
            blinker_count <= blinker_count + 1;
            x_latched <= I_x;
            y_latched <= I_y;
            
            if (fram_data_latched(fram_offset) = '1') and 
               (blinker_count(24) = '1' or (tram_data_latched(15) = '0')) then
                r <= colour_fg(23 downto 16); 
                g <= colour_fg(15 downto 8);
                b <= colour_fg(7 downto 0);
            else
                r <= colour_bg(23 downto 16);
                g <= colour_bg(15 downto 8);
                b <= colour_bg(7 downto 0);
            end if;
        end if;
    end process;
    
	data_prefetch: process(I_clk_pixel)
    begin
        if falling_edge(I_clk_pixel) then
            if (x_latched(2 downto 0) = "111") then
                -- new glyph next. start the state machine
                state <= 1;
                -- flip to prefetched data
                fram_data_latched <= fram_data_latched_next;
                tram_data_latched <= tram_data_latched_next;
                colour_fg <= colour_fg_next;
                colour_bg <= colour_bg_next;
            elsif state = 1 then
                -- calc tram data address
                tram_addr_us <= (unsigned( y_latched(11 downto 4)) * 160) + unsigned(x_latched(11 downto 3));
                state <= 2;
            elsif state = 2 then
                -- wait state
                state <= 3;
            elsif state = 3 then
                -- latch tram result
                tram_data_latched_next <= I_TRAM_DATA;
                state <= 4;
            elsif state = 4 then
                -- calc fram data address
                fram_addr <= "0000" & tram_data_latched_next(7 downto 0) & y_latched(3 downto 0);
                state <= 5;
            elsif state = 5 then
                -- latch colors from tram state
                colour_fg_next <= colours( to_integer(unsigned( tram_data_latched_next(11 downto 8))));
                colour_bg_next <= colours( to_integer(unsigned( tram_data_latched_next(14 downto 12))));
                state <= 6;
            elsif state = 6 then
                -- latch fram result
                fram_data_latched_next <= I_FRAM_DATA;
                state <= 7;
            elsif state = 7 then
                -- wait state, return from prefetch state.
                state <= 0;
            end if;
        end if;
    end process;
	
end Behavioral;

