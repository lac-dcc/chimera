--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:17:57 02/17/2015
-- Design Name:   
-- Module Name:   C:/nico/perso/hack/hackerspace/fpga/x86/cpu86/papilio1/papilio1_tb.vhd
-- Project Name:  papilio1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: papilio1_top
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.STD_LOGIC_UNSIGNED.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
LIBRARY std;
USE std.TEXTIO.all;
USE work.utils.all;

ENTITY papilio1_tb2 IS
END papilio1_tb2;
 
ARCHITECTURE behavior OF papilio1_tb2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT papilio1_top
    PORT(
         rx : IN  std_logic;
         tx : OUT  std_logic;
         W1A : INOUT  std_logic_vector(15 downto 0);
         W1B : INOUT  std_logic_vector(15 downto 0);
         W2C : INOUT  std_logic_vector(15 downto 0);
         clk : IN  std_logic
        );
    END COMPONENT;
    
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

   --Inputs
   signal rx : std_logic := '0';
   signal clk : std_logic := '0';

	--BiDirs
   signal W1A : std_logic_vector(15 downto 0);
   signal W1B : std_logic_vector(15 downto 0);
   signal W2C : std_logic_vector(15 downto 0);

 	--Outputs
   signal tx : std_logic;

   -- Clock period definitions
   constant clk_period : time := 31.25 ns;

   -- Architecture declarations
   signal dind1_s : std_logic;
   signal dind2_s : std_logic;       

   -- Internal signal declarations
   SIGNAL CLOCK_40MHZ : std_logic := '0';
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
            resetn   <= '0';                     -- PIN3 on Drigmorn1 connected to PIN2
            wait for 100 ns;
            resetn   <= '1';

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

	-- Instantiate the Unit Under Test (UUT)
   uut: papilio1_top PORT MAP (
          rx => rx,
          tx => tx,
          W1A => W1A,
          W1B => W1B,
          W2C => W2C,
          clk => clk
        );
	w1b(1) <= resetn;
--         CTS         => CTS,
	TXD <= tx;
	rx <= txcmd;
	cpuerror <= w1b(0);
	
   ------------------------------------------------------------------------------
   -- TX Uart
   ------------------------------------------------------------------------------
   U_1 : uarttx
         port map (
            clk    => CLOCK_40MHZ,
            enable => txenable,	-- default, working in simu but non-working in real-life ?
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

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
END;
