

-- ----------------------------------------------------------------------
--LOGI-hard
--Copyright (c) 2013, Jonathan Piat, Michael Jones, All rights reserved.
--
--This library is free software; you can redistribute it and/or
--modify it under the terms of the GNU Lesser General Public
--License as published by the Free Software Foundation; either
--version 3.0 of the License, or (at your option) any later version.
--
--This library is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
--Lesser General Public License for more details.
--
--You should have received a copy of the GNU Lesser General Public
--License along with this library.
-- ----------------------------------------------------------------------



----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:17:52 08/18/2013 
-- Design Name: 
-- Module Name:    max7219 - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library work ;
use work.logi_utils_pack.all ;

entity wishbone_max7219 is
generic(NB_DEVICE : positive := 2; 
		  CLK_DIV : positive := 1024;
		  wb_size : natural := 16 -- Data port size for wishbone
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

		  -- max7219 signals
		  DOUT : out std_logic ;
		  SCLK : out std_logic ;
		  LOAD : out std_logic

);
end wishbone_max7219;

architecture Behavioral of wishbone_max7219 is

constant tempo_val : integer := CLK_DIV ;
type tranfer_state is (WAIT_DATA, ASSERT_LOAD, SEND_DATA, DEASSERT_LOAD);

signal current_transfer_state, next_transfer_state : tranfer_state;

signal read_ack : std_logic ;
signal write_ack : std_logic ;

signal data_shift_reg : std_logic_vector(15 downto 0) ;
signal load_shift_register : std_logic ;

signal count_tempo : std_logic_vector(nbit(CLK_DIV) downto 0 );
signal load_tempo, en_tempo, end_tempo : std_logic ;
signal data_clk, data_clk_old, data_clk_re, data_clk_fe : std_logic ;

signal en_bit_count, reset_bit_count : std_logic ;

signal bit_count : std_logic_vector(4 downto 0);
signal bit_count_eq_16  : std_logic ;


signal en_device_count, reset_device_count : std_logic ;
signal device_count : std_logic_vector(nbit(NB_DEVICE) downto 0);
signal device_count_lt_nb_dev, device_count_lt_nb_dev_m1 : std_logic ;

signal fifo_pop, fifo_push, fifo_full, fifo_burst : std_logic ;
signal fifo_out, fifo_in : std_logic_vector(15 downto 0 );

signal write_sig, old_write_sig : std_logic ;

signal load_d, resetn : std_logic ;


begin

wbs_ack <= read_ack or write_ack;

write_bloc : process(gls_clk,gls_reset)
begin
    if gls_reset = '1' then 
        write_ack <= '0';
    elsif rising_edge(gls_clk) then
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
        
    elsif rising_edge(gls_clk) then
        if (wbs_strobe = '1' and wbs_write = '0'  and wbs_cycle = '1' ) then
            read_ack <= '1';
        else
            read_ack <= '0';
        end if;
    end if;
end process read_bloc;
wbs_readdata <= X"DEAD";

resetn <= (not gls_reset) ;
data_fifo : small_fifo 
generic map( WIDTH =>  16 , DEPTH => NB_DEVICE*16, THRESHOLD => NB_DEVICE)
port map(clk => gls_clk, resetn => resetn,
	  push => fifo_push, pop => fifo_pop,
	  full => fifo_full, limit => fifo_burst,
	  data_in => fifo_in,
	  data_out => fifo_out
	  );


-- tempo
process(gls_clk, gls_reset)
begin
	if gls_reset = '1' then
		count_tempo <= (others => '1');
	elsif gls_clk'event and gls_clk = '1' then
		if load_tempo = '1' then
			count_tempo <= std_logic_vector(to_unsigned(tempo_val, nbit(CLK_DIV)+1)) ;
		elsif en_tempo = '1' then
			if count_tempo /= 0 then
				count_tempo <= count_tempo - 1 ;
			end if ;
		end if ;
	end if ;
end process ;

end_tempo <= '1' when count_tempo =  0 else
				 '0' ;
		
-- bit counter		
process(gls_clk, gls_reset)
begin
	if gls_reset = '1' then
		bit_count <= (others => '0');
	elsif gls_clk'event and gls_clk = '1' then
		if reset_bit_count = '1' then
			bit_count <= (others => '0');
		elsif en_bit_count = '1' then
			bit_count <= bit_count + 1 ;
		end if ;
	end if ;
end process ;	
bit_count_eq_16 <= '1' when bit_count = 16 else
						 '0' ;

--device counter
process(gls_clk, gls_reset)
begin
	if gls_reset = '1' then
		device_count <= (others => '0');
	elsif gls_clk'event and gls_clk = '1' then
		if reset_device_count = '1' then
			device_count <= (others => '0');
		elsif en_device_count = '1' then
			device_count <= device_count + 1 ;
		end if ;
	end if ;
