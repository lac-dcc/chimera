----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:57:51 01/19/2012 
-- Design Name: 
-- Module Name:    input_fifo - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity input_fifo is
generic (
				depth: integer :=640;	-- bytes in FIFO (horizontal resolution)
				v_res : integer :=480 	-- vertical resolution				
			);  
port(
		data_in : in std_logic_vector(7 downto 0);
		clk, rst, ce : in std_logic;								-- ce - global clock enable 
		x_coord : out std_logic_vector(9 downto 0);			-- delayed X coord
		y_coord : out std_logic_vector(9 downto 0);			-- delayed Y coord
		o00, o01, o02, o03, o04, o05, o06 : out std_logic_vector(7 downto 0); 
		o10, o11, o12, o13, o14, o15, o16 : out std_logic_vector(7 downto 0); 
		o20, o21, o22, o23, o24, o25, o26 : out std_logic_vector(7 downto 0); 
		o30, o31, o32, o33, o34, o35, o36 : out std_logic_vector(7 downto 0);
		o40, o41, o42, o43, o44, o45, o46 : out std_logic_vector(7 downto 0);
		o50, o51, o52, o53, o54, o55, o56 : out std_logic_vector(7 downto 0);
		o60, o61, o62, o63, o64, o65, o66 : out std_logic_vector(7 downto 0)
		);
end input_fifo;

architecture Behavioral of input_fifo is

type ram is array (depth-1 downto 0) of std_logic_vector(7 downto 0); 
signal address_read, address_write : unsigned(9 downto 0);
signal data_out_0, data_out_1, data_out_2, data_out_3, data_out_4, data_out_5 : std_logic_vector(7 downto 0);
signal ram_0, ram_1, ram_2, ram_3, ram_4, ram_5 : ram;
signal o_00, o_01, o_02, o_03, o_04, o_05, o_06 : std_logic_vector(7 downto 0);
signal o_10, o_11, o_12, o_13, o_14, o_15, o_16 : std_logic_vector(7 downto 0);
signal o_20, o_21, o_22, o_23, o_24, o_25, o_26 : std_logic_vector(7 downto 0);
signal o_30, o_31, o_32, o_33, o_34, o_35, o_36 : std_logic_vector(7 downto 0);
signal o_40, o_41, o_42, o_43, o_44, o_45, o_46 : std_logic_vector(7 downto 0);
signal o_50, o_51, o_52, o_53, o_54, o_55, o_56 : std_logic_vector(7 downto 0);
signal o_60, o_61, o_62, o_63, o_64, o_65, o_66 : std_logic_vector(7 downto 0);

signal v_cnt : unsigned (9 downto 0);
signal v_cnt_delayed : unsigned (9 downto 0);
signal EN_y : std_logic;		-- clock enable for delayed Y coord - active at the end of image line

attribute ram_style: string; 
attribute ram_style of ram_0 : signal is "block"; 
attribute ram_style of ram_1 : signal is "block"; 
attribute ram_style of ram_2 : signal is "block"; 
attribute ram_style of ram_3 : signal is "block"; 
attribute ram_style of ram_4 : signal is "block"; 
attribute ram_style of ram_5 : signal is "block"; 

component x_shifter is
port(
			clk, input, EN : in std_logic;
			output : out std_logic
		);
end component;

component yx_shifter is
port(
			clk, input, EN : in std_logic;
			output : out std_logic
		);
end component;


component y_shifter is
port(
			clk, input, EN : in std_logic;
			output : out std_logic
		);
end component;


begin

