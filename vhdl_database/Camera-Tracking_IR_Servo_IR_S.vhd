LIBRARY ieee; -- Import logic primitives
USE ieee.std_logic_1164.all;

entity IR_S is 
  port(
	IRDA_RXD: in std_logic;
	reset: in std_logic;
	CLOCK_50	:IN STD_LOGIC;
	ready : out std_logic  ;
	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: OUT STD_LOGIC_VECTOR(0 TO 6);
	irData: out std_logic_vector(31 downto 0)
	);
end entity;


architecture behaviour of IR_S is
	component ir_receiver_servo is 
		port ( 
				IRDA_RXD: in std_logic;
				reset: in std_logic;
				CLOCK_50: in std_logic;
				--Display the information about CUSTOM CODE bits __HEX7-HEX4
				--and KEY CODE bits __HEX3-HEX0
				data_ready : out std_logic ;
				oData: out std_logic_vector(31 downto 0));
	end component;
	
	component hexDisplay is 
                port (S: in std_logic_vector(3 downto 0);  -- S is an intermediate signal (NOT A PHYSICAL INPUT)
                      H: out std_logic_vector(0 to 6));           -- Storage signal for result
	end component; 
	
	signal display5, display4, display3, display2, display1, display0: std_logic_vector(0 to 6);
	signal iData: std_logic_vector(31 downto 0); 
	signal data_readyn : std_logic ;
begin 
	I_r: ir_receiver_servo port map(IRDA_RXD,reset,CLOCK_50,data_readyn,iData);
	
	h0: hexDisplay port map (iData(31 downto 28), display0);
	h1: hexDisplay port map (iData(27 downto 24), display1);
	h2: hexDisplay port map (iData(23 downto 20), display2);
	h3: hexDisplay port map (iData(19 downto 16), display3);
	h4: hexDisplay port map (iData(15 downto 12), display4);
	h5: hexDisplay port map (iData(11 downto 8), display5);
	
	HEX0<=display0;
	HEX1<=display1;
	HEX2<=display2;
	HEX3<=display3;
	HEX4<=display4;
	HEX5<=display5;
	
	ready <= data_readyn ;
	irData <=iData;
end behaviour;