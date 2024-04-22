library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package secd_defs is

  subtype ins_name is string(1 to 4);
  type ins_names is array(0 to 21) of ins_name;
  constant secd_ins_name : ins_names := ("NIL ",
                                         "LD  ",
                                         "LDC ",
                                         "LDF ",
                                         "AP  ",
                                         "RTN ",
                                         "DUM ",
                                         "RAP ",
                                         "SEL ",
                                         "JOIN",
                                         "CAR ",
                                         "CDR ",
                                         "ATOM",
                                         "CONS",
                                         "EQ  ",
                                         "ADD ",
                                         "SUB ",
                                         "MUL ",
                                         "DIV ",
                                         "REM ",
                                         "LEQ ",
                                         "STOP");

  -- Microinstruction register read codes
  constant ralu    : std_logic_vector(4 downto 0) := "00001";
  constant rmem    : std_logic_vector(4 downto 0) := "00010";
  constant rarg    : std_logic_vector(4 downto 0) := "00011";
  constant rbuf1   : std_logic_vector(4 downto 0) := "00100";
  constant rbuf2   : std_logic_vector(4 downto 0) := "00101";
  constant rcar    : std_logic_vector(4 downto 0) := "00110";
  constant rs      : std_logic_vector(4 downto 0) := "00111";
  constant re      : std_logic_vector(4 downto 0) := "01000";
  constant rc      : std_logic_vector(4 downto 0) := "01001";
  constant rd      : std_logic_vector(4 downto 0) := "01010";
  constant rmar    : std_logic_vector(4 downto 0) := "01011";
  constant rx1     : std_logic_vector(4 downto 0) := "01100";
  constant rx2     : std_logic_vector(4 downto 0) := "01101";
  constant rfree   : std_logic_vector(4 downto 0) := "01110";
  constant rparent : std_logic_vector(4 downto 0) := "01111";
  constant rroot   : std_logic_vector(4 downto 0) := "10000";
  constant ry1     : std_logic_vector(4 downto 0) := "10001";
  constant ry2     : std_logic_vector(4 downto 0) := "10010";
  constant rnum    : std_logic_vector(4 downto 0) := "10011";
  constant rnil    : std_logic_vector(4 downto 0) := "10100";
  constant rtrue   : std_logic_vector(4 downto 0) := "10101";
  constant rfalse  : std_logic_vector(4 downto 0) := "10110";
  constant rcons   : std_logic_vector(4 downto 0) := "10111";

  -- Microinstruction register write codes
  constant bidir   : std_logic_vector(4 downto 0) := "00001";
  constant warg    : std_logic_vector(4 downto 0) := "00010";
  constant wbuf1   : std_logic_vector(4 downto 0) := "00011";
  constant wbuf2   : std_logic_vector(4 downto 0) := "00100";
  constant wcar    : std_logic_vector(4 downto 0) := "00101";
  constant ws      : std_logic_vector(4 downto 0) := "00110";
  constant we      : std_logic_vector(4 downto 0) := "00111";
  constant wc      : std_logic_vector(4 downto 0) := "01000";
  constant wd      : std_logic_vector(4 downto 0) := "01001";
  constant wmar    : std_logic_vector(4 downto 0) := "01010";
  constant wx1     : std_logic_vector(4 downto 0) := "01011";
  constant wx2     : std_logic_vector(4 downto 0) := "01100";
  constant wfree   : std_logic_vector(4 downto 0) := "01101";
  constant wparent : std_logic_vector(4 downto 0) := "01110";
  constant wroot   : std_logic_vector(4 downto 0) := "01111";
  constant wy1     : std_logic_vector(4 downto 0) := "10000";
  constant wy2     : std_logic_vector(4 downto 0) := "10001";

  -- ALU operations
  constant dec        : std_logic_vector(4 downto 0) := "00001";
  constant add        : std_logic_vector(4 downto 0) := "00010";
  constant subx       : std_logic_vector(4 downto 0) := "00011";
  constant mul        : std_logic_vector(4 downto 0) := "00100";
  constant div        : std_logic_vector(4 downto 0) := "00101";
  constant remx       : std_logic_vector(4 downto 0) := "00110";
  constant setmark    : std_logic_vector(4 downto 0) := "00111";
  constant setfield   : std_logic_vector(4 downto 0) := "01000";
  constant clearmark  : std_logic_vector(4 downto 0) := "01001";
  constant replcar    : std_logic_vector(4 downto 0) := "01010";
  constant replcdr    : std_logic_vector(4 downto 0) := "01011";
  constant clearfield : std_logic_vector(4 downto 0) := "01100";
  constant gcreverse  : std_logic_vector(4 downto 0) := "01101";
  constant gcreset    : std_logic_vector(4 downto 0) := "01110";
  constant gcmark     : std_logic_vector(4 downto 0) := "01111";
  constant running    : std_logic_vector(4 downto 0) := "10000";
  constant halted     : std_logic_vector(4 downto 0) := "10001";
  constant gc         : std_logic_vector(4 downto 0) := "10010";

  -- Constant addresses
  constant nil_addr : std_logic_vector := "00000000000000";
  constant t_addr   : std_logic_vector := "00000000000001";
  constant f_addr   : std_logic_vector := "00000000000010";

  -- Next microinstruction
  constant nextx    : std_logic_vector := "0000";
  constant jump     : std_logic_vector := "0001";
  constant dispatch : std_logic_vector := "0010";
  constant markp    : std_logic_vector := "0011";
  constant fieldp   : std_logic_vector := "0100";
  constant zerop    : std_logic_vector := "0101";
  constant eqp      : std_logic_vector := "0110";
  constant leqp     : std_logic_vector := "0111";
  constant nump     : std_logic_vector := "1000";
  constant atomp    : std_logic_vector := "1001";
  constant nilp     : std_logic_vector := "1010";
  constant buttonp  : std_logic_vector := "1011";
  constant call     : std_logic_vector := "1100";
  constant returnx  : std_logic_vector := "1101";
  constant stop     : std_logic_vector := "1110";

  -- Cell types
  constant cell_symbol : std_logic_vector := "10";
  constant cell_number : std_logic_vector := "11";
  constant cell_cons   : std_logic_vector := "00";

  -- Flagsunit structure definition
  constant atom     : integer := 0;
  constant mark     : integer := 1;
  constant field    : integer := 2;
  constant zero     : integer := 3;
  constant nil      : integer := 4;
  constant eq       : integer := 5;
  constant leq      : integer := 6;
  constant num      : integer := 7;

  constant flag_max : integer := 7;
  subtype flagsunit is std_logic_vector(flag_max downto 0);

  subtype microaddress is std_logic_vector(8 downto 0);

end package;
