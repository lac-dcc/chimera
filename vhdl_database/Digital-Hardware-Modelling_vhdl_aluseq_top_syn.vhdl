
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_top_W4 is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_top_W4;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_top_W4.all;

entity alu_W4 is

   port( i_data_a, i_data_b : in std_logic_vector (3 downto 0);  i_data_carry :
         in std_logic;  i_ctrl : in std_logic_vector (3 downto 0);  o_data_c : 
         out std_logic_vector (3 downto 0);  o_data_carry : out std_logic;  
         o_data_comp : out std_logic_vector (1 downto 0));

end alu_W4;

architecture SYN_behavioral of alu_W4 is

   component inv
      port( inb : in std_logic;  outb : out std_logic);
   end component;
   
   component nand3
      port( a, b, c : in std_logic;  outb : out std_logic);
   end component;
   
   component nand2
      port( a, b : in std_logic;  outb : out std_logic);
   end component;
   
   component oai12
      port( b, c, a : in std_logic;  outb : out std_logic);
   end component;
   
   component xor2
      port( a, b : in std_logic;  outb : out std_logic);
   end component;
   
   component aoi12
      port( b, c, a : in std_logic;  outb : out std_logic);
   end component;
   
   component nor2
      port( a, b : in std_logic;  outb : out std_logic);
   end component;
   
   component nor3
      port( a, b, c : in std_logic;  outb : out std_logic);
   end component;
   
   component oai22
      port( a, b, c, d : in std_logic;  outb : out std_logic);
   end component;
   
   component aoi22
      port( a, b, c, d : in std_logic;  outb : out std_logic);
   end component;
   
   component nand4
      port( a, b, c, d : in std_logic;  outb : out std_logic);
   end component;
   
   signal n9, n10, n11, n12, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, 
      n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38
      , n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, 
      n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67
      , n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, 
      n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96
      , n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, 
      n109, n110, n111, n1 : std_logic;

