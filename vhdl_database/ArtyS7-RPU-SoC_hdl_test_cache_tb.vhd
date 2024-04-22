----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.06.2020 13:42:40
-- Design Name: 
-- Module Name: cache_tb - Behavioral
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
--
-- THIS IS OLD AND WILL NEED UPATED FOR 32byte cache line interface & write size
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cache_tb is
--  Port ( );
end cache_tb;

architecture Behavioral of cache_tb is
    component cache is
        Port ( I_CLK : in STD_LOGIC;
               I_RST : in STD_LOGIC;
               I_CMD : in STD_LOGIC_VECTOR (1 downto 0);
               I_EXEC : in STD_LOGIC;
               I_ADDR : in STD_LOGIC_VECTOR (31 downto 0);
               I_DATA : in STD_LOGIC_VECTOR (127 downto 0);
               O_ADDR : out STD_LOGIC_VECTOR (31 downto 0);
               O_DATA : out STD_LOGIC_VECTOR (31 downto 0);
               O_REQ : out STD_LOGIC;
               I_REQRDY : in STD_LOGIC;
               O_CMDDONE : out STD_LOGIC;
               O_READY : out STD_LOGIC
               );
    end component;
    
      signal SI_CLK :   STD_LOGIC := '0';
  signal SI_RST :   STD_LOGIC := '1';
  signal  SI_CMD :   STD_LOGIC_VECTOR (1 downto 0)  := (others => '0');
  signal  SI_EXEC :   STD_LOGIC := '0';
  signal  SI_ADDR :   STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
  signal  SI_DATA :   STD_LOGIC_VECTOR (127 downto 0) := (others => '0');
  signal  SO_ADDR :   STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
  signal  SO_DATA :   STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
  signal  SO_REQ :   STD_LOGIC := '0';
 signal   SI_REQRDY :   STD_LOGIC := '0';
   signal SO_CMDDONE :   STD_LOGIC := '0';
  signal  SO_READY :   STD_LOGIC := '0';
  
  signal READRESULT : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    
      constant I_100clk_period : time := 4 ns;
