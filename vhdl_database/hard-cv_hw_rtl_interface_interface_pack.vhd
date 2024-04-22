--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library work ;
use work.image_pack.all ;

package interface_pack is

component fx2_interface is
port(
	-- logic interface
	clk, resetn : in std_logic ;
	wr, rd, cs	: in std_logic ;
	dv, busy	: out std_logic ;
	data_in : in std_logic_vector(7 downto 0 ); 
	data_out : out std_logic_vector(7 downto 0 );
	
	-- fx2 interface
	fx2_clk	: in std_logic ;
	fx2_wr, fx2_rd, fx2_oe : out std_logic ;
	fx2_full, fx2_empty : in std_logic ;
	fx2_data	: inout	std_logic_vector(7 downto 0 );
	
	--debug signals
	latch_enable : out std_logic 
);
end component;


component spi2ad_bus is
generic(ADDR_WIDTH : positive := 16 ; DATA_WIDTH : positive := 16 ; BIG_ENDIAN : boolean := true);
port(clk, resetn : in std_logic ;
	  mosi, ss, sck : in std_logic;
	  miso : out std_logic;
	  data_bus_out	: out	std_logic_vector((DATA_WIDTH - 1) downto 0);
	  data_bus_in	: in	std_logic_vector((DATA_WIDTH - 1) downto 0);
	  addr_bus	:	out	std_logic_vector((ADDR_WIDTH - 1) downto 0);
	  wr, rd	:	out	std_logic
);
end component;


component muxed_addr_interface is
generic(ADDR_WIDTH : positive := 8 ; DATA_WIDTH : positive := 16);
port(clk, resetn : in std_logic ;
	  data	:	inout	std_logic_vector((DATA_WIDTH - 1) downto 0);
	  wrn, oen, addr_en_n, csn : in std_logic ;
	  be0n, be1n : in std_logic ;
	  data_bus_out	: out	std_logic_vector((DATA_WIDTH - 1) downto 0);
	  data_bus_in	: in	std_logic_vector((DATA_WIDTH - 1) downto 0);
	  addr_bus	:	out	std_logic_vector((ADDR_WIDTH - 1) downto 0);
	  wr, rd	:	out	std_logic
);
end component;

component addr_interface is
generic(ADDR_WIDTH : positive := 8 ; DATA_WIDTH : positive := 16; USE_EXT_CLOCK : boolean := false);
port(clk, resetn : in std_logic ;
	  data	:	inout	std_logic_vector((DATA_WIDTH - 1) downto 0);
	  addr	:	in	std_logic_vector((ADDR_WIDTH - 1) downto 0);
	  wrn, oen, csn, ext_clk : in std_logic ;
	  data_bus_out	: out	std_logic_vector((DATA_WIDTH - 1) downto 0);
	  data_bus_in	: in	std_logic_vector((DATA_WIDTH - 1) downto 0);
	  addr_bus	:	out	std_logic_vector((ADDR_WIDTH - 1) downto 0);
	  wr, rd	:	out	std_logic
);
end component;

component sync_muxed_addr_interface is
generic(ADDR_WIDTH : positive := 8 ; DATA_WIDTH : positive := 16);
port(	  clk, resetn : in std_logic ;
	  data	:	inout	std_logic_vector((DATA_WIDTH - 1) downto 0);
	  wrn, oen, addr_en_n, csn, ext_clk : in std_logic ;
	  be0n, be1n : in std_logic ;
	  data_bus_out	: out	std_logic_vector((DATA_WIDTH - 1) downto 0);
	  data_bus_in	: in	std_logic_vector((DATA_WIDTH - 1) downto 0);
	  addr_bus	:	out	std_logic_vector((ADDR_WIDTH - 1) downto 0);
	  wr, rd	:	out	std_logic
);
end component;


component lcd_interface is
port(clk, resetn	:	in std_logic ;
	  addr	:	in std_logic_vector(7 downto 0) ;
	  data	:	in std_logic_vector(15 downto 0);
	  wr_data	:	in std_logic ;
	  set_addr	:	in std_logic ;
	  busy	:	out std_logic ;
	  lcd_rs, lcd_cs, lcd_rd, lcd_wr	:	 out std_logic;
	  lcd_data	:	out std_logic_vector(15 downto 0) );
end component ;

component lcd_controller is
port(
 		clk : in std_logic; 
 		resetn : in std_logic; 
 		pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
 		pixel_r, pixel_g, pixel_b : in std_logic_vector(7 downto 0 );
		lcd_rs, lcd_cs, lcd_rd, lcd_wr	:	 out std_logic;
	   lcd_data	:	out std_logic_vector(15 downto 0) 
	); 
end component ;

component yuv_camera_interface is
	port(
 		clock : in std_logic; 
 		resetn : in std_logic; 
 		pixel_data : in std_logic_vector(7 downto 0 ); 
 		pixel_out_y_data : out std_logic_vector(7 downto 0 ); 
 		pixel_out_u_data : out std_logic_vector(7 downto 0 ); 
 		pixel_out_v_data : out std_logic_vector(7 downto 0 ); 
 		pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic; 
 		pclk, href,vsync : in std_logic
	); 
end component ;

component rgb565_camera_interface is
	generic(FORMAT : FRAME_FORMAT := QVGA);
	port(
 		clock : in std_logic; 
 		i2c_clk : in std_logic; 
 		resetn : in std_logic; 
 		pixel_data : in std_logic_vector(7 downto 0 ); 
 		pixel_out_r_data : out std_logic_vector(7 downto 0 ); 
 		pixel_out_g_data : out std_logic_vector(7 downto 0 ); 
 		pixel_out_b_data : out std_logic_vector(7 downto 0 ); 
 		scl : inout std_logic; 
 		sda : inout std_logic; 
 		pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic; 
 		pxclk, href,vsync : in std_logic
	); 
end component ;

component i2c_master is
	port(
 		clock : in std_logic; 
 		resetn : in std_logic; 
 		slave_addr : in std_logic_vector(6 downto 0 ); 
 		data_in : in std_logic_vector(7 downto 0 );
		data_out : out std_logic_vector(7 downto 0 ); 
 		send : in std_logic; 
 		rcv : in std_logic; 
		hold : in std_logic;
		scl : inout std_logic; 
 		sda : inout std_logic; 

 		dispo, ack_byte, nack_byte : out std_logic
	); 
end component ;


end interface_pack;

package body interface_pack is

end interface_pack;
