----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:43:52 07/03/2014 
-- Design Name: 
-- Module Name:    wishbone_i2c_master - Behavioral 
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


-- memory layout

--0x00 : read/write fifo
--0x01r : status register (bit 0 is nacked)
--0x01w : control register (bit 0 is reset and bit 1 is enable)
entity wishbone_i2c_master is
	generic(
		  wb_size : natural := 16 -- data port size for wishbone
	 );
	 port 
	 (
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
		  -- out signals
		  scl, sda : inout std_logic
	 );
end wishbone_i2c_master;

architecture Behavioral of wishbone_i2c_master is


	component i2c_master is
		generic(i2c_freq_hz : positive := 100_000;
			  clk_freq_hz : positive := 100_000_000);
		port(
			clk : in std_logic; 
			reset : in std_logic; 
			slave_addr : in std_logic_vector(6 downto 0 ); 
			data_in : in std_logic_vector(7 downto 0 );
			
			i2c_read : in std_logic; 
			i2c_write : in std_logic; 
			scl : inout std_logic; 
			sda : inout std_logic; 
			
			data_out : out std_logic_vector(7 downto 0 ); 
			new_data : out std_logic ;
			ack, nack, busy : out std_logic
		); 
	end component;
	
	component small_fifo is
		generic( WIDTH : positive := 8 ; DEPTH : positive := 8; THRESHOLD : positive := 4);
		port(
		  clk, resetn : in std_logic ;
		  push, pop : in std_logic ;
		  full, empty, limit : out std_logic ;
		  data_in : in std_logic_vector( WIDTH-1 downto 0);
		  data_out : out std_logic_vector(WIDTH-1 downto 0)
		  );
	end component;


	signal status_register, control_register, decoded_read : std_logic_vector(15 downto 0);
	signal read_ack : std_logic ;
	signal write_ack : std_logic ;
	
	
	-- i2c control signals
	signal i2c_write, i2c_ack, i2c_nack, i2c_busy, i2c_nacked, i2c_ack_old, i2c_ack_re, i2c_reset, i2c_enable: std_logic ;
	signal slave_addr : std_logic_vector(6 downto 0);
	-- fifo control register
	signal write_fifo_pop, write_fifo_push, write_fifo_empty, write_fifo_reset : std_logic ;
	signal write_fifo_in, write_fifo_out : std_logic_vector(7 downto 0);
	
	signal read_fifo_pop, read_fifo_push, read_fifo_empty, read_fifo_reset : std_logic ;
	signal read_fifo_in, read_fifo_out : std_logic_vector(7 downto 0);
begin
wbs_ack <= read_ack or write_ack;

write_bloc : process(gls_clk,gls_reset)
begin
    if gls_reset = '1' then 
        control_register <= (others => '0');
        write_ack <= '0';
    elsif rising_edge(gls_clk) then
		  if ((wbs_strobe and wbs_write and wbs_cycle) = '1' ) and wbs_address(0) = '0' then
            write_ack <= '1';
        elsif ((wbs_strobe and wbs_write and wbs_cycle) = '1' ) and wbs_address(0) = '1' then
            control_register <= wbs_writedata;
            write_ack <= '1';
        else
            write_ack <= '0';
        end if;
    end if;
end process write_bloc;


read_bloc : process(gls_clk, gls_reset)
begin
    if gls_reset = '1' then
        --status_register <= (others => '0');
    elsif rising_edge(gls_clk) then
		  wbs_readdata <= decoded_read ; -- this is not clear if this should only happen in the read part
        if (wbs_strobe = '1' and wbs_write = '0'  and wbs_cycle = '1' ) then
            read_ack <= '1';
        else
            read_ack <= '0';
        end if;
		  
    end if;
end process read_bloc;

decoded_read <= status_register when wbs_address(0) = '1' else
					 X"00" & read_fifo_out ;

slave_addr <= control_register(15 downto 9) ;


write_fifo_in <= wbs_writedata(7 downto 0);
write_fifo_push <= (not write_ack) and (wbs_strobe and wbs_write and wbs_cycle) and not wbs_address(0);

write_fifo : small_fifo 	generic map( WIDTH => 8 , DEPTH => 8)
	port map(
	  clk => gls_clk, resetn =>(not write_fifo_reset),
	  push => write_fifo_push, 
	  pop => write_fifo_pop,
	  full => open, 
	  empty => write_fifo_empty, 
	  limit => open,
	  data_in => write_fifo_in,
	  data_out => write_fifo_out
	  );



i2c_reset <= control_register(0);
i2c_enable <= control_register(1);
status_register(1) <= i2c_nacked ; 
status_register(0) <= i2c_busy ; 
status_register(15 downto 2) <= (others => '0');

process(gls_clk, gls_reset)
begin
	if gls_reset = '1' then
		i2c_ack_old <= '0' ;
	elsif gls_clk'event and gls_clk = '1' then
		i2c_ack_old <= i2c_ack ;
		if i2c_nack = '1' then
			i2c_nacked <= '1' ;
		elsif i2c_reset = '1' then
			i2c_nacked <= '0' ;
		end if ;
	end if ;
end process ;
i2c_ack_re <= i2c_ack and (not i2c_ack_old) ;

write_fifo_pop <= i2c_ack_re ;
write_fifo_reset <= i2c_nack or i2c_reset;


i2c_write <= '1' when i2c_enable = '1' and write_fifo_empty = '0' else
				 '0' ;


i2c_master_ctrl : i2c_master
generic map(i2c_freq_hz => 100_000,
		  clk_freq_hz => 100_000_000)
port map(
 		clk => gls_clk,
 		reset => gls_reset,
 		slave_addr => slave_addr, 
 		data_in => write_fifo_out,
		
 		i2c_read => '0',
 		i2c_write => i2c_write,
		scl => scl, 
 		sda => sda, 
		
		data_out => open, 
		new_data => open,
		
 		ack => i2c_ack,
		nack => i2c_nack,
		busy => i2c_busy
	);

end Behavioral;

