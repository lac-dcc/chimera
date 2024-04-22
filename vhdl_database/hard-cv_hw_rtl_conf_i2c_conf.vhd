----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    09:49:57 01/04/2013 
-- Design Name: 
-- Module Name:    i2c_conf - Behavioral 
-- Project Name: 
-- Target Devices: Spartan 6 
-- Tool versions: ISE 14.1 
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
        use IEEE.std_logic_1164.all;
        use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.interface_pack.all ;
use work.utils_pack.all ;

entity i2c_conf is
	generic(ADD_WIDTH : positive := 8 ; SLAVE_ADD : std_logic_vector(6 downto 0) := "0100001");
	port(
		clock : in std_logic;
		resetn : in std_logic; 		
 		i2c_clk : in std_logic; 
		scl : inout std_logic; 
 		sda : inout std_logic; 
		reg_addr : out std_logic_vector(ADD_WIDTH - 1 downto 0);
		reg_data : in std_logic_vector(15 downto 0)
	);
end i2c_conf;

architecture Behavioral of i2c_conf is
	constant NB_REGS : integer := 255; 
	TYPE registers_state IS (INIT, SEND_ADDR, WAIT_ACK0, SEND_DATA, WAIT_ACK1, WAIT_TEMP, NEXT_REG, STOP) ; 
	signal reg_state : registers_state ; 
	
	signal reg_addr_temp : std_logic_vector(ADD_WIDTH - 1 downto 0);
	signal i2c_data : std_logic_vector(7 downto 0 ) ; 
	signal i2c_addr : std_logic_vector(6 downto 0 ) ; 
	signal send : std_logic ; 
	signal rcv : std_logic ; 
	signal dispo : std_logic ; 
	signal ack_byte, nack_byte : std_logic ; 
	
	signal sraz_temp, en_temp : std_logic ;
	signal temp_val : std_logic_vector(9 downto 0);
begin

	i2c_master0 : i2c_master
		port map ( 
			clock => i2c_clk, 
			resetn => resetn, 
			sda => sda, 
			scl => scl, 
			data_in => i2c_data, 
			slave_addr => i2c_addr, 
			send => send, 
			rcv => rcv,
                        hold => '0',
			dispo => dispo, 
			ack_byte => ack_byte,
			nack_byte => nack_byte
		); 

	temp_counter : simple_counter
	 generic map(NBIT => 10)
    port map( clk => i2c_clk,
           resetn => resetn ,
           sraz => sraz_temp ,
           en => en_temp,
			  load => '0',
			  E => (others => '0'),
           Q => temp_val
			  );
	with reg_state select
		en_temp <= '1' when wait_temp,
					  '0' when others;
					  
	with reg_state select
		sraz_temp <= '0' when wait_temp,
		'1' when others;
					

-- sccb_interface
	process(i2c_clk, resetn)
		 begin
		 	i2c_addr <= SLAVE_ADD ; -- sensor address
		 	if  resetn = '0'  then
		 		reg_state <= init ;
				reg_addr_temp <= (others => '0');
		 	elsif i2c_clk'event and i2c_clk = '1' then
		 		case reg_state is
		 			when init => 
		 				if  dispo = '1'  then 
		 					send <= '1' ; 
		 					i2c_data <= reg_data(15 downto 8) ; 
		 					reg_state <= send_addr ;
		 				end if ;
		 			when send_addr => --send register address
		 				if  ack_byte = '1'  then
		 					send <= '1' ; 
		 					i2c_data <= reg_data(7 downto 0) ; 
		 					reg_state <= wait_ack0 ;
						end if;
		 			when wait_ack0 => -- falling edge of ack 
						if nack_byte = '1' then							send <= '0' ; 
							reg_state <= next_reg ;
						elsif  ack_byte = '0'  then
		 					reg_state <= send_data ;
		 				end if ;
		 			when send_data => --send register value
		 				if  ack_byte = '1'  then
		 					send <= '0' ; 
		 					reg_state <= wait_ack1 ; 
							reg_addr_temp <= (reg_addr_temp + 1) ;
						end if;
						
					when wait_ack1 => -- wait for ack
					  if nack_byte = '1' then
								  send <= '0' ; 
								  reg_state <= wait_temp ;
						elsif  ack_byte = '0'  then
		 					reg_state <= wait_temp ;
		 				end if ;
					when wait_temp => -- switching to next register
		 				send <= '0' ;
		 				if temp_val = "1111111111" then	
							reg_state <= next_reg ;
						end if ;
		 			when next_reg => -- switching to next register
		 				send <= '0' ;
		 				if ( NOT ack_byte = '1' ) AND  reg_data /= X"FFFF"  AND  dispo = '1'  AND  conv_integer(reg_addr_temp) < 255  then
		 					reg_state <= send_addr ; 
		 					i2c_data <= reg_data(15 downto 8) ; 
		 					send <= '1' ;
		 				elsif  conv_integer(reg_addr_temp) >= 255  OR  reg_data = X"FFFF"  then
		 					reg_state <= stop ;
		 				end if ;
		 			when stop => -- all register were set, were done !
		 				send <= '0' ;
		 				reg_state <= stop ;
		 			when others => 
		 				reg_state <= init ;
		 		end case ;
		 	end if ;
		 end process;  
	reg_addr <= reg_addr_temp ;
	
	
	

end Behavioral;

