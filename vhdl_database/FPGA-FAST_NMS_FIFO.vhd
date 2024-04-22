----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:39:51 09/01/2010 
-- Design Name: 
-- Module Name:    FIFO_delay_input - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity NMS_FIFO is
generic (depth: integer :=640);  -- horizontal image resolution
port(
		data_in : in std_logic_vector(33 downto 0);
		clk, rst, EN : in std_logic;								-- EN - global enable
		o11, o12, o13, o14, o15, o16, o17 : out std_logic_vector(33 downto 0); -- [--x_coord(10)--|--y_coord(10)--|--iscorner(1)--|--score(13)--] total of 34 bits
		o21, o22, o23, o24, o25, o26, o27 : out std_logic_vector(33 downto 0); 
		o31, o32, o33, o34, o35, o36, o37 : out std_logic_vector(33 downto 0);
		o41, o42, o43, o44, o45, o46, o47 : out std_logic_vector(33 downto 0);
		o51, o52, o53, o54, o55, o56, o57 : out std_logic_vector(33 downto 0);
		o61, o62, o63, o64, o65, o66, o67 : out std_logic_vector(33 downto 0);
		o71, o72, o73, o74, o75, o76, o77 : out std_logic_vector(33 downto 0)
		);
end NMS_FIFO;

architecture Behavioral of NMS_FIFO is

type ram is array (depth-1 downto 0) of std_logic_vector(33 downto 0); 
signal address_read, address_write : unsigned(9 downto 0);
signal data_out_1, data_out_2, data_out_3, data_out_4, data_out_5, data_out_6 : std_logic_vector(33 downto 0);
signal ram_1, ram_2, ram_3, ram_4, ram_5, ram_6 : ram;
signal o_11, o_12, o_13, o_14, o_15, o_16, o_17 : std_logic_vector(33 downto 0);
signal o_21, o_22, o_23, o_24, o_25, o_26, o_27 : std_logic_vector(33 downto 0);
signal o_31, o_32, o_33, o_34, o_35, o_36, o_37 : std_logic_vector(33 downto 0);
signal o_41, o_42, o_43, o_44, o_45, o_46, o_47 : std_logic_vector(33 downto 0);
signal o_51, o_52, o_53, o_54, o_55, o_56, o_57 : std_logic_vector(33 downto 0);
signal o_61, o_62, o_63, o_64, o_65, o_66, o_67 : std_logic_vector(33 downto 0);
signal o_71, o_72, o_73, o_74, o_75, o_76, o_77 : std_logic_vector(33 downto 0);

attribute ram_style: string; 
attribute ram_style of ram_1 : signal is "block"; 
attribute ram_style of ram_2 : signal is "block"; 
attribute ram_style of ram_3 : signal is "block"; 
attribute ram_style of ram_4 : signal is "block"; 
attribute ram_style of ram_5 : signal is "block"; 
attribute ram_style of ram_6 : signal is "block"; 

begin

