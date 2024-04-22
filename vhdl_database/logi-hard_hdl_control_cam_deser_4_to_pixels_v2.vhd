----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:09:09 12/17/2014 
-- Design Name: 
-- Module Name:    cam_deser_4_to_pixels - Behavioral 
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

entity cam_deser_4_to_pixels_v2 is
generic(INVERT_DATA : boolean := true);
port(
	deser_clk, sys_clk : in std_logic ;
	sys_reset : in std_logic ;
	data_in_deser : in std_logic_vector(3 downto 0);
	
	
	raw_deser : out std_logic_vector(9 downto 0);
	
	pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic ;
	pixel_out_data : out std_logic_vector(7 downto 0);
	synced_out : out std_logic 
);
end cam_deser_4_to_pixels_v2;

architecture Behavioral of cam_deser_4_to_pixels_v2 is
type synced_states is (WAIT_SYNC, ACC) ;
type array_3 is array(0 to 2) of std_logic_vector(9 downto 0);

COMPONENT fifo_sync
  PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC
  );
END COMPONENT;

signal current_state, next_state : synced_states ;
signal data_acc : array_3 ;

signal data_shift_register : std_logic_vector(23 downto 0);
signal sync_phase, sync_mask, old_phase : std_logic_vector(3 downto 0);
signal shift_counter : std_logic_vector(2 downto 0);
signal en_shift, reset_shift : std_logic ;

signal pixel_valid, pixel_valid_long, frame_valid, line_valid : std_logic ;
signal pixel_data : std_logic_vector(7 downto 0);

signal pixel_out_clk_deser_clk, pixel_out_hsync_deser_clk, pixel_out_vsync_deser_clk : std_logic ;
signal pixel_out_data_deser_clk : std_logic_vector(7 downto 0);

signal pixel_out_clk_sync1, pixel_out_hsync_sync1, pixel_out_vsync_sync1 : std_logic ;
signal pixel_out_data_sync1 : std_logic_vector(7 downto 0);

signal raw_deser_data, raw_deser_deser_clk, raw_deser_sync1 : std_logic_vector(9 downto 0) ;
signal sync_pattern : std_logic ;

signal in_sync_0, in_sync_1 : std_logic ;

signal rd_sync, sync_empty, sync_full : std_logic ;
signal sync_out : std_logic_vector(9 downto 0);
begin


with_invert : if INVERT_DATA generate
process(deser_clk, sys_reset)
begin
	if sys_reset = '1' then
		data_shift_register <= (others => '0') ;
	elsif deser_clk'event and deser_clk = '1' then
		data_shift_register(data_shift_register'high-4 downto 0) <=  data_shift_register(data_shift_register'high downto 4) ;
		data_shift_register(data_shift_register'high downto data_shift_register'high-3) <= not data_in_deser ;
	end if ;
end process ;
end generate ;

without_invert : if not INVERT_DATA generate
process(deser_clk, sys_reset)
begin
	if sys_reset = '1' then
		data_shift_register <= (others => '0') ;
	elsif deser_clk'event and deser_clk = '1' then
		data_shift_register(data_shift_register'high-4 downto 0) <=  data_shift_register(data_shift_register'high downto 4) ;
		data_shift_register(data_shift_register'high downto data_shift_register'high-3) <= data_in_deser ;
	end if ;
end process ;
end generate ;


gen_detect_start_stop : for i in 0 to 3 generate
	sync_phase(i) <= '1' when data_shift_register(i+1 downto i) = "10" and data_shift_register(i+12) = '0' else
						  --'1' when data_shift_register(i+1) = '1' and data_shift_register(i+12) = '0' else
						  '0' ; -- start bit is a 0 to 1 transition
end generate ;	

process(deser_clk, sys_reset)
begin
	if sys_reset = '1' then
		shift_counter(0) <= '1' ;
		shift_counter(shift_counter'high downto 1) <= (others => '0') ;
	elsif deser_clk'event and deser_clk = '1' then
		if reset_shift = '1' then
			shift_counter(0) <= '1' ;
			shift_counter(shift_counter'high downto 1) <= (others => '0') ;
		elsif en_shift = '1' then
			shift_counter(0) <= shift_counter(shift_counter'high) ;
			shift_counter(shift_counter'high downto 1) <= shift_counter(shift_counter'high-1 downto 0) ;
		end if ;
	end if ;
end process ;
		
sync_mask <= old_phase when (sync_phase and old_phase) /= 0 else
				 "0001" when sync_phase(0) = '1' else
				 "0010" when sync_phase(1) = '1' else
				 "0100" when sync_phase(2) = '1' else
				 "1000" when sync_phase(3) = '1' else
				 "0000" ;
		
process(deser_clk, sys_reset)
begin
	if sys_reset = '1' then
		old_phase <= (others => '0') ;
	elsif deser_clk'event and deser_clk = '1' then
		if current_state = WAIT_SYNC and next_state = ACC then
			old_phase <= sync_mask ;
		end if ;
	end if ;
end process ;		
		
en_shift <= '1' when current_state = WAIT_SYNC and sync_phase /=0 else
				'1' when current_state = ACC else
				'0' ;
reset_shift <= '0' ; --'1' when current_state = WAIT_SYNC and sync_phase = 0 else
					--'0' ;

process(deser_clk, sys_reset)
begin
	if sys_reset = '1' then
		current_state <= WAIT_SYNC ;
	elsif deser_clk'event and deser_clk = '1' then
		current_state <= next_state ;
	end if ;
end process ;			

process(current_state, shift_counter, sync_phase)
begin
	next_state <= current_state ;
	case  current_state is
		when WAIT_SYNC =>
			if sync_phase /= 0 then
				next_state <= ACC ;
			end if ;
		when ACC =>
			if shift_counter(2) = '1' then
				next_state <= WAIT_SYNC ;
			end if ;
		when others => 
			next_state <= WAIT_SYNC ;
	end case ;
end process ;		

pixel_valid <= '1' when current_state = WAIT_SYNC and sync_phase /= 0 and sync_full = '0' else
					'0' ;			
				  
with sync_mask select
	raw_deser_data <= data_shift_register(11 downto 2) when "0001",
					  data_shift_register(12 downto 3) when "0010",
					  data_shift_register(13 downto 4) when "0100",
					  data_shift_register(14 downto 5) when "1000",
					  (others => '0') when others ;	



synchronizer_0 : fifo_sync
  PORT MAP (
    rst => sys_reset,
    wr_clk => deser_clk,
    rd_clk => sys_clk,
    din => raw_deser_data,
    
	 wr_en => pixel_valid,
    rd_en => rd_sync,
    dout => sync_out,
    full => sync_full,
    empty => sync_empty
  );

process(sys_clk, sys_reset)
begin
	if sys_reset = '1' then 
			rd_sync <= '0' ;
	elsif sys_clk'event and sys_clk = '1' then
		if sync_empty = '0' then
			rd_sync <= '1' ;
		else
			rd_sync <= '0' ;
		end if ;
	end if ;
end process ;

pixel_out_clk <= not sync_empty ;
pixel_out_hsync <= not sync_out(8) ;
pixel_out_vsync <= not sync_out(9) ;
pixel_out_data <= sync_out(7 downto 0) ;	
raw_deser <= sync_out;
synced_out <= '1' when current_state = ACC else
				  '1' when current_state = WAIT_SYNC and sync_phase /= 0 else
				  '0' ;

end Behavioral;

