
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_top is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_top;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_top.all;

entity top is

   port( in_data_a, in_data_b : in std_logic_vector (3 downto 0);  
         in_data_carry : in std_logic;  in_ctrl : in std_logic_vector (2 downto
         0);  out_data_c : out std_logic_vector (3 downto 0);  out_data_carry :
         out std_logic;  out_data_comp : out std_logic_vector (1 downto 0));

end top;

architecture SYN_behavioral of top is

   component inv
      port( inb : in std_logic;  outb : out std_logic);
   end component;
   
   component nor3
      port( a, b, c : in std_logic;  outb : out std_logic);
   end component;
   
   component nand2
      port( a, b : in std_logic;  outb : out std_logic);
   end component;
   
   component oai22
      port( a, b, c, d : in std_logic;  outb : out std_logic);
   end component;
   
   component nor2
      port( a, b : in std_logic;  outb : out std_logic);
   end component;
   
   component nand3
      port( a, b, c : in std_logic;  outb : out std_logic);
   end component;
   
   component xor2
      port( a, b : in std_logic;  outb : out std_logic);
   end component;
   
   component oai12
      port( b, c, a : in std_logic;  outb : out std_logic);
   end component;
   
   component aoi22
      port( a, b, c, d : in std_logic;  outb : out std_logic);
   end component;
   
   component nand4
      port( a, b, c, d : in std_logic;  outb : out std_logic);
   end component;
   
   component aoi12
      port( b, c, a : in std_logic;  outb : out std_logic);
   end component;
   
   signal n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, 
      n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, 
      n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, 
      n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, 
      n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, 
      n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, 
      n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, 
      n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, 
      n201, n202, n203, n204 : std_logic;

