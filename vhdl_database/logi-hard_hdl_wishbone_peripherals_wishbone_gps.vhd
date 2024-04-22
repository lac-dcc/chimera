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

entity wishbone_gps is
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
		  wbs_ack       : out std_logic ;
		  rx_in : in std_logic 
);
end wishbone_gps;

architecture Behavioral of wishbone_gps is

component async_serial is
generic(CLK_FREQ : positive := 100_000_000; BAUDRATE : positive := 115_200; NMEA_HEADER : string := "$GPRMC") ;
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

component nmea_frame_extractor is
generic(nmea_header : string := "$GPRMC");
port(
	clk, reset : in std_logic ;
	nmea_byte_in : in std_logic_vector(7 downto 0);
	new_byte_in : in std_logic ;
	nmea_byte_out : out std_logic_vector(7 downto 0);
	new_byte_out : out std_logic;
	frame_size : out std_logic_vector(7 downto 0);
	end_of_frame : out std_logic;
	frame_error : out std_logic
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

-- uart signals
signal rx_register : std_logic_vector(7 downto 0); 
signal ctrl_register : std_logic_vector(15 downto 0);
signal send_data, data_ready, uart_available : std_logic ;

-- nmea filter signals
signal new_nmea : std_logic ;
signal nmea_out : std_logic_vector(7 downto 0);
signal frame_error : std_logic ;

-- fifo signals
signal reset_fifo : std_logic ;
signal fifo_empty, fifo_full, pop_fifo : std_logic ;
signal fifo_out : std_logic_vector(15 downto 0);

-- 8 bit to 16 bit logic 
signal new_nmea16, mod_count, end_of_frame : std_logic ;
signal char_buffer, nb_available, nmea_frame_size : std_logic_vector(7 downto 0);
signal nmea16 : std_logic_vector(15 downto 0);

-- double buffer signal
signal buffer_use : std_logic_vector(1 downto 0);
signal buffer_read_data : std_logic_vector(15 downto 0);
signal read_address, write_address : std_logic_vector(7 downto 0);
signal buffer_locked, free_buffer, end_of_frame_delayed : std_logic ;
signal write_buffer : std_logic ;
signal buffer_address, char_write_index : std_logic_vector(7 downto 0);
signal buffer_input : std_logic_vector(15 downto 0);
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

reset_fifo <= wbs_writedata(0) when write_ack = '1' else
				  --- '1' when frame_error = '1' else -- could corrupt ongoing frames ...
				  gls_reset;

read_bloc : process(gls_clk, gls_reset)
begin
    if gls_reset = '1' then
--        ctrl_register <= (others => '0');
--		  wbs_readdata <= (others => '0');
		  read_ack <= '0' ;
    elsif rising_edge(gls_clk) then
		 
--		 if read_ack = '1' and (wbs_strobe = '0' and wbs_cycle = '0' ) and  wbs_address(4)='0' then -- reset when read
--			pop_fifo <= '1' ;
--	     else
--			pop_fifo <= '0' ;
--		  end if ;
--		  
--		  ctrl_register(7 downto 0) <= nb_available ; 
--		  ctrl_register(15 downto 9) <= "0000000" ;
--		  
--		  ctrl_register(8) <= fifo_full ;
		  --if reset_fifo = '1' then -- RS register for fifo full to detect overun
		--			ctrl_register(8) <= '0' ;
		 -- elsif fifo_full = '1' then
		--			ctrl_register(8) <= '1' ;
		 -- end if ;
		  
		  
--		  if wbs_address(4) = '0' then
--				wbs_readdata <= fifo_out ;
--		  else
--				wbs_readdata <= ctrl_register ;
--		  end if ;
		  
        if (wbs_strobe = '1' and wbs_write = '0'  and wbs_cycle = '1') then
            read_ack <= '1';
        else
            read_ack <= '0';
        end if;
    end if;
end process read_bloc;


serial_0 : async_serial
generic map(CLK_FREQ => 100_000_000, BAUDRATE => baudrate)
port map( clk => gls_clk, reset => gls_reset ,
		rx => rx_in,
		tx => open,
		data_out => rx_register,
		data_in => (others => '0'),
		data_ready => data_ready,
		data_send => '0',
		available => open
);

filter_nmea : nmea_frame_extractor
generic map(nmea_header => "$GPRMC")
port map(
	clk => gls_clk, reset => (gls_reset or reset_fifo),
	nmea_byte_in => rx_register,
	new_byte_in => data_ready,
	nmea_byte_out => nmea_out,
	new_byte_out => new_nmea, 
	frame_size => nmea_frame_size,
	end_of_frame => end_of_frame,
	frame_error => frame_error
);

process(gls_clk, gls_reset)
begin
	if gls_reset = '1' then
			char_buffer <= (others => '0');
			mod_count <= '0' ;
	elsif gls_clk'event and gls_clk = '1' then
			if end_of_frame_delayed = '1' then
				char_buffer <= (others => '0');
				mod_count <= '0' ;
			elsif new_nmea = '1' then
				char_buffer <= nmea_out ;
				mod_count <= not mod_count ;
			end if ;
	end if ;
end process ;

new_nmea16 <= new_nmea and mod_count ;
nmea16 <= nmea_out & char_buffer  ;

--
---- handling nb_available manually ...
--process(gls_clk, gls_reset)
--begin
--	if gls_reset = '1' then
--			nb_available <= (others => '0');
--	elsif gls_clk'event and gls_clk = '1' then
--			if reset_fifo = '1' then
--				nb_available <= (others => '0');
--			elsif new_nmea16 = '1' and fifo_full = '0' and pop_fifo = '0' then
--				nb_available <= nb_available + 1 ;
--			elsif pop_fifo = '1' and fifo_empty = '0' and new_nmea16 = '0' then
--				nb_available <= nb_available - 1 ;
--			end if ;
--	end if ;
--end process ;
--
--fifo_0 : small_fifo 
--generic map( WIDTH => 16, DEPTH => 64, THRESHOLD => 4)
--port map(clk => gls_clk, 
--	  resetn => (not reset_fifo),
--	  push => new_nmea16, 
--	  pop => pop_fifo,
--	  full => fifo_full, 
--	  empty => fifo_empty, 
--	  limit => open,
--	  data_in => nmea16,
--	  data_out => fifo_out
--	  );
	  
	  
-- handle address
process(gls_clk, gls_reset)
begin
	if gls_reset = '1' then
			char_write_index <= (others => '0');
	elsif gls_clk'event and gls_clk = '1' then
			if end_of_frame_delayed = '1' then
				char_write_index <= X"01";
			elsif new_nmea16 = '1' then
				char_write_index <= char_write_index + 1 ;
			end if ;
			end_of_frame_delayed <= end_of_frame ;
	end if ;
end process ;	  
	

buffer_address <= (others => '0') when end_of_frame_delayed = '1' else
						char_write_index ;
						
buffer_input <= 	(X"00" & nmea_frame_size) when end_of_frame_delayed = '1' else
						nmea16 ;

write_buffer <= 	new_nmea16 OR end_of_frame OR end_of_frame_delayed; 


buffer_locked <= read_ack ;
wbs_readdata <= buffer_read_data ;


-- ram being used to implement the double buffer memory
ram0 : dpram_NxN 
	generic map(SIZE => 256,  NBIT => 16, ADDR_WIDTH=> 8) -- need to be computed
	port map(
 		clk => gls_clk,
 		we => write_buffer ,
 		di => buffer_input, 
		a	=> write_address ,
 		dpra => read_address,
		spo => open,
		dpo => buffer_read_data 		
	); 



-- highest bit select buffer to write to 
write_address(write_address'high) <= buffer_use(1) ;
write_address(write_address'high-1 downto 0) <= buffer_address(write_address'high-1 downto 0);											 

read_address(read_address'high) <= buffer_use(0) ;
read_address(read_address'high-1 downto 0) <= wbs_address(read_address'high-1 downto 0);											 



process(gls_clk, gls_reset)
begin
	if gls_reset = '1' then	
		buffer_use <= "01" ;
	elsif gls_clk'event and gls_clk = '1' then
		if end_of_frame_delayed = '1' then
			free_buffer <= '1' ;
		elsif free_buffer = '1' and buffer_locked = '0' then -- if write and one buffer at least is available
			buffer_use <= not buffer_use ;
			free_buffer <= '0' ;
		end if ;
	end if ;
end process ;	  

end Behavioral;

