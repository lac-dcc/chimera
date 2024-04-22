----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:27:28 07/10/2014 
-- Design Name: 
-- Module Name:    rgb_32_32_matrix_ctrl - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;



library work;
use work.logi_utils_pack.all ;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rgb_32_32_matrix_ctrl is
generic(
		  clk_div : positive := 10;
		  -- TODO: nb_panels is untested, still need to be validated
		  nb_panels : positive := 4 ;
		  bits_per_color : INTEGER RANGE 1 TO 4 := 4 ;
		  expose_step_cycle: positive := 1910
);

port(

		  clk, reset : in std_logic ;
		  pixel_addr : in std_logic_vector((nbit(32*32*nb_panels))-1 downto 0);
		  pixel_value_out : out std_logic_vector((bits_per_color*3)-1 downto 0);
		  pixel_value_in : in std_logic_vector((bits_per_color*3)-1 downto 0);
		  write_pixel : in std_logic ;
		  SCLK_OUT : out std_logic ;
		  BLANK_OUT : out std_logic ;
		  LATCH_OUT : out std_logic ;
		  A_OUT : out std_logic_vector(3 downto 0);
		  R_out : out std_logic_vector(1 downto 0);
		  G_out : out std_logic_vector(1 downto 0);
		  B_out : out std_logic_vector(1 downto 0)
);
end rgb_32_32_matrix_ctrl;

architecture Behavioral of rgb_32_32_matrix_ctrl is

component dpram_NxN is
	generic(SIZE : natural := 64 ; NBIT : natural := 8; ADDR_WIDTH : natural := 6);
	port(
 		clk : in std_logic; 
 		we : in std_logic; 
 		
 		di : in std_logic_vector(NBIT-1 downto 0 ); 
		a	:	in std_logic_vector((ADDR_WIDTH - 1) downto 0 );
 		dpra : in std_logic_vector((ADDR_WIDTH - 1) downto 0 );
		spo : out std_logic_vector(NBIT-1 downto 0 );
		dpo : out std_logic_vector(NBIT-1 downto 0 ) 		
	); 
end component;


type ctrl_state is (EXPOSE, BLANK, LATCH, UNBLANK, READ, SHIFT1, SHIFT2);

constant LINE_SIZE : positive := 32*nb_panels ;
constant RAM_SIZE : positive := LINE_SIZE*32 ;
constant BOTTOM_ADDRESS_OFFSET : positive := LINE_SIZE * 16 ;

signal cur_state, next_state : ctrl_state ;

signal next_pixel_div, bin_code_delay, exposure_time : std_logic_vector(15 downto 0);
signal end_count : std_logic ;
signal col_count : std_logic_vector(nbit(LINE_SIZE)-1 downto 0);
signal line_count : std_logic_vector(3 downto 0);
signal clk_count, count_load_val : std_logic_vector(15 downto 0) ;
signal rd_bit, exp_bit : std_logic_vector(1 downto 0);
signal pixel_read_addr, line_base_addr : std_logic_vector(nbit(RAM_SIZE/2)-1 downto 0);
signal line_count_enable, col_count_enable, rd_bit_count_enable : std_logic ;
signal line_count_reset, col_count_reset : std_logic ;

signal pixel_data_line0, pixel_data_line16 : std_logic_vector((bits_per_color*3)-1 downto 0);
signal pixel_data_line16_extended, pixel_data_line0_extended : std_logic_vector(15 downto 0) ;


signal end_of_col, end_of_bits : std_logic ;
signal shift_count : std_logic_vector(3 downto 0);

signal end_of_exposure, load_exposure, load_count : std_logic ;

signal SCLK_Q, LATCH_Q, BLANK_Q : std_logic ;
signal R1_Q, G1_Q, B1_Q, R0_Q, G0_Q, B0_Q : std_logic ;
signal A_OUT_Q : std_logic_vector(3 downto 0);