begin
   
   o_data_comp(1) <= '0';
   U2 : inv port map( inb => n93, outb => n9);
   U3 : inv port map( inb => n78, outb => n10);
   U4 : inv port map( inb => n42, outb => n11);
   U5 : inv port map( inb => n38, outb => n12);
   U7 : inv port map( inb => n80, outb => n14);
   U8 : inv port map( inb => n69, outb => n15);
   U9 : inv port map( inb => n45, outb => n16);
   U10 : inv port map( inb => i_data_a(2), outb => n17);
   U11 : inv port map( inb => i_data_a(1), outb => n18);
   U12 : inv port map( inb => n101, outb => n19);
   U13 : inv port map( inb => n46, outb => n20);
   U14 : inv port map( inb => n49, outb => n21);
   U15 : inv port map( inb => n92, outb => n22);
   U16 : inv port map( inb => i_data_a(0), outb => n23);
   U17 : inv port map( inb => i_data_b(3), outb => n24);
   U18 : inv port map( inb => i_data_b(1), outb => n25);
   U19 : inv port map( inb => n73, outb => n26);
   U20 : inv port map( inb => i_data_b(0), outb => n27);
   U21 : inv port map( inb => i_data_carry, outb => n28);
   U22 : inv port map( inb => n71, outb => n29);
   U23 : inv port map( inb => n87, outb => n30);
   U24 : inv port map( inb => n61, outb => n31);
   U25 : inv port map( inb => n59, outb => n32);
   U26 : inv port map( inb => i_ctrl(2), outb => n33);
   U27 : inv port map( inb => i_ctrl(1), outb => n34);
   U28 : inv port map( inb => i_ctrl(0), outb => n35);
   U29 : aoi12 port map( b => n36, c => n37, a => i_ctrl(3), outb => 
                           o_data_comp(0));
   U30 : nand4 port map( a => i_ctrl(1), b => i_ctrl(0), c => n12, d => n33, 
                           outb => n37);
   U31 : nand3 port map( a => n39, b => n34, c => i_ctrl(2), outb => n36);
   U32 : oai12 port map( b => i_ctrl(0), c => n40, a => n41, outb => n39);
   U33 : nand3 port map( a => n38, b => i_ctrl(0), c => n40, outb => n41);
   U34 : aoi12 port map( b => n42, c => n43, a => n44, outb => n38);
   U35 : oai22 port map( a => n45, b => n20, c => n17, d => i_data_b(2), outb 
                           => n43);
   U36 : oai12 port map( b => n47, c => n48, a => n49, outb => n46);
   U37 : nor2 port map( a => n50, b => n11, outb => n40);
   U38 : aoi12 port map( b => n51, c => n52, a => n44, outb => n50);
   U39 : oai12 port map( b => n47, c => n53, a => n16, outb => n51);
   U40 : nor3 port map( a => n21, b => i_data_a(0), c => n27, outb => n53);
   U41 : nor2 port map( a => i_ctrl(3), b => n54, outb => o_data_carry);
   U42 : nor3 port map( a => n55, b => n56, c => n57, outb => n54);
   U43 : aoi12 port map( b => n42, c => n58, a => n59, outb => n57);
   U44 : nand2 port map( a => n60, b => n1, outb => n58);
   U45 : nor3 port map( a => n61, b => n62, c => n1, outb => n56);
   U46 : nor2 port map( a => n63, b => n24, outb => n55);
   U47 : aoi22 port map( a => n31, b => n64, c => n32, d => n60, outb => n63);
   U48 : nand2 port map( a => n62, b => n1, outb => n64);
   U49 : nor2 port map( a => i_ctrl(3), b => n65, outb => o_data_c(3));
   U50 : nor3 port map( a => n66, b => n67, c => n68, outb => n65);
   U51 : aoi12 port map( b => n69, c => n70, a => n71, outb => n68);
   U52 : nand2 port map( a => i_data_b(1), b => n72, outb => n70);
   U53 : oai22 port map( a => i_data_b(0), b => n18, c => n23, d => n27, outb 
                           => n72);
   U54 : nor3 port map( a => n26, b => i_data_b(1), c => n1, outb => n67);
   U55 : oai22 port map( a => n10, b => n61, c => n74, d => n59, outb => n66);
   U56 : xor2 port map( a => n60, b => n75, outb => n74);
   U57 : oai12 port map( b => n76, c => n77, a => n52, outb => n60);
   U58 : nor2 port map( a => i_data_b(2), b => n17, outb => n77);
   U59 : xor2 port map( a => n62, b => n75, outb => n78);
   U60 : nor2 port map( a => n11, b => n44, outb => n75);
   U61 : nor2 port map( a => n1, b => i_data_b(3), outb => n44);
   U62 : nand2 port map( a => i_data_b(3), b => n1, outb => n42);
   U63 : aoi22 port map( a => n79, b => i_data_a(2), c => n14, d => i_data_b(2)
                           , outb => n62);
   U64 : nor2 port map( a => i_data_a(2), b => n79, outb => n80);
   U65 : nor2 port map( a => i_ctrl(3), b => n81, outb => o_data_c(2));
   U66 : nor3 port map( a => n82, b => n83, c => n84, outb => n81);
   U67 : nor2 port map( a => i_data_b(1), b => n85, outb => n84);
   U68 : aoi22 port map( a => i_data_b(0), b => n86, c => n73, d => i_data_a(2)
                           , outb => n85);
   U69 : oai22 port map( a => n1, b => n87, c => n18, d => n71, outb => n86);
   U70 : nor3 port map( a => n71, b => n25, c => n48, outb => n83);
   U71 : oai22 port map( a => n88, b => n61, c => n89, d => n59, outb => n82);
   U72 : xor2 port map( a => n45, b => n76, outb => n89);
   U73 : aoi12 port map( b => n49, c => n90, a => n47, outb => n76);
   U74 : xor2 port map( a => n79, b => n16, outb => n88);
   U75 : oai12 port map( b => i_data_b(2), c => n17, a => n52, outb => n45);
   U76 : nand2 port map( a => i_data_b(2), b => n17, outb => n52);
   U77 : oai22 port map( a => n22, b => n18, c => n91, d => n25, outb => n79);
   U78 : nor2 port map( a => i_data_a(1), b => n92, outb => n91);
   U79 : nor2 port map( a => n9, b => i_ctrl(3), outb => o_data_c(1));
   U80 : nand4 port map( a => n94, b => n95, c => n96, d => n97, outb => n93);
   U81 : aoi22 port map( a => n32, b => n19, c => n31, d => n98, outb => n97);
   U82 : xor2 port map( a => n22, b => n99, outb => n98);
   U83 : oai22 port map( a => n27, b => n28, c => n100, d => n23, outb => n92);
   U84 : xor2 port map( a => n90, b => n99, outb => n101);
   U85 : nor2 port map( a => n47, b => n21, outb => n99);
   U86 : nor2 port map( a => n25, b => i_data_a(1), outb => n47);
   U87 : oai22 port map( a => n27, b => n28, c => i_data_a(0), d => n100, outb 
                           => n90);
   U88 : nor2 port map( a => i_data_carry, b => i_data_b(0), outb => n100);
   U89 : nand2 port map( a => n21, b => n73, outb => n96);
   U90 : nor2 port map( a => n102, b => i_data_b(0), outb => n73);
   U91 : nand4 port map( a => n29, b => i_data_b(0), c => i_data_a(0), d => n25
                           , outb => n95);
   U92 : oai12 port map( b => n103, c => n15, a => n30, outb => n94);
   U93 : nand3 port map( a => i_data_a(2), b => n25, c => i_data_b(0), outb => 
                           n69);
   U94 : nor3 port map( a => n1, b => i_data_b(0), c => n25, outb => n103);
   U95 : nor2 port map( a => i_ctrl(3), b => n104, outb => o_data_c(0));
   U96 : nor3 port map( a => n105, b => n106, c => n107, outb => n104);
   U97 : nor2 port map( a => n108, b => n87, outb => n107);
   U98 : aoi22 port map( a => i_data_b(1), b => n109, c => n21, d => 
                           i_data_b(0), outb => n108);
   U99 : nand2 port map( a => i_data_a(1), b => n25, outb => n49);
   U100 : oai22 port map( a => n1, b => n27, c => i_data_b(0), d => n17, outb 
                           => n109);
   U101 : nor3 port map( a => n48, b => i_data_b(1), c => n102, outb => n106);
   U102 : nor2 port map( a => n30, b => n29, outb => n102);
   U103 : nand3 port map( a => i_ctrl(1), b => i_ctrl(0), c => i_ctrl(2), outb 
                           => n71);
   U104 : nand3 port map( a => i_ctrl(1), b => n35, c => i_ctrl(2), outb => n87
                           );
   U105 : aoi12 port map( b => n61, c => n59, a => n110, outb => n105);
   U106 : xor2 port map( a => n28, b => n111, outb => n110);
   U107 : oai12 port map( b => n27, c => i_data_a(0), a => n48, outb => n111);
   U108 : nand2 port map( a => i_data_a(0), b => n27, outb => n48);
   U109 : nand3 port map( a => n35, b => n33, c => i_ctrl(1), outb => n59);
   U110 : nand3 port map( a => n34, b => n33, c => i_ctrl(0), outb => n61);
   U6 : inv port map( inb => i_data_a(3), outb => n1);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_top_W4.all;

