
package DWpackages is

end;


-- pragma translate_off

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
library grlib;
use grlib.stdlib.all;

entity DW_mult_pipe is
  generic (
    a_width       : positive;                      -- multiplier word width
    b_width       : positive;                      -- multiplicand word width
    num_stages    : positive := 2;                 -- number of pipeline stages
    stall_mode    : natural range 0 to 1 := 1;     -- '0': non-stallable; '1': stallable
    rst_mode      : natural range 0 to 2  := 1;    -- '0': none; '1': async; '2': sync
    op_iso_mode   : natural range 0 to 4  := 0);   -- '0': apply Power Compiler user setting; '1': noop; '2': and; '3': or; '4' preferred style...'and'
  port (
    clk     : in  std_logic;          -- register clock
    rst_n   : in  std_logic;          -- register reset
    en      : in  std_logic;          -- register enable
    tc      : in  std_logic;          -- '0' : unsigned, '1' : signed
    a       : in  std_logic_vector(a_width-1 downto 0);  -- multiplier
    b       : in  std_logic_vector(b_width-1 downto 0);  -- multiplicand
    product : out std_logic_vector(a_width+b_width-1 downto 0));  -- product
end ;

architecture simple of DW_mult_pipe is

subtype resw is  std_logic_vector(A_width+B_width-1 downto 0);
type pipet is array (num_stages-1 downto 1) of resw;
signal p_i : pipet;
signal prod :  resw;
  
begin

  comb : process(A, B, TC)
  begin 
    if notx(A) and notx(B) and notx(tc) then
      if TC = '1' then
        prod <= signed(A) * signed(B);
      else
        prod <= unsigned(A) * unsigned(B);
      end if;
    else
      prod <= (others => 'X');
    end if;
  end process;

  w2 : if num_stages = 2 generate
    reg : process(clk)
    begin
      if rising_edge(clk) then
        if (stall_mode = 0) or (en = '1') then
          p_i(1) <= prod;
        end if;
      end if;
    end process;
  end generate;

  w3 : if num_stages > 2 generate
    reg : process(clk)
    begin
      if rising_edge(clk) then
        if (stall_mode = 0) or (en = '1') then
          p_i <= p_i(num_stages-2 downto 1) & prod;
        end if;
      end if;
    end process;
  end generate;

  product <= p_i(num_stages-1);
end;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
library grlib;
use grlib.stdlib.all;

entity DW02_mult is
   generic( A_width: NATURAL;		-- multiplier wordlength
            B_width: NATURAL);		-- multiplicand wordlength
   port(A : in std_logic_vector(A_width-1 downto 0);  
        B : in std_logic_vector(B_width-1 downto 0);
        TC : in std_logic;		-- signed -> '1', unsigned -> '0'
        PRODUCT : out std_logic_vector(A_width+B_width-1 downto 0));
end DW02_mult;


architecture behav of DW02_mult is
begin

  comb : process(A, B, TC)
  begin 
    if notx(A) and notx(B) and notx(TC) then
      if TC = '1' then
        product <= signed(A) * signed(B);
      else
        product <= unsigned(A) * unsigned(B);
      end if;
    else
      product <= (others => 'X');
    end if;
  end process;
  
end;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
library grlib;
use grlib.stdlib.all;

entity DW02_mult_2_stage is
  generic( A_width: POSITIVE;		
           B_width: POSITIVE);		
   port(A : in std_logic_vector(A_width-1 downto 0);  
        B : in std_logic_vector(B_width-1 downto 0);
        TC : in std_logic;		
        CLK : in std_logic;          
        PRODUCT : out std_logic_vector(A_width+B_width-1 downto 0));
end;


architecture behav of DW02_mult_2_stage is

  signal P_i : std_logic_vector(A_width+B_width-1 downto 0);
  
begin

  comb : process(A, B, TC)
  begin 
    if notx(A) and notx(B) then
      if TC = '1' then
        P_i <= signed(A) * signed(B);
      else
        P_i <= unsigned(A) * unsigned(B);
      end if;
    else
      P_i <= (others => 'X');
    end if;
  end process;
  
  reg : process(CLK)
  begin
    if rising_edge(CLK) then
      PRODUCT <= P_i;
    end if;
  end process;
  
end;

-- pragma translate_on