ram_handler : process(clk, rst)
begin
	if clk='1' and clk'event then
		if EN='1' then
			ram_1(to_integer(address_write))<=data_in; 		
			ram_2(to_integer(address_write))<=data_out_1; 	
			ram_3(to_integer(address_write))<=data_out_2; 	
			ram_4(to_integer(address_write))<=data_out_3; 	
			ram_5(to_integer(address_write))<=data_out_4; 	
			ram_6(to_integer(address_write))<=data_out_5; 	

			data_out_1<=ram_1(to_integer(address_read));	--read from FIFO 1
			data_out_2<=ram_2(to_integer(address_read));	--read from FIFO 2
			data_out_3<=ram_3(to_integer(address_read));	--read from FIFO 3
			data_out_4<=ram_4(to_integer(address_read));	--read from FIFO 4
			data_out_5<=ram_5(to_integer(address_read));	--read from FIFO 5
			data_out_6<=ram_6(to_integer(address_read));	--read from FIFO 6
			
			o_77<=data_in;	-- 7th row in the window
			o_76<=o_77;		-- coming from data_in
			o_75<=o_76;		
			o_74<=o_75;		
			o_73<=o_74;		
			o_72<=o_73;		
			o_71<=o_72;		

			o_67<=data_out_1;	
			o_66<=o_67;		
			o_65<=o_66;		
			o_64<=o_65;		
			o_63<=o_64;		
			o_62<=o_63;		
			o_61<=o_62;		
			
			o_57<=data_out_2;	
			o_56<=o_57;			
			o_55<=o_56;		
			o_54<=o_55;		
			o_53<=o_54;		
			o_52<=o_53;		
			o_51<=o_52;		

			o_47<=data_out_3;	
			o_46<=o_47;			
			o_45<=o_46;		
			o_44<=o_45;		
			o_43<=o_44;		
			o_42<=o_43;		
			o_41<=o_42;		

			o_37<=data_out_4;	
			o_36<=o_37;			
			o_35<=o_36;		
			o_34<=o_35;		
			o_33<=o_34;		
			o_32<=o_33;		
			o_31<=o_32;		

			o_27<=data_out_5;	
			o_26<=o_27;			
			o_25<=o_26;		
			o_24<=o_25;		
			o_23<=o_24;		
			o_22<=o_23;		
			o_21<=o_22;		

			o_17<=data_out_6;	
			o_16<=o_17;			
			o_15<=o_16;		
			o_14<=o_15;		
			o_13<=o_14;		
			o_12<=o_13;		
			o_11<=o_12;		


--			+---+---+---+---+---+---+---+				window arrangement:
--			|o11|o12|o13|o14|o15|o16|o17|				o(row number, col. number)		
--			+---+---+---+---+---+---+---+			
--			|o21|o22|o23|o24|o25|o26|o27|					
--			+---+---+---+---+---+---+---+			
--			|o31|o32|o33|o34|o35|o36|o37|					
--			+---+---+---+---+---+---+---+			
--			|o41|o42|o43|o44|o45|o46|o47|				-- o44 is the middle
--			+---+---+---+---+---+---+---+			
--			|o51|o52|o53|o54|o55|o56|o57|					
--			+---+---+---+---+---+---+---+			
--			|o61|o62|o63|o64|o65|o66|o67|					
--			+---+---+---+---+---+---+---+			
--			|o71|o72|o73|o74|o75|o76|o77|					
--			+---+---+---+---+---+---+---+			
			
		end if;														
	end if;
end process ram_handler;

address_generator : process(clk)
begin
	if clk='1' and clk'event then
		if rst='1' then
			address_read<=(others=>'0');
			address_write<=to_unsigned(1, 10);
		else		
			if EN='1' then
				if address_read=to_unsigned(639, 10) then
					address_read<=(others=>'0');
				else
					address_read<=address_read+1;
				end if;
				address_write<=address_read;	
			end if;
		end if;
	end if;
end process address_generator;

o11<=o_11;
o12<=o_12;
o13<=o_13;
o14<=o_14;
o15<=o_15;
o16<=o_16;
o17<=o_17;

o21<=o_21;
o22<=o_22;
o23<=o_23;
o24<=o_24;
o25<=o_25;
o26<=o_26;
o27<=o_27;

o31<=o_31;
o32<=o_32;
o33<=o_33;
o34<=o_34;
o35<=o_35;
o36<=o_36;
o37<=o_37;

o41<=o_41;
o42<=o_42;
o43<=o_43;
o44<=o_44;
o45<=o_45;
o46<=o_46;
o47<=o_47;

o51<=o_51;
o52<=o_52;
o53<=o_53;
o54<=o_54;
o55<=o_55;
o56<=o_56;
o57<=o_57;

o61<=o_61;
o62<=o_62;
o63<=o_63;
o64<=o_64;
o65<=o_65;
o66<=o_66;
o67<=o_67;

o71<=o_71;
o72<=o_72;
o73<=o_73;
o74<=o_74;
o75<=o_75;
o76<=o_76;
o77<=o_77;

end Behavioral;