ram_handler : process(clk, rst)
begin
	if clk='1' and clk'event then
		if rst='1' then
			o_00<=(others=>'0');	o_01<=(others=>'0');	o_02<=(others=>'0');	o_03<=(others=>'0');	o_04<=(others=>'0');	o_05<=(others=>'0');	o_06<=(others=>'0');
			o_10<=(others=>'0');	o_11<=(others=>'0');	o_12<=(others=>'0');	o_13<=(others=>'0');	o_14<=(others=>'0');	o_15<=(others=>'0');	o_16<=(others=>'0');
			o_20<=(others=>'0');	o_21<=(others=>'0');	o_22<=(others=>'0');	o_23<=(others=>'0');	o_24<=(others=>'0');	o_25<=(others=>'0');	o_26<=(others=>'0');
			o_30<=(others=>'0');	o_31<=(others=>'0');	o_32<=(others=>'0');	o_33<=(others=>'0');	o_34<=(others=>'0');	o_35<=(others=>'0');	o_36<=(others=>'0');
			o_40<=(others=>'0');	o_41<=(others=>'0');	o_42<=(others=>'0');	o_43<=(others=>'0');	o_44<=(others=>'0');	o_45<=(others=>'0');	o_46<=(others=>'0');
			o_50<=(others=>'0');	o_51<=(others=>'0');	o_52<=(others=>'0');	o_53<=(others=>'0');	o_54<=(others=>'0');	o_55<=(others=>'0');	o_56<=(others=>'0');
			o_60<=(others=>'0');	o_61<=(others=>'0');	o_62<=(others=>'0');	o_63<=(others=>'0');	o_64<=(others=>'0');	o_65<=(others=>'0');	o_66<=(others=>'0');
			data_out_0<=(others=>'0'); 	data_out_1<=(others=>'0');		data_out_2<=(others=>'0'); 
			data_out_3<=(others=>'0'); 	data_out_4<=(others=>'0'); 	data_out_5<=(others=>'0');
			
		elsif ce='1' then
			ram_0(to_integer(unsigned(address_write)))<=data_in; 		-- data input to delay buffer 0
			ram_1(to_integer(unsigned(address_write)))<=data_out_0; 	-- data input to delay buffer 1
			ram_2(to_integer(unsigned(address_write)))<=data_out_1; 	-- data input to delay buffer 2
			ram_3(to_integer(unsigned(address_write)))<=data_out_2; 	-- data input to delay buffer 3
			ram_4(to_integer(unsigned(address_write)))<=data_out_3; 	-- data input to delay buffer 4
			ram_5(to_integer(unsigned(address_write)))<=data_out_4; 	-- data input to delay buffer 5

			data_out_0<=ram_0(to_integer(unsigned(address_read)));	-- read FIFO 0
			data_out_1<=ram_1(to_integer(unsigned(address_read)));	-- read FIFO 1
			data_out_2<=ram_2(to_integer(unsigned(address_read)));	-- read FIFO 2
			data_out_3<=ram_3(to_integer(unsigned(address_read)));	-- read FIFO 3
			data_out_4<=ram_4(to_integer(unsigned(address_read)));	-- read FIFO 4
			data_out_5<=ram_5(to_integer(unsigned(address_read)));	-- read FIFO 5
			
			o_66<=data_in;	-- 7th row in the window - latest to come in
			o_65<=o_66;		-- data is read from data_in
			o_64<=o_65;		
			o_63<=o_64;		
			o_62<=o_63;		
			o_61<=o_62;		
			o_60<=o_61;
			
			o_56<=data_out_0;	-- 6th row in the window - delayed by 1 FIFO
			o_55<=o_56;			-- so taken from RAM 0
			o_54<=o_55;		
			o_53<=o_54;		
			o_52<=o_53;		
			o_51<=o_52;		
			o_50<=o_51;		

			o_46<=data_out_1;	-- 5th row in the window - delayed by 2 FIFOs
			o_45<=o_46;			-- taken from RAM 1
			o_44<=o_45;		
			o_43<=o_44;		
			o_42<=o_43;		
			o_41<=o_42;		
			o_40<=o_41;		

			o_36<=data_out_2;	-- 4th row in the window - delayed by 3 FIFOs
			o_35<=o_36;			-- taken from RAM 2
			o_34<=o_35;		
			o_33<=o_34;		
			o_32<=o_33;		
			o_31<=o_32;		
			o_30<=o_31;		

			o_26<=data_out_3;	-- 3rd row in the window - delayed by 4 FIFOs
			o_25<=o_26;			-- taken from RAM 3 
			o_24<=o_25;		
			o_23<=o_24;		
			o_22<=o_23;		
			o_21<=o_22;		
			o_20<=o_21;		

			o_16<=data_out_4;	-- 2nd row in the window - delayed by 5 FIFOs
			o_15<=o_16;			-- taken from RAM 4
			o_14<=o_15;		
			o_13<=o_14;		
			o_12<=o_13;		
			o_11<=o_12;		
			o_10<=o_11;		

			o_06<=data_out_5;	-- 1st row in the window - delayed by 6 FIFOs
			o_05<=o_06;			-- taken from RAM 5
			o_04<=o_05;		
			o_03<=o_04;		
			o_02<=o_03;		
			o_01<=o_02;		
			o_00<=o_01;		


