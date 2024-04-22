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
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    10:54:36 06/19/2012 
-- Design Name: 
-- Module Name:    wishbone_mp_sdram_controller - Behavioral 
-- Project Name: 
-- Target Devices: Spartan 6 Spartan 6 
-- Tool versions: ISE 14.1 ISE 14.1 
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

library work ;
use work.logi_utils_pack.all ;


entity wishbone_mp_sdram_controller is
generic( ADDR_WIDTH: positive := 16; --! width of the address bus
			WIDTH	: positive := 16; --! width of the data bus
			NB_PORT : positive := 2;
			ACCESS_CACHE_SIZE : positive  := 1024 -- expressed in 16bits multiple
			); 
port(
	-- Syscon signals
	gls_reset    : in std_logic ;
	gls_clk      : in std_logic ;
	
	-- Wishbone interface
	wbs_address       : in std_logic_vector(ADDR_WIDTH-1 downto 0) ;
	wbs_writedata : in std_logic_vector( WIDTH-1 downto 0);
	wbs_readdata  : out std_logic_vector( WIDTH-1 downto 0);
	wbs_strobe    : in std_logic ;
	wbs_cycle      : in std_logic ;
	wbs_write     : in std_logic ;
	wbs_ack       : out std_logic;
	
	-- logic interfaces
	logic_address       : in slv32_array(0 to NB_PORT-1) ; -- mem base address and cache addr
	logic_writedata : in slv16_array(0 to NB_PORT-1);
	logic_readdata  : out slv16_array(0 to NB_PORT-1);
	logic_read, logic_write : in std_logic_vector(0 to NB_PORT-1) ;
	logic_refresh : in std_logic_vector(0 to NB_PORT-1) ;
	cache_available : out std_logic_vector(0 to NB_PORT-1) ;
	
	-- SDRAM interface

	cmd_ready         : out STD_LOGIC;                     -- '1' when a new command will be acted on
	cmd_enable        : in  STD_LOGIC;                     -- Set to '1' to issue new command (only acted on when cmd_read = '1')
	cmd_wr            : in  STD_LOGIC;                     -- Is this a write?
	cmd_address       : in  STD_LOGIC_VECTOR(sdram_address_width-2 downto 0); -- address to read/write
	cmd_byte_enable   : in  STD_LOGIC_VECTOR(3 downto 0);  -- byte masks for the write command
	cmd_data_in       : in  STD_LOGIC_VECTOR(31 downto 0); -- data for the write command

	data_out          : out STD_LOGIC_VECTOR(31 downto 0); -- word read from SDRAM
	data_out_ready    : out STD_LOGIC                     -- is new data ready	
	
);
end wishbone_mp_sdram_controller;



architecture RTL of wishbone_mp_sdram_controller is

component data_cache is
generic(PORT_A_WIDTH : positive := 16; PORT_B_WIDTH : positive := 32);
port(
	clk, reset : in std_logic ;
	
	port_a_line_number : in std_logic_vector(2 downto 0);
	port_b_line_number : in std_logic_vector(2 downto 0);
	
	port_a_line_address : in std_logic_vector(6 downto 0);
	port_b_line_address : in std_logic_vector(5 downto 0);
	
	port_a_line_datain : in std_logic_vector(PORT_A_WIDTH-1 downto 0);
	port_b_line_datain : in std_logic_vector(PORT_B_WIDTH-1 downto 0);
	
	port_a_line_dataout : out std_logic_vector(PORT_A_WIDTH-1 downto 0);
	port_b_line_dataout : out std_logic_vector(PORT_B_WIDTH-1 downto 0);
	
	port_a_write, port_b_write : in std_logic ;
	
	cache_invalid : in std_logic ;
	line_dirty : out std_logic_vector(7 downto 0);
	line_clean : in std_logic_vector(7 downto 0)
);
end component;


constant ctrl_address_bit : integer := 10 ;
constant line_size : integer := 256 ;
constant cache_line_first_bit_ctrl : integer := nbit(cache_size/4);
constant END_OF_LINE : integer := (cache_size/4) ;

type ctrl_states is (INIT, REFRESH_CACHE, FLUSH_CACHE, OP_END, NEXT_PORT);

-- controller state machine signals
signal current_state, next_state : ctrl_states ;

--cache status for wishbone bus
signal cache_status : std_logic_vector(15 downto 0);

--cache control for wishbone bus
signal cache_ctrl : std_logic_vector(15 downto 0);


-- array of cache events (0 = refresh, 1 = flush)
signal cache_refresh : std_logic_vector(NB_PORT downto 0);
signal cache_flush : std_logic_vector(NB_PORT downto 0);
signal set_wbcache_refresh, set_wbcache_flush : std_logic ;

