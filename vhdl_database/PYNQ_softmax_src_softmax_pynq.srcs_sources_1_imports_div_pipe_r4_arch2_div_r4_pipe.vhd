-----------------------------------------------------------------------
---- Pipelined radix 4 Divisor based on Arch2 (half arch)
---- A, and B naturals (non negative integers) with XBITS and YBITS width
---- there is no restriction XBITS >= YBITS. 
---- Return quotient Q of XBITS and remainder R of NBITS
---- GRAIN defines the amount of bits computed at each cycle. 
----
---- The cicruict captures operands at each cycle 
---- The algorithm needs XBITS/GRAIN/DEPTH + 1 cylcles to calculate the quotient 
---- and remainder (Latency). Its posible to obtain the result one cycle before.
---- GRAIN = 2 for that radix 4 divider
---- DEPTH (logic depth) every how many basic cell we register.
---- DEPTH = 1 maximun pipeline
----------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use work.mypackage.all;

entity div_r4_pipe is
  port (
      A: in STD_LOGIC_VECTOR (XBITS-1 downto 0);
      B: in STD_LOGIC_VECTOR (YBITS-1 downto 0);
      clk: in STD_LOGIC;
      Q: out STD_LOGIC_VECTOR (XBITS-1 downto 0);
      R: out STD_LOGIC_VECTOR (YBITS-1 downto 0)
   );
end div_r4_pipe;

architecture simple_arch of div_r4_pipe is

  component cond_adder is
      port (
        op_a: in STD_LOGIC_VECTOR (YBITS-1 downto 0);
        op_b: in STD_LOGIC_VECTOR (YBITS-1 downto 0);
        sel: in STD_LOGIC;
        outp: out STD_LOGIC_VECTOR (YBITS-1 downto 0)
       );
  end component;

  component nr_r4_half_cell is
    port (
        op_r: in STD_LOGIC_VECTOR (YBITS downto 0);
        op_y: in STD_LOGIC_VECTOR (YBITS downto 0);
        op_3y: in STD_LOGIC_VECTOR (YBITS+1 downto 0);
        x_1: in STD_LOGIC;
        x_0: in STD_LOGIC;
        n_qneg: out STD_LOGIC_VECTOR (1 downto 0);
        new_r: out STD_LOGIC_VECTOR (YBITS downto 0)
        );
  end component;

type connectionmatrix is array (0 to GRAIN) of STD_LOGIC_VECTOR (YBITS downto 0);
  Signal  iR, reg_Y_rem: STD_LOGIC_VECTOR (YBITS-1 downto 0);
  Signal  iQ: STD_LOGIC_VECTOR (XBITS-1 downto 0);

  type matrix_rem is array (0 to XBITS/GRAIN-1) of STD_LOGIC_VECTOR (YBITS downto 0);
  signal rem_in, rem_out: matrix_rem;
  type matrix_Y is array (0 to XBITS/GRAIN-1) of STD_LOGIC_VECTOR (YBITS downto 0);
  signal reg_Y: matrix_Y;
  type matrix_3Y is array (0 to XBITS/GRAIN-1) of STD_LOGIC_VECTOR (YBITS+1 downto 0);
  signal reg_3Y: matrix_3Y;
  type matrix_X is array (0 to XBITS/GRAIN-1) of STD_LOGIC_VECTOR (XBITS-1 downto 0);
  signal reg_X: matrix_X;
  type matrix_Q is array (0 to XBITS/GRAIN-1) of STD_LOGIC_VECTOR (XBITS-1 downto 0);
  signal reg_Q: matrix_Q;

signal rem_no_adj: STD_LOGIC_VECTOR (YBITS downto 0);

--attribute keep_hierarchy: string;
--attribute keep_hierarchy of low_level_arch: architecture is "yes";
--attribute IOB: string;
--attribute IOB of low_level_arch: architecture is "FALSE";

begin

  FF_0: process (clk)
  begin
  if CLK'event and CLK='1' then  --CLK rising edge 
    reg_Y(0) <= ('0' & B);
    reg_3Y(0) <= ('0' & B) + ('0' & B & '0');
    reg_X(0) <= A; 
    --Q <= not reg_Q(XBITS/GRAIN-1); --ito obtain the result a cycle before
    Q <= iQ; iQ <= not reg_Q(XBITS/GRAIN-1);
    rem_no_adj <= rem_out(XBITS/GRAIN-1);
    reg_Y_rem <= reg_Y(XBITS/GRAIN-1)(YBITS-1 downto 0);
    R <= iR;
  end if;
  end process;


  rem_in(0) <= (others => '0');
  
  g1: for i in 0 to XBITS/GRAIN -1 generate
  cell: nr_r4_half_cell port map( op_r => rem_in(i),
        op_y => reg_Y(i), op_3y => reg_3Y(i),
        x_1 => reg_X(i)(XBITS-1-i*2), x_0 => reg_X(i)(XBITS-2-i*2),
        n_qneg => reg_Q(i)(XBITS-1-i*2 downto XBITS-2-i*2),  new_r => rem_out(i) );
  end generate;
 
  g2: for i in 0 to XBITS/GRAIN-2 generate
    g2c: if (i+1) mod DEPTH /= 0 generate
      rem_in(i+1) <= rem_out(i);
      reg_Y(i+1) <= reg_Y(i); reg_3Y(i+1) <= reg_3Y(i);
      reg_X(i+1) <= reg_X(i); 
      reg_Q(i+1)(XBITS-1 downto XBITS-2-i*2) <= reg_Q(i)(XBITS-1 downto XBITS-2-i*2); 
    end generate;
    g2FF: if (i+1) mod DEPTH = 0 generate
      FFs: process(clk)
      begin
        if CLK'event and CLK='1' then  --CLK rising edge 
          rem_in(i+1) <= rem_out(i);
          reg_Y(i+1) <= reg_Y(i); reg_3Y(i+1) <= reg_3Y(i);
          reg_X(i+1) <= reg_X(i); 
          reg_Q(i+1)(XBITS-1 downto XBITS-2-i*2) <= reg_Q(i)(XBITS-1 downto XBITS-2-i*2); 
        end if;
      end process;
    end generate;
  end generate;

 
-- use this code to obtain the remainder a cycle before
-- final_rem_Adjust: cond_adder port map (op_a => rem_out(XBITS/GRAIN-1)(YBITS-1 downto 0),
--          op_b => reg_Y(XBITS/GRAIN-1)(YBITS-1 downto 0),
--          sel => rem_out(XBITS/GRAIN-1)(YBITS), outp => iR);

  
 final_rem_Adjust: cond_adder port map (op_a => rem_no_adj(YBITS-1 downto 0),
          op_b => reg_Y_rem(YBITS-1 downto 0),
          sel => rem_no_adj(YBITS), outp => iR);


end simple_arch;