begin
    ddr3cache : cache PORT MAP (
       I_CLK => SI_CLK,
       I_RST => SI_RST,
       I_CMD  => SI_CMD,
       I_EXEC => SI_EXEC,
       I_ADDR => SI_ADDR,
       I_DATA  => SI_DATA,
       O_ADDR => SO_ADDR,
       O_DATA  => SO_DATA,
       O_REQ  => SO_REQ,
       I_REQRDY  => SI_REQRDY,
       O_CMDDONE => SO_CMDDONE,
       O_READY => SO_READY
    );

    CLK100MHZclk: process
    begin
            SI_CLK <= '0';
            wait for I_100clk_period/2;
            SI_CLK <= '1';
            wait for I_100clk_period/2;
    end process;
    
      stim_proc: process
      begin        
        SI_ADDR <= X"00000000";
         -- hold reset state for 100 ns.
         wait for I_100clk_period*10;    
         SI_RST <= '0';
         
           
               
                        --miss
        wait for I_100clk_period;-- wait until SO_READY = '1';
        SI_ADDR <= X"10000000";
        SI_CMD <= "01";
        SI_EXEC <= '1';
        wait for I_100clk_period;
        SI_EXEC <= '0';
        wait for I_100clk_period;-- wait until SO_REQ='1';
        wait for I_100clk_period*30;
        SI_DATA <= X"11223344" & X"55667788" & X"99aabbcc" & X"ddeeff00";
        SI_REQRDY <='1';
        wait for I_100clk_period;
        SI_REQRDY <='0';
        wait for I_100clk_period;
        wait for I_100clk_period;-- wait until SO_CMDDONE='1';
        READRESULT <= SO_DATA;
        wait for I_100clk_period*5;-- wait until SO_READY='1';
        
        
        ---hit 
        
        SI_ADDR <= X"10000004";
        SI_EXEC <= '1';
        wait for I_100clk_period;
        SI_EXEC <= '0';
        
        wait for I_100clk_period;--  wait until SO_CMDDONE='1';
        READRESULT <= SO_DATA;
          
              
                       --miss
        
        wait for I_100clk_period*10;--   wait until SO_READY='1';
        SI_ADDR <= X"10000308";
        SI_EXEC <= '1';
        wait for I_100clk_period;
        SI_EXEC <= '0';
        wait for I_100clk_period;-- wait until SO_REQ='1';
        wait for I_100clk_period*30;
        SI_DATA <= X"03003344" & X"03007788" & X"0300bbcc" & X"0300ff00";
        SI_REQRDY <='1';
        wait for I_100clk_period;
        SI_REQRDY <='0';
        wait for I_100clk_period;
        wait for I_100clk_period;-- wait until SO_CMDDONE='1';
        READRESULT <= SO_DATA;
         
           
              
                       --miss
         
        wait for I_100clk_period*10;--   wait until SO_READY='1';
        SI_ADDR <= X"10004404";
        SI_EXEC <= '1';
        wait for I_100clk_period;
        SI_EXEC <= '0';
        wait for I_100clk_period;-- wait until SO_REQ='1';
        wait for I_100clk_period*31;
        SI_DATA <= X"44003344" & X"44007788" & X"4400bbcc" & X"4400ff00";
        SI_REQRDY <='1';
        wait for I_100clk_period;
        SI_REQRDY <='0';
        wait for I_100clk_period;
        wait for I_100clk_period;-- wait until SO_CMDDONE='1';
        READRESULT <= SO_DATA;
                
        
                 --miss
                 
        wait for I_100clk_period*10;--   wait until SO_READY='1';
        SI_ADDR <= X"1000ff04";
        SI_EXEC <= '1';
        wait for I_100clk_period;
        SI_EXEC <= '0';
        wait for I_100clk_period;-- wait until SO_REQ='1';
        wait for I_100clk_period*28;
        SI_DATA <= X"ff003344" & X"ff007788" & X"ff00bbcc" & X"ff00ff00";
        SI_REQRDY <='1';
        wait for I_100clk_period;
        SI_REQRDY <='0';
        wait for I_100clk_period;
        wait for I_100clk_period;-- wait until SO_CMDDONE='1';
        READRESULT <= SO_DATA;
        
         -- hit
                
                 wait for I_100clk_period;
        SI_ADDR <= X"10004400";
        SI_EXEC <= '1';
        wait for I_100clk_period;
        SI_EXEC <= '0';
        
        wait for I_100clk_period;--  wait until SO_CMDDONE='1';
        READRESULT <= SO_DATA;
        
            --miss (should evict a line if sizeis 4)
        
        wait for I_100clk_period*10;--   wait until SO_READY='1';
        SI_ADDR <= X"1100be04";
        SI_EXEC <= '1';
        wait for I_100clk_period;
        SI_EXEC <= '0';
        wait for I_100clk_period;-- wait until SO_REQ='1';
        wait for I_100clk_period*28;
        SI_DATA <= X"be003344" & X"be007788" & X"be00bbcc" & X"be00ff00";
        SI_REQRDY <='1';
        wait for I_100clk_period;
        SI_REQRDY <='0';
        wait for I_100clk_period;
        wait for I_100clk_period;-- wait until SO_CMDDONE='1';
        READRESULT <= SO_DATA;
        -- hit
                
                wait for I_100clk_period;
        SI_ADDR <= X"1100be08";
        SI_EXEC <= '1';
        wait for I_100clk_period;
        SI_EXEC <= '0';
        
        wait for I_100clk_period;--  wait until SO_CMDDONE='1';
        READRESULT <= SO_DATA;
        
          -- hit
                  
          wait for I_100clk_period;
          SI_ADDR <= X"1100be0c";
          SI_EXEC <= '1';
          wait for I_100clk_period;
          SI_EXEC <= '0';
          
          wait for I_100clk_period;--  wait until SO_CMDDONE='1';
          READRESULT <= SO_DATA;
    
    -- sim a write
                        
          wait for I_100clk_period;
          
          SI_CMD <= "10";
          SI_ADDR <= X"1100be08";
          SI_EXEC <= '1';
          wait for I_100clk_period;
          SI_EXEC <= '0';
          
          wait for I_100clk_period;--  wait until SO_CMDDONE='1';
          READRESULT <= X"00000000";
          wait for I_100clk_period;--  wait until SO_CMDDONE='1';
                    wait for I_100clk_period;--  wait until SO_CMDDONE='1';
        
            --miss (should evict a line which is marked invalid)
      
          SI_CMD <= "01";-- read
        
          SI_ADDR <= X"1100be08";
          SI_EXEC <= '1';
          wait for I_100clk_period;
          SI_EXEC <= '0';
          wait for I_100clk_period;-- wait until SO_REQ='1';
          wait for I_100clk_period*28;
          SI_DATA <= X"be003344" & X"be227788" & X"be22bbcc" & X"be00ff00";
          SI_REQRDY <='1';
          wait for I_100clk_period;
          SI_REQRDY <='0';
          wait for I_100clk_period;
          wait for I_100clk_period;-- wait until SO_CMDDONE='1';
          READRESULT <= SO_DATA;
          -- hit

    
    
                
        wait for 2000000us ;    
      end process;
      
end Behavioral;
