library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package Common is
  type RwType is (R, W);
  type LenType is (Lword, Lhalf, Lbyte);
  type AluOpType is (
    ALU_NOP,
    ALU_AND, ALU_OR, ALU_XOR, ALU_NOR,
    ALU_ADD, ALU_SUB, ALU_MUL, ALU_MULU,
    ALU_SRL, ALU_SRA, ALU_SLL,
    ALU_EQ, ALU_NE,
    ALU_LT, ALU_LTU,
    ALU_GTZ, ALU_LEZ, ALU_GEZ);
  type ModeType is (Kernel, User);

  subtype WaitCycles is integer range 0 to 15;

  subtype Int32 is std_logic_vector(31 downto 0);
  subtype Int31 is std_logic_vector(30 downto 0);
  subtype Int30 is std_logic_vector(29 downto 0);
  subtype Int26 is std_logic_vector(25 downto 0);
  subtype Int24 is std_logic_vector(23 downto 0);
  subtype Int23 is std_logic_vector(22 downto 0);
  subtype Int18 is std_logic_vector(17 downto 0);
  subtype Int16 is std_logic_vector(15 downto 0);
  subtype Int10 is std_logic_vector(9 downto 0);
  subtype Int8 is std_logic_vector(7 downto 0);
  subtype Int6 is std_logic_vector(5 downto 0);
  subtype Int5 is std_logic_vector(4 downto 0);
  subtype Int4 is std_logic_vector(3 downto 0);

  subtype Signed32 is signed(31 downto 0);
  subtype Unsigned32 is unsigned(31 downto 0);

  constant Int8_Zero     : Int8  := "00000000";
  constant Int8_Z        : Int8  := "ZZZZZZZZ";
  constant Int16_Zero    : Int16 := "0000000000000000";
  constant Int16_Z       : Int16 := "ZZZZZZZZZZZZZZZZ";
  constant Int24_Zero    : Int24 := "000000000000000000000000";
  constant Int30_Zero    : Int30 := "000000000000000000000000000000";
  constant Int31_Zero    : Int31 := "0000000000000000000000000000000";
  constant Int32_Zero    : Int32 := "00000000000000000000000000000000";
  constant Int32_Z       : Int32 := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
  constant COM_Data_Addr : Int32 := x"1FD003F8";
  constant COM_Stat_Addr : Int32 := x"1FD003FC";
  
  constant clk0_freq: integer := 11059200;
  constant clk1_freq: integer := 50000000;
  constant RAM_START: Int32 := x"80000000";
  constant ROM_START: Int32 := x"BFC00000";

  -- opcode
  constant op_special : Int6 := "000000";
  constant op_regimm  : Int6 := "000001";
  constant op_j       : Int6 := "000010";
  constant op_jal     : Int6 := "000011";
  constant op_beq     : Int6 := "000100";
  constant op_bne     : Int6 := "000101";
  constant op_blez    : Int6 := "000110";
  constant op_bgtz    : Int6 := "000111";
  constant op_addiu   : Int6 := "001001";
  constant op_slti    : Int6 := "001010";
  constant op_sltiu   : Int6 := "001011";
  constant op_andi    : Int6 := "001100";
  constant op_ori     : Int6 := "001101";
  constant op_xori    : Int6 := "001110";
  constant op_lui     : Int6 := "001111";
  constant op_cop0    : Int6 := "010000";
  constant op_lb      : Int6 := "100000";
  constant op_lh      : Int6 := "100001";
  constant op_lw      : Int6 := "100011";
  constant op_lbu     : Int6 := "100100";
  constant op_lhu     : Int6 := "100101";
  constant op_sb      : Int6 := "101000";
  constant op_sh      : Int6 := "101001";
  constant op_sw      : Int6 := "101011";
  constant op_cache   : Int6 := "101111";

  -- func
  constant func_sll     : Int6 := "000000";
  constant func_srl     : Int6 := "000010";
  constant func_sra     : Int6 := "000011";
  constant func_sllv    : Int6 := "000100";
  constant func_srlv    : Int6 := "000110";
  constant func_srav    : Int6 := "000111";
  constant func_jr      : Int6 := "001000";
  constant func_jalr    : Int6 := "001001";
  constant func_syscall : Int6 := "001100";
  constant func_break   : Int6 := "001101";
  constant func_mfhi    : Int6 := "010000";
  constant func_mthi    : Int6 := "010001";
  constant func_mflo    : Int6 := "010010";
  constant func_mtlo    : Int6 := "010011";
  constant func_mult    : Int6 := "011000";
  constant func_multu   : Int6 := "011001";
  constant func_addu    : Int6 := "100001";
  constant func_subu    : Int6 := "100011";
  constant func_and     : Int6 := "100100";
  constant func_or      : Int6 := "100101";
  constant func_xor     : Int6 := "100110";
  constant func_nor     : Int6 := "100111";
  constant func_slt     : Int6 := "101010";
  constant func_sltu    : Int6 := "101011";
  
  constant func_tlbwi   : Int6 := "000010";
  constant func_eret    : Int6 := "011000";

  -- rs
  constant rs_mfc0 : Int5 := "00000";
  constant rs_mtc0 : Int5 := "00100";
  constant rs_co   : Int5 := "10000";
  
  -- rt
  constant rt_bltz : Int5 := "00000";
  constant rt_bgez : Int5 := "00001";

  type opcode_name_array is array (0 to 63) of string(1 to 7);
  type sp_func_name_array is array (0 to 63) of string(1 to 7);
  type ri_rt_name_array is array (0 to 1) of string(1 to 4);
  type cp0reg_name_array is array (0 to 15) of string(1 to 8);

  constant opcode_names : opcode_name_array :=
    ("SPECIAL", "REGIMMH", "J      ", "JAL    ",
     "BEQ    ", "BNE    ", "BLEZ   ", "BGTZ   ",
     "ADDI   ", "ADDIU  ", "SLTI   ", "SLTIU  ",
     "ANDI   ", "ORI    ", "XORI   ", "LUI    ",
     "COP0   ", "COP1   ", "COP2   ", "COP1X  ",
     "BEQL   ", "BNEL   ", "BLEZL  ", "BGTZL  ",
     "UNDEF18", "UNDEF19", "UNDEF1A", "UNDEF1B",
     "UNDEF1C", "JALX   ", "UNDEF1E", "UNDEF1F",
     "LB     ", "LH     ", "LWL    ", "LW     ",
     "LBU    ", "LHU    ", "LWR    ", "UNDEF27",
     "SB     ", "SH     ", "SWL    ", "SW     ",
     "UNDEF2C", "UNDEF2D", "SWR    ", "CACHE  ",
     "LL     ", "LWC1   ", "LWC2   ", "PREF   ",
     "UNDEF34", "LDC1   ", "LDC2   ", "UNDEF37",
     "SC     ", "SWC1   ", "SWC2   ", "UNDEF3B",
     "UNDEF3C", "SDC1   ", "SDC2   ", "UNDEF3F");

  constant sp_func_names : sp_func_name_array :=
    ("SLL    ", "MOVCI  ", "SRL    ", "SRA    ",
     "SLLV   ", "UNDEF05", "SRLV   ", "SRAV   ",
     "JR     ", "JALR   ", "MOVZ   ", "MOVN   ",
     "SYSCALL", "BREAK  ", "UNDEF0E", "SYNC   ",
     "MFHI   ", "MTHI   ", "MFLO   ", "MTLO   ",
     "UNDEF14", "UNDEF15", "UNDEF16", "UNDEF17",
     "MULT   ", "MULTU  ", "DIV    ", "DVIU   ",
     "UNDEF1C", "UNDEF1D", "UNDEF1E", "UNDEF1F",
     "ADD    ", "ADDU   ", "SUB    ", "SUBU   ",
     "AND    ", "OR     ", "XOR    ", "NOR    ",
     "UNDEF28", "UNDEF29", "SLT    ", "SLTU   ",
     "UNDEF2C", "UNDEF2D", "UNDEF2E", "UNDEF2F",
     "TGE    ", "TGEU   ", "TLT    ", "TLTU   ",
     "TEQ    ", "UNDEF35", "TNE    ", "UNDEF37",
     "UNDEF38", "UNDEF39", "UNDEF3A", "UNDEF3B",
     "UNDEF3C", "UNDEF3D", "UNDEF3E", "UNDEF3F");

  constant ri_rt_names : ri_rt_name_array :=
    ("BLTZ", "BGEZ");
    
  constant cp0regs_names : cp0reg_name_array :=
    ("Index   ", "Random  ", "EntryLo0", "EntryLo1",
     "Context ", "PageMask", "Wired   ", "HWREna  ",
     "BadVAddr", "Count   ", "EntryHi ", "Compare ",
     "SR      ", "Cause   ", "EPC     ", "EBase   ");
     -- EBase is actually 15.1
     -- only first 15 regs' names are listed
     
  -- ExcCode for Cause register
  constant ExcInt     : Int5 := "00000";
  constant ExcTLBL    : Int5 := "00010";
  constant ExcTLBS    : Int5 := "00011";
  constant ExcAdEL    : Int5 := "00100";
  constant ExcAdES    : Int5 := "00101";
  constant ExcSyscall : Int5 := "01000";
  constant ExcRI      : Int5 := "01010";

  function boolean_to_std_logic(cond : boolean) return std_logic;
  function to_hex_string(data_in     : std_logic_vector) return string;
  
  function add(a, b : Int32) return Int32;
  function add(a: Int32; b: integer) return Int32;
  function add(a, b : Int32; c: integer) return Int32;

