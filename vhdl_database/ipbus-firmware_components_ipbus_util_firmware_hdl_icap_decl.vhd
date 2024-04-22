--======================================================================

library ieee;
use ieee.std_logic_1164.all;

package icap_decl is

  -- Some helper constants/definitions to make things easier to read.
  constant C_ICAP_CS_ENABLE : std_logic := '0';
  constant C_ICAP_CS_DISABLE : std_logic := '1';

  constant C_ICAP_RW_READ : std_logic := '1';
  constant C_ICAP_RW_WRITE : std_logic := '0';

  constant C_ICAP_TYPE1_OPCODE_NOP : std_logic_vector(1 downto 0) := "00";
  constant C_ICAP_TYPE1_OPCODE_READ : std_logic_vector(1 downto 0) := "01";
  constant C_ICAP_TYPE1_OPCODE_WRITE : std_logic_vector(1 downto 0) := "10";

  constant C_ICAP_WORD_DUMMY : std_logic_vector(31 downto 0) := x"ffffffff";
  constant C_ICAP_WORD_SYNC : std_logic_vector(31 downto 0) := x"aa995566";
  constant C_ICAP_WORD_DESYNC : std_logic_vector(31 downto 0) := x"0000000d";
  constant C_ICAP_WORD_BUS_WIDTH_SYNC : std_logic_vector(31 downto 0) := x"000000bb";
  constant C_ICAP_WORD_BUS_WIDTH_DETECT : std_logic_vector(31 downto 0) := x"11220044";
  constant C_ICAP_WORD_NOOP : std_logic_vector(31 downto 0) := x"20000000";

  constant C_ICAP_ADDRESS_CMD : std_logic_vector(4 downto 0) := "00100";
  constant C_ICAP_ADDRESS_WBSTAR : std_logic_vector(4 downto 0) := "10000";

  constant C_ICAP_CMD_IPROG : std_logic_vector(4 downto 0) := "01111";

end package icap_decl;

--======================================================================
