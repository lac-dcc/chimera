-- libraries -------------------------------------------------------------------------------------------{{{
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.all;
---------------------------------------------------------------------------------------------------------}}}
entity mult_add_sub is -- {{{
generic (DATA_W  : natural := 32);
port (
  sub               : in std_logic; -- level 10.
  a, c              : in unsigned (DATA_W-1 downto 0); -- level 10.
  b                 : in unsigned (DATA_W downto 0); -- level 10.
  sra_sign_v        : in std_logic := '0'; -- level 10.
  sra_sign          : in unsigned (DATA_W downto 0); -- level 10.
  sltu_true_p0      : out std_logic := '0'; -- level 15.
  res_low_p0        : out std_logic_vector(DATA_W-1 downto 0) := (others=>'0'); -- level 15.
  res_high          : out std_logic_vector(DATA_W-1 downto 0) := (others=>'0'); -- level 16.
  clk, ce           : in std_logic
);
end entity; --}}}
architecture Behavioral of mult_add_sub is
  -- signals definitions ----------------------------------------------------------------------------------{{{
  signal c_sub, res_low_low_d0            : unsigned(DATA_W downto 0) := (others=>'0');
  signal res_low_low                      : unsigned(DATA_W downto 0) := (others=>'0');
  signal res_low_high, res_high_low       : unsigned(DATA_W downto 0) := (others=>'0');
  signal res_high_high                    : unsigned(DATA_W downto 0) := (others=>'0');
  signal res_middle                       : unsigned(DATA_W-1 downto 0) := (others=>'0');
  signal res_middle_high                  : unsigned(DATA_W downto 0) := (others=>'0');
  signal zeros                            : unsigned(DATA_W downto 0) := (others=>'0');
  signal res_middle_low                   : unsigned(DATA_W-1 downto 0) := (others=>'0');
  signal res_low_i                        : std_logic_vector(DATA_W downto 0) := (others=>'0');
  signal a_high_d0, a_high_d1, a_high_d2  : unsigned(DATA_W/2-1 downto 0) := (others=>'0'); 
  signal b_high_d0, b_high_d1, b_high_d2  : unsigned(DATA_W/2 downto 0) := (others=>'0'); 
  signal sra_sign_low                     : unsigned(DATA_W downto 0) := (others=>'0'); 
  signal sra_sign_high_d0                 : signed(DATA_W/2 downto 0) := (others=>'0');
  signal sra_sign_set_to_ones             : std_logic := '0';
  signal sra_sign_high_d1                 : signed(DATA_W/2 downto 0) := (others=>'0');
  signal sra_sign_high_d2                 : signed(DATA_W/2 downto 0) := (others=>'0');
  signal sra_sign_v_d0, sra_sign_v_d1     : std_logic := '0';
  signal a_low_extended                   : unsigned(DATA_W/2 downto 0) := (others=>'0');
  signal sra_sign_d0                      : unsigned(DATA_W downto 0) := (others=>'0');

  attribute use_dsp48                     :string;
  attribute use_dsp48 of res_middle       : signal is "no";
  ---------------------------------------------------------------------------------------------------------}}}