begin
   
   out_data_comp(1) <= '0';
   U105 : nand2 port map( a => n106, b => n107, outb => out_data_comp(0));
   U106 : nand4 port map( a => in_ctrl(0), b => n108, c => in_ctrl(1), d => 
                           n109, outb => n107);
   U107 : nand4 port map( a => n110, b => n111, c => n112, d => in_ctrl(2), 
                           outb => n106);
   U108 : inv port map( inb => n113, outb => n111);
   U109 : nor2 port map( a => n114, b => in_ctrl(0), outb => n113);
   U110 : oai12 port map( b => n108, c => n114, a => in_ctrl(0), outb => n110);
   U111 : nand2 port map( a => n115, b => n116, outb => n114);
   U112 : oai12 port map( b => n117, c => n118, a => n119, outb => n115);
   U113 : aoi12 port map( b => n120, c => n121, a => n122, outb => n118);
   U114 : nand3 port map( a => n123, b => n124, c => in_data_b(0), outb => n120
                           );
   U115 : nand2 port map( a => n119, b => n125, outb => n108);
   U116 : oai12 port map( b => n126, c => n127, a => n116, outb => n125);
   U117 : aoi12 port map( b => n123, c => n128, a => n122, outb => n126);
   U118 : nand3 port map( a => n121, b => n129, c => in_data_a(0), outb => n128
                           );
   U119 : nand3 port map( a => n130, b => n131, c => n132, outb => 
                           out_data_carry);
   U120 : aoi22 port map( a => in_data_b(3), b => n133, c => n134, d => 
                           in_data_carry, outb => n132);
   U121 : nand3 port map( a => in_data_a(3), b => n135, c => n136, outb => n131
                           );
   U122 : nand2 port map( a => n137, b => n138, outb => n135);
   U123 : nand2 port map( a => n139, b => n140, outb => n130);
   U124 : oai12 port map( b => in_data_a(3), c => n141, a => n116, outb => n140
                           );
   U125 : nand2 port map( a => n142, b => n143, outb => out_data_c(3));
   U126 : aoi22 port map( a => n144, b => n133, c => n145, d => n146, outb => 
                           n143);
   U127 : inv port map( inb => n147, outb => n145);
   U128 : aoi22 port map( a => n139, b => n141, c => n137, d => n136, outb => 
                           n147);
   U129 : oai22 port map( a => n141, b => n148, c => n137, d => n149, outb => 
                           n133);
   U130 : aoi22 port map( a => in_data_a(2), b => n150, c => n151, d => 
                           in_data_b(2), outb => n137);
   U131 : nand2 port map( a => n152, b => n153, outb => n151);
   U132 : aoi12 port map( b => n154, c => n155, a => n117, outb => n141);
   U133 : inv port map( inb => n156, outb => n117);
   U134 : inv port map( inb => n146, outb => n144);
   U135 : nand2 port map( a => n116, b => n119, outb => n146);
   U136 : nand2 port map( a => in_data_a(3), b => n138, outb => n119);
   U137 : inv port map( inb => n157, outb => n116);
   U138 : nor2 port map( a => n138, b => in_data_a(3), outb => n157);
   U139 : inv port map( inb => in_data_b(3), outb => n138);
   U140 : aoi22 port map( a => n158, b => n159, c => in_data_a(3), d => n160, 
                           outb => n142);
   U141 : oai12 port map( b => n161, c => n162, a => n163, outb => n159);
   U142 : oai22 port map( a => in_data_a(0), b => n129, c => in_data_b(0), d =>
                           in_data_a(1), outb => n162);
   U143 : nand4 port map( a => n164, b => n165, c => n166, d => n167, outb => 
                           out_data_c(2));
   U144 : aoi22 port map( a => n168, b => n158, c => in_data_a(2), d => n160, 
                           outb => n167);
   U145 : aoi22 port map( a => in_data_b(0), b => n123, c => n169, d => n129, 
                           outb => n168);
   U146 : nand2 port map( a => in_data_a(0), b => in_data_b(1), outb => n169);
   U147 : nand2 port map( a => n170, b => n136, outb => n166);
   U148 : xor2 port map( a => n122, b => n150, outb => n170);
   U149 : inv port map( inb => n152, outb => n150);
   U150 : oai22 port map( a => in_data_a(1), b => n171, c => in_data_b(1), d =>
                           n172, outb => n152);
   U151 : inv port map( inb => n173, outb => n172);
   U152 : nand2 port map( a => n171, b => in_data_a(1), outb => n173);
   U153 : nand3 port map( a => n174, b => in_data_a(3), c => n175, outb => n165
                           );
   U154 : nand2 port map( a => n139, b => n176, outb => n164);
   U155 : xor2 port map( a => n122, b => n154, outb => n176);
   U156 : inv port map( inb => n177, outb => n154);
   U157 : aoi12 port map( b => n178, c => n123, a => n179, outb => n177);
   U158 : nand2 port map( a => n155, b => n156, outb => n122);
   U159 : nand2 port map( a => in_data_b(2), b => n153, outb => n156);
   U160 : inv port map( inb => n127, outb => n155);
   U161 : nor2 port map( a => n153, b => in_data_b(2), outb => n127);
   U162 : inv port map( inb => in_data_a(2), outb => n153);
   U163 : nand4 port map( a => n180, b => n181, c => n182, d => n183, outb => 
                           out_data_c(1));
   U164 : aoi22 port map( a => n175, b => n184, c => in_data_a(1), d => n160, 
                           outb => n183);
   U165 : nand2 port map( a => n163, b => n185, outb => n184);
   U166 : nand3 port map( a => in_data_b(1), b => n129, c => in_data_a(3), outb
                           => n185);
   U167 : nand2 port map( a => n174, b => in_data_a(2), outb => n163);
   U168 : nand2 port map( a => n136, b => n186, outb => n182);
   U169 : xor2 port map( a => n171, b => n187, outb => n186);
   U170 : oai12 port map( b => n188, c => n124, a => n189, outb => n171);
   U171 : nand3 port map( a => n174, b => in_data_a(0), c => n158, outb => n181
                           );
   U172 : nor2 port map( a => n129, b => in_data_b(1), outb => n174);
   U173 : nand2 port map( a => n139, b => n190, outb => n180);
   U174 : xor2 port map( a => n178, b => n187, outb => n190);
   U175 : nand2 port map( a => n123, b => n121, outb => n187);
   U176 : inv port map( inb => n179, outb => n121);
   U177 : nor2 port map( a => n161, b => in_data_a(1), outb => n179);
   U178 : oai12 port map( b => in_data_a(0), c => n188, a => n189, outb => n178
                           );
   U179 : nand3 port map( a => n191, b => n192, c => n193, outb => 
                           out_data_c(0));
   U180 : nand2 port map( a => in_data_a(0), b => n160, outb => n193);
   U181 : inv port map( inb => n194, outb => n160);
   U182 : nor2 port map( a => n195, b => n134, outb => n194);
   U183 : nor3 port map( a => in_ctrl(1), b => in_ctrl(2), c => in_ctrl(0), 
                           outb => n134);
   U184 : nor3 port map( a => in_data_b(0), b => in_data_b(1), c => n196, outb 
                           => n195);
   U185 : nor2 port map( a => n158, b => n175, outb => n196);
   U186 : nor3 port map( a => n109, b => n197, c => n112, outb => n158);
   U187 : nand3 port map( a => n198, b => n199, c => n200, outb => n192);
   U188 : nand2 port map( a => n149, b => n148, outb => n200);
   U189 : inv port map( inb => n139, outb => n148);
   U190 : nor3 port map( a => in_ctrl(0), b => in_ctrl(2), c => n112, outb => 
                           n139);
   U191 : inv port map( inb => n136, outb => n149);
   U192 : nor3 port map( a => in_ctrl(1), b => in_ctrl(2), c => n197, outb => 
                           n136);
   U193 : inv port map( inb => in_ctrl(0), outb => n197);
   U194 : nand2 port map( a => n201, b => n124, outb => n199);
   U195 : inv port map( inb => in_data_a(0), outb => n124);
   U196 : xor2 port map( a => in_data_carry, b => n129, outb => n201);
   U197 : nand3 port map( a => n202, b => n189, c => in_data_a(0), outb => n198
                           );
   U198 : nand2 port map( a => in_data_carry, b => in_data_b(0), outb => n189);
   U199 : inv port map( inb => n188, outb => n202);
   U200 : nor2 port map( a => in_data_carry, b => in_data_b(0), outb => n188);
   U201 : nand2 port map( a => n175, b => n203, outb => n191);
   U202 : oai22 port map( a => n129, b => n123, c => n161, d => n204, outb => 
                           n203);
   U203 : oai22 port map( a => in_data_b(0), b => in_data_a(2), c => 
                           in_data_a(3), d => n129, outb => n204);
   U204 : nand2 port map( a => in_data_a(1), b => n161, outb => n123);
   U205 : inv port map( inb => in_data_b(1), outb => n161);
   U206 : inv port map( inb => in_data_b(0), outb => n129);
   U207 : nor3 port map( a => n109, b => in_ctrl(0), c => n112, outb => n175);
   U208 : inv port map( inb => in_ctrl(1), outb => n112);
   U209 : inv port map( inb => in_ctrl(2), outb => n109);

end SYN_behavioral;