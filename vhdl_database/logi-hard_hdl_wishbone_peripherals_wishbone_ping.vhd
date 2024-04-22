----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:56:26 05/26/2014 
-- Design Name: 
-- Module Name:    wishbone_ping - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library work ;
use work.control_pack.all ;

entity wishbone_ping is
generic(	nb_ping : positive := 2;
		clock_period_ns           : integer := 10
       );
port(
		  -- Syscon signals
		  gls_reset    : in std_logic ;
		  gls_clk      : in std_logic ;
		  -- Wishbone signals
		  wbs_address       : in std_logic_vector(15 downto 0) ;
		  wbs_writedata : in std_logic_vector( 15 downto 0);
		  wbs_readdata  : out std_logic_vector( 15 downto 0);
		  wbs_strobe    : in std_logic ;
		  wbs_cycle      : in std_logic ;
		  wbs_write     : in std_logic ;
		  wbs_ack       : out std_logic;
			
		  ping_io : inout std_logic_vector(nb_ping-1 downto 0 )

);
end wishbone_ping;

architecture Behavioral of wishbone_ping is

type reg16_array is array (0 to (nb_ping-1)) of std_logic_vector(15 downto 0) ;

signal ping_regs : reg16_array ;


signal read_ack : std_logic ;
signal write_ack : std_logic ;

signal enable_reg : std_logic_vector(15 downto 0);

begin


wbs_ack <= read_ack or write_ack;

write_bloc : process(gls_clk,gls_reset)
begin
    if gls_reset = '1' then 
        write_ack <= '0';
    elsif rising_edge(gls_clk) then
        if ((wbs_strobe and wbs_write and wbs_cycle) = '1' ) then
	    enable_reg <= wbs_writedata ;
            write_ack <= '1';
        else
            write_ack <= '0';
        end if;
    end if;
end process write_bloc;


read_bloc : process(gls_clk, gls_reset)
begin
    if gls_reset = '1' then
        
    elsif rising_edge(gls_clk) then
		  wbs_readdata <= ping_regs(conv_integer(wbs_address)) ;
        if (wbs_strobe = '1' and wbs_write = '0'  and wbs_cycle = '1' ) then
            read_ack <= '1';
        else
            read_ack <= '0';
        end if;
    end if;
end process read_bloc;





gen_trigs_echo : for i in 0 to nb_ping-1 generate
	pinger :  ping_sensor
	generic map(CLK_FREQ_NS => clock_period_ns) 
	port map( 
				clk => gls_clk,
				reset => gls_reset,
				ping_io => ping_io(i),
				ping_enable => enable_reg(i),
				state_debug => open,
				echo_length => ping_regs(i),
				echo_done_out => open,
				timeout => open,
				busy => open
	);
end generate ;	



end Behavioral;

