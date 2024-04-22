library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

-------------------------------------------------------------------------------

entity rgb2ycbcr is
  port 
  (
	rgb 	: in std_logic_vector(23 downto 0);
	de_in 	: in std_logic;
	ycbcr 	: out std_logic_vector(23 downto 0);
	de_out 	: out std_logic;
	rst_n 	: in std_logic;
	clk 	: in std_logic
   );
end entity rgb2ycbcr;


architecture rtl of rgb2ycbcr is
  

  

 
signal Y_reg_1           : signed(23 downto 0):=(others=>'0');
signal Y_reg_2           : signed(23 downto 0):=(others=>'0');
signal Y_reg_3           : signed(23 downto 0):=(others=>'0');
signal Cb_reg_1          : signed(23 downto 0):=(others=>'0');
signal Cb_reg_2          : signed(23 downto 0):=(others=>'0');
signal Cb_reg_3          : signed(23 downto 0):=(others=>'0');
signal Cr_reg_1          : signed(23 downto 0):=(others=>'0');
signal Cr_reg_2          : signed(23 downto 0):=(others=>'0');
signal Cr_reg_3          : signed(23 downto 0):=(others=>'0');
signal Y_reg             : signed(23 downto 0):=(others=>'0');
signal Cb_reg            : signed(23 downto 0):=(others=>'0');
signal Cr_reg            : signed(23 downto 0):=(others=>'0');


constant C_Y_1       : signed(14 downto 0) := to_signed(4899,  15);
constant C_Y_2       : signed(14 downto 0) := to_signed(9617,  15);
constant C_Y_3       : signed(14 downto 0) := to_signed(1868,  15);
constant C_Cb_1      : signed(14 downto 0) := to_signed(-2764, 15);
constant C_Cb_2      : signed(14 downto 0) := to_signed(-5428, 15);
constant C_Cb_3      : signed(14 downto 0) := to_signed(8192,  15);
constant C_Cr_1      : signed(14 downto 0) := to_signed(8192,  15);
constant C_Cr_2      : signed(14 downto 0) := to_signed(-6860, 15);
constant C_Cr_3      : signed(14 downto 0) := to_signed(-1332, 15);


signal R_s               : signed(8 downto 0):=(others=>'0');
signal G_s               : signed(8 downto 0):=(others=>'0');
signal B_s               : signed(8 downto 0):=(others=>'0');
signal Y_8bit            : unsigned(7 downto 0):=(others=>'0');
signal Cb_8bit           : unsigned(7 downto 0):=(others=>'0');
signal Cr_8bit           : unsigned(7 downto 0):=(others=>'0');

signal de_in_q : std_logic;
  
 
begin

  
process(CLK, rst_n)
begin
	if rst_n = '0' then
		Y_Reg_1  	<= (others => '0');
		Y_Reg_2  	<= (others => '0');
		Y_Reg_3  	<= (others => '0');
		Cb_Reg_1 	<= (others => '0');
		Cb_Reg_2 	<= (others => '0');
		Cb_Reg_3 	<= (others => '0');
		Cr_Reg_1 	<= (others => '0');
		Cr_Reg_2 	<= (others => '0');
		Cr_Reg_3 	<= (others => '0');
		Y_Reg    	<= (others => '0');
		Cb_Reg   	<= (others => '0');
		Cr_Reg   	<= (others => '0');
		de_in_q 	<= '0';
		de_out 		<= '0';
	elsif rising_edge(clk) then
		
		de_in_q <= de_in;		
		
		Y_Reg_1  <= R_s*C_Y_1;
		Y_Reg_2  <= G_s*C_Y_2;
		Y_Reg_3  <= B_s*C_Y_3;

		Cb_Reg_1 <= R_s*C_Cb_1;
		Cb_Reg_2 <= G_s*C_Cb_2;
		Cb_Reg_3 <= B_s*C_Cb_3;

		Cr_Reg_1 <= R_s*C_Cr_1;
		Cr_Reg_2 <= G_s*C_Cr_2;
		Cr_Reg_3 <= B_s*C_Cr_3;

		de_out <= de_in_q;
		Y_Reg  <= Y_Reg_1 + Y_Reg_2 + Y_Reg_3;
		Cb_Reg <= Cb_Reg_1 + Cb_Reg_2 + Cb_Reg_3 + to_signed(128*16384,Cb_Reg'length);
		Cr_Reg <= Cr_Reg_1 + Cr_Reg_2 + Cr_Reg_3 + to_signed(128*16384,Cr_Reg'length);
	end if;
	
end process;

R_s <= signed('0' & rgb(7 downto 0));
G_s <= signed('0' & rgb(15 downto 8));
B_s <= signed('0' & rgb(23 downto 16));


Y_8bit  <= unsigned(Y_Reg(21 downto 14));
Cb_8bit <= unsigned(Cb_Reg(21 downto 14));
Cr_8bit <= unsigned(Cr_Reg(21 downto 14));
 
ycbcr(7 downto 0) <= std_logic_vector(Y_8bit);
ycbcr(15 downto 8) <= std_logic_vector(Cb_8bit);
ycbcr(23 downto 16) <= std_logic_vector(Cr_8bit);

end architecture RTL;
