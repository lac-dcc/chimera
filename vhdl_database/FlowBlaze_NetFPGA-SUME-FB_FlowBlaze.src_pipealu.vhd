----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/16/2016 02:28:31 PM
-- Design Name: 
-- Module Name: pipealu - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pipealu is
Port (
    clk : in std_logic;
    reset : in std_logic;
    wea : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    header: in std_logic_vector(431 downto 0);
    instruction: in std_logic_vector(7 downto 0);
    Rina : in STD_LOGIC_VECTOR (31 downto 0);
    Rinb : in STD_LOGIC_VECTOR (31 downto 0);
    Rinc : in STD_LOGIC_VECTOR (31 downto 0);
    
    inGR0 : in STD_LOGIC_VECTOR (31 downto 0);
    inGR1 : in STD_LOGIC_VECTOR (31 downto 0);
    inGR2 : in STD_LOGIC_VECTOR (31 downto 0);
    inGR3 : in STD_LOGIC_VECTOR (31 downto 0);
        
    GR0 : out STD_LOGIC_VECTOR (31 downto 0);
    GR1 : out STD_LOGIC_VECTOR (31 downto 0);
    GR2 : out STD_LOGIC_VECTOR (31 downto 0);
    GR3 : out STD_LOGIC_VECTOR (31 downto 0);
--    GR4 : out STD_LOGIC_VECTOR (31 downto 0);
--    GR5 : out STD_LOGIC_VECTOR (31 downto 0);
--    GR6 : out STD_LOGIC_VECTOR (31 downto 0);
--    GR7 : out STD_LOGIC_VECTOR (31 downto 0);
--    GR8 : out STD_LOGIC_VECTOR (31 downto 0);
--    GR9 : out STD_LOGIC_VECTOR (31 downto 0);
--    GR10 : out STD_LOGIC_VECTOR (31 downto 0);
--    GR11 : out STD_LOGIC_VECTOR (31 downto 0);
--    GR12 : out STD_LOGIC_VECTOR (31 downto 0);
--    GR13 : out STD_LOGIC_VECTOR (31 downto 0);
--    GR14 : out STD_LOGIC_VECTOR (31 downto 0);
--    GR15 : out STD_LOGIC_VECTOR (31 downto 0);
    
    Res3a : out STD_LOGIC_VECTOR (31 downto 0);
    Res3b : out STD_LOGIC_VECTOR (31 downto 0);
    Res3c : out STD_LOGIC_VECTOR (31 downto 0);
    Res3d : out STD_LOGIC_VECTOR (31 downto 0)
    
 );
end pipealu;

architecture Behavioral of pipealu is

signal X1a,X1b,X1c,X1d,X1e,X1f,Y1a,Y1a_temp,Y1b,Y1b_temp,Y1c,Y1c_temp,Y1d,Y1d_temp:STD_LOGIC_VECTOR(31 downto 0); --inputs for first stage ALU

signal X1a_d,X1b_d,X1c_d,X1d_d:STD_LOGIC_VECTOR(31 downto 0); --delayed inputs for first stage ALU
signal X1a_d2,X1b_d2,X1c_d2,X1d_d2:STD_LOGIC_VECTOR(31 downto 0); --doubledelayed inputs for first stage ALU


--,Y1e,Y1f
signal Res1a,Res1b,Res1c,Res1d:STD_LOGIC_VECTOR (31 downto 0); --outputs for first stage ALU
signal X2a,X2b,X2c,X2d,Y2a,Y2b,Y2c,Y2d:STD_LOGIC_VECTOR (31 downto 0); --inputs for second stage ALU
signal Res2a,Res2b,Res2c,Res2d:STD_LOGIC_VECTOR (31 downto 0); --outputs for second stage ALU/DIV
--,Res2e,Res2f
signal X3a,X3b,X3c,X3d,Y3a,Y3b,Y3c,Y3d:STD_LOGIC_VECTOR (31 downto 0); --inputs for third stage ALU

signal Op1ax,Op1ay,Op1ayy:STD_LOGIC_VECTOR (7 downto 0);  
signal Op1bx,Op1by,Op1byy:STD_LOGIC_VECTOR (7 downto 0);  
signal Op1cx,Op1cy,Op1cyy:STD_LOGIC_VECTOR (7 downto 0);  
signal Op1dx,Op1dy,Op1dyy:STD_LOGIC_VECTOR (7 downto 0);
signal Op1ac,Op1bc,Op1cc,Op1dc:STD_LOGIC_VECTOR (7 downto 0);  
--signal Op1ex,Op1ey:STD_LOGIC_VECTOR (5 downto 0);  
--signal Op1fx,Op1fy:STD_LOGIC_VECTOR (5 downto 0);  

