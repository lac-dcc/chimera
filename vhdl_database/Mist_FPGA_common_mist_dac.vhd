-------------------------------------------------------------------------------
--
-- Delta-Sigma DAC
--
-- Refer to Xilinx Application Note XAPP154.
--
-- This DAC requires an external RC low-pass filter:
--
--   dac_o 0---XXXXX---+---0 analog audio
--              3k3    |
--                    === 4n7
--                     |
--                    GND
--
-------------------------------------------------------------------------------

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity dac is
	generic (
		C_bits  : integer := 8
	);
	port (
		clk_i   : in  std_logic;
		res_n_i : in  std_logic;
		dac_i   : in  std_logic_vector(C_bits-1 downto 0);
		dac_o   : out std_logic
	);
end dac;

architecture rtl of dac is
	signal sig_in: unsigned(C_bits downto 0);
begin
	seq: process(clk_i, res_n_i)
	begin
		if res_n_i = '0' then
			sig_in <= to_unsigned(2**C_bits, sig_in'length);
			dac_o  <= '0';
		elsif rising_edge(clk_i) then
		        -- not dac_i(C_bits-1) effectively adds 0x8..0 to dac_i
			--sig_in <= sig_in + unsigned(sig_in(C_bits) & (not dac_i(C_bits-1)) & dac_i(C_bits-2 downto 0));
			sig_in <= sig_in + unsigned(sig_in(C_bits) & dac_i);
			dac_o  <= sig_in(C_bits);
		end if;
	end process seq;
end rtl;