entity top_W4 is

   port( clk, rst : in std_logic;  i_data_a, i_data_b : in std_logic_vector (3 
         downto 0);  i_data_carry : in std_logic;  i_ctrl : in std_logic_vector
         (3 downto 0);  o_data_c : out std_logic_vector (3 downto 0);  
         o_data_carry : out std_logic;  o_data_comp : out std_logic_vector (1 
         downto 0);  o_valid : out std_logic);

end top_W4;

architecture SYN_rtl of top_W4 is

   component inv
      port( inb : in std_logic;  outb : out std_logic);
   end component;
   
   component nand2
      port( a, b : in std_logic;  outb : out std_logic);
   end component;
   
   component nor2
      port( a, b : in std_logic;  outb : out std_logic);
   end component;
   
   component nor3
      port( a, b, c : in std_logic;  outb : out std_logic);
   end component;
   
   component dff
      port( d, gclk, rnot : in std_logic;  q : out std_logic);
   end component;
   
   component alu_W4
      port( i_data_a, i_data_b : in std_logic_vector (3 downto 0);  
            i_data_carry : in std_logic;  i_ctrl : in std_logic_vector (3 
            downto 0);  o_data_c : out std_logic_vector (3 downto 0);  
            o_data_carry : out std_logic;  o_data_comp : out std_logic_vector 
            (1 downto 0));
   end component;
   
   signal o_valid_port, reg_i_instr_1_3_port, reg_i_instr_1_2_port, 
      reg_i_instr_1_1_port, reg_i_instr_1_0_port, reg_i_instr_2_3_port, 
      reg_i_instr_2_2_port, reg_i_instr_2_1_port, reg_i_instr_2_0_port, 
      reg_i_instr_3_3_port, reg_i_instr_3_2_port, reg_i_instr_3_1_port, 
      reg_i_instr_3_0_port, N13, N14, N15, reg_i_data_a_1_3_port, 
      reg_i_data_a_1_2_port, reg_i_data_a_1_1_port, reg_i_data_a_1_0_port, 
      reg_i_data_b_1_3_port, reg_i_data_b_1_2_port, reg_i_data_b_1_1_port, 
      reg_i_data_b_1_0_port, reg_i_data_carry_1, reg_i_data_a_2_3_port, 
      reg_i_data_a_2_2_port, reg_i_data_a_2_1_port, reg_i_data_a_2_0_port, 
      reg_i_data_b_2_3_port, reg_i_data_b_2_2_port, reg_i_data_b_2_1_port, 
      reg_i_data_b_2_0_port, reg_i_data_carry_2, reg_i_data_a_3_3_port, 
      reg_i_data_a_3_2_port, reg_i_data_a_3_1_port, reg_i_data_a_3_0_port, 
      reg_i_data_b_3_3_port, reg_i_data_b_3_2_port, reg_i_data_b_3_1_port, 
      reg_i_data_b_3_0_port, reg_i_data_carry_3, N45, sig_data_c_3_port, 
      sig_data_c_2_port, sig_data_c_1_port, sig_data_c_0_port, sig_data_carry, 
      sig_data_comp_1_port, sig_data_comp_0_port, N54, N55, N56, N57, N58, N59,
      n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n12, n13_port, n14_port, 
      n15_port, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28
      , n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, 
      n43, n44, n45_port, n46, n47, n48, n49, n50, n51, n52, n53, n54_port, 
      n55_port, n56_port, n57_port, n58_port, n59_port, n60, n61, n62, n63, n64
      , n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n76, n77, n78, n79, 
      n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94
      , n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107
      , n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
      n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, 
      n132, n133, n134, n135, n136, n137, n138 : std_logic;

