-- Listing 3.20
--******************************************************************
-- Notes to run on logi:
-- user can experiment by hard coding the folowing values are 
-- using the push buttons or switches to change the parameters
--*******************************************************************/
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity fp_adder_test is
   port(
      clk: in std_logic;
      sw_n: in std_logic_vector(1 downto 0);
      btn_n: in std_logic_vector(1 downto 0);
      an: out std_logic_vector(3 downto 0);
      sseg: out std_logic_vector(7 downto 0)
   );
end fp_adder_test;

architecture arch of fp_adder_test is
	signal sw, btn: std_logic_vector(1 downto 0);

   signal sign1, sign2: std_logic;
   signal exp1, exp2: std_logic_vector(3 downto 0);
   signal frac1, frac2: std_logic_vector(7 downto 0);
   signal sign_out: std_logic;
   signal exp_out: std_logic_vector(3 downto 0);
   signal frac_out: std_logic_vector(7 downto 0);
   signal led3, led2, led1, led0:
             std_logic_vector(7 downto 0);
begin

	sw <= not(sw_n);
	btn <= not(btn_n);
	
	--user can experiment by hard coding the folowing values are using the push buttons or switches to change the parameters
   -- set up the fp adder input signals
   sign1 <= '0';
   exp1 <= "1000";
   frac1<= '1' &  '0' & sw(0) & "10101";
   --!sign2 <= sw(7);
	sign2 <= sw(1);
   exp2 <= "00" & btn;
   --!frac2 <= '1' & sw(6 downto 0);
   frac2 <= '1' & "0000001";
	
   -- instantiate fp adder
   fp_add_unit: entity work.fp_adder
      port map(
         sign1=>sign1, sign2=>sign2, exp1=>exp1, exp2=>exp2,
         frac1=>frac1, frac2=>frac2,
         sign_out=>sign_out, exp_out=>exp_out,
         frac_out=>frac_out
      );

   -- instantiate three instances of hex decoders
   -- exponent
   sseg_unit_0: entity work.hex_to_sseg
      port map(hex=>exp_out, dp=>'0', sseg=>led0);
   -- 4 LSBs of fraction
   sseg_unit_1: entity work.hex_to_sseg
      port map(hex=>frac_out(3 downto 0),
               dp=>'1', sseg=>led1);
   -- 4 MSBs of fraction
   sseg_unit_2: entity work.hex_to_sseg
      port map(hex=>frac_out(7 downto 4),
               dp=>'0', sseg=>led2);
   -- sign
   --! led3 <= "11111110" when sign_out='1' else -- middle bar
           -- "11111111";                       -- blank
	led3 <= "00000001" when sign_out='1' else -- middle bar
			"00000000";                       -- blank

   -- instantiate 7-seg LED display time-multiplexing module
   disp_unit: entity work.disp_mux
      port map(
         clk=>clk, reset=>'0',
         in0=>led0, in1=>led1, in2=>led2, in3=>led3,
         an=>an, sseg=>sseg
      );
end arch;