----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:53:55 02/01/2011 
-- Design Name: 
-- Module Name:    NMS_top - Behavioral 
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

entity NMS_top is
port(
		data_in : in std_logic_vector(12 downto 0); -- dane z corner score
		iscorner, clk, EN, rst : in std_logic;	-- dane z contig + zegar
		x_coord_in, y_coord_in : in std_logic_vector(9 downto 0);
		x_coord_out, y_coord_out : out std_logic_vector(9 downto 0);
		corner_out : out std_logic -- ostateczne wykryte narozniki - po NMS
);
end NMS_top;

architecture Behavioral of NMS_top is


component NMS_FIFO is
generic (depth: integer :=640);  -- image resolution
port(
		data_in : in std_logic_vector(33 downto 0);
		clk, rst, EN : in std_logic;								-- EN - global enable
		o11, o12, o13, o14, o15, o16, o17 : out std_logic_vector(33 downto 0); -- MSB -> iscorner
		o21, o22, o23, o24, o25, o26, o27 : out std_logic_vector(33 downto 0); 
		o31, o32, o33, o34, o35, o36, o37 : out std_logic_vector(33 downto 0);
		o41, o42, o43, o44, o45, o46, o47 : out std_logic_vector(33 downto 0);
		o51, o52, o53, o54, o55, o56, o57 : out std_logic_vector(33 downto 0);
		o61, o62, o63, o64, o65, o66, o67 : out std_logic_vector(33 downto 0);
		o71, o72, o73, o74, o75, o76, o77 : out std_logic_vector(33 downto 0)
		);
end component;


component NMS is
port(
		inp11, inp12, inp13, inp14, inp15, inp16, inp17 : in std_logic_vector(12 downto 0);
		inp21, inp22, inp23, inp24, inp25, inp26, inp27 : in std_logic_vector(12 downto 0);
		inp31, inp32, inp33, inp34, inp35, inp36, inp37 : in std_logic_vector(12 downto 0);
		inp41, inp42, inp43, inp44, inp45, inp46, inp47 : in std_logic_vector(12 downto 0);
		inp51, inp52, inp53, inp54, inp55, inp56, inp57 : in std_logic_vector(12 downto 0);
		inp61, inp62, inp63, inp64, inp65, inp66, inp67 : in std_logic_vector(12 downto 0);
		inp71, inp72, inp73, inp74, inp75, inp76, inp77 : in std_logic_vector(12 downto 0);
		x_coord_in, y_coord_in : in std_logic_vector(9 downto 0);
		x_coord_out, y_coord_out : out std_logic_vector(9 downto 0);
		iscorner, clk, EN : in std_logic;
		corner_out : out std_logic
);
end component;

signal int11, int12, int13, int14, int15, int16, int17 : std_logic_vector(33 downto 0);
signal int21, int22, int23, int24, int25, int26, int27 : std_logic_vector(33 downto 0);
signal int31, int32, int33, int34, int35, int36, int37 : std_logic_vector(33 downto 0);
signal int41, int42, int43, int44, int45, int46, int47 : std_logic_vector(33 downto 0);
signal int51, int52, int53, int54, int55, int56, int57 : std_logic_vector(33 downto 0);
signal int61, int62, int63, int64, int65, int66, int67 : std_logic_vector(33 downto 0);
signal int71, int72, int73, int74, int75, int76, int77 : std_logic_vector(33 downto 0);

begin

nonmax : NMS port map(
								clk=>clk,
								EN=>EN,

								inp11=>int11(12 downto 0),
								inp12=>int12(12 downto 0),
								inp13=>int13(12 downto 0),
								inp14=>int14(12 downto 0),
								inp15=>int15(12 downto 0),
								inp16=>int16(12 downto 0),
								inp17=>int17(12 downto 0),

								inp21=>int21(12 downto 0),
								inp22=>int22(12 downto 0),
								inp23=>int23(12 downto 0),
								inp24=>int24(12 downto 0),
								inp25=>int25(12 downto 0),
								inp26=>int26(12 downto 0),
								inp27=>int27(12 downto 0),

								inp31=>int31(12 downto 0),
								inp32=>int32(12 downto 0),
								inp33=>int33(12 downto 0),
								inp34=>int34(12 downto 0),
								inp35=>int35(12 downto 0),
								inp36=>int36(12 downto 0),
								inp37=>int37(12 downto 0),
								
								inp41=>int41(12 downto 0),
								inp42=>int42(12 downto 0),
								inp43=>int43(12 downto 0),
								inp44=>int44(12 downto 0),
								inp45=>int45(12 downto 0),
								inp46=>int46(12 downto 0),
								inp47=>int47(12 downto 0),
								
								inp51=>int51(12 downto 0),
								inp52=>int52(12 downto 0),
								inp53=>int53(12 downto 0),
								inp54=>int54(12 downto 0),
								inp55=>int55(12 downto 0),
								inp56=>int56(12 downto 0),
								inp57=>int57(12 downto 0),
								
								inp61=>int61(12 downto 0),
								inp62=>int62(12 downto 0),
								inp63=>int63(12 downto 0),
								inp64=>int64(12 downto 0),
								inp65=>int65(12 downto 0),
								inp66=>int66(12 downto 0),
								inp67=>int67(12 downto 0),
								
								inp71=>int71(12 downto 0),
								inp72=>int72(12 downto 0),
								inp73=>int73(12 downto 0),
								inp74=>int74(12 downto 0),
								inp75=>int75(12 downto 0),
								inp76=>int76(12 downto 0),
								inp77=>int77(12 downto 0),
							
								iscorner=>int44(13), 			-- from contig test
								x_coord_in=>int44(33 downto 24),
								y_coord_in=>int44(23 downto 14),
								
								corner_out=>corner_out,
								x_coord_out=>x_coord_out,
								y_coord_out=>y_coord_out
								
								);
								
suppress : NMS_FIFO port map(

								o11=>int11,
								o12=>int12,
								o13=>int13,
								o14=>int14,
								o15=>int15,
								o16=>int16,
								o17=>int17,

								o21=>int21,
								o22=>int22,
								o23=>int23,
								o24=>int24,
								o25=>int25,
								o26=>int26,
								o27=>int27,

								o31=>int31,
								o32=>int32,
								o33=>int33,
								o34=>int34,
								o35=>int35,
								o36=>int36,
								o37=>int37,
								
								o41=>int41,
								o42=>int42,
								o43=>int43,
								o44=>int44,
								o45=>int45,
								o46=>int46,
								o47=>int47,
								
								o51=>int51,
								o52=>int52,
								o53=>int53,
								o54=>int54,
								o55=>int55,
								o56=>int56,
								o57=>int57,
								
								o61=>int61,
								o62=>int62,
								o63=>int63,
								o64=>int64,
								o65=>int65,
								o66=>int66,
								o67=>int67,
								
								o71=>int71,
								o72=>int72,
								o73=>int73,
								o74=>int74,
								o75=>int75,
								o76=>int76,
								o77=>int77,

								clk=>clk,
								rst=>rst,
								EN=>EN,

								
								data_in(33 downto 24)=>x_coord_in,
								data_in(23 downto 14)=>y_coord_in,
								data_in(13)=>iscorner,
								data_in(12 downto 0)=>data_in

								);

end Behavioral;
