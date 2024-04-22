----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:12:13 10/16/2014 
-- Design Name: 
-- Module Name:    dram_fifo - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
library work ;
use work.logi_utils_pack.all ;
use work.logi_primitive_pack.all ;



entity dram_fifo is
generic(CACHE_SIZE : positive := 2048;
		  FIFO_SIZE : positive := 16_777_216;
		  sdram_address_width : positive := 24;
		  SYNC_READ : boolean := true;
		  SYNC_WRITE : boolean := true;
		  CACHE_ADDRESS : std_logic_vector(31 downto 0) := (others => '0'));
port(
		clk           : in  STD_LOGIC;
		reset         : in  STD_LOGIC;

		
		-- FIFO interface
		reset_fifo : in std_logic ;
		write_fifo, read_fifo : in std_logic ;
		nb_available : out std_logic_vector(31 downto 0);
		data_out : out std_logic_vector(15 downto 0);
		data_in : in std_logic_vector(15 downto 0);
		
		
		refresh_active, flush_active : out std_logic ;
		
		-- Interface to issue reads or write data
		cmd_ready         : in STD_LOGIC;                     -- '1' when a new command will be acted on
		cmd_enable        : out  STD_LOGIC;                     -- Set to '1' to issue new command (only acted on when cmd_read = '1')
		cmd_wr            : out  STD_LOGIC;                     -- Is this a write?
		cmd_address       : out  STD_LOGIC_VECTOR(sdram_address_width-2 downto 0); -- address to read/write
		cmd_byte_enable   : out  STD_LOGIC_VECTOR(3 downto 0);  -- byte masks for the write command
		cmd_data_in       : out  STD_LOGIC_VECTOR(31 downto 0); -- data for the write command

		sdram_data_out         : in STD_LOGIC_VECTOR(31 downto 0); -- word read from SDRAM
		sdram_data_ready    : in STD_LOGIC
);
end dram_fifo;

architecture Behavioral of dram_fifo is

type cache_controller_state is (IDLE, REFRESH, FLUSH);

constant CACHE_END_ADDRESS : std_logic_vector(sdram_address_width-2 downto 0) := CACHE_ADDRESS(sdram_address_width-2 downto 0) + (FIFO_SIZE/2);
constant cache_byte_granularity : positive := 256 ;
constant cache_index_low_fifo_side : positive := nbit(cache_byte_granularity)-1;
constant cache_index_low_sdram_side : positive := nbit(cache_byte_granularity)-2;

signal cache_current_state, cache_next_state : cache_controller_state;

signal fifo_write_address, fifo_read_address : std_logic_vector(cache_index_low_fifo_side downto 0);
signal sdram_write_address, sdram_read_address : std_logic_vector(sdram_address_width-2 downto 0);
signal cache_write_address, cache_read_address : std_logic_vector(cache_index_low_sdram_side downto 0);
signal cache_out, cache_in : std_logic_vector(31 downto 0);

signal cache_require_refresh, cache_require_flush : std_logic ;
signal cache_counter : std_logic_vector(6 downto 0);
signal cache_ready : std_logic ;
signal write_fifo_index, read_fifo_index : std_logic ;

signal refresh_done, flush_done, cache_require_flush_reset, cache_require_refresh_reset : std_logic ;
signal old_write_line_index, old_read_line_index : std_logic ;
signal write_fifo_write, write_cache_write : std_logic ;
signal fifo_wr, fifo_rd : std_logic ; 
signal rd_old, wr_old, wr_data, rd_data, one_turn, latch_data : std_logic ;
signal rd_rising_edge, wr_rising_edge : std_logic ;
signal rd_falling_edge, wr_falling_edge : std_logic ;
signal fifo_nb_available_t : std_logic_vector(31 downto 0);
signal fifo_ready : std_logic ;
signal flushed_line_count : std_logic_vector(15 downto 0);
signal read_cache_init : std_logic_vector(1 downto 0);
begin

refresh_active <= '1' when cache_current_state = REFRESH else
						'0' ;
flush_active <= '1' when cache_current_state = FLUSH else
					 '0' ;

cmd_byte_enable <= (others => '1');
-- CACHE MANAGEMENT 
process(clk, reset)
begin
	if reset = '1' then 
		cache_current_state <= IDLE; -- CACHE init state is IDLE
	elsif clk'event and clk = '1' then
		if reset_fifo = '1' then
			cache_current_state <= IDLE;
		else
			cache_current_state <= cache_next_state;
		end if ;
	end if ;
