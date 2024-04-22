-------------------------------------------------------------------------------
--  CPU86 - VHDL CPU8088 IP core                                             --
--  Copyright (C) 2002-2008 HT-LAB                                           --
--                                                                           --
--  Contact/bugs : http://www.ht-lab.com/misc/feedback.html                  --
--  Web          : http://www.ht-lab.com                                     --
--                                                                           --
--  CPU86 is released as open-source under the GNU GPL license. This means   --
--  that designs based on CPU86 must be distributed in full source code      --
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
-------------------------------------------------------------------------------
--  TestBench                                                                --
-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.STD_LOGIC_UNSIGNED.all;


LIBRARY std;
USE std.TEXTIO.all;
USE work.utils.all;

entity papilio1_tb is
end papilio1_tb ;


ARCHITECTURE struct OF papilio1_tb IS

   -- Architecture declarations
   signal dind1_s : std_logic;
   signal dind2_s : std_logic;       

   -- Internal signal declarations
   SIGNAL CLOCK_40MHZ : std_logic := '0';
   SIGNAL CLOCK_32MHZ : std_logic := '0';
   SIGNAL CTS         : std_logic;
   SIGNAL resetn      : std_logic;
   SIGNAL TXD         : std_logic;
   SIGNAL cpuerror    : std_logic;
   SIGNAL rdn_s       : std_logic;                        -- Active Low Read Pulse (CLK)
   SIGNAL rdrf        : std_logic;
   SIGNAL rxenable    : std_logic;
   SIGNAL txcmd       : std_logic;
   SIGNAL txenable    : std_logic;
   SIGNAL udbus       : Std_Logic_Vector(7 DOWNTO 0);

   CONSTANT DIVIDER_c : std_logic_vector(7 downto 0):="01000001"; -- 65, baudrate divider 40MHz

   SIGNAL divtx_s     : std_logic_vector(3 downto 0);
   SIGNAL divcnt_s    : std_logic_vector(7 downto 0);
   SIGNAL rxclk16_s   : std_logic;

   SIGNAL tdre_s      : std_logic;
   SIGNAL wrn_s       : std_logic;
   SIGNAL char_s      : std_logic_vector(7 downto 0);

	signal rx : STD_LOGIC;
	signal tx : STD_LOGIC;
        signal   W1A :   STD_LOGIC_VECTOR (15 downto 0);
         signal  W1B :   STD_LOGIC_VECTOR (15 downto 0);
        signal   W2C :   STD_LOGIC_VECTOR (15 downto 0);
         signal  clk :   STD_LOGIC;


   -- Component Declarations
   COMPONENT papilio1_top
    Port ( rx : in  STD_LOGIC;
           tx : out  STD_LOGIC;
           W1A : inout  STD_LOGIC_VECTOR (15 downto 0);
           W1B : inout  STD_LOGIC_VECTOR (15 downto 0);
           W2C : inout  STD_LOGIC_VECTOR (15 downto 0);
           clk : in  STD_LOGIC);
   END COMPONENT;
	component Aaatop
	Port (
	CLK : in  STD_LOGIC;
	txd : inout std_logic;
	rxd : in std_logic;
	
	ARD_RESET : out  STD_LOGIC;
	DUO_SW1 : in  STD_LOGIC;
			 
	sram_addr : out std_logic_vector(20 downto 0);
	sram_data : inout std_logic_vector(7 downto 0);
	sram_ce : out std_logic;
	sram_we : out std_logic;
	sram_oe : out std_logic;
	
	Arduino : inout  STD_LOGIC_VECTOR (53 downto 0)
	);
	end component;

   COMPONENT uartrx
   PORT (
      clk    : IN     std_logic;
      enable : IN     std_logic;
      rdn    : IN     std_logic;
      resetn : IN     std_logic;
      rx     : IN     std_logic;
      dbus   : OUT    std_logic_vector (7 DOWNTO 0);
      ferror : OUT    std_logic;
      rdrf   : OUT    std_logic
   );
   END COMPONENT;

   COMPONENT uarttx
       PORT (
           clk    : in     std_logic ;
           enable : in     std_logic ;             -- 1 x bit_rate transmit clock enable
           resetn : in     std_logic ;
           dbus   : in     std_logic_vector (7 downto 0); -- input to txshift register
           tdre   : out    std_logic ;
           wrn    : in     std_logic ;
           tx     : out    std_logic);
   END COMPONENT;