end Common;

package body Common is
  
  function boolean_to_std_logic(cond : boolean) return std_logic is
  begin
    if cond then
      return('1');
    else
      return('0');
    end if;
  end function boolean_to_std_logic;

  function vec_to_hex(byte_in : std_logic_vector(3 downto 0)) return character is
    variable int : integer;
  begin
    int := to_integer(unsigned(byte_in));
    if int < 10 then
      return (character'val(character'pos('0') + int));
    else
      return (character'val(character'pos('a') + int - 10));
    end if;
  end function vec_to_hex;

  function to_hex_string(data_in : std_logic_vector) return string is
  begin
    if data_in'length = 32 then
      return ("0x" &
              vec_to_hex(data_in(31 downto 28)) &
              vec_to_hex(data_in(27 downto 24)) &
              vec_to_hex(data_in(23 downto 20)) &
              vec_to_hex(data_in(19 downto 16)) &
              vec_to_hex(data_in(15 downto 12)) &
              vec_to_hex(data_in(11 downto 8)) &
              vec_to_hex(data_in(7 downto 4)) &
              vec_to_hex(data_in(3 downto 0)));
    elsif data_in'length = 26 then
      return ("0x" &
              vec_to_hex("00" & data_in(25 downto 24)) &
              vec_to_hex(data_in(23 downto 20)) &
              vec_to_hex(data_in(19 downto 16)) &
              vec_to_hex(data_in(15 downto 12)) &
              vec_to_hex(data_in(11 downto 8)) &
              vec_to_hex(data_in(7 downto 4)) &
              vec_to_hex(data_in(3 downto 0)));
    elsif data_in'length = 16 then
      return ("0x" &
              vec_to_hex(data_in(15 downto 12)) &
              vec_to_hex(data_in(11 downto 8)) &
              vec_to_hex(data_in(7 downto 4)) &
              vec_to_hex(data_in(3 downto 0)));
    elsif data_in'length = 8 then
      return ("0x" &
              vec_to_hex(data_in(7 downto 4)) &
              vec_to_hex(data_in(3 downto 0)));
    end if;
    return "";
  end function to_hex_string;
  
  function add(a, b : Int32) return Int32 is
  begin
    return(std_logic_vector(unsigned(a) + unsigned(b)));
  end function add;
  
  function add(a: Int32; b: integer) return Int32 is
  begin
    return(std_logic_vector(unsigned(a) + to_unsigned(b, 32)));
  end function add;
  
  function add(a, b : Int32; c: integer) return Int32 is
  begin
    return (add( add(a, b) , c ));
  end function add;
end Common;