-- array of cache control signals
signal cache_base_address : slv32_array(0 to NB_PORT); -- where the cache i based in SDRAM
signal cache_line_index, cache_line_addr : slv8_array(0 to NB_PORT); -- control by manager to access cache
signal cache_line_dirty : slv8_array(0 to NB_PORT); -- cache is divided in lines, that can be marked as dirty
signal cache_access_count : slv16_array(0 to NB_PORT); -- counter to start counting from base addr until cache is filled
signal cache_write_data, cache_read_data : slv32_array(0 to NB_PORT); -- data signal from/to cache
signal cache_write : std_logic_vector(0 to NB_PORT); -- write signal to activate write to cache
signal cache_clean : std_logic_vector(0 to NB_PORT);
signal cache_invalid : std_logic_vector(0 to NB_PORT);


begin

gls_resetn <= NOT gls_reset ;

write_bloc : process(gls_clk,gls_reset)
begin
    if gls_reset = '1' then 
        write_ack <= '0';
    elsif rising_edge(gls_clk) then
        if ((wbs_strobe and wbs_write and wbs_cycle) = '1' ) then
				if wbs_address(ctrl_address_bit) = '1' and wbs_address(1 downto 0) = "00" then -- register to set base mem address
					cache_base_address(0)(15 downto 0) <= wbs_writedata ;
				elsif wbs_address(ctrl_address_bit) = '1' and wbs_address(1 downto 0) = "01" then
					cache_base_address(0)(31 downto 16) <= wbs_writedata ;
				elsif wbs_address(ctrl_address_bit) = '1' and wbs_address(1 downto 0) = "10" then
					set_wbcache_flush <= 	wbs_writedata(0);
					set_wbcache_refresh <= 	wbs_writedata(0);
				end if ;
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
		  control_latched  <= control_data ;
        if (wbs_strobe = '1' and wbs_write = '0'  and wbs_cycle = '1' ) then
            read_ack <= '1';
        else
            read_ack <= '0';
        end if;
    end if;
end process read_bloc;

wbs_ack <= read_ack or write_ack;


-- cache banks
-- cache at index 0 is wishbone access cache
cache_i : data_cache
generic map(PORT_A_WIDTH => 16,  PORT_B_WIDTH => 32)
port map(
	clk => gls_clk , 
	reset => gls_reset ,
	
	port_a_line_number => wbs_address(9 downto 7), -- need to compose cache address from access address
	port_b_line_number => cache_addr(0)(8 downto 6),
	
	port_a_line_address => wbs_address(6 downto 0), -- need to compose cache address from access address
	port_b_line_address => cache_addr(0)(5 downto 0),
	
	port_a_line_datain => wbs_writedata,
	port_b_line_datain => cache_write_data(0),
	
	port_a_line_dataout => wbs_readdata,
	port_b_line_dataout => cache_read_data(0),
	
	port_a_write => wishbone_write, 
	port_b_write => cache_write(0),
	
	line_dirty => cache_line_dirty(0),
	line_clean => cache_clean(0),
	cache_invalid => cache_invalid(0)
);
			
		
cache_ctrl_0 : process(gls_clk, gls_reset)
begin
    if gls_reset = '1' then
       cache_flush(0) <=  '0' ;
		 cache_refresh(0) <= '0' ;
    elsif rising_edge(gls_clk) then
		 if set_wbcache_flush= '1' then
			cache_flush(0) <= '1' ;
		 elsif set_wbcache_refresh = '1' then
			cache_refresh(0) <= '1';
		 end if ;
		 if rst_cache_ctrl(0)= '1' then --handled by controller when operation is done
			cache_flush(0) <= '0' ;
			cache_refresh(0) <= '0' ;
		 end if ;
    end if;
end process read_bloc;	
		
-- generate cache memory and control for each of the ports		
gen_caches : for i in 1 to NB_PORT generate
	
cache_i : data_cache
generic map(PORT_A_WIDTH => 16,  PORT_B_WIDTH => 32)
port map(
	clk => gls_clk , 
	reset => gls_reset ,
	
	port_a_line_number => logic_address(i-1)(9 downto 7), -- need to compose cache address from access address
	port_b_line_number => cache_addr(i)(8 downto 6),
	
	port_a_line_address => logic_address(i-1)(6 downto 0), -- need to compose cache address from access address
	port_b_line_address => cache_addr(i)(5 downto 0),
	
	port_a_line_datain => logic_writedata(i-1),
	port_b_line_datain => cache_write_data(i),
	
	port_a_line_dataout => logic_readdata(i-1),
	port_b_line_dataout => cache_read_data(i),
	
	port_a_write => logic_write, 
	port_b_write => cache_write(i),
	
	line_dirty => cache_line_dirty(i),
	line_clean => cache_clean(i),
	cache_invalid => cache_invalid(i)
);
		
cache_ctrl_i : process(gls_clk, gls_reset)
begin
    if gls_reset = '1' then
       cache_flush(i) <=  '0' ;
		 cache_refresh(i) <= '0' ;
    elsif rising_edge(gls_clk) then
		 if logic_flush(i-1)= '1' then
			cache_flush(i) <= '1' ;
			cach_base_address(i) <= logic_address(i-1);
		 elsif logic_refresh(i-1)= '1' then
			cache_refresh(i) <= '1' ;
			cach_base_address <= logic_address(i-1);
		 end if ;
		 if rst_cache_ctrl(i)= '1' then --handled by controller when operation is done
			cache_flush(i) <= '0' ;
			cache_refresh(i) <= '0' ;
		 end if ;
    end if;
