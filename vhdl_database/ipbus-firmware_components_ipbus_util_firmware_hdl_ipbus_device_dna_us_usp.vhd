--======================================================================
-- IPbus wrapper for the Xilinx FPGA DNA primitive.
--======================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

use work.ipbus.all;

entity ipbus_device_dna_us_usp is
  port (
    clk : in std_logic;
    rst : in std_logic;
    ipb_in : in ipb_wbus;
    ipb_out : out ipb_rbus
  );
end ipbus_device_dna_us_usp;

architecture rtl of ipbus_device_dna_us_usp is

  signal dna_val : std_logic_vector(95 downto 0);

begin

  ipb_out.ipb_ack <= ipb_in.ipb_strobe;
  ipb_out.ipb_err <= ipb_in.ipb_write when ipb_in.ipb_strobe = '1' else '0';

  -- The DNA value is 96 bits long, so we map this to three 32-bit
  -- IPbus words.
  with ipb_in.ipb_addr(1 downto 0) select ipb_out.ipb_rdata <=
    dna_val(31 downto 0) when "00",
    dna_val(63 downto 32) when "01",
    dna_val(95 downto 64) when "10",
    X"00000000" when others;

  dna_reader : entity work.device_dna
    port map (
      clk => clk,
      rst => rst,
      dna => dna_val
    );

end rtl;

--======================================================================
