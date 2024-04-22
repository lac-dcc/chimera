-- Copyright (c) 2015, $ME
-- All rights reserved.
--
-- Redistribution and use in source and synthezised forms, with or without modification, are permitted 
-- provided that the following conditions are met:
--
-- 1. Redistributions of source code must retain the above copyright notice, this list of conditions 
--    and the following disclaimer.
--
-- 2. Redistributions in synthezised form must reproduce the above copyright notice, this list of conditions
--    and the following disclaimer in the documentation and/or other materials provided with the distribution.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED 
-- WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A 
-- PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR 
-- ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED 
-- TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
-- HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
-- NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
-- POSSIBILITY OF SUCH DAMAGE.
--
--
-- kc87 video controller
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity video is
    generic (
        -- clock: 40.63 MHz
        H_DISP        : integer := 640;
        H_SYNC_START  : integer := 640+15;
        H_SYNC_END    : integer := 640+15+85;
        H_VID_END     : integer := 640+15+85+100;
        H_SYNC_ACTIVE : std_logic := '0';
        
        V_DISP        : integer := 768;
        V_SYNC_START  : integer := 768+3;
        V_SYNC_END    : integer := 768+3+6;
        V_VID_END     : integer := 768+3+6+29;
        V_SYNC_ACTIVE : std_logic := '0';
        
        CHAR_X_SIZE   : integer := 16;
        CHAR_Y_SIZE   : integer := 32;
        CHAR_PER_LINE : integer := 40;
        
        SYNC_DELAY    : integer := 3
    );
    port (
        clk     : in  std_logic;

        red     : out std_logic_vector(3 downto 0);
        green   : out std_logic_vector(3 downto 0);
        blue    : out std_logic_vector(3 downto 0);
        hsync   : out std_logic;
        vsync   : out std_logic;
        
        ramAddr : out std_logic_vector(9 downto 0);
        charData : in  std_logic_vector(7 downto 0);
        colData : in  std_logic_vector(7 downto 0);
        
        scanLine : in std_logic
    ); 
end video;

architecture rtl of video is

    signal countH : integer range 0 to H_VID_END-1 := 0;
    signal countV : integer range 0 to V_VID_END-1 := 0;
    signal display : boolean;

    signal cgAddr : std_logic_vector(10 downto 0);
    signal cgData : std_logic_vector(7 downto 0);
     
    signal output : std_logic_vector(7 downto 0);
    
    signal color  : std_logic_vector(5 downto 0);
    
    signal vSyncDelay : std_logic_vector(SYNC_DELAY-1 downto 0) := (others => not(V_SYNC_ACTIVE));
begin
    chargen : entity work.chargen 
        port map (
            clk => clk,
            addr => cgAddr,
            data => cgData
        );

    vsync <= vSyncDelay(SYNC_DELAY-1);
        
    cgAddr <= charData & std_logic_vector(to_unsigned(countV / (CHAR_Y_SIZE/8), 3));
    ramAddr <= std_logic_vector(to_unsigned(countH/CHAR_X_SIZE + countV/CHAR_Y_SIZE * CHAR_PER_LINE, 10));
    
    -- timing
    process
    begin 
        wait until rising_edge(clk);

        if (countH < H_VID_END-1) then
            countH <= countH + 1;
            
            if ((countH mod CHAR_X_SIZE) = 2) then
                output <= cgData;
--                output(0) <= '1';
--                output(7) <= '1';
                if (colData(7)='1') then -- invert-bit?
                    color(2 downto 0) <= colData(6 downto 4);
                    color(5 downto 3) <= colData(2 downto 0);
                else
                    color(2 downto 0) <= colData(2 downto 0);
                    color(5 downto 3) <= colData(6 downto 4);
                end if;
            elsif ((countH mod (CHAR_X_SIZE/8)) = 0) then
                output <= output(6 downto 0) & "0";
            end if;
        else
            countH <= 0;
            
            if (countV < V_VID_END-1) then
                countV <= countV + 1;
            else
                countV <= 0;
            end if;
        end if;
    end process;
     
    -- sync+blanking
    process 
    begin
        wait until rising_edge(clk);
        
        display <= false;
        if (countV < V_DISP) and (countH >= SYNC_DELAY-1) and (countH < H_DISP+SYNC_DELAY-1) then
            display <= true;
        end if;
        
        hsync <= not(H_SYNC_ACTIVE);
        if (countH >= H_SYNC_START+SYNC_DELAY-1) and (countH <= H_SYNC_END+SYNC_DELAY-1) then 
            hsync <= H_SYNC_ACTIVE;
        end if;
       
        vSyncDelay(0) <= not(V_SYNC_ACTIVE);
        if (countV >= V_SYNC_START) and (countV <= V_SYNC_END) then
            vSyncDelay(0) <= V_SYNC_ACTIVE;
        end if;
        
        vSyncDelay(SYNC_DELAY-1 downto 1) <= vSyncDelay(SYNC_DELAY-2 downto 0);
    end process;
    
    -- color+output
    process (display, output, color, countV, scanLine)
    begin
        if (display and not(countV mod (CHAR_Y_SIZE/8) = 0 and scanLine='0')) then
            if (output(7)='1') then
                red   <= (others => color(3));
                green <= (others => color(4));
                blue  <= (others => color(5));
            else
                red   <= (others => color(0));
                green <= (others => color(1));
                blue  <= (others => color(2));
            end if;
        else
            red   <= (others => '0');
            green <= (others => '0');
            blue  <= (others => '0');
        end if;
    end process;
end rtl; 