signal Op2ax,Op2ay:STD_LOGIC_VECTOR (2 downto 0);  
signal Op2bx,Op2by:STD_LOGIC_VECTOR (2 downto 0);  
signal Op2cx,Op2cy:STD_LOGIC_VECTOR (2 downto 0);  
signal Op2dx,Op2dy:STD_LOGIC_VECTOR (2 downto 0);
signal Op2ac,Op2bc,Op2cc,Op2dc:STD_LOGIC_VECTOR (7 downto 0);

signal Op3ax,Op3ay:STD_LOGIC_VECTOR (2 downto 0);  
signal Op3bx,Op3by:STD_LOGIC_VECTOR (2 downto 0);  
signal Op3cx,Op3cy:STD_LOGIC_VECTOR (2 downto 0);  
signal Op3dx,Op3dy:STD_LOGIC_VECTOR (2 downto 0);
signal Op3ac,Op3bc,Op3cc,Op3dc:STD_LOGIC_VECTOR (7 downto 0);
signal Op3GR0,Op3GR1,Op3GR2,Op3GR3:STD_LOGIC_VECTOR (7 downto 0);
signal aluGR0,aluGR1,aluGR2,aluGR3:STD_LOGIC_VECTOR (31 downto 0);



signal extented_header: STD_LOGIC_VECTOR (655 downto 0);
signal extented_header_d: STD_LOGIC_VECTOR (655 downto 0); 
signal extented_header_dd: STD_LOGIC_VECTOR (655 downto 0);    
signal command : STD_LOGIC_VECTOR(511 DOWNTO 0);

component blk_mem_gen_0 IS
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    clkb : IN STD_LOGIC;
    enb : IN STD_LOGIC;
    addrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
  );
END component;



begin

extented_header <= inGR3 & inGR2 & inGR1 & inGR0 & Rinc & Rinb & Rina & header;
shexte_head_d:  entity work.shreg generic map (1,656) port map (clk,extented_header,extented_header_d);
shexte_head_dd:  entity work.shreg generic map (2,656) port map (clk,extented_header,extented_header_dd);
---- command memory
--mem1: blk_mem_gen_0 port map(
--      clk, --clka : IN STD_LOGIC;
--      vdd, --ena : IN STD_LOGIC;
--      wea_wrapper_slv, --wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--      addra, --addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
--      dina, --dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--      clk, --clkb : IN STD_LOGIC;
--      vdd, --enb : IN STD_LOGIC;
--      instruction, --addrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
--      command    --doutb : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
--    );
    
    
mem1: entity work.ram256x512 
    generic map (init_file => "./init_pipe_1.mif")
    port map(
          clk,
          wea,
          addra, -- : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
          dina,  -- : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
          instruction, -- addrb  IN STD_LOGIC_VECTOR(7 DOWNTO 0);
          command      -- doutb : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
       );
    
        

-- command to stage 1 op
-- 4x 32bit instructions (16B)
sh1_1:  entity work.shreg generic map (1,8) port map (clk,command(7  downto  0),Op1ax);
sh1_2:  entity work.shreg generic map (1,8) port map (clk,command(15 downto  8),Op1ay);
sh1_3:  entity work.shreg generic map (1,8) port map (clk,command(23 downto 16),Op1ayy);
sh1_4:  entity work.shreg generic map (1,8) port map (clk,command(31 downto 24),Op1ac);

sh1_5:  entity work.shreg generic map (1,8) port map (clk,command(39 downto 32),Op1bx);
sh1_6:  entity work.shreg generic map (1,8) port map (clk,command(47 downto 40),Op1by);
sh1_7:  entity work.shreg generic map (1,8) port map (clk,command(55 downto 48),Op1byy);
sh1_8:  entity work.shreg generic map (1,8) port map (clk,command(63 downto 56),Op1bc);


sh1_9:   entity work.shreg generic map (1,8) port map (clk,command(71 downto 64),Op1cx);
sh1_10:  entity work.shreg generic map (1,8) port map (clk,command(79 downto 72),Op1cy);
sh1_11:  entity work.shreg generic map (1,8) port map (clk,command(87 downto 80),Op1cyy);
sh1_12:  entity work.shreg generic map (1,8) port map (clk,command(95 downto 88),Op1cc);