end process ;

process(cache_ready, cache_require_refresh, cache_require_flush, refresh_done, flush_done, cache_current_state)
begin
	cache_next_state <= cache_current_state ;
	case cache_current_state is
		when IDLE =>
			if cache_require_refresh = '1' and cache_ready = '1' then
				cache_next_state <= REFRESH ; -- CACHE can only be refreshed if already flushed onces
			elsif cache_require_flush = '1' then
				cache_next_state <= FLUSH ;
			end if ;
		when REFRESH =>
			if refresh_done = '1' then
				cache_next_state <= IDLE ;
			end if ;
		when FLUSH =>
			if flush_done = '1' then
				cache_next_state <= IDLE ;
			end if ;
		when others =>
			cache_next_state <= IDLE ;
	end case ;
end process ;




-- CACHE REFRESH/FLUSH STRATEGY
process(clk, reset)
begin
	if reset = '1' then 
		cache_ready <= '0' ;
		cache_require_refresh <= '0' ;
		cache_require_flush <= '0';
		write_fifo_index <= '0';
		read_fifo_index <= '0';
		fifo_ready <= '0' ;
		read_cache_init <= "11";
	elsif clk'event and clk = '1' then
		-- CACHE IS FLUSHED WHENEVER THE FIFO_INDEX BIT CHANGES
		if reset_fifo = '1' then
			cache_require_flush <= '0';
		elsif cache_require_flush_reset = '1' then
			cache_require_flush <= '0';
		elsif write_fifo_index /= fifo_write_address(fifo_write_address'high) then
			cache_require_flush <= '1'; -- CACHE require flush when one line of cache was written
												 -- fifo write address highest byte indicate cache line address
		end if ;
		write_fifo_index <= fifo_write_address(fifo_write_address'high) ;
		
		
		-- CACHE IS REFRESHED ONCE TWICE AND THEN
		-- WHENEVER THE FIFO_INDEX BIT CHANGES
		if reset_fifo = '1' then
			read_cache_init <= "11"; -- at reset init indicates that cache can be refreshed twice
			cache_require_refresh <= '0' ;
		elsif cache_require_refresh_reset = '1' then -- a refresh was performed
			cache_require_refresh <= '0';
			read_cache_init(1) <= '0' ;
			read_cache_init(0) <= read_cache_init(1) ;
		elsif read_cache_init /= 0 and flushed_line_count > 0 then -- a refresh is required  as init of cache was not performed
			cache_require_refresh <= '1';
		elsif read_cache_init = 0 and read_fifo_index /= fifo_read_address(fifo_read_address'high) and flushed_line_count > 0 then
			cache_require_refresh <= '1'; -- normal case to trigger a refresh. One line of cache was fully consumed
		end if ;
		read_fifo_index <= fifo_read_address(fifo_read_address'high) ;
		
		-- CACHE IS CONSIDERED READY WHEN IT WAS ONCE FLUSHED AND REFRESHED
		-- THIS LIMIT GRANULARITY OF FIFO
		if reset_fifo = '1' then
			cache_ready <= '0' ;
		elsif cache_current_state = FLUSH and cache_next_state = IDLE then
			cache_ready <= '1' ;
		end if ;
		--TODO: decide when cache is not ready anymore ...
		
		-- FIFO IS CONSIDERED READY WHEN IT WAS ONCE REFRESHED
		-- THIS LIMIT GRANULARITY OF FIFO
		if reset_fifo = '1' then
			fifo_ready <= '0' ;
		elsif cache_current_state = REFRESH and cache_next_state = IDLE then
			fifo_ready <= '1' ;
		elsif fifo_ready = '1' and fifo_nb_available_t = 0 then
			fifo_ready <= '0' ;-- fifo is fully empty the cache is not ready anymore
		end if ;
	end if ;	
end process ;


-- SDRAM WRITE ADDRESS IS INCREMENTED WHEN CACHE IS FLUSHED
-- END OF FLUSH IS REACHED WHEN THE CACHE_LINE_INDEX CHANGES
process(clk, reset)
begin
	if reset = '1' then
		sdram_write_address <= CACHE_ADDRESS(sdram_address_width-2 downto 0);
		old_write_line_index <= '0' ;
	elsif clk'event and clk = '1' then 
		if reset_fifo = '1' then
			sdram_write_address <= CACHE_ADDRESS(sdram_address_width-2 downto 0) ;
		elsif cache_current_state = FLUSH and cmd_ready = '1' then --incrementing on falling edge of ready signal
			if sdram_write_address = CACHE_END_ADDRESS then
				sdram_write_address <= CACHE_ADDRESS(sdram_address_width-2 downto 0) ;
			else
				sdram_write_address <= sdram_write_address + 1 ;
			end if ;
		end if ;
		if reset_fifo = '1' then
			old_write_line_index <= '0' ;
		else
			old_write_line_index <= sdram_write_address(cache_index_low_sdram_side);
		end if ;
	end if ;
end process ;

cache_read_address <= sdram_write_address(cache_read_address'high downto 0);
flush_done <= '1' when cache_current_state = FLUSH and old_write_line_index /= sdram_write_address(cache_index_low_sdram_side) else
				  '0' ;
cache_require_flush_reset <= '1' when cache_current_state = FLUSH and cache_next_state=IDLE else
									  '0' ;
-- SDRAM_READ_ADDRESS IS INCREMENTED ON REFRESH UNTIL THE CACHE_LINE_INDEX CHANGES 
process(clk, reset)
begin
	if reset = '1' then
		sdram_read_address <= CACHE_ADDRESS(sdram_address_width-2 downto 0);
		cache_write_address <= (others => '0');
		old_read_line_index <= '0' ;
	elsif clk'event and clk = '1' then 
		if reset_fifo = '1' then
			sdram_read_address <= CACHE_ADDRESS(sdram_address_width-2 downto 0);
		elsif cache_current_state = REFRESH and refresh_done = '0' and cmd_ready = '1' and cache_write_address(cache_write_address'high) = sdram_read_address(cache_write_address'high) then
			if sdram_read_address = CACHE_END_ADDRESS then
				sdram_read_address <= CACHE_ADDRESS(sdram_address_width-2 downto 0) ;
			else
				sdram_read_address <= sdram_read_address + 1 ;
			end if ;
		end if ;
		-- CACHE_WRITE_ADDRESS IS ONLY INCREMENT WHEN SDRAM PIPELINE IS INITIALIZED
		if reset_fifo = '1' then
			cache_write_address <= (others => '0');
		elsif cache_current_state = REFRESH and sdram_data_ready = '1' then
			cache_write_address <= cache_write_address + 1 ;
		end if ;
		if reset_fifo = '1' then
			old_read_line_index <= '0' ;
		else
			old_read_line_index <= cache_write_address(cache_write_address'high);
		end if ;
	end if ;
end process ;
refresh_done <= '1' when cache_current_state = REFRESH and old_read_line_index /= cache_write_address(cache_write_address'high) else
					 '0';
write_cache_write <= '1' when cache_current_state = REFRESH and sdram_data_ready = '1' else
							'0' ;
					 
process(clk, reset)
begin
	if reset = '1' then
		flushed_line_count <= (others => '0');
	elsif clk'event and clk = '1' then 
		if reset_fifo = '1' then
			flushed_line_count <= (others => '0');
		elsif refresh_done = '1' and flushed_line_count > 0 then 
			flushed_line_count <= flushed_line_count - 1;
		elsif flush_done = '1' then
			flushed_line_count <= flushed_line_count + 1;
		end if ;
	end if ;
end process ;					 
					 
cache_require_refresh_reset <= '1' when cache_current_state = REFRESH and cache_next_state=IDLE else
									  '0' ;
									  
									  
---- WRITE COMMAND IS ACTIVE ON FLUSH
--cmd_wr <= cmd_ready when cache_current_state = FLUSH  else
cmd_wr <= '1' when cache_current_state = FLUSH  else
			 '0' ;
---- CMD_ENABLE IS ACTIVE ON FLUSH AND ON REFRESH UNTIL THE SDRAM_READ_ADDRESS INDICATING CACHE_LINE_INDEX
---- CHANGES
---- THIS SEEMS TO AFFECT TIMING ...
cmd_enable <= '0' when cache_current_state = IDLE else
				  '1' when cache_current_state = REFRESH and cache_write_address(cache_write_address'high) = sdram_read_address(cache_write_address'high) else
				  '1' when cache_current_state = FLUSH else
				  '0';
				  

----CMD_ADDRESS IS EITHER READ_ADDRESS OR WRITE_ADDRESS DEPENDING ON FLUSH OR REFRESH				  
---- THIS SEEMS TO AFFECT TIMING ...
with cache_current_state select
	cmd_address <= sdram_write_address when FLUSH,
						sdram_read_address when REFRESH,
						(others => '0') when others ;
							
cache_in <= sdram_data_out ;
cmd_data_in <= cache_out ;

-- CACHE ARE INSTANTIATED IN NEXT SECTION

-- write cache is divided into two lines
-- one line is always available for write, and one line is always available 
-- to be flushed to SDRAM
write_cache :  tdp_bram 
	generic map(
    DATA_A    => 16,
    ADDR_A    => 8,
    DATA_B    => 32,
    ADDR_B    => 7
)
port map(
    -- Port A
    a_clk   => clk,
    a_wr    => write_fifo_write,
    a_addr  => fifo_write_address,
    a_din   => data_in,
    a_dout  => open,
     
    -- Port B
    b_clk   => clk,
    b_wr    => '0',
    b_addr  => cache_read_address,
    b_din   => (others => '0'),
    b_dout  => cache_out
);
	
-- read cache is divided into two lines
-- one line is always available for read, and one line is always available 
--for refresh	
read_cache : tdp_bram
generic map(
    DATA_A    => 16,
    ADDR_A    => 8,
    DATA_B    => 32,
    ADDR_B    => 7
)
port map(
    -- Port A
    a_clk   => clk,
    a_wr    => '0',
    a_addr  => fifo_read_address,
    a_din   => (others => '0'),
    a_dout  => data_out,
     
    -- Port B
    b_clk   => clk,
    b_wr    => write_cache_write,
    b_addr  => cache_write_address,
    b_din   => cache_in,
    b_dout  => open
);



-- HERE STARTS FIFO STRUCTURE		  
gen_async_rd : if NOT SYNC_READ generate			  		  
	process(reset, clk)
	begin
		if reset = '1' then
			rd_old <= '0' ;
		elsif clk'event and clk = '1' then
			rd_old <= read_fifo ;
		end if ;
	end process ;
	rd_falling_edge <= ((NOT read_fifo) AND rd_old);
	fifo_rd <= rd_falling_edge ;
end generate ;

gen_sync_rd : if SYNC_READ generate			  		  
	fifo_rd <= read_fifo;
end generate ;


gen_async_wr : if NOT SYNC_WRITE generate		
process(reset, clk)
begin
	if reset = '1' then
		wr_old <= '0' ;
	elsif clk'event and clk = '1' then
		wr_old <= write_fifo ;
	end if ;
end process ;
wr_falling_edge <= ((NOT write_fifo) AND wr_old) ;
fifo_wr <= wr_falling_edge ;
end generate ;

gen_sync_wr : if SYNC_WRITE generate
fifo_wr <= write_fifo ;
end generate ;

write_fifo_write <= fifo_wr ;

--rd process
process(clk, reset)
begin
if reset = '1' then
	fifo_read_address <= (others => '0') ;
elsif clk'event and clk = '1' then
	if reset_fifo = '1' then
		fifo_read_address <= (others => '0') ;
	elsif fifo_rd = '1' and fifo_nb_available_t /= 0 then
			fifo_read_address <= fifo_read_address + 1;
	end if ;
end if ;
end process ;

-- wr process 
process(clk, reset)
begin
if reset = '1' then
	fifo_write_address <= (others => '0') ;
elsif clk'event and clk = '1' then
	if reset_fifo = '1' then
		fifo_write_address <= (others => '0') ;
	elsif fifo_wr = '1' and fifo_nb_available_t /= FIFO_SIZE then
		fifo_write_address <= fifo_write_address + 1;
	end if ;
end if ;
end process ;

-- nb available process
process(clk, reset)
begin
if reset = '1' then
	fifo_nb_available_t <= (others => '0') ;
elsif clk'event and clk = '1' then
	if reset_fifo = '1' then
		fifo_nb_available_t <= (others => '0') ;
	elsif fifo_wr = '1' and fifo_rd = '0' and fifo_nb_available_t /= FIFO_SIZE then
		fifo_nb_available_t <= fifo_nb_available_t + 1 ;
	elsif fifo_rd = '1' and fifo_wr = '0' and fifo_nb_available_t /= 0 then
		fifo_nb_available_t <= fifo_nb_available_t - 1 ;	
	end if ;
end if ;
end process ;


nb_available <= fifo_nb_available_t when fifo_ready = '1' else
					 (others => '0');

end Behavioral;

