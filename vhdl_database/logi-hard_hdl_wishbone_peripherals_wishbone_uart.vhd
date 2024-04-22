----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:06:21 03/22/2014 
-- Design Name: 
-- Module Name:    wishbone_uart - Behavioral 
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

entity wishbone_uart is
generic(
			wb_size : natural := 16 ; -- Data port size for wishbone
			baudrate : positive := 115_200
		  );
port(
-- Syscon signals
		  gls_reset    : in std_logic ;
		  gls_clk      : in std_logic ;
		  -- Wishbone signals
		  wbs_address       : in std_logic_vector(15 downto 0) ;
		  wbs_writedata : in std_logic_vector( wb_size-1 downto 0);
		  wbs_readdata  : out std_logic_vector( wb_size-1 downto 0);
		  wbs_strobe    : in std_logic ;
		  wbs_cycle      : in std_logic ;
		  wbs_write     : in std_logic ;
		  wbs_ack       : out std_logic;
		  tx_out : out std_logic ;
		  rx_in : in std_logic 
);
end wishbone_uart;

architecture Behavioral of wishbone_uart is

component async_serial is
generic(CLK_FREQ : positive := 100_000_000; BAUDRATE : positive := 115_200) ;
port( clk, reset : in std_logic ;
		rx : in std_logic ;
		tx : out std_logic ;
		data_out : out std_logic_vector(7 downto 0);
		data_in : in std_logic_vector(7 downto 0);
		data_ready : out std_logic ;
		data_send : in std_logic ; 
		available : out std_logic 
);
end component;

component small_fifo is
generic( WIDTH : positive := 8 ; DEPTH : positive := 8; THRESHOLD : positive := 4);
port(clk, resetn : in std_logic ;
	  push, pop : in std_logic ;
	  full, empty, limit : out std_logic ;
	  data_in : in std_logic_vector( WIDTH-1 downto 0);
	  data_out : out std_logic_vector(WIDTH-1 downto 0)
	  );
end component;

signal read_ack : std_logic ;
signal write_ack : std_logic ;

signal rx_register, tx_register : std_logic_vector(7 downto 0); 
signal ctrl_register : std_logic_vector(15 downto 0);
signal send_data, data_ready, uart_available : std_logic ;

-- fifo signals
signal fifo_empty, pop_fifo : std_logic ;
signal fifo_out : std_logic_vector(7 downto 0);
begin

wbs_ack <= read_ack or write_ack;

write_bloc : process(gls_clk,gls_reset)
begin
    if gls_reset = '1' then 
        write_ack <= '0';
    elsif rising_edge(gls_clk) then
		  tx_register <= wbs_writedata(7 downto 0) ;
        if ((wbs_strobe and wbs_write and wbs_cycle) = '1' ) then
            write_ack <= '1';
        else
            write_ack <= '0';
        end if;
    end if;
end process write_bloc;


read_bloc : process(gls_clk, gls_reset)
begin
    if gls_reset = '1' then
        ctrl_register(1 downto 0) <= (others => '0');
    elsif rising_edge(gls_clk) then
		  ctrl_register(0) <= uart_available ;
		  
--		  if data_ready = '1' then
--			ctrl_register(1) <= data_ready ;
--		  elsif read_ack = '1' and (wbs_strobe = '0' or wbs_cycle = '0' ) then -- reset when read
--			ctrl_register(1) <= '0' ;
--		  end if ;
		  if read_ack = '1' and (wbs_strobe = '0' or wbs_cycle = '0' ) then -- reset when read
			pop_fifo <= '1' ;
	     else
			pop_fifo <= '0' ;
		  end if ;
		  ctrl_register(1) <= not fifo_empty;
--		  wbs_readdata <= ctrl_register(7 downto 0) & rx_register ;
		  wbs_readdata <= ctrl_register(7 downto 0) & fifo_out ;
        if (wbs_strobe = '1' and wbs_write = '0'  and wbs_cycle = '1' ) then
            read_ack <= '1';
        else
            read_ack <= '0';
        end if;
    end if;
end process read_bloc;


send_data <= '1' when write_ack = '1' and wbs_address(0) = '0' and uart_available = '1' else
				 '0' ;

ctrl_register(15 downto 2) <= (others => '0');
serial_0 : async_serial
generic map(CLK_FREQ => 100_000_000, BAUDRATE => 115_200)
port map( clk => gls_clk, reset => gls_reset ,
		rx => rx_in,
		tx => tx_out,
		data_out => rx_register,
		data_in => tx_register,
		data_ready => data_ready,
		data_send => send_data,
		available => uart_available
);


fifo_0 : small_fifo 
generic map( WIDTH => 8, DEPTH => 256, THRESHOLD => 4)
port map(clk => gls_clk, 
	  resetn => not gls_reset,
	  push => data_ready, 
	  pop => pop_fifo,
	  full => open, 
	  empty => fifo_empty, 
	  limit => open,
	  data_in => rx_register,
	  data_out => fifo_out
	  );

end Behavioral;