sh1_13: entity work.shreg generic map (1,8) port map (clk,command(103 downto 96),Op1dx);
sh1_14: entity work.shreg generic map (1,8) port map (clk,command(111 downto 104),Op1dy);
sh1_15: entity work.shreg generic map (1,8) port map (clk,command(119 downto 112),Op1dyy);
sh1_16: entity work.shreg generic map (1,8) port map (clk,command(127 downto 120),Op1dc);
                                                                                     
--sh1_13: entity work.shreg generic map (1,6) port map (clk,command(101 downto 96),Op1ex);
--sh1_14: entity work.shreg generic map (1,6) port map (clk,command(109 downto 104),Op1ey);

--sh1_15: entity work.shreg generic map (1,6) port map (clk,command(117 downto 112),Op1fx);
--sh1_16: entity work.shreg generic map (1,6) port map (clk,command(125 downto 120),Op1fy);
     
-- command to stage 2 op
-- 8x3 (sel op) + 4x8 (4 ALU) = 56  (8B)
sh2_1:  entity work.shreg generic map (2,3) port map (clk,command(130 downto 128),Op2ax);
sh2_2:  entity work.shreg generic map (2,3) port map (clk,command(133 downto 131),Op2ay);
sh2_3:  entity work.shreg generic map (2,8) port map (clk,command(143 downto 136),Op2ac);
                                                                                       
sh2_4:  entity work.shreg generic map (2,3) port map (clk,command(146 downto 144),Op2bx);
sh2_5:  entity work.shreg generic map (2,3) port map (clk,command(149 downto 147),Op2by);
sh2_6:  entity work.shreg generic map (2,8) port map (clk,command(159 downto 152),Op2bc);
                                                                                       
sh2_7:  entity work.shreg generic map (2,3) port map (clk,command(162 downto 160),Op2cx);
sh2_8:  entity work.shreg generic map (2,3) port map (clk,command(165 downto 163),Op2cy);
sh2_9:  entity work.shreg generic map (2,8) port map (clk,command(175 downto 168),Op2cc);
                                                                                       
sh2_10: entity work.shreg generic map (2,3) port map (clk,command(178 downto 176),Op2dx);
sh2_11: entity work.shreg generic map (2,3) port map (clk,command(181 downto 179),Op2dy);
sh2_12: entity work.shreg generic map (2,8) port map (clk,command(191 downto 184),Op2dc);
                                                                                       
-- command to stage 3 op                                                               
-- 8x3 (sel op) + 4x8 (4 ALU) = 56  (8B)                                               
sh3_1:  entity work.shreg generic map (3,3) port map (clk,command(194  downto 192),Op3ax);
sh3_2:  entity work.shreg generic map (3,3) port map (clk,command(197  downto 195),Op3ay);
sh3_3:  entity work.shreg generic map (3,8) port map (clk,command(207  downto 200),Op3ac);
                                                                                       
sh3_4:  entity work.shreg generic map (3,3) port map (clk,command(210  downto 208),Op3bx);
sh3_5:  entity work.shreg generic map (3,3) port map (clk,command(213  downto 211),Op3by);
sh3_6:  entity work.shreg generic map (3,8) port map (clk,command(223  downto 216),Op3bc);
                                                                                       
sh3_7:  entity work.shreg generic map (3,3) port map (clk,command(226  downto 224),Op3cx);
sh3_8:  entity work.shreg generic map (3,3) port map (clk,command(229  downto 227),Op3cy);
sh3_9:  entity work.shreg generic map (3,8) port map (clk,command(239  downto 232),Op3cc);
                                                                                       
sh3_10: entity work.shreg generic map (3,3) port map (clk,command(242  downto 240),Op3dx);
sh3_11: entity work.shreg generic map (3,3) port map (clk,command(245  downto 243),Op3dy);
sh3_12: entity work.shreg generic map (3,8) port map (clk,command(255  downto 248),Op3dc);

sh3_13: entity work.shreg generic map (3,8) port map (clk,command(263  downto 256),Op3GR0);
sh3_14: entity work.shreg generic map (3,8) port map (clk,command(271  downto 264),Op3GR1);
sh3_15: entity work.shreg generic map (3,8) port map (clk,command(279  downto 272),Op3GR2);
sh3_16: entity work.shreg generic map (3,8) port map (clk,command(287  downto 280),Op3GR3);



-- first stage: 12x6 (sel op) + 4x8 (4 ALU) = 104 (16B)
-- select from the header to provide inputs for the alus/divs and compute first stage alu outputs  

