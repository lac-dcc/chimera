----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:27:37 05/05/2015 
-- Design Name: 
-- Module Name:    delayer_axi - Behavioral 
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


entity delayer_axi is
    generic (
        DELAY_LENGHT : integer := 8;
         -- Parameters of AxiStream Slave Bus Interface S00_AXIS
                       C_S00_AXIS_DATA_WIDTH  : integer   := 256;
                       C_S00_AXIS_TUSER_WIDTH  : integer   := 128;
                       -- Parameters of AxiStream Master Bus Interface M00_AXIS
                       C_M00_AXIS_DATA_WIDTH  : integer   := 256;
                       C_M00_AXIS_TUSER_WIDTH  : integer   := 128;
                       -- Parameters of Axi Slave Bus Interface S00_AXIS
                       C_S00_AXI_DATA_WIDTH  : integer   := 32;
                       C_S00_AXI_ADDR_WIDTH  : integer   := 32;
                       C_S00_BASEADDR  : integer   := 32;
                       C_S00_HIGHADDR  : integer   := 32
        );
    port (
	    enable : in std_logic;
		slot : in std_logic;
                  -- Master Stream Ports.
        M0_AXIS_TVALID   : out std_logic;
        M0_AXIS_TDATA    : out std_logic_vector(C_M00_AXIS_DATA_WIDTH-1 downto 0);
        M0_AXIS_TKEEP    : out std_logic_vector((C_M00_AXIS_DATA_WIDTH/8)-1 downto 0);
        M0_AXIS_TUSER    : out std_logic_vector(C_M00_AXIS_TUSER_WIDTH-1 downto 0);
        M0_AXIS_TLAST    : out std_logic;
        M0_AXIS_TREADY   : in std_logic;
		  
		  -- Slave Stream Ports.
        S0_AXIS_ACLK     : in std_logic;
		S0_AXIS_ARESETN  : in std_logic;
        S0_AXIS_TVALID   : in std_logic;
        S0_AXIS_TDATA    : in std_logic_vector(C_S00_AXIS_DATA_WIDTH-1 downto 0);
        S0_AXIS_TKEEP    : in std_logic_vector((C_S00_AXIS_DATA_WIDTH/8)-1 downto 0);
        S0_AXIS_TUSER    : in std_logic_vector(C_S00_AXIS_TUSER_WIDTH-1 downto 0);
        S0_AXIS_TLAST    : in std_logic;
        S0_AXIS_TREADY   : out std_logic
		  
	  );
end entity;

architecture Behavioral of delayer_axi is

 -- -----------------------------------------------------------------
 -- Signals
 -- -----------------------------------------------------------------
 type shift_register is array (DELAY_LENGHT-1 downto 0) of std_logic_vector(C_S00_AXIS_DATA_WIDTH+C_S00_AXIS_TUSER_WIDTH+C_S00_AXIS_DATA_WIDTH/8+1 downto 0);
 signal delay_line: shift_register;
 signal delay_in: std_logic_vector(C_S00_AXIS_DATA_WIDTH+C_S00_AXIS_TUSER_WIDTH+C_S00_AXIS_DATA_WIDTH/8+1 downto 0); 
 signal int_M0_AXIS_TVALID   : std_logic;
 signal int_M0_AXIS_TDATA    : std_logic_vector(C_M00_AXIS_DATA_WIDTH-1 downto 0);
 signal int_M0_AXIS_TKEEP    : std_logic_vector((C_M00_AXIS_DATA_WIDTH/8)-1 downto 0);
 signal int_M0_AXIS_TUSER    : std_logic_vector(C_M00_AXIS_TUSER_WIDTH-1 downto 0);
 signal int_M0_AXIS_TLAST    : std_logic;

begin
    
    S0_AXIS_TREADY<= M0_AXIS_TREADY when enable='1' else '0';
    delay_in(0)<=S0_AXIS_TVALID when enable='1' else '0';       
    delay_in(C_S00_AXIS_DATA_WIDTH+C_S00_AXIS_TUSER_WIDTH+C_S00_AXIS_DATA_WIDTH/8+1 downto 1) <= S0_AXIS_TDATA & S0_AXIS_TKEEP & S0_AXIS_TUSER & S0_AXIS_TLAST; 
    
    process(S0_AXIS_ACLK)
    begin
        if (S0_AXIS_ACLK'event and S0_AXIS_ACLK = '1') then
            if (S0_AXIS_ARESETN = '0') then
                int_M0_AXIS_TDATA      <= (others => '0');
                int_M0_AXIS_TKEEP       <= (others => '0');
                int_M0_AXIS_TUSER    <= (others => '0');
                int_M0_AXIS_TVALID     <='0'; 
                int_M0_AXIS_TLAST     <='0'; 
                for i in 0 to (DELAY_LENGHT-1) loop
                    --delay_line(i)(0) <='0';
                    delay_line(i) <= (others => '0');
                end loop; 
            elsif ((slot='1') and (enable='1') and (M0_AXIS_TREADY = '1')) then
                delay_line<=delay_line(DELAY_LENGHT-2 downto 0) & delay_in;
                int_M0_AXIS_TVALID <= delay_line(DELAY_LENGHT-1)(0);
                int_M0_AXIS_TLAST <= delay_line(DELAY_LENGHT-1)(1);
                int_M0_AXIS_TUSER <= delay_line(DELAY_LENGHT-1)(C_S00_AXIS_TUSER_WIDTH+1 downto 2);
                int_M0_AXIS_TKEEP   <= delay_line(DELAY_LENGHT-1)(C_S00_AXIS_DATA_WIDTH/8+C_S00_AXIS_TUSER_WIDTH+1 downto C_S00_AXIS_TUSER_WIDTH+2);
                int_M0_AXIS_TDATA  <= delay_line(DELAY_LENGHT-1)(C_S00_AXIS_DATA_WIDTH+C_S00_AXIS_TUSER_WIDTH+C_S00_AXIS_DATA_WIDTH/8+1 downto C_S00_AXIS_DATA_WIDTH/8+C_S00_AXIS_TUSER_WIDTH+2);
            end if;
        end if;
    end process;

    M0_AXIS_TDATA  <= int_M0_AXIS_TDATA;
    M0_AXIS_TKEEP  <= int_M0_AXIS_TKEEP;
    M0_AXIS_TUSER  <= int_M0_AXIS_TUSER;
    M0_AXIS_TVALID <= int_M0_AXIS_TVALID when (enable='1' and slot='1') else '0';
    M0_AXIS_TLAST  <= int_M0_AXIS_TLAST; 
   
end;