signal pixel_write_addr_line0, pixel_write_addr_line16 : std_logic_vector((nbit(32*32*nb_panels))-1 downto 0);
signal pixel_write_addr : std_logic_vector((nbit(32*32*nb_panels))-1 downto 0);
signal pixel_value_out_0, pixel_value_out_1 : std_logic_vector((bits_per_color*3)-1 downto 0);
signal write_mem0, write_mem1 : std_logic ;
begin


-- ram buffer instanciation
pixel_write_addr <= pixel_addr  ;
pixel_write_addr_line0 <= pixel_write_addr ;
									--when pixel_write_addr < ((32*nb_panels)*16) else
									--(others => '0');
pixel_write_addr_line16 <= pixel_write_addr - BOTTOM_ADDRESS_OFFSET ; 
									--when pixel_write_addr >= (32*nb_panels)*16 else
									--(others => '0'); -- only for simulation purpose ...

write_mem0  <=  write_pixel when pixel_write_addr < BOTTOM_ADDRESS_OFFSET else
					 '0' ;
					 
pixel_value_out <= pixel_value_out_0 when pixel_addr < BOTTOM_ADDRESS_OFFSET else
						 pixel_value_out_1 ;
					 
frame_buffer0 : dpram_NxN 
	generic map(SIZE  => RAM_SIZE/2,  NBIT => bits_per_color*3, ADDR_WIDTH => nbit(RAM_SIZE/2))
	port map(
 		clk => clk,
 		we => write_mem0, 
 		
 		di => pixel_value_in, 
		a	=> pixel_write_addr_line0(nbit(RAM_SIZE/2)-1 downto 0) ,
 		dpra => pixel_read_addr, 
		spo => pixel_value_out_0,
		dpo => pixel_data_line0
	);
	
pixel_data_line0_extended((bits_per_color*3)-1 downto 0) <= pixel_data_line0 ;
pixel_data_line0_extended(15 downto (bits_per_color*3)) <= (others => '0') ;

	
write_mem1  <=  write_pixel when pixel_write_addr >= BOTTOM_ADDRESS_OFFSET else
					 '0' ;
					 
frame_buffer1 : dpram_NxN 
	generic map(SIZE  => RAM_SIZE/2,  NBIT => bits_per_color*3, ADDR_WIDTH => nbit(RAM_SIZE/2))
	port map(
 		clk => clk,
 		we => write_mem1, 
 		
 		di => pixel_value_in, 
		a	=> pixel_write_addr_line16(nbit(RAM_SIZE/2)-1 downto 0) ,
 		dpra => pixel_read_addr, 
		spo => pixel_value_out_1,
		dpo => pixel_data_line16	
	); 
pixel_data_line16_extended((bits_per_color*3)-1 downto 0) <= pixel_data_line16 ;
pixel_data_line16_extended(15 downto (bits_per_color*3)) <= (others => '0') ;