SAM1aX: entity work.sam32 port map(extented_header_dd,Op1ax(6 downto 0),"11",X1a);
SAM1aY: entity work.sam32 port map(extented_header_dd,Op1ay(6 downto 0),"11",Y1a_temp); 

Y1a<=Y1a_temp when Op1ac(7)='0' else 
     x"0000" & Op1ay & Op1ayy;


SAM1bX: entity work.sam32 port map(extented_header_dd,Op1bx(6 downto 0),"11",X1b);
SAM1bY: entity work.sam32 port map(extented_header_dd,Op1by(6 downto 0),"11",Y1b_temp); 
Y1b<=Y1b_temp when Op1bc(7)='0'else
     x"0000" & Op1by & Op1byy;

SAM1cX: entity work.sam32 port map(extented_header_dd,Op1cx(6 downto 0),"11",X1c);
SAM1cY: entity work.sam32 port map(extented_header_dd,Op1cy(6 downto 0),"11",Y1c_temp);
Y1c<=Y1c_temp when Op1cc(7)='0'else
     x"0000" & Op1cy & Op1cyy;


SAM1dX: entity work.sam32 port map(extented_header_dd,Op1dx(6 downto 0),"11",X1d);
SAM1dY: entity work.sam32 port map(extented_header_dd,Op1dy(6 downto 0),"11",Y1d_temp); 

Y1d<=Y1d_temp when Op1dc(7)='0'else
     x"0000" & Op1dy & Op1dyy;


--SAM1eX: entity work.sam32 port map(extented_header,Op1ex,"01",X1e);
--SAM1eY: entity work.sam32 port map(extented_header,Op1ey,"00",Y1e);
--SAM1fX: entity work.sam32 port map(extented_header,Op1fx,"01",X1f);
--SAM1fY: entity work.sam32 port map(extented_header,Op1fy,"00",Y1f);
  
ALU1a:  entity work.alu_c port map(clk,reset,X1a,Y1a,Op1ac(6 downto 0),Res1a);
ALU1b:  entity work.alu_c port map(clk,reset,X1b,Y1b,Op1bc(6 downto 0),Res1b);
ALU1c:  entity work.alu_c port map(clk,reset,X1c,Y1c,Op1cc(6 downto 0),Res1c);
ALU1d:  entity work.alu_c port map(clk,reset,X1d,Y1d,Op1dc(6 downto 0),Res1d);



shX1a:  entity work.shreg generic map (1,32) port map (clk,X1a,X1a_d);
shX1b:  entity work.shreg generic map (1,32) port map (clk,X1b,X1b_d);
shX1c:  entity work.shreg generic map (1,32) port map (clk,X1c,X1c_d);
shX1d:  entity work.shreg generic map (1,32) port map (clk,X1d,X1d_d);

shX2a:  entity work.shreg generic map (1,32) port map (clk,X1a_d,X1a_d2);
shX2b:  entity work.shreg generic map (1,32) port map (clk,X1b_d,X1b_d2);
shX2c:  entity work.shreg generic map (1,32) port map (clk,X1c_d,X1c_d2);
shX2d:  entity work.shreg generic map (1,32) port map (clk,X1d_d,X1d_d2);

    
-- second stage: 8x3 (sel op) + 4x8 (4 ALU) =  56 (8B)
-- select from the first stage inputs/outputs and compute second stage alus outputs and divs outputs    

MX2a: entity work.mux3 port map(Res1a,Res1b,Res1c,Res1d,X1a_d,X1b_d,X1c_d,X1d_d,X2a,Op2ax);
MY2a: entity work.mux3 port map(Res1a,Res1b,Res1c,Res1d,X1a_d,X1b_d,X1c_d,X1d_d,Y2a,Op2ay);
MX2b: entity work.mux3 port map(Res1a,Res1b,Res1c,Res1d,X1a_d,X1b_d,X1c_d,X1d_d,X2b,Op2bx);
MY2b: entity work.mux3 port map(Res1a,Res1b,Res1c,Res1d,X1a_d,X1b_d,X1c_d,X1d_d,Y2b,Op2by);
MX2c: entity work.mux3 port map(Res1a,Res1b,Res1c,Res1d,X1a_d,X1b_d,X1c_d,X1d_d,X2c,Op2cx);
MY2c: entity work.mux3 port map(Res1a,Res1b,Res1c,Res1d,X1a_d,X1b_d,X1c_d,X1d_d,Y2c,Op2cy);
MX2d: entity work.mux3 port map(Res1a,Res1b,Res1c,Res1d,X1a_d,X1b_d,X1c_d,X1d_d,X2d,Op2dx);
MY2d: entity work.mux3 port map(Res1a,Res1b,Res1c,Res1d,X1a_d,X1b_d,X1c_d,X1d_d,Y2d,Op2dy);

