library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.math_real.all;
library work;
use work.cnn_types.all;

entity DotProduct is
  generic(
    BITWIDTH       : integer;
    SUM_WIDTH        : integer;
    DOT_PRODUCT_SIZE : integer;
    KERNEL_VALUE     : pixel_array;
    BIAS_VALUE       : std_logic_vector
    );
  port(
    clk      : in  std_logic;
    reset_n  : in  std_logic;
    enable   : in  std_logic;
    in_data  : in  pixel_array (0 to DOT_PRODUCT_SIZE - 1);
    in_dv    : in  std_logic;
    in_fv    : in  std_logic;
    out_data : out std_logic_vector (SUM_WIDTH-1 downto 0);
    out_dv   : out std_logic;
    out_fv   : out std_logic
    );
end DotProduct;

architecture rtl of DotProduct is
  --------------------------------------------------------------
  ---- Implementation with the multiplier and adder components
  --------------------------------------------------------------
  component MCM
     generic (
       BITWIDTH       : integer;
       DOT_PRODUCT_SIZE : integer;
       KERNEL_VALUE     : pixel_array
       );
     port (
       clk       : in  std_logic;
       reset_n   : in  std_logic;
       enable    : in  std_logic;
       in_data   : in  pixel_array (0 to DOT_PRODUCT_SIZE - 1);
       in_valid  : in  std_logic;
       out_data  : out prod_array (0 to DOT_PRODUCT_SIZE - 1);
       out_valid : out std_logic
       );
  end component MCM;
  --
  component MOA
     generic (
       BITWIDTH   : integer;
       SUM_WIDTH    : integer;
       NUM_OPERANDS : integer;
       BIAS_VALUE   : std_logic_vector
       );
     port (
       clk       : in  std_logic;
       reset_n   : in  std_logic;
       enable    : in  std_logic;
       in_data   : in  prod_array (0 to NUM_OPERANDS - 1);
       in_valid  : in  std_logic;
       out_data  : out std_logic_vector (SUM_WIDTH-1 downto 0);
       out_valid : out std_logic
       );
  end component MOA;
  --
     signal p_prod_data  : prod_array (0 to DOT_PRODUCT_SIZE - 1);
     signal p_prod_valid : std_logic;
     signal s_out_valid  : std_logic;
   begin
   MCM_i : MCM
     generic map (
       BITWIDTH       => BITWIDTH,
       DOT_PRODUCT_SIZE => DOT_PRODUCT_SIZE,
       KERNEL_VALUE     => KERNEL_VALUE
       )
     port map (
       clk       => clk,
       reset_n   => reset_n,
       enable    => enable,
       in_data   => in_data,
       in_valid  => (in_dv and in_fv),
       out_data  => p_prod_data,
       out_valid => p_prod_valid
       );
   MOA_i : MOA
     generic map (
       BITWIDTH   => BITWIDTH,
       SUM_WIDTH    => SUM_WIDTH,
       NUM_OPERANDS => DOT_PRODUCT_SIZE,
       BIAS_VALUE   => BIAS_VALUE
       )
     port map (
       clk       => clk,
       reset_n   => reset_n,
       enable    => enable,
       in_data   => p_prod_data,
       in_valid  => p_prod_valid,
       out_data  => out_data,
       out_valid => s_out_valid
       );
   out_dv <= s_out_valid;
   out_fv <= s_out_valid;

  --------------------------------------------------------------
  ---- Direct Implementation as a Pipelined MAC
  --------------------------------------------------------------
--  signal pip_acc : sum_array (0 to DOT_PRODUCT_SIZE - 1) := (others => (others => '0'));
--  begin
--    process(clk)
--    begin
--      if (reset_n = '0') then
--        pip_acc <= (others => (others => '0'));
--        out_dv  <= '0';
--        out_fv  <= '0';
--
--      elsif(rising_edge(clk)) then
--        if (enable = '1') then
--          if (in_dv = '1' and in_fv = '1') then
--            pip_acc(0)(2*BITWIDTH-1 downto 0) <= in_data(0) *  KERNEL_VALUE(0);
--            acc_loop : for i in 1 to DOT_PRODUCT_SIZE-1 loop
--              pip_acc(i) <= pip_acc(i-1) + (in_data(i) * KERNEL_VALUE(i));
--            end loop acc_loop;
--          end if;
--          out_dv <= in_dv;
--          out_fv <= in_fv;
--        end if;
--      end if;
--    end process;
--    out_data <= pip_acc(DOT_PRODUCT_SIZE-1) + BIAS_VALUE;
end architecture;