end process read_bloc;	
		
end generate ;
	

-- current port counter
-- incemented by round robin scheduler after time slot
port_counter : process(gls_clk, gls_reset)
begin
    if gls_reset = '1' then
        port_index <= (others => '0');
    elsif rising_edge(gls_clk) then
		  if reset_port_counter = '1' then
				port_index <= (others => '0') ;
		  elsif en_port_counter = '1' then
				port_index <= port_index + 1 ;
		  end if ;
    end if;
end process port_counter;

-- Round robing cache manager
-- capture cache events (flush, refresh) and schedule them on SDRAM memory
-- change of slave whenever the counter reaches the tick (and current transfer has completed).
state_mem : process(gls_clk, gls_reset)
begin
    if gls_reset = '1' then
        current_state <= INIT ;
    elsif rising_edge(gls_clk) then
		  current_state <= next_state ;
    end if;
end process state_mem;


current_cache_addr <= cache_addr(conv_integer(port_index)) ;
current_line_index <= line_index(conv_integer(port_index)) ;
current_cache_refresh <= cache_refresh(conv_integer(port_index)) ;
current_cache_dirty <= cache_dirty(conv_integer(port_index)) ;

state_evolve: process(current_state, robin_tick_cnt, cmd_ready)
begin
	 next_state <= current_state ;
    case current_state is
		when INIT => 
			if current_cache_refresh = '1' then -- cache refresh is manually triggered
				next_state <= REFRESH_CACHE ;
			elsif current_cache_dirty(conv_integer(current_cache_line_index)) = '1' then -- cache line is dirty, need to flush to memory 
				next_state <= FLUSH_CACHE ;																			  -- will need to prioritize in the future to make sure cache line is all dirty ...
			else
				next_state <= NEXT_PORT ;
			end if ;
		when REFRESH_CACHE => 
			if current_cache_addr = END_OF_LINE then -- next line, also need to mark cache line as clean
				next_state <= OP_END ; -- cache operation ends for this cache
			end if ;
		when FLUSH_CACHE => 
			if current_cache_addr = END_OF_LINE then -- next-line, also need to mark cache line as clean
				next_state <= OP_END ; -- cache operations ends for this cache
			end if ;
		when OP_END =>
			next_state <= NEXT_PORT ;
		when NEXT_PORT => 
			next_state <= INIT;
		when others => 
			next_state <= INIT ;
	 end case ;
end process state_evolve;

-- need to generate some of the logic for each line ...
gen_cleans : for i in 0 to 8 generate
cache_clean(conv_integer(port_index))(i) <= '1' when current_cache_addr = END_OF_LINE and current_state = FLUSH_CACHE and cache_line_index = i else
														'1' when current_cache_addr = END_OF_LINE and current_state = REFRESH_CACHE and cache_line_index = i else
														'0' ; -- also need to have addresse at right value to clean the right line ...
end generate ;
			
with current_state select
	en_port_counter <= '1' when NEXT_PORT,
							 '0' when others ;
							 							 
reset_port_counter <= '1' when port_index = NB_PORT and current_state = NEXT_PORT else
							 '0' ;
							 
en_line_index <= '1' when current_cache_addr = END_OF_LINE and current_state = FLUSH_CACHE else -- increment line index after line was flushed
					  '1' when current_cache_addr = END_OF_LINE and current_state = REFRESH_CACHE else -- increment line index after line was refreshed
					  '1' when cache_refresh(conv_integer(port_index)) = '0' and  current_cache_dirty(conv_integer(port_index))(conv_integer(cache_addr(8 downto 6))) = '1' and current_state = INIT else -- increment line index if line needs no-op
					  '0'  ;							 
					  
with current_state select
	load_mem_addr <= '1' when INIT,
						  '0' when others ;
						  
with current_state select
	cm_enable <= '1' when FLUSH_CACHE,
					 '1' when REFRESH_CACHE,
					 '0' when others ;
					 
with current_state select
	cm_wr <= '1' when FLUSH_CACHE,
				'0' when others ;
 
--mem handling process 
cache_operation_proc : process(gls_clk, gls_reset)
begin
    if gls_reset = '1' then
        mem_addr <= (others => '0') ;
    elsif rising_edge(gls_clk) then
		  if load_mem_addr = '1' then
				mem_addr <= cache_base_addr(port_index) ;
		  end if ;
		  
		  if current_state = FLUSH_CACHE then
				if cmd_ready = '1' then
					mem_addr <= mem_addr + 1 ;
					current_cache_addr <= current_cache_addr + 1 ;
				end if ;
		  end if ;
		  
		  if current_state = REFRESH_CACHE then
				if cmd_ready = '1' then
					mem_addr <= mem_addr + 1 ;
				end if ;
				
				if data_out_ready = '1' then
					current_cache_addr <= current_cache_addr + 1 ;
				end if ;
		  end if ;
		  
    end if;
end process state_mem;

 	



end RTL;