BEGIN

    CLOCK_40MHZ <= not CLOCK_40MHZ after 12.5 ns;   -- 40MHz
--    CLOCK_40MHZ <= not CLOCK_40MHZ after 25 ns;   -- 20MHz
    CLOCK_32MHZ <= not CLOCK_32MHZ after 15.625 ns;   -- 32MHz

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
            resetn   <= '0';                     -- PIN3 on Drigmorn1 connected to PIN2
            wait for 100 ns;
            resetn   <= '1';

            wrn_s       <= '1';                 -- Active low write strobe to TX UART
            char_s      <= (others => '1');                 
            wait for 25.1 ms;                   -- wait for > prompt before issuing commands

--            write_to_uart('R');                             
            write_to_uart('H');                             
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
    -- Generate rxenable clock (16 x baudrate)
    ------------------------------------------------------------------------------
    process (CLOCK_40MHZ,resetn)                       -- First divider
       begin
           if (resetn='0') then                     
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
    process (CLOCK_40MHZ,resetn)                             
       begin
            if (resetn='0') then                     
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


   assert not ((NOW > 0 ns) and cpuerror='1')  report "**** CPU Error flag asserted ****" severity error;

   ------------------------------------------------------------------------------
   -- UART Monitor
   -- Display string on console after 80 characters or when CR character is received   
   ------------------------------------------------------------------------------
   process (rdrf,resetn)      
      variable L   : line;
      variable i_v : integer;
         begin
            if resetn='0' then
                i_v := 0;                       -- clear character counter
            elsif (rising_edge(rdrf)) then      -- possible, pulse is wide!
                 if i_v=0 then 
                   write(L,string'("RD UART : "));
                   if (udbus/=X"0D" and udbus/=X"0A") then 
                      write(L,std_to_char(udbus)); 
                   end if;         
                   i_v := i_v+1;
                elsif (i_v=80 or udbus=X"0D") then                
                      writeline(output,L);
                      i_v:=0;
                else 
               if (udbus/=X"0D" and udbus/=X"0A") then 
                  write(L,std_to_char(udbus)); 
               end if;         
               i_v := i_v+1;
                 end if;
             end if;   
   end process;
                                       
   process (CLOCK_40MHZ,resetn)                -- First/Second delay        
       begin
         if (resetn='0') then                     
            dind1_s <= '0';
            dind2_s <= '0';              
         elsif (rising_edge(CLOCK_40MHZ)) then     
            dind1_s <= rdrf;
            dind2_s <= dind1_s;                             
         end if;   
   end process;    
       
   rdn_s <= '0' when (dind1_s='1' and dind2_s='0') else '1';


   ------------------------------------------------------------------------------
   -- Top Level CPU+RAM+UART 
   ------------------------------------------------------------------------------
	U_0 : Aaatop Port map(
		CLK => clk,
		txd => tx,
		rxd => rx,
		
		ARD_RESET => open,
		DUO_SW1 => '0',
			 
		sram_addr => open,
		sram_data => open,
		sram_ce => open,
		sram_we => open,
		sram_oe => open,
		
		Arduino => open
	);

	clk <= CLOCK_32MHZ;
	TXD <= tx;
	rx <= txcmd;
--	w1b(1) <= resetn;
	

--         CTS         => CTS,
--         PIN3        => resetn,
--         RXD         => txcmd,
         --TXD         => TXD,
--         LED1        => cpuerror,

   ------------------------------------------------------------------------------
   -- TX Uart
   ------------------------------------------------------------------------------
   U_1 : uarttx
         port map (
            clk    => CLOCK_40MHZ,
            enable => txenable,
            resetn => resetn,
            dbus   => char_s,
            tdre   => tdre_s,
            wrn    => wrn_s,
            tx     => txcmd
         );
  
   ------------------------------------------------------------------------------
   -- RX Uart 
   ------------------------------------------------------------------------------
   U_2 : uartrx
      PORT MAP (
         clk    => CLOCK_40MHZ,
         enable => rxenable,
         resetn => resetn,
         dbus   => udbus,
         rdn    => rdn_s,
         rdrf   => rdrf,
         ferror => OPEN,
         rx     => TXD
      );

END struct;