--			+---+---+---+---+---+---+---+			
--			|o00|o01|o02|o03|o04|o05|o06|					
--			+---+---+---+---+---+---+---+				window organization:
--			|o10|o11|o12|o13|o14|o15|o16|				o(row nr, col nr)		
--			+---+---+---+---+---+---+---+			
--			|o20|o21|o22|o23|o24|o25|o26|					
--			+---+---+---+++++---+---+---+			
--			|o30|o31|o32+o33+o34|o35|o36|					
--			+---+---+---+++++---+---+---+			
--			|o40|o41|o42|o43|o44|o45|o46|				-- o33 is the central pixel (for FAST)
--			+---+---+---+---+---+---+---+			
--			|o50|o51|o52|o53|o54|o55|o56|					
--			+---+---+---+---+---+---+---+			
--			|o60|o61|o62|o63|o64|o65|o66|					
--			+---+---+---+---+---+---+---+			
			
		end if;														
	end if;
end process ram_handler;

address_generator : process(clk)
begin
	if clk='1' and clk'event then
		if rst='1' then
			v_cnt<=(others=>'0');
			address_read<=(others=>'0');
			address_write<=to_unsigned(1, 10);
		else		
			if ce='1' then
				if address_read=to_unsigned(depth-1, 10) then	-- whenever max. horizontal resolution reached
					if v_cnt=to_unsigned(v_res-1, 9) then			-- vertical resolution counter handler
						v_cnt<=(others=>'0');
					else
						v_cnt<=v_cnt+1;
					end if;
					address_read<=(others=>'0');
				else
					address_read<=address_read+1;
				end if;
				address_write<=address_read;	
			end if;
		end if;
	end if;
end process address_generator;

y_coord_en : process(clk)
begin
	if clk='1' and clk'event then
		if rst='1' then
			EN_y<='0';
		else
			if ce='1' then
				if address_read=to_unsigned(depth-2, 10) then
					EN_y<='1';
				else 
					EN_y<='0';
				end if;			
			else 
				EN_y<='0';
			end if;
		end if;
	end if;
end process y_coord_en;

x_coord_handler : for i in 0 to 9 generate
begin
	x_shift : x_shifter port map(clk, std_logic(address_write(i)), ce, x_coord(i));
end generate;

y_coord_handler : for i in 0 to 9 generate
begin
	y_shift: y_shifter port map(clk, std_logic(v_cnt(i)), EN_y, v_cnt_delayed(i));
end generate;

y_coord_equalizer : for i in 0 to 9 generate
begin
	y_equalize: yx_shifter port map(clk, std_logic(v_cnt_delayed(i)), ce, y_coord(i));
end generate;

o00<=o_00;
o01<=o_01;
o01<=o_01;
o02<=o_02;
o03<=o_03;
o04<=o_04;
o05<=o_05;
o06<=o_06;

o10<=o_10;
o11<=o_11;
o11<=o_11;
o12<=o_12;
o13<=o_13;
o14<=o_14;
o15<=o_15;
o16<=o_16;

o20<=o_20;
o21<=o_21;
o22<=o_22;
o23<=o_23;
o24<=o_24;
o25<=o_25;
o26<=o_26;

o30<=o_30;
o31<=o_31;
o32<=o_32;
o33<=o_33;
o34<=o_34;
o35<=o_35;
o36<=o_36;

o40<=o_40;
o41<=o_41;
o42<=o_42;
o43<=o_43;
o44<=o_44;
o45<=o_45;
o46<=o_46;

o50<=o_50;
o51<=o_51;
o52<=o_52;
o53<=o_53;
o54<=o_54;
o55<=o_55;
o56<=o_56;

o60<=o_60;
o61<=o_61;
o62<=o_62;
o63<=o_63;
o64<=o_64;
o65<=o_65;
o66<=o_66;

end Behavioral;

