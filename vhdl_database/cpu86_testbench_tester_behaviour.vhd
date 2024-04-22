-------------------------------------------------------------------------------
--                                                                           --
--  CPU86 - VHDL CPU8088 IP core                                             --
--  Copyright (C) 2005 HT-LAB                                                --
--                                                                           --
--  Contact : mailto:cpu86@ht-lab.com                                        --
--  Web: http://www.ht-lab.com                                               --
--                                                                           --
--  CPU86 is released as open-source under the GNU GPL license. This means   --
--  that designs based on the CPU86 must be distributed in full source code  --
--  under the same license. Contact HT-Lab for commercial applications where --
--  source-code distribution is not desirable.                               --
--                                                                           --
-------------------------------------------------------------------------------
--                                                                           --
--  This library is free software; you can redistribute it and/or            --
--  modify it under the terms of the GNU Lesser General Public               --
--  License as published by the Free Software Foundation; either             --
--  version 2.1 of the License, or (at your option) any later version.       --
--                                                                           --
--  This library is distributed in the hope that it will be useful,          --
--  but WITHOUT ANY WARRANTY; without even the implied warranty of           --
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU        --
--  Lesser General Public License for more details.                          --
--                                                                           --
--  Full details of the license can be found in the file "copying.txt".      --
--                                                                           --
--  You should have received a copy of the GNU Lesser General Public         --
--  License along with this library; if not, write to the Free Software      --
--  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA  --
--                                                                           --
-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.STD_LOGIC_UNSIGNED.all;

LIBRARY std;
USE std.TEXTIO.all;
USE work.utils.all;

ENTITY tester IS
   PORT( 
      resoutn     : IN     std_logic;
      CTS         : OUT    std_logic;
      RESET       : OUT    std_logic;
      rxenable    : OUT    std_logic;
      CLOCK_40MHZ : BUFFER std_logic:='0';
      txenable    : BUFFER std_logic;
      txcmd       : OUT    std_logic
   );
END tester ;

--
ARCHITECTURE behaviour OF tester IS

constant DIVIDER_c  : std_logic_vector(7 downto 0):="01000001"; -- 65, baudrate divider 40MHz

signal   divtx_s    : std_logic_vector(3 downto 0);
signal   divreg_s   : std_logic_vector(7 downto 0);
signal   divcnt_s   : std_logic_vector(7 downto 0);
signal   rxclk16_s  : std_logic;

signal   tdre_s     : std_logic;
signal   wrn_s      : std_logic;
signal   char_s     : std_logic_vector(7 downto 0);


component uarttx
    port (
        clk    : in     std_logic ;
        enable : in     std_logic ;             -- 1 x bit_rate transmit clock enable
        resetn : in     std_logic ;
        dbus   : in     std_logic_vector (7 downto 0); -- input to txshift register
        tdre   : out    std_logic ;
        wrn    : in     std_logic ;
        tx     : out    std_logic);
end component;


BEGIN
    
    CLOCK_40MHZ <= not CLOCK_40MHZ after 12.5 ns;   -- 40MHz

    process
        variable L   : line;

        procedure write_to_uart (char_in  : IN character) is   
        begin
            char_s <=to_std_logic_vector(char_in);
            wait until rising_edge(CLOCK_40MHZ);
            wrn_s   <= '0';                         
            wait until rising_edge(CLOCK_40MHZ);
            wrn_s   <=  '1';
            wait until rising_edge(CLOCK_40MHZ);
            wait until rising_edge(tdre_s);
        end;

        begin
            
            CTS     <= '1';
            RESET   <= '0';                     -- PIN3 on Drigmorn1 connected to PIN2
            wait for 100 ns;
            RESET   <= '1';

            wrn_s       <= '1';                 -- Active low write strobe to TX UART
            char_s      <= (others => '1');                 
            wait for 25.1 ms;                   -- wait for > prompt before issuing commands

            write_to_uart('R');                             
            wait for 47 ms;                     -- wait for > prompt before issuing commands

            write_to_uart('D');                 -- Issue Fill Memory command
            write_to_uart('M');
            write_to_uart('0');
            write_to_uart('1');
            write_to_uart('0');
            write_to_uart('0');
            wait for 1 ms;
            write_to_uart('0');
            write_to_uart('1');
            write_to_uart('2');
            write_to_uart('4');

            wait for 50 ms;                     -- wait for > prompt before issuing commands

            wait;
    end process; 

    ------------------------------------------------------------------------------
    -- 8 bits divider
    -- Generate rxenable clock
    ------------------------------------------------------------------------------
    process (CLOCK_40MHZ,resoutn)                       -- First divider
       begin
           if (resoutn='0') then                     
              divcnt_s <= (others => '0');   
              rxclk16_s <= '0';                 -- Receive clock (x16, pulse)               
           elsif (rising_edge(CLOCK_40MHZ)) then 
             if divcnt_s=DIVIDER_c then
                divcnt_s <= (others => '0');    
                rxclk16_s <= '1';       
             else                                  
                rxclk16_s <= '0';
                divcnt_s <= divcnt_s + '1';  
             end if;
           end if;   
    end process;

    rxenable <= rxclk16_s;

    ------------------------------------------------------------------------------
    -- divider by 16 
    -- rxclk16/16=txclk
    ------------------------------------------------------------------------------
    process (CLOCK_40MHZ,resoutn)                             
       begin
            if (resoutn='0') then                     
               divtx_s <= (others => '0');   
            elsif (rising_edge(CLOCK_40MHZ)) then 
               if rxclk16_s='1' then
                   divtx_s <= divtx_s + '1';
                   if divtx_s="0000" then
                      txenable <= '1';
                   end if;  
               else 
                   txenable <= '0';
               end if;   
            end if;   
    end process;

    ------------------------------------------------------------------------------
    -- TX Uart 
    ------------------------------------------------------------------------------
    I0 : uarttx
          port map (
             clk    => CLOCK_40MHZ,
             enable => txenable,
             resetn => resoutn,
             dbus   => char_s,
             tdre   => tdre_s,
             wrn    => wrn_s,
             tx     => txcmd
          );


END ARCHITECTURE behaviour;