ALU2a:  entity work.alu_c port map(clk,reset,X2a,Y2a,Op2ac(6 downto 0),Res2a);
ALU2b:  entity work.alu_c port map(clk,reset,X2b,Y2b,Op2bc(6 downto 0),Res2b);
ALU2c:  entity work.alu_c port map(clk,reset,X2c,Y2c,Op2cc(6 downto 0),Res2c);
ALU2d:  entity work.alu_c port map(clk,reset,X2d,Y2d,Op2dc(6 downto 0),Res2d);
--Res2e(31 downto 24) <=x"00";
--div2e: entity work.div_gen_0 port map(clk,'1',Y1e(7 downto 0),'1',X1e(15 downto 0),open,Res2e(23 downto 0));
--Res2e <=Y1e;
--Res2f(31 downto 24) <=x"00";
--div2f: entity work.div_gen_0 port map(clk,'1',Y1f(7 downto 0),'1',X1f(15 downto 0),open,Res2f(23 downto 0));
--Res2f <=Y1f;


-- third stage: 8x3 (sel op) + 4x8 (4 ALU) = 56 (8B)
-- select from the second stage inputs/outputs and compute third stage alus outputs    

MX3a: entity work.mux3 port map(Res2a,Res2b,Res2c,Res2d,X1a_d2,X1b_d2,X1c_d2,X1d_d2,X3a,Op3ax);
MY3a: entity work.mux3 port map(Res2a,Res2b,Res2c,Res2d,X1a_d2,X1b_d2,X1c_d2,X1d_d2,Y3a,Op3ay);
MX3b: entity work.mux3 port map(Res2a,Res2b,Res2c,Res2d,X1a_d2,X1b_d2,X1c_d2,X1d_d2,X3b,Op3bx); 
MY3b: entity work.mux3 port map(Res2a,Res2b,Res2c,Res2d,X1a_d2,X1b_d2,X1c_d2,X1d_d2,Y3b,Op3by); 
MX3c: entity work.mux3 port map(Res2a,Res2b,Res2c,Res2d,X1a_d2,X1b_d2,X1c_d2,X1d_d2,X3c,Op3cx); 
MY3c: entity work.mux3 port map(Res2a,Res2b,Res2c,Res2d,X1a_d2,X1b_d2,X1c_d2,X1d_d2,Y3c,Op3cy); 
MX3d: entity work.mux3 port map(Res2a,Res2b,Res2c,Res2d,X1a_d2,X1b_d2,X1c_d2,X1d_d2,X3d,Op3dx); 
MY3d: entity work.mux3 port map(Res2a,Res2b,Res2c,Res2d,X1a_d2,X1b_d2,X1c_d2,X1d_d2,Y3d,Op3dy); 

ALU3a:  entity work.alu_c port map(clk,reset,X3a,Y3a,Op3ac(6 downto 0),Res3a);
ALU3b:  entity work.alu_c port map(clk,reset,X3b,Y3b,Op3bc(6 downto 0),Res3b);
ALU3c:  entity work.alu_c port map(clk,reset,X3c,Y3c,Op3cc(6 downto 0),Res3c);
ALU3d:  entity work.alu_c port map(clk,reset,X3d,Y3d,Op3dc(6 downto 0),Res3d);

ALU3GR0: entity work.alu_c port map(clk,reset,X3a,Y3a,Op3GR0(6 downto 0),aluGR0);
ALU3GR1: entity work.alu_c port map(clk,reset,X3b,Y3b,Op3GR1(6 downto 0),aluGR1);
ALU3GR2: entity work.alu_c port map(clk,reset,X3c,Y3c,Op3GR2(6 downto 0),aluGR2);
ALU3GR3: entity work.alu_c port map(clk,reset,X3d,Y3d,Op3GR3(6 downto 0),aluGR3);

GR0<= inGR0 when Op3GR0(7)='0' else
     aluGR0;
GR1<= inGR1 when Op3GR1(7)='0' else
      aluGR1;
GR2<= inGR2 when Op3GR2(7)='0' else
      aluGR2;
GR3<= inGR3 when Op3GR3(7)='0' else
      aluGR3;



end Behavioral;