end process ;				 

process(gls_clk, gls_reset)
begin
	if gls_reset = '1' then
		current_transfer_state <= WAIT_DATA;
	elsif gls_clk'event and gls_clk = '1' then
		current_transfer_state <= next_transfer_state;
	end if ;
end process ; 


process(current_transfer_state, fifo_burst, bit_count, device_count, end_tempo, device_count_lt_nb_dev_m1)
begin
	next_transfer_state <= current_transfer_state ;
	case current_transfer_state is
		when wait_data =>
			if fifo_burst = '1' then
				next_transfer_state <= assert_load ;
			end if ;
		when assert_load =>
			if end_tempo = '1' then 
				next_transfer_state <= send_data ;
			end if ;
		when send_data =>
			if bit_count = 16 and device_count_lt_nb_dev_m1 = '0' then
				next_transfer_state <= deassert_load ;
			end if ;
		when deassert_load => 
			if end_tempo = '1' then 
				next_transfer_state <= wait_data ;
			end if ;
		when others =>
			next_transfer_state <= wait_data ;
	end case;
end process ;

process(gls_clk, gls_reset)
begin 
	if gls_reset = '1' then
		data_clk <= '0' ;
	elsif gls_clk'event and gls_clk = '1' then
		if current_transfer_state = send_data then
			if end_tempo = '1' then
				data_clk <= not data_clk ;
			end if ;
		else
			data_clk <= '0' ;
		end if ;
	end if ;
end process ;

-- data clock rising edge and falling edge detect
process(gls_clk, gls_reset)
begin 
	if gls_reset = '1' then
		data_clk_old <= '0' ;
	elsif gls_clk'event and gls_clk = '1' then
		data_clk_old <= data_clk ;
	end if ;
end process ;
data_clk_re <= data_clk and (not data_clk_old);
data_clk_fe <= (not data_clk) and data_clk_old;

--shift register for data out
process(gls_clk, gls_reset)
begin 
	if gls_reset = '1' then
		data_shift_reg <= (others => '0') ;
	elsif gls_clk'event and gls_clk = '1' then
		if load_shift_register = '1' then
			data_shift_reg <= fifo_out ;
		elsif data_clk_fe = '1' then
			data_shift_reg(15 downto 1) <= data_shift_reg(14 downto 0) ;
			data_shift_reg(0) <= '0' ;
		end if ;
	end if ;
end process ;


with current_transfer_state select
	load_shift_register <= end_tempo when assert_load,
	                       (bit_count_eq_16 and device_count_lt_nb_dev_m1) when send_data, 
					           '0' when others ;


with current_transfer_state select
	en_tempo <= '1' when assert_load,
				   '1' when send_data,
					'1' when deassert_load,
					'0' when others ;

with current_transfer_state select
	load_tempo <= '1' when  wait_data,
					end_tempo when assert_load,
				   end_tempo when send_data,
					end_tempo when deassert_load,
					'0' when others ;
					
with current_transfer_state select
	en_bit_count <= data_clk_fe when send_data,
					    '0' when others ;
						 
						 
with current_transfer_state select
	reset_bit_count <= bit_count_eq_16 when send_data,
					    '1' when others ;
						 
with current_transfer_state select
	reset_device_count <= '0' when send_data,
							    '1' when others ;
								 
device_count_lt_nb_dev <= '1' when device_count < 	nb_device else
								 '0' ;
device_count_lt_nb_dev_m1 <= '1' when (device_count) < (nb_device-1) else
								 '0' ;
						 
en_device_count <= 	bit_count_eq_16 ;	
		
fifo_pop <= load_shift_register ;
			  
write_sig <= (wbs_strobe and wbs_write and wbs_cycle) ;	  
	  process(gls_clk, gls_reset)
begin 
	if gls_reset = '1' then
		old_write_sig <= '0' ;
	elsif gls_clk'event and gls_clk = '1' then
				if write_sig = '1' then
					fifo_in <= wbs_writedata ;
				end if ;
				old_write_sig <= write_sig ;
	end if ;
end process ;		
			  
fifo_push <= old_write_sig and (not write_sig); -- writing on, falling edge of write

-- outputs 

with current_transfer_state select
	load_d <= '0' when assert_load,
				'0' when send_data,
				'1' when others ;
				
process(gls_clk, gls_reset)
begin 
	if gls_reset = '1' then
		DOUT <= '0' ;
		SCLK <= '0' ;
		LOAD <= '1' ;
	elsif gls_clk'event and gls_clk = '1' then
		DOUT <= data_shift_reg(15) ;
		SCLK <= data_clk ;
		LOAD <= load_d ;	
	end if ;
end process ;		

end Behavioral;

