library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
--use ieee.std_logic_arith.all;

entity image_process is
generic (
			--constant data_width : integer := 8;
            --constant addr_cnt	: integer := 20	;
			--constant img_width	: integer := 320;
			--constant img_height	: integer := 240;
			--constant rom_depth	: integer := 76800;
			--constant alt_tap_2_2	: integer := 319;
			--constant alt_tap_3_3	: integer := 318;
			--constant alt_tap_5_5	: integer := 316;
			--constant window_size_2_2 : integer := 2;
			--constant window_size_3_3 : integer := 3;
			--constant window_size_5_5 : integer := 5
			
			constant data_width : integer := 8;
            constant addr_cnt	: integer := 10	;			
			constant img_width	: integer := 16;
			constant img_height	: integer := 16;
			constant rom_depth	: integer := 256;
			constant alt_tap_2_2	: integer := 15;
			constant alt_tap_3_3	: integer := 14;
			constant alt_tap_5_5	: integer := 12;
			constant window_size_2_2 : integer := 2;
			constant window_size_3_3 : integer := 3; 
			constant window_size_5_5 : integer := 5
);
port (
		clk : in std_logic;
		en : in std_logic;
		rst : in std_logic;
			
		r33, r32, r31, r23,r22,r21,r13,r12,r11 : out std_logic_vector(data_width-1 downto 0)		
		
	  );
end image_process;

architecture behavior of image_process is

	component sys_ctl is
	port (
			clk : in std_logic;
			en : in std_logic;
			rst : in std_logic;
			sys_ctl_en : out std_logic
		);
	end component;
	component rom	
	generic (
			data_width : integer ;
            addr_cnt	:integer ;
			rom_depth  : integer 
	);	
    port(
			clk : in std_logic;
			en : in std_logic;
			addr : in std_logic_vector(addr_cnt -1  downto 0);
			data : out std_logic_vector(data_width -1  downto 0)
        );
    end component;		

	component rom_ctl is
	generic (
				data_width  : integer ;
				addr_cnt	: integer ;
				img_width	: integer ;
				rom_depth	: integer ;
				img_height	: integer 
	);
	port (
			clk : in std_logic;
			en  : in std_logic;
			rst : in std_logic;
			addr : out std_logic_vector(addr_cnt-1 downto 0);
			pix_addr : out std_logic_vector(addr_cnt-1 downto 0);
			stream_on : out std_logic;
			col : out std_logic_vector(addr_cnt -1 downto 0);
			row : out std_logic_vector(addr_cnt -1 downto 0)
		);
	end component;

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

	signal s_ctl_en: std_logic;	
	signal s_rom_addr, s_pix_addr : std_logic_vector(addr_cnt -1  downto 0) := (others => '0');
	signal s_r33, s_r32, s_r31: std_logic_vector(data_width-1 downto 0);
	signal s_r23, s_r22, s_r21: std_logic_vector(data_width-1 downto 0);
	signal s_r13, s_r12, s_r11: std_logic_vector(data_width-1 downto 0);
	signal s_rom_out: std_logic_vector(data_width -1 downto 0);
	signal s_stream_on : std_logic;
	signal s_data_valid : std_logic;
	
begin
	
	
	r33	<=	s_r33;	r32	<=	s_r32;	 r31 <=	 s_r31;
	r23	<=	s_r23;  r22	<=	s_r22;   r21 <=  s_r21;
	r13	<=	s_r13;  r12	<=	s_r12;   r11 <=  s_r11;
	
	sysctl : sys_ctl
	port map (
          clk => clk,
          en =>  en,
		  rst => rst,
		  sys_ctl_en => s_ctl_en
    );
	
	img: rom 
	generic map(
		data_width	=> data_width,
		addr_cnt	=> addr_cnt,
		rom_depth	=> rom_depth
	)
	port map (
          clk => clk,
          en => s_ctl_en,
          addr => s_rom_addr,
		  data => s_rom_out
    );
	img_read : rom_ctl
	generic map(
		data_width	=> data_width,
		addr_cnt	=> addr_cnt,
		img_width	=> img_width,
		img_height 	=> img_height,
		rom_depth	=> rom_depth
	)
	port map(
		clk => clk,
		rst => rst,
		en 	=> s_ctl_en,
		stream_on => s_stream_on,
--		col	=> s_col,
--		row => s_row,
--		pix_addr => s_pix_addr,
		addr => s_rom_addr
	);
	
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
		en 	=> s_ctl_en,
		din => s_rom_out,
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
		pix_data_valid => s_data_valid,
		pix_addr => s_pix_addr			
	);

	window_2_2: shift_tab_2_2 
	generic map(
		data_width	=> data_width,
		addr_cnt	=> addr_cnt,
		img_width	=> img_width,
		img_height 	=> img_height,
		window_size => window_size_2_2,
		alt_tap		=> alt_tap_2_2,
		rom_depth	=> rom_depth
	)
	port map(
		clk	=> clk,
		rst => rst,
		en	=> s_ctl_en,
		din => s_rom_out,		
		stream_on => s_stream_on

--		r11 => s1_r11,		r12 => s1_r12,		
--		r21 => s1_r21,		r22 => s1_r22,						
--		pix_data_valid => s_img_1_data_valid,		
--		pix_addr => s_img_1_data_addr
	);

end behavior;

