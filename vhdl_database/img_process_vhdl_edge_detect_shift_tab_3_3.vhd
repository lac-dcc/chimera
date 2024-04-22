library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity shift_tab_3_3 is
generic (
			constant data_width : integer := 8;
            constant addr_cnt	:integer := 20;
			constant alt_tap	: integer := 320;
			constant img_width	: integer := 320;
			constant img_height	: integer := 240;			
			constant window_size : integer := 3;
			constant rom_depth	: integer:= 4096
);
port (
		clk : in std_logic;
		en : in std_logic;
		rst : in std_logic;
		din : in std_logic_vector(data_width-1 downto 0);
		stream_on : in std_logic;		
		r33, r32, r31, r23,r22,r21,r13,r12,r11 : out std_logic_vector(data_width-1 downto 0);
		pix_data_valid: out std_logic;
		pix_col : out std_logic_vector(addr_cnt -1 downto 0);
	    pix_row : out std_logic_vector(addr_cnt -1 downto 0);
		pix_addr: out std_logic_vector(addr_cnt - 1 downto 0)
	  );
end shift_tab_3_3;

architecture control of shift_tab_3_3 is

	component fifo 
	generic(
			data_width	:integer ;
			addr_cnt	:integer ;
			fifo_depth	:integer 
	);
	port (	clk	: in std_logic;
			rst	: in std_logic;
			we  : in std_logic;
			re	: in std_logic;
			addr_head  : out std_logic_vector(addr_cnt - 1 downto 0);
			addr_tail  : out std_logic_vector(addr_cnt - 1 downto 0);
			din : in std_logic_vector(data_width -1 downto 0);
			dout  : out std_logic_vector(data_width -1 downto 0);
			empty	: out std_logic;
			full	: out std_logic
	);
	end component;
	
	signal s_en : std_logic;
	signal s_data_valid : std_logic ;
	signal s_col : std_logic_vector(addr_cnt -1 downto 0);
	signal s_row : std_logic_vector(addr_cnt -1 downto 0);
	signal s_addr: std_logic_vector(addr_cnt -1 downto 0);
	signal s_pix_addr: std_logic_vector(addr_cnt -1 downto 0);
	signal fifo_en_count :integer range 0 to 2097151;  -- 2^21 = 2097152 > 1920*1080 > 1280*720 > 640*480
	signal alt_tap_full : std_logic;
	
	signal s_r33, s_r32, s_r31, s_r23,s_r22,s_r21,s_r13,s_r12,s_r11 : std_logic_vector(data_width-1 downto 0);
	signal s_f33, s_f32, s_f31, s_f23,s_f22,s_f21,s_f13,s_f12,s_f11 : std_logic_vector(data_width-1 downto 0);
	signal reg32,reg31,reg22,reg21,reg12,reg11 : std_logic_vector(data_width -1 downto 0) ;
	signal s_rom_data : std_logic_vector(data_width - 1 downto 0);
	
	signal s_we_tap1 : std_logic := '0';
	signal s_re_tap1 : std_logic := '0';	
	signal s_tap1_empty : std_logic;
	signal s_tap1_full : std_logic;	
	signal s_tap1_din : std_logic_vector(data_width -1 downto 0);
	signal s_tap1_out : std_logic_vector(data_width -1 downto 0);
	
	signal s_we_tap2 : std_logic := '0';
	signal s_re_tap2 : std_logic := '0';	
	signal s_tap2_empty : std_logic;
	signal s_tap2_full : std_logic;
	signal s_tap2_din : std_logic_vector(data_width -1 downto 0);
	signal s_tap2_out : std_logic_vector(data_width -1 downto 0);
	
	signal s_img_done : std_logic;
--	signal s_img_on : std_logic;
	signal s_stream_on : std_logic;
	signal s_pix_data_valid : std_logic;
	begin
	
		tap1 : fifo 
		generic map(
			data_width	=> data_width,
			addr_cnt	=> addr_cnt,
			fifo_depth	=> alt_tap
		)
		port map(
			clk => clk,
			rst => rst,
			we	=> s_we_tap1,
			re	=> s_re_tap1,
			full => s_tap1_full,
			empty => s_tap1_empty,
			din => s_tap1_din,
			dout => s_tap1_out
		);
		tap2 : fifo 
		generic map(
			data_width	=> data_width,
			addr_cnt	=> addr_cnt,
			fifo_depth	=> alt_tap
		)
		port map(
			clk => clk,
			rst => rst,
			we	=> s_we_tap2,
			re	=> s_re_tap2,
			full => s_tap2_full,
			empty => s_tap2_empty,
			din => s_tap2_din,
			dout => s_tap2_out
		);
	
		--external module input signal
		s_en <= en;
		s_rom_data <= din;
		--s_col	<= col;
		--s_row	<= row;
		s_stream_on <= stream_on;
		--external module output signal
		r33 <= s_r33;	r32 <= s_r32;	r31 <= s_r31;
		r23 <= s_r23;	r22 <= s_r22;	r21 <= s_r21;
		r13 <= s_r13;	r12 <= s_r12;	r11 <= s_r11;
		pix_data_valid <= s_pix_data_valid;
	--	s_pix_data_valid <= s_data_valid and not s_img_done;
		
		pix_addr <= s_pix_addr;
		pix_row <= s_row;
		pix_col <= s_col;
		
		--internal module signal
		s_r33	<= s_rom_data;
		s_r32	<= reg32;
		s_r31	<= reg31;
		
		s_tap2_din	<= reg31;
		s_r23	<= s_tap2_out;
		s_r22	<= reg22;
		s_r21	<= reg21;		
		
		s_tap1_din	<= reg21;
		s_r13	<= s_tap1_out;
		s_r12	<= reg12;
		s_r11	<= reg11;

		
		--alt_tap_transisit
		alt_shift_tap : process(clk, rst)
		begin
			if(rst = '0') then 
				reg32 <= (others => '0');	reg31 <= (others => '0');
				reg22 <= (others => '0');	reg21 <= (others => '0');
				reg12 <= (others => '0');	reg11 <= (others => '0');
			elsif rising_edge(clk) then
				if s_en = '1' then
					reg32	<= s_r33;	reg31	<= reg32;
					reg22	<= s_r23;	reg21	<= reg22;
					reg12	<= s_r13;	reg11	<= reg12;
				end if;
			end if;
		end process;
		
		--control signal
		en_fifo: process(rst, clk)
		begin
			if rst = '0' then
				fifo_en_count <= 0;
				alt_tap_full <= '0';
			--	s_img_on <= '0';
				s_data_valid <= '0';
			elsif	rising_edge(clk) then
				if(s_stream_on = '1') then
				
					fifo_en_count <= fifo_en_count + 1;
					-- alt_tap = img_width - (window_size - 1)
					if(fifo_en_count >= window_size - 2) then 
						s_we_tap2 <= '1';			
					end if;
					
					if(fifo_en_count >= img_width - 2 ) then 
						s_re_tap2 <= '1';			
					end if;	
					
					if(fifo_en_count >= img_width + window_size - 2 ) then 
						s_we_tap1 <= '1';				
					end if;					
					
					if(fifo_en_count >= img_width + img_width - 2 ) then 
						s_re_tap1 <= '1';			
					end if;
					
					if(fifo_en_count >= img_width) then 				
						s_data_valid <= '1';		--fifo_en_count = img_width + img_width + (window_size - 1)/2 - 1	the center of center
					end if;					
				end if;
			end if ;
		end process;
		
		imgdone : process(clk , rst)
		begin
			if rst = '0' then 
				s_pix_data_valid <= '0';
				s_pix_addr <= (others => '0');
			elsif rising_edge(clk) then
				if s_pix_addr < rom_depth - 1 then
					s_pix_data_valid <= s_data_valid;				
				else
					s_pix_data_valid <= '0';	
				end if;
				s_pix_addr <= s_addr;
			end if;
		end process;
		

		addr_gen : process(clk, rst)
		begin
			if rst = '0' then
				s_addr <= (others => '0');
				s_col <= (others => '0');
				s_row <= (others => '0');
			elsif rising_edge(clk) then
				if s_data_valid = '1' then
					if s_addr < rom_depth - 1 then
						s_addr <= s_addr + 1;
					end if;
					if s_col >= img_width - 1 then
						s_col <= (others => '0');
						if s_row >= img_height - 1 then
							s_row <= (others => '0');
						else
							s_row <= s_row + 1;
						end if;
					else
						s_col <= s_col + 1;
					end if;
				end if;
			end if;
		end process;
		
		out_fix : process(clk, rst)
		begin
			if rst = '0' then
				s_f33 <= (others => '0');	s_f32 <= (others => '0');  s_f31 <= (others => '0');
				s_f23 <= (others => '0'); 	s_f22 <= (others => '0');  s_f21 <= (others => '0'); 
				s_f13 <= (others => '0'); 	s_f12 <= (others => '0');  s_f11 <= (others => '0'); 
			elsif rising_edge(clk) then
				if s_data_valid = '1' then
					if(s_col = 0) then
						if(s_row = 0) then						
							s_f11 <= s_r22; s_f12 <= s_r22; s_f13 <= s_r23; 
							s_f21 <= s_r22; s_f22 <= s_r22; s_f23 <= s_r23;
							s_f31 <= s_r32; s_f32 <= s_r32; s_f33 <= s_r33;	
							
						elsif(s_row = img_height - 1)then
							s_f11 <= s_r12; s_f12 <= s_r12; s_f13 <= s_r13; 
							s_f21 <= s_r22; s_f22 <= s_r22; s_f23 <= s_r23;
							s_f31 <= s_r22; s_f32 <= s_r22; s_f33 <= s_r23;							
						else
							s_f11 <= s_r12; s_f12 <= s_r12; s_f13 <= s_r13; 
							s_f21 <= s_r22; s_f22 <= s_r22; s_f23 <= s_r23;
							s_f31 <= s_r32; s_f32 <= s_r32; s_f33 <= s_r33;					
						end if;
					elsif(s_col = img_width - 1) then
						if(s_row = 0) then
							s_f11 <= s_r21; s_f12 <= s_r22; s_f13 <= s_r22; 
							s_f21 <= s_r21; s_f22 <= s_r22; s_f23 <= s_r22;
							s_f31 <= s_r31; s_f32 <= s_r32; s_f33 <= s_r32;	
						elsif(s_row = img_height - 1)then
							s_f11 <= s_r11; s_f12 <= s_r12; s_f13 <= s_r12; 
							s_f21 <= s_r21; s_f22 <= s_r22; s_f23 <= s_r22;
							s_f31 <= s_r21; s_f32 <= s_r22; s_f33 <= s_r22;		
						else	
							s_f11 <= s_r11; s_f12 <= s_r12; s_f13 <= s_r12; 
							s_f21 <= s_r21; s_f22 <= s_r22; s_f23 <= s_r22;
							s_f31 <= s_r31; s_f32 <= s_r32; s_f33 <= s_r32;	
						end if;
					else
						if(s_row = 0) then
							s_f11 <= s_r21; s_f12 <= s_r22; s_f13 <= s_r23; 
							s_f21 <= s_r21; s_f22 <= s_r22; s_f23 <= s_r23;
							s_f31 <= s_r31; s_f32 <= s_r32; s_f33 <= s_r33;	
						elsif(s_row = img_height - 1)then
							s_f11 <= s_r11; s_f12 <= s_r12; s_f13 <= s_r13; 
							s_f21 <= s_r21; s_f22 <= s_r22; s_f23 <= s_r23;
							s_f31 <= s_r21; s_f32 <= s_r22; s_f33 <= s_r23;	
						else
							s_f11 <= s_r11; s_f12 <= s_r12; s_f13 <= s_r13; 
							s_f21 <= s_r21; s_f22 <= s_r22; s_f23 <= s_r23;
							s_f31 <= s_r31; s_f32 <= s_r32; s_f33 <= s_r33;		
						end if;
						
					end if;
				else
							s_f33 <= (others => '0');	s_f32 <= (others => '0');  s_f31 <= (others => '0');
							s_f23 <= (others => '0'); 	s_f22 <= (others => '0');  s_f21 <= (others => '0'); 
							s_f13 <= (others => '0'); 	s_f12 <= (others => '0');  s_f11 <= (others => '0'); 
				end if;
			end if;
		end process;
		

	
end control;

