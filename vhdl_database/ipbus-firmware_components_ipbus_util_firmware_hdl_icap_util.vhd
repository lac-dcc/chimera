--======================================================================

library ieee;
use ieee.std_logic_1164.all;

use work.icap_decl.all;

package icap_util is

  function bit_swap(vec_in : std_logic_vector) return std_logic_vector;

  function build_icap_type1_packet(icap_op_code : std_logic_vector;
                                   register_address : std_logic_vector)
    return std_logic_vector;

  end package icap_util;

package body icap_util is

  -- Helper function to bit-swap an std_logic_vector into SelectMap
  -- bit order (which is what is expected of the ICAP data).
  -- NOTE: See 'Parallel Bus Bit Order' in UG570.
  -- NOTE: Basically just 'bit-swapping within each byte'.
  function bit_swap(vec_in : std_logic_vector) return std_logic_vector is
    variable byte_num : integer;
    variable bit_num : integer;
    variable vec_out : std_logic_vector(31 downto 0);
  begin
    for byte_num in 0 to 3 loop
      for bit_num in 0 to 7 loop
        vec_out((8 * byte_num) + bit_num) := vec_in((8 * byte_num) + (7 - bit_num));
      end loop;
    end loop;
    return vec_out;
  end function bit_swap;

  -- Helper function to build Type-1 ICAP packets.
  -- See also UG470, Table 5-20.
  function build_icap_type1_packet(icap_op_code : std_logic_vector;
                                   register_address : std_logic_vector)
    return std_logic_vector is
    variable packet : std_logic_vector(31 downto 0);
  begin
    packet :=
      -- Header type.
      "001"
      -- Opcode.
      & icap_op_code
      -- Reserved bits plus register address.
      & "000000000"
      & register_address
      -- Reserved bits.
      & "00"
      -- Word count.
      & "00000000001";
    return packet;
  end function build_icap_type1_packet;

end package body;

--======================================================================
