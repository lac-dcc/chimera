library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity gaussian_filter is
generic (
			constant data_width : integer := 8;
            constant addr_cnt	: integer := 20	;
			constant img_width	: integer := 320;
			constant img_height	: integer := 240;
			constant rom_depth	: integer := 76800;
			constant alt_tap_2_2	: integer := 319;
			constant alt_tap_3_3	: integer := 318;
			constant alt_tap_5_5	: integer := 316;
			constant window_size_2_2 : integer := 2;
			constant window_size_3_3 : integer := 3;
			constant window_size_5_5 : integer := 5
);
port (
		clk : in std_logic;
		rst : in std_logic;		
		en	: in std_logic;
		stream_on : in std_logic;
		din: in std_logic_vector(data_width - 1 downto 0);
		
		stream_out : out std_logic;
		dout : out std_logic_vector(data_width-1 downto 0)
	  );
end gaussian_filter;

architecture gaussian of gaussian_filter is

	component shift_tab_3_3
	generic (
			data_width	:	integer ;
            addr_cnt	:	integer ;
			alt_tap		:	integer;
			img_width	:	integer;
			img_height	:	integer	;		
			window_size :	integer;
			rom_depth	: integer
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
	end component;
	
	component shift_tab_2_2 is
	generic (
				constant data_width :	integer ;
				constant addr_cnt	:	integer ;
				constant alt_tap	:	integer ;
				constant img_width	:	integer ;
				constant img_height	:	integer ;			
				constant window_size :	integer ;
				constant rom_depth	: 	integer
	);
	port (
			clk : in std_logic;
			en : in std_logic;
			rst : in std_logic;
			din : in std_logic_vector(data_width-1 downto 0);
			stream_on : in std_logic;		
			r22,r21,r12,r11 : out std_logic_vector(data_width-1 downto 0);
			pix_data_valid: out std_logic	;
			pix_col : out std_logic_vector(addr_cnt -1 downto 0);
			pix_row : out std_logic_vector(addr_cnt -1 downto 0);
			pix_addr: out std_logic_vector(addr_cnt - 1 downto 0)
		);
	end component;
	
	component gaussian is
	generic (
				constant data_width : integer := 8;
				constant addr_cnt	:integer := 20
	);
	port (
			clk : in std_logic;
			rst : in std_logic;
			r33, r32, r31, r23,r22,r21,r13,r12,r11 : in std_logic_vector(data_width-1 downto 0);
			in_data_valid : in std_logic;
			out_data_valid : out std_logic;
			dout : out std_logic_vector(data_width-1 downto 0)
		);
	end component;
	
	signal s_stream_on, s_stream_out :std_logic;
	signal s_data_valid : std_logic;
	signal s_din, s_dout : std_logic_vector(data_width - 1 downto 0);
	signal s_r33, s_r32, s_r31: std_logic_vector(data_width-1 downto 0);
	signal s_r23, s_r22, s_r21: std_logic_vector(data_width-1 downto 0);
	signal s_r13, s_r12, s_r11: std_logic_vector(data_width-1 downto 0);
begin
	
	s_stream_on <= stream_on;
	stream_out <= s_stream_out;
	s_din <= din;
	dout <= s_dout;
	
	window_3_3: shift_tab_3_3
	generic map(
			data_width	=> data_width,
			addr_cnt	=> addr_cnt,
			img_width	=> img_width,
			img_height 	=> img_height,
			rom_depth	=> rom_depth,
			alt_tap		=> alt_tap_3_3,
			window_size	=> window_size_3_3
	)
	port map(
		clk => clk,
		rst => rst,
		en 	=> en,
		din => s_din,
		stream_on => s_stream_on,
		r33	=>	s_r33, 
		r23	=>	s_r23, 		
		r13	=>	s_r13, 		
		r32	=>	s_r32, 
		r22	=>	s_r22, 
		r12	=>	s_r12, 
		r31	=>	s_r31,
		r21 =>  s_r21,
		r11 =>  s_r11,
		pix_data_valid => s_data_valid
	);
	
	gaussian_filter: gaussian 
	generic map(
			data_width	=> data_width,
			addr_cnt	=> addr_cnt
	)
	port map(
			clk => clk,
			rst => rst,
			r33	=>	s_r33, 
			r23	=>	s_r23, 		
			r13	=>	s_r13, 		
			r32	=>	s_r32, 
			r22	=>	s_r22, 
			r12	=>	s_r12, 
			r31	=>	s_r31,
			r21 =>  s_r21,
			r11 =>  s_r11,

			in_data_valid => s_data_valid,
			out_data_valid => s_stream_out,
			dout => s_dout
		);
end gaussian;