begin
   o_valid <= o_valid_port;
   
   alu_inst : alu_W4 port map( i_data_a(3) => reg_i_data_a_3_3_port, 
                           i_data_a(2) => reg_i_data_a_3_2_port, i_data_a(1) =>
                           reg_i_data_a_3_1_port, i_data_a(0) => 
                           reg_i_data_a_3_0_port, i_data_b(3) => 
                           reg_i_data_b_3_3_port, i_data_b(2) => 
                           reg_i_data_b_3_2_port, i_data_b(1) => 
                           reg_i_data_b_3_1_port, i_data_b(0) => 
                           reg_i_data_b_3_0_port, i_data_carry => 
                           reg_i_data_carry_3, i_ctrl(3) => 
                           reg_i_instr_3_3_port, i_ctrl(2) => 
                           reg_i_instr_3_2_port, i_ctrl(1) => 
                           reg_i_instr_3_1_port, i_ctrl(0) => 
                           reg_i_instr_3_0_port, o_data_c(3) => 
                           sig_data_c_3_port, o_data_c(2) => sig_data_c_2_port,
                           o_data_c(1) => sig_data_c_1_port, o_data_c(0) => 
                           sig_data_c_0_port, o_data_carry => sig_data_carry, 
                           o_data_comp(1) => sig_data_comp_1_port, 
                           o_data_comp(0) => sig_data_comp_0_port);
   reg_i_instr_1_reg_3_inst : dff port map( d => n93, gclk => clk, rnot => n47,
                           q => reg_i_instr_1_3_port);
   reg_i_instr_1_reg_2_inst : dff port map( d => n92, gclk => clk, rnot => n46,
                           q => reg_i_instr_1_2_port);
   reg_i_instr_1_reg_1_inst : dff port map( d => n91, gclk => clk, rnot => 
                           n45_port, q => reg_i_instr_1_1_port);
   reg_i_instr_1_reg_0_inst : dff port map( d => n90, gclk => clk, rnot => n44,
                           q => reg_i_instr_1_0_port);
   reg_i_instr_2_reg_3_inst : dff port map( d => n48, gclk => clk, rnot => n43,
                           q => reg_i_instr_2_3_port);
   reg_i_instr_3_reg_3_inst : dff port map( d => n52, gclk => clk, rnot => n42,
                           q => reg_i_instr_3_3_port);
   reg_i_instr_2_reg_2_inst : dff port map( d => n49, gclk => clk, rnot => n41,
                           q => reg_i_instr_2_2_port);
   reg_i_instr_3_reg_2_inst : dff port map( d => N15, gclk => clk, rnot => n40,
                           q => reg_i_instr_3_2_port);
   reg_i_instr_2_reg_1_inst : dff port map( d => n50, gclk => clk, rnot => n39,
                           q => reg_i_instr_2_1_port);
   reg_i_instr_3_reg_1_inst : dff port map( d => N14, gclk => clk, rnot => n38,
                           q => reg_i_instr_3_1_port);
   reg_i_instr_2_reg_0_inst : dff port map( d => n51, gclk => clk, rnot => n37,
                           q => reg_i_instr_2_0_port);
   reg_i_instr_3_reg_0_inst : dff port map( d => N13, gclk => clk, rnot => n36,
                           q => reg_i_instr_3_0_port);
   reg_i_data_a_1_reg_3_inst : dff port map( d => n84, gclk => clk, rnot => n35
                           , q => reg_i_data_a_1_3_port);
   reg_i_data_a_1_reg_2_inst : dff port map( d => n83, gclk => clk, rnot => n34
                           , q => reg_i_data_a_1_2_port);
   reg_i_data_a_1_reg_1_inst : dff port map( d => n82, gclk => clk, rnot => n33
                           , q => reg_i_data_a_1_1_port);
   reg_i_data_a_1_reg_0_inst : dff port map( d => n81, gclk => clk, rnot => n32
                           , q => reg_i_data_a_1_0_port);
   reg_i_data_b_1_reg_3_inst : dff port map( d => n88, gclk => clk, rnot => n31
                           , q => reg_i_data_b_1_3_port);
   reg_i_data_b_1_reg_2_inst : dff port map( d => n87, gclk => clk, rnot => n30
                           , q => reg_i_data_b_1_2_port);
   reg_i_data_b_1_reg_1_inst : dff port map( d => n86, gclk => clk, rnot => n29
                           , q => reg_i_data_b_1_1_port);
   reg_i_data_b_1_reg_0_inst : dff port map( d => n85, gclk => clk, rnot => n28
                           , q => reg_i_data_b_1_0_port);
   reg_i_data_carry_1_reg : dff port map( d => n89, gclk => clk, rnot => n27, q
                           => reg_i_data_carry_1);
   reg_i_data_a_2_reg_3_inst : dff port map( d => n56_port, gclk => clk, rnot 
                           => n26, q => reg_i_data_a_2_3_port);
   reg_i_data_a_2_reg_2_inst : dff port map( d => n57_port, gclk => clk, rnot 
                           => n25, q => reg_i_data_a_2_2_port);
   reg_i_data_a_2_reg_1_inst : dff port map( d => n58_port, gclk => clk, rnot 
                           => n24, q => reg_i_data_a_2_1_port);
   reg_i_data_a_2_reg_0_inst : dff port map( d => n59_port, gclk => clk, rnot 
                           => n23, q => reg_i_data_a_2_0_port);
   reg_i_data_b_2_reg_3_inst : dff port map( d => n60, gclk => clk, rnot => n22
                           , q => reg_i_data_b_2_3_port);
   reg_i_data_b_2_reg_2_inst : dff port map( d => n61, gclk => clk, rnot => n21
                           , q => reg_i_data_b_2_2_port);
   reg_i_data_b_2_reg_1_inst : dff port map( d => n62, gclk => clk, rnot => n20
                           , q => reg_i_data_b_2_1_port);
   reg_i_data_b_2_reg_0_inst : dff port map( d => n63, gclk => clk, rnot => n19
                           , q => reg_i_data_b_2_0_port);
   reg_i_data_carry_2_reg : dff port map( d => n64, gclk => clk, rnot => n18, q
                           => reg_i_data_carry_2);
   reg_i_data_carry_3_reg : dff port map( d => n73, gclk => clk, rnot => n17, q
                           => reg_i_data_carry_3);
   reg_i_data_a_3_reg_3_inst : dff port map( d => n65, gclk => clk, rnot => n16
                           , q => reg_i_data_a_3_3_port);
   reg_i_data_a_3_reg_2_inst : dff port map( d => n66, gclk => clk, rnot => 
                           n15_port, q => reg_i_data_a_3_2_port);
   reg_i_data_a_3_reg_1_inst : dff port map( d => n67, gclk => clk, rnot => 
                           n14_port, q => reg_i_data_a_3_1_port);
   reg_i_data_a_3_reg_0_inst : dff port map( d => n68, gclk => clk, rnot => 
                           n13_port, q => reg_i_data_a_3_0_port);
   reg_i_data_b_3_reg_3_inst : dff port map( d => n69, gclk => clk, rnot => n12
                           , q => reg_i_data_b_3_3_port);
   reg_i_data_b_3_reg_2_inst : dff port map( d => n70, gclk => clk, rnot => n11
                           , q => reg_i_data_b_3_2_port);
   reg_i_data_b_3_reg_1_inst : dff port map( d => n71, gclk => clk, rnot => n10
                           , q => reg_i_data_b_3_1_port);
   reg_i_data_b_3_reg_0_inst : dff port map( d => n72, gclk => clk, rnot => n9,
                           q => reg_i_data_b_3_0_port);
   reg_valid_reg : dff port map( d => N45, gclk => clk, rnot => n8, q => 
                           o_valid_port);
   o_data_comp_reg_0_inst : dff port map( d => N59, gclk => clk, rnot => n6, q 
                           => o_data_comp(0));
   o_data_c_reg_3_inst : dff port map( d => N57, gclk => clk, rnot => n5, q => 
                           o_data_c(3));
   o_data_c_reg_2_inst : dff port map( d => N56, gclk => clk, rnot => n4, q => 
                           o_data_c(2));
   o_data_c_reg_1_inst : dff port map( d => N55, gclk => clk, rnot => n3, q => 
                           o_data_c(1));
   o_data_c_reg_0_inst : dff port map( d => N54, gclk => clk, rnot => n2, q => 
                           o_data_c(0));
   o_data_carry_reg : dff port map( d => N58, gclk => clk, rnot => n1, q => 
                           o_data_carry);
   n1 <= '1';
   n2 <= '1';
   n3 <= '1';
   n4 <= '1';
   n5 <= '1';
   n6 <= '1';
   n8 <= '1';
   n9 <= '1';
   n10 <= '1';
   n11 <= '1';
   n12 <= '1';
   n13_port <= '1';
   n14_port <= '1';
   n15_port <= '1';
   n16 <= '1';
   n17 <= '1';
   n18 <= '1';
   n19 <= '1';
   n20 <= '1';
   n21 <= '1';
   n22 <= '1';
   n23 <= '1';
   n24 <= '1';
   n25 <= '1';
   n26 <= '1';
   n27 <= '1';
   n28 <= '1';
   n29 <= '1';
   n30 <= '1';
   n31 <= '1';
   n32 <= '1';
   n33 <= '1';
   n34 <= '1';
   n35 <= '1';
   n36 <= '1';
   n37 <= '1';
   n38 <= '1';
   n39 <= '1';
   n40 <= '1';
   n41 <= '1';
   n42 <= '1';
   n43 <= '1';
   n44 <= '1';
   n45_port <= '1';
   n46 <= '1';
   n47 <= '1';
   U50 : inv port map( inb => n130, outb => n48);
   U51 : inv port map( inb => n131, outb => n49);
   U52 : inv port map( inb => n132, outb => n50);
   U53 : inv port map( inb => n95, outb => n51);
   U54 : inv port map( inb => n129, outb => n52);
   U55 : inv port map( inb => reg_i_instr_2_2_port, outb => n53);
   U56 : inv port map( inb => reg_i_instr_2_1_port, outb => n54_port);
   U57 : inv port map( inb => reg_i_instr_2_0_port, outb => n55_port);
   U58 : inv port map( inb => n116, outb => n56_port);
   U59 : inv port map( inb => n117, outb => n57_port);
   U60 : inv port map( inb => n118, outb => n58_port);
   U61 : inv port map( inb => n119, outb => n59_port);
   U62 : inv port map( inb => n112, outb => n60);
   U63 : inv port map( inb => n113, outb => n61);
   U64 : inv port map( inb => n114, outb => n62);
   U65 : inv port map( inb => n115, outb => n63);
   U66 : inv port map( inb => n111, outb => n64);
   U67 : inv port map( inb => n107, outb => n65);
   U68 : inv port map( inb => n108, outb => n66);
   U69 : inv port map( inb => n109, outb => n67);
   U70 : inv port map( inb => n110, outb => n68);
   U71 : inv port map( inb => n103, outb => n69);
   U72 : inv port map( inb => n104, outb => n70);
   U73 : inv port map( inb => n105, outb => n71);
   U74 : inv port map( inb => n106, outb => n72);
   U75 : inv port map( inb => n102, outb => n73);
   U76 : inv port map( inb => sig_data_comp_0_port, outb => n74);
   U78 : inv port map( inb => sig_data_carry, outb => n76);
   U79 : inv port map( inb => sig_data_c_0_port, outb => n77);
   U80 : inv port map( inb => sig_data_c_1_port, outb => n78);
   U81 : inv port map( inb => sig_data_c_2_port, outb => n79);
   U82 : inv port map( inb => sig_data_c_3_port, outb => n80);
   U83 : inv port map( inb => n128, outb => n81);
   U84 : inv port map( inb => n127, outb => n82);
   U85 : inv port map( inb => n126, outb => n83);
   U86 : inv port map( inb => n125, outb => n84);
   U87 : inv port map( inb => n124, outb => n85);
   U88 : inv port map( inb => n123, outb => n86);
   U89 : inv port map( inb => n122, outb => n87);
   U90 : inv port map( inb => n121, outb => n88);
   U91 : inv port map( inb => n120, outb => n89);
   U92 : inv port map( inb => n100, outb => n90);
   U93 : inv port map( inb => n99, outb => n91);
   U94 : inv port map( inb => n97, outb => n92);
   U95 : inv port map( inb => n96, outb => n93);
   U96 : inv port map( inb => rst, outb => n94);
   U97 : nand2 port map( a => n138, b => reg_i_instr_1_0_port, outb => n95);
   U98 : nand2 port map( a => n138, b => i_ctrl(3), outb => n96);
   U99 : nand2 port map( a => n138, b => i_ctrl(2), outb => n97);
   U101 : nand2 port map( a => n138, b => i_ctrl(1), outb => n99);
   U102 : nor2 port map( a => n74, b => n98, outb => N59);
   U103 : nor2 port map( a => n76, b => n98, outb => N58);
   U104 : nor2 port map( a => n80, b => n98, outb => N57);
   U105 : nor2 port map( a => n79, b => n98, outb => N56);
   U106 : nor2 port map( a => n78, b => n98, outb => N55);
   U107 : nor2 port map( a => n77, b => n98, outb => N54);
   U108 : nand2 port map( a => o_valid_port, b => n138, outb => n98);
   U109 : nand2 port map( a => n138, b => i_ctrl(0), outb => n100);
   U110 : nor2 port map( a => reg_i_instr_2_3_port, b => n101, outb => N45);
   U111 : nor3 port map( a => N13, b => N15, c => N14, outb => n101);
   U112 : nand2 port map( a => n138, b => reg_i_data_carry_2, outb => n102);
   U113 : nand2 port map( a => n138, b => reg_i_data_b_2_3_port, outb => n103);
   U114 : nand2 port map( a => n138, b => reg_i_data_b_2_2_port, outb => n104);
   U115 : nand2 port map( a => n135, b => reg_i_data_b_2_1_port, outb => n105);
   U116 : nand2 port map( a => n136, b => reg_i_data_b_2_0_port, outb => n106);
   U117 : nand2 port map( a => n94, b => reg_i_data_a_2_3_port, outb => n107);
   U118 : nand2 port map( a => n135, b => reg_i_data_a_2_2_port, outb => n108);
   U119 : nand2 port map( a => n136, b => reg_i_data_a_2_1_port, outb => n109);
   U120 : nand2 port map( a => n94, b => reg_i_data_a_2_0_port, outb => n110);
   U121 : nand2 port map( a => n135, b => reg_i_data_carry_1, outb => n111);
   U122 : nand2 port map( a => n136, b => reg_i_data_b_1_3_port, outb => n112);
   U123 : nand2 port map( a => n94, b => reg_i_data_b_1_2_port, outb => n113);
   U124 : nand2 port map( a => n135, b => reg_i_data_b_1_1_port, outb => n114);
   U125 : nand2 port map( a => n136, b => reg_i_data_b_1_0_port, outb => n115);
   U126 : nand2 port map( a => n94, b => reg_i_data_a_1_3_port, outb => n116);
   U127 : nand2 port map( a => n135, b => reg_i_data_a_1_2_port, outb => n117);
   U128 : nand2 port map( a => n136, b => reg_i_data_a_1_1_port, outb => n118);
   U129 : nand2 port map( a => n133, b => reg_i_data_a_1_0_port, outb => n119);
   U130 : nand2 port map( a => n134, b => i_data_carry, outb => n120);
   U131 : nand2 port map( a => n137, b => i_data_b(3), outb => n121);
   U132 : nand2 port map( a => n133, b => i_data_b(2), outb => n122);
   U133 : nand2 port map( a => n134, b => i_data_b(1), outb => n123);
   U134 : nand2 port map( a => n137, b => i_data_b(0), outb => n124);
   U135 : nand2 port map( a => n133, b => i_data_a(3), outb => n125);
   U136 : nand2 port map( a => n134, b => i_data_a(2), outb => n126);
   U137 : nand2 port map( a => n137, b => i_data_a(1), outb => n127);
   U138 : nand2 port map( a => n133, b => i_data_a(0), outb => n128);
   U139 : nand2 port map( a => n134, b => reg_i_instr_2_3_port, outb => n129);
   U140 : nor2 port map( a => n53, b => rst, outb => N15);
   U141 : nor2 port map( a => n54_port, b => rst, outb => N14);
   U142 : nor2 port map( a => n55_port, b => rst, outb => N13);
   U143 : nand2 port map( a => n137, b => reg_i_instr_1_3_port, outb => n130);
   U144 : nand2 port map( a => n133, b => reg_i_instr_1_2_port, outb => n131);
   U145 : nand2 port map( a => n134, b => reg_i_instr_1_1_port, outb => n132);
   o_data_comp(1) <= '0';
   U147 : inv port map( inb => rst, outb => n133);
   U148 : inv port map( inb => rst, outb => n134);
   U149 : inv port map( inb => rst, outb => n135);
   U150 : inv port map( inb => rst, outb => n136);
   U151 : inv port map( inb => rst, outb => n137);
   U152 : inv port map( inb => rst, outb => n138);

end SYN_rtl;
