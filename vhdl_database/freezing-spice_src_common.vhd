library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

package common is
    -- definition for a machine word
    subtype word is std_logic_vector(31 downto 0);
    subtype reg_addr_t is std_logic_vector(4 downto 0);

    subtype alu_func_t is std_logic_vector(3 downto 0);
    constant ALU_NONE : alu_func_t := "0000";
    constant ALU_ADD  : alu_func_t := "0001";
    constant ALU_ADDU : alu_func_t := "0010";
    constant ALU_SUB  : alu_func_t := "0011";
    constant ALU_SUBU : alu_func_t := "0100";
    constant ALU_SLT  : alu_func_t := "0101";
    constant ALU_SLTU : alu_func_t := "0110";
    constant ALU_AND  : alu_func_t := "0111";
    constant ALU_OR   : alu_func_t := "1000";
    constant ALU_XOR  : alu_func_t := "1001";
    constant ALU_SLL  : alu_func_t := "1010";
    constant ALU_SRA  : alu_func_t := "1011";
    constant ALU_SRL  : alu_func_t := "1100";

    subtype insn_type_t is std_logic_vector(3 downto 0);
    constant OP_ILLEGAL : insn_type_t := "0000";
    constant OP_LUI     : insn_type_t := "0001";
    constant OP_AUIPC   : insn_type_t := "0010";
    constant OP_JAL     : insn_type_t := "0011";
    constant OP_JALR    : insn_type_t := "0100";
    constant OP_BRANCH  : insn_type_t := "0101";
    constant OP_LOAD    : insn_type_t := "0110";
    constant OP_STORE   : insn_type_t := "0111";
    constant OP_ALU     : insn_type_t := "1000";
    constant OP_STALL   : insn_type_t := "1001";
    constant OP_SYSTEM  : insn_type_t := "1010";

    subtype branch_type_t is std_logic_vector(2 downto 0);
    constant BRANCH_NONE : branch_type_t := "000";
    constant BEQ         : branch_type_t := "001";
    constant BNE         : branch_type_t := "010";
    constant BLT         : branch_type_t := "011";
    constant BGE         : branch_type_t := "100";
    constant BLTU        : branch_type_t := "101";
    constant BGEU        : branch_type_t := "110";

    subtype load_type_t is std_logic_vector(2 downto 0);
    constant LOAD_NONE : load_type_t := "000";
    constant LB        : load_type_t := "001";
    constant LH        : load_type_t := "010";
    constant LW        : load_type_t := "011";
    constant LBU       : load_type_t := "100";
    constant LHU       : load_type_t := "101";

    subtype store_type_t is std_logic_vector(1 downto 0);
    constant STORE_NONE : store_type_t := "00";
    constant SB         : store_type_t := "01";
    constant SH         : store_type_t := "10";
    constant SW         : store_type_t := "11";

    subtype system_type_t is std_logic_vector(2 downto 0);
    constant SYSTEM_ECALL  : system_type_t := "000";
    constant SYSTEM_EBREAK : system_type_t := "001";
    constant SYSTEM_CSRRW  : system_type_t := "010";
    constant SYSTEM_CSRRS  : system_type_t := "011";
    constant SYSTEM_CSRRC  : system_type_t := "100";
    constant SYSTEM_CSRRWI : system_type_t := "101";
    constant SYSTEM_CSRRSI : system_type_t := "110";
    constant SYSTEM_CSRRCI : system_type_t := "111";

    -- print a string with a newline
    procedure println (str : in    string);
    procedure print (slv   : in    std_logic_vector);
    procedure write(l      : inout line; slv : in std_logic_vector);
    function hstr(slv      :       std_logic_vector) return string;

    -- instruction formats
    type r_insn_t is (R_ADD, R_SLT, R_SLTU, R_AND, R_OR, R_XOR, R_SLL, R_SRL, R_SUB, R_SRA);
    type i_insn_t is (I_JALR, I_LB, I_LH, I_LW, I_LBU, I_LHU, I_ADDI, I_SLTI, I_SLTIU, I_XORI, I_ORI, I_ANDI, I_SLLI, I_SRLI, I_SRAI);
    type s_insn_t is (S_SB, S_SH, S_SW);
    type sb_insn_t is (SB_BEQ, SB_BNE, SB_BLT, SB_BGE, SB_BLTU, SB_BGEU);
    type u_insn_t is (U_LUI, U_AUIPC);
    type uj_insn_t is (UJ_JAL);

    -- ADDI r0, r0, r0
    constant NOP : word := "00000000000000000000000000010011";
    
end package common;

package body common is

    function hstr(slv : std_logic_vector) return string is
        variable hexlen  : integer;
        variable longslv : std_logic_vector(67 downto 0) := (others => '0');
        variable hex     : string(1 to 16);
        variable fourbit : std_logic_vector(3 downto 0);
    begin
        hexlen := (slv'left+1)/4;
        if (slv'left+1) mod 4 /= 0 then
            hexlen := hexlen + 1;
        end if;
        longslv(slv'left downto 0) := slv;
        for i in (hexlen -1) downto 0 loop
            fourbit := longslv(((i*4)+3) downto (i*4));
            case fourbit is
                when "0000" => hex(hexlen -I) := '0';
                when "0001" => hex(hexlen -I) := '1';
                when "0010" => hex(hexlen -I) := '2';
                when "0011" => hex(hexlen -I) := '3';
                when "0100" => hex(hexlen -I) := '4';
                when "0101" => hex(hexlen -I) := '5';
                when "0110" => hex(hexlen -I) := '6';
                when "0111" => hex(hexlen -I) := '7';
                when "1000" => hex(hexlen -I) := '8';
                when "1001" => hex(hexlen -I) := '9';
                when "1010" => hex(hexlen -I) := 'A';
                when "1011" => hex(hexlen -I) := 'B';
                when "1100" => hex(hexlen -I) := 'C';
                when "1101" => hex(hexlen -I) := 'D';
                when "1110" => hex(hexlen -I) := 'E';
                when "1111" => hex(hexlen -I) := 'F';
                when "ZZZZ" => hex(hexlen -I) := 'z';
                when "UUUU" => hex(hexlen -I) := 'u';
                when "XXXX" => hex(hexlen -I) := 'x';
                when others => hex(hexlen -I) := '?';
            end case;
        end loop;
        return hex(1 to hexlen);
    end hstr;

    -- print a string with a newline
    procedure println (str : in string) is
        variable l : line;
    begin  -- procedure println
        write(l, str);
        writeline(output, l);
    end procedure println;

    procedure write(l : inout line; slv : in std_logic_vector) is
    begin
        for i in slv'range loop
            if slv(i) = '0' then
                write(l, string'("0"));
            elsif slv(i) = '1' then
                write(l, string'("1"));
            elsif slv(i) = 'X' then
                write(l, string'("X"));
            elsif slv(i) = 'U' then
                write(l, string'("U"));
            end if;
        end loop;  -- i
    end procedure write;

    procedure print (slv : in std_logic_vector) is
        variable l : line;
    begin  -- procedure print
        write(l, slv);
        writeline(output, l);
    end procedure print;
    
end package body common;
