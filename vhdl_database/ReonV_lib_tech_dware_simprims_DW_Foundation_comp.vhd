library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_misc.all;

package DW_Foundation_comp is

  component DW_mult_pipe
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

  end component;

  component DW02_mult
   generic( A_width: NATURAL;		-- multiplier wordlength
            B_width: NATURAL);		-- multiplicand wordlength
   port(A : in std_logic_vector(A_width-1 downto 0);  
        B : in std_logic_vector(B_width-1 downto 0);
        TC : in std_logic;		-- signed -> '1', unsigned -> '0'
        PRODUCT : out std_logic_vector(A_width+B_width-1 downto 0));
  end component;

end;