-- ram buffer read address decoding
pixel_read_addr <= line_base_addr + std_logic_vector(resize(unsigned(col_count), pixel_read_addr'LENGTH)) ;



-- state machine code

-- state machine latch state process
process(clk, reset)
begin
    if reset = '1' then
        cur_state <= EXPOSE ;
    elsif rising_edge(clk) then
       cur_state <= next_state ;
    end if;
end process;


-- state machine, state evolution process				 
process(cur_state, end_count, col_count, end_of_col, end_of_exposure)
begin
    next_state <= cur_state ;
	 case cur_state is 
	   when EXPOSE =>
			if end_of_exposure = '1' then
				next_state <= BLANK ;
			end if ;
		when BLANK =>
			if end_count = '1' then
				next_state <= LATCH ;
			end if ;
		when LATCH =>
			if end_count = '1' then
				next_state <= UNBLANK ;
			end if ;
		when UNBLANK =>
			if end_count = '1' then
				next_state <= SHIFT1 ;
			end if ;
		when SHIFT1 =>
				if end_count = '1' then
					next_state <= SHIFT2 ;
				end if ;
		when SHIFT2 =>
				if end_of_col = '1' and end_count = '1' then
					next_state <= EXPOSE ;
				elsif end_count = '1' then
					next_state <= SHIFT1 ;
				end if ;
		when others =>
			next_state <= EXPOSE ;
	 end case ;
end process;				 
				 		
-- internal signals management

-- clk_count is used to generate the time interval between states
-- it is also used to generate the output clock frequency
process(clk, reset)
begin
    if reset = '1' then
        clk_count <=  (others => '0');
    elsif rising_edge(clk) then
		if load_count = '1' then
			clk_count <= count_load_val ;
		else
			clk_count <= clk_count - 1 ;
		end if ;
    end if;
end process;

-- helper signal to simplify equations
end_count <= '1' when clk_count = 0 else
				 '0' ;
load_count <= '1' when cur_state = EXPOSE else
				  end_count;
	
-- value to in interval counter, value to load is computed for next state	
with cur_state select
	count_load_val	<= std_logic_vector(to_unsigned((clk_div*8)-1, 16) ) when EXPOSE,
							std_logic_vector(to_unsigned((clk_div*8)-1, 16) ) when BLANK,
							std_logic_vector(to_unsigned((clk_div-1), 16) )  when LATCH,
							std_logic_vector(to_unsigned((clk_div-1), 16) )  when UNBLANK,
							std_logic_vector(to_unsigned((clk_div-1), 16) ) when SHIFT1,
							std_logic_vector(to_unsigned((clk_div-1), 16) ) when SHIFT2,
							std_logic_vector(to_unsigned((clk_div-1), 16) ) when others;
	

-- counter for exposure time	
process(clk)
begin
    if rising_edge(clk) then
	   if reset = '1' then
			exposure_time <=  bin_code_delay;
		elsif load_exposure = '1' then
			exposure_time <= bin_code_delay ;
		elsif exposure_time > 0 then
			exposure_time <= exposure_time - 1 ;
		end if ;
    end if;
end process;

end_of_exposure <= '1' when exposure_time = 0 else
					 '0' ; 
load_exposure <= '1' when cur_state = LATCH else
					  '0' ;
					  
					  
-- column counter, is incremented on each falling edge of sclk
process(clk, reset)
begin
    if reset = '1' then
        col_count <=  (others => '0') ;
    elsif rising_edge(clk) then
		if col_count_reset = '1' then
			col_count <=  (others => '0') ;
		elsif col_count_enable = '1' and col_count < (LINE_SIZE-1) then 
			col_count <= col_count + 1 ;
		end if ;
    end if;
end process;
-- helper signal to simplify equations
end_of_col <= '1' when col_count = (LINE_SIZE-1) else
					 '0' ;

-- the column count is reseted on end of blank
with cur_state select
	col_count_reset <= '0' when SHIFT1,
							 '0' when SHIFT2,
							 end_count when UNBLANK,
							 '0' when others;
-- column are counted when shifintg the pixel data
with cur_state select							 
	col_count_enable <= end_count when SHIFT2,
							  '0' when others ;


-- line counter, specify the line to read from memory
process(clk, reset)
begin
    if reset = '1' then
        line_count <=  (others => '0') ;
		  line_base_addr <= (others => '0') ;
    elsif rising_edge(clk) then
		if line_count_reset = '1' then
			line_count <=  (others => '0') ;
		   line_base_addr <= (others => '0') ;
		elsif line_count_enable = '1' then 
			line_count <= line_count + 1 ;
			line_base_addr <= line_base_addr + LINE_SIZE ;
		end if ;
    end if;
end process;	

-- increment line counter after blanking
with cur_state select							 
	line_count_enable <= (end_count and end_of_bits) when LATCH,
							  '0' when others ;	
line_count_reset <= '1' when line_count_enable = '1' and line_count = 15 else
						  '0' ;
-- rd_bit specify the bit to read from the color code 
-- exp bit specify the bit being exposed on the matrix 
process(clk, reset)
begin
    if reset = '1' then
        rd_bit <=  (others => '0') ;
		  --exp_bit <= (others => '0') ;
    elsif rising_edge(clk) then
		if end_of_bits = '1' and rd_bit_count_enable = '1' then
			rd_bit <=  (others => '0') ;
		   --exp_bit <= rd_bit ;
		elsif rd_bit_count_enable = '1' then 
			rd_bit <= rd_bit + 1 ;
			--exp_bit <= rd_bit ;
		end if ;
    end if;
end process;	

with cur_state select							 
	rd_bit_count_enable <= (end_count) when LATCH,
							  '0' when others ;

-- helper signals to simplify equations
end_of_bits <= 	'1' when rd_bit = bits_per_color-1 else
					'0' ;	

-- The binary coded modulation delay is doubled for each exposed color bit
with conv_integer(rd_bit) select
	bin_code_delay <= std_logic_vector(to_unsigned(expose_step_cycle, 16)) when 3,
							std_logic_vector(to_unsigned(expose_step_cycle*2, 16)) when 2,
							std_logic_vector(to_unsigned(expose_step_cycle*4, 16)) when 1,
							std_logic_vector(to_unsigned(expose_step_cycle*8, 16)) when others ;


-- output management

-- the output are combinatorial but latched to avoid glitches
with cur_state select
	SCLK_q <= '0' when SHIFT1,
			 '1' when SHIFT2,
			 '0' when others ;	
			 
			 
with cur_state select
	BLANK_q <= '1' when BLANK,
			 '1' when LATCH,
			 '0' when others ;	
			 
with cur_state select
	LATCH_q <= '1' when LATCH,
			 '0' when others ;	
				 

with conv_integer(rd_bit) select
	R0_q <= pixel_data_line0_extended(8) when 3, 
			pixel_data_line0_extended(9) when 2,
			pixel_data_line0_extended(10) when 1,
			pixel_data_line0_extended(11) when others;
			
with conv_integer(rd_bit) select
	G0_q <= pixel_data_line0_extended(4) when 3, 
			pixel_data_line0_extended(5) when 2,
			pixel_data_line0_extended(6) when 1,
			pixel_data_line0_extended(7) when others;
			
with conv_integer(rd_bit) select
	B0_q <= pixel_data_line0_extended(0) when 3, 
			pixel_data_line0_extended(1) when 2,
			pixel_data_line0_extended(2) when 1,
			pixel_data_line0_extended(3) when others;
			
			
with conv_integer(rd_bit) select
	R1_q <= pixel_data_line16_extended(8) when 3, 
			pixel_data_line16_extended(9) when 2,
			pixel_data_line16_extended(10) when 1,
			pixel_data_line16_extended(11) when others;
			
with conv_integer(rd_bit) select
	G1_q <= pixel_data_line16_extended(4) when 3, 
			pixel_data_line16_extended(5) when 2,
			pixel_data_line16_extended(6) when 1,
			pixel_data_line16_extended(7) when others;
			
with conv_integer(rd_bit) select
	B1_q <= pixel_data_line16_extended(0) when 3, 
			pixel_data_line16_extended(1) when 2,
			pixel_data_line16_extended(2) when 1,
			pixel_data_line16_extended(3) when others;
	
	

-- the address to be output to the matrix is a delayed version of the
-- line being read from memory. We expose one line, while we are loading the values
-- for the next
process(clk, reset)
begin
	 if reset = '1' then
			A_OUT_Q <= (others => '0');
    elsif rising_edge(clk) then
		if cur_state = BLANK and end_count = '1' then
			A_OUT_Q <= line_count ;
		end if ;
	end if;
end process;	

-- all output are latched to prevent glitches	
process(clk, reset)
begin
    if rising_edge(clk) then
		SCLK_OUT <= SCLK_q ;
		LATCH_OUT <= LATCH_q ;
		BLANK_OUT <= BLANK_q ;
		R_OUT(0) <= R0_q ;
		R_OUT(1) <= R1_q ;
		G_OUT(0) <= G0_q ;
		G_OUT(1) <= G1_q ;
		B_OUT(0) <= B0_q ;
		B_OUT(1) <= B1_q ;
		A_OUT <= A_OUT_Q ;
	end if;
end process;	

end Behavioral;