begin
  -- DSPs -------------------------------------------------------------------------------------------------{{{
  mul_add_low_low: entity DSP48E1 generic map(
    SIZE_A => DATA_W/2+1,
    SIZE_B => DATA_W/2,
    SUB  => false
  ) port map(
    clk => clk,
    ce => ce,
    ain => a_low_extended, -- level 10.
    bin => b(DATA_W/2-1 downto 0), -- level 10.
    cin => c_sub, -- level 11.
    res => res_low_low -- level 13.
  );
  
  mul_add_low_high: entity DSP48E1 generic map(
    SIZE_A => DATA_W/2,
    SIZE_B => DATA_W/2+1,
    SUB => true
  ) port map(
    clk => clk,
    ce => ce,
    ain => a(DATA_W/2-1 downto 0), -- level 10.
    bin => b(DATA_W downto DATA_W/2), -- level 10.
    cin => sra_sign_low, -- level 11.
    res => res_low_high -- level 13.
  );
    
  mul_add_high_low: entity DSP48E1 generic map(
    SIZE_A => DATA_W/2,
    SIZE_B => DATA_W/2,
    SUB => false
  ) port map(
    clk => clk,
    ce => ce,
    ain => a(DATA_W-1 downto DATA_W/2), -- level 10.
    bin => b(DATA_W/2-1 downto 0), -- level 10.
    cin => zeros(DATA_W-1  downto 0), 
    res => res_high_low(DATA_W-1 downto 0) -- level 13.
  );

  mul_add_high_high: entity DSP48E1 generic map(
    SIZE_A => DATA_W/2,
    SIZE_B => DATA_W/2+1,
    SUB => false
  ) port map(
    clk => clk,
    ce => ce,
    ain => a_high_d2, -- level 13.
    bin => b_high_d2, -- level 13.
    cin => res_middle_high, -- level 14.
    res => res_high_high -- level 16.
  );
  ---------------------------------------------------------------------------------------------------------}}}
  -- other logic ------------------------------------------------------------------------------------------{{{
  res_middle_low(DATA_W-1 downto DATA_W/2) <= res_middle(DATA_W/2-1 downto 0); -- level 14.
  res_middle_high(DATA_W/2-1 downto 0) <= res_middle(DATA_W-1 downto DATA_W/2); -- level 14.

  res_high <= std_logic_vector(res_high_high(DATA_W-1 downto 0)); -- level 16.
  
  res_middle_high(DATA_W downto DATA_W/2) <= unsigned(sra_sign_high_d2); -- level 14.

  a_low_extended <= '0' & a(DATA_W/2-1 downto 0);

  process(clk)
  begin
    if rising_edge(clk) then
      sra_sign_low(DATA_W downto DATA_W/2) <= sra_sign(DATA_W/2 downto 0); -- @ 11.
      sra_sign_d0 <= sra_sign; -- @ 11.
      sra_sign_v_d0 <= sra_sign_v; -- @ 11.
      
      sra_sign_high_d0 <= -signed(sra_sign_d0(DATA_W downto DATA_W/2)); ---@ 12.
      sra_sign_v_d1 <= sra_sign_v_d0; -- @ 12.

      if sra_sign_high_d0 = (sra_sign_high_d0'range => '0') and sra_sign_v_d1 = '1' then -- level 12.
        sra_sign_set_to_ones <= '1'; -- @ 13.
      else
        sra_sign_set_to_ones <= '0'; -- @ 13.
      end if;
      sra_sign_high_d1 <= sra_sign_high_d0; -- @ 13.

      if sra_sign_set_to_ones = '1' then -- level 13.
        sra_sign_high_d2 <= (others=>'1');
      else
        sra_sign_high_d2 <= sra_sign_high_d1; -- @ 14.
      end if;
      
      if sub = '1' then -- level 10.
        c_sub <= unsigned(-signed('0' & c)); -- @ 11.
      else
        c_sub <= '0' & c; -- @ 11.
      end if;
      
      a_high_d0 <= a(DATA_W-1 downto DATA_W/2); -- @ 11.
      b_high_d0 <= b(DATA_W downto DATA_W/2); -- @ 11.
      a_high_d1 <= a_high_d0; -- @ 12.
      b_high_d1 <= b_high_d0; -- @ 12.
      a_high_d2 <= a_high_d1; -- @ 13.
      b_high_d2 <= b_high_d1; -- @ 13.

      -- stage 0 after DSPs
      res_low_low_d0 <= res_low_low; -- @ 14.
      res_middle <= res_high_low(DATA_W-1 downto 0) + res_low_high(DATA_W-1 downto 0); -- @ 14.
      -- stage 1 after DSP
      res_low_i <= std_logic_vector(res_low_low_d0 + unsigned('0'&res_middle_low)); -- @ 15.
    end if;
  end process;
  res_low_p0 <= res_low_i(DATA_W-1 downto 0); -- @ 15.
  sltu_true_p0 <= res_low_i(DATA_W); -- @ 15.
  ---------------------------------------------------------------------------------------------------------}}}
end architecture;
