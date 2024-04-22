----------------------------------------------------------------------------
----------------------------------------------------------------------------
--  The Free IP Project
--  VHDL DES Core
--  (c) 1999, The Free IP Project and David Kessner
--
--
--  FREE IP GENERAL PUBLIC LICENSE
--  TERMS AND CONDITIONS FOR USE, COPYING, DISTRIBUTION, AND MODIFICATION
--
--  1.  You may copy and distribute verbatim copies of this core, as long
--      as this file, and the other associated files, remain intact and
--      unmodified.  Modifications are outlined below.  Also, see the
--      import/export warning above for further restrictions on
--      distribution.
--  2.  You may use this core in any way, be it academic, commercial, or
--      military.  Modified or not.  
--  3.  Distribution of this core must be free of charge.  Charging is
--      allowed only for value added services.  Value added services
--      would include copying fees, modifications, customizations, and
--      inclusion in other products.
--  4.  If a modified source code is distributed, the original unmodified
--      source code must also be included (or a link to the Free IP web
--      site).  In the modified source code there must be clear
--      identification of the modified version.
--  5.  Visit the Free IP web site for additional information.
--      http://www.free-ip.com
--
----------------------------------------------------------------------------
----------------------------------------------------------------------------
--
----------------------------------------------------------------------------
--  Microcode VHDL file for 6502 CPU.  Created by mcgen.exe
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;

package microcode is
  type MCT_DONE is (MC_NOP, MC_DONE);  -- 2 types
  type MCT_ADDR_OP is (MC_NOP, MC_PC_P, MC_SPLIT, MC_SPLIT_X, MC_SPLIT_Y, MC_DIN_ZX, MC_DIN_ZXP, MC_DIN_Z, MC_DIN_ZP, MC_DINT16, MC_DINT16_X, MC_DINT1_Z, MC_DINT1_ZX, MC_V_IRQ1, MC_V_IRQ2, MC_SP, MC_SPLIT_P, MC_DIN_ZY, MC_V_RESET1, MC_V_RESET2, MC_V_NMI1, MC_V_NMI2);  -- 22 types
  type MCT_DIN_LE is (MC_NOP, MC_EN);  -- 2 types
  type MCT_RD_EN is (MC_NOP, MC_READ);  -- 2 types
  type MCT_DOUT_OP is (MC_NOP, MC_DINT3, MC_PCH, MC_PCL, MC_P_REG, MC_A_REG, MC_X_REG, MC_Y_REG);  -- 8 types
  type MCT_DINT1_OP is (MC_NOP, MC_DIN);  -- 2 types
  type MCT_DINT2_OP is (MC_NOP, MC_DIN);  -- 2 types
  type MCT_DINT3_OP is (MC_NOP, MC_ALU);  -- 2 types
  type MCT_PC_OP is (MC_NOP, MC_INC, MC_BCC, MC_BCS, MC_BEQ, MC_BMI, MC_BNE, MC_BPL, MC_SPLIT, MC_BVC, MC_BVS);  -- 11 types
  type MCT_SP_OP is (MC_NOP, MC_PUSH, MC_POP, MC_X_REG);  -- 4 types
  type MCT_ALU1 is (MC_A_REG, MC_DIN, MC_X_REG, MC_Y_REG);  -- 4 types
  type MCT_ALU2 is (MC_DIN, MC_ONE, MC_SP_REG);  -- 3 types
  type MCT_ALU_OP is (MC_PASS1, MC_ADDC, MC_BIT_AND, MC_BIT_ASL, MC_SUB, MC_BIT_XOR, MC_ADD, MC_PASS2, MC_BIT_LSR, MC_BIT_OR, MC_BIT_ROL, MC_BIT_ROR, MC_SUBB);  -- 13 types
  type MCT_A_LE is (MC_NOP, MC_LE);  -- 2 types
  type MCT_X_LE is (MC_NOP, MC_LE);  -- 2 types
  type MCT_Y_LE is (MC_NOP, MC_LE);  -- 2 types
  type MCT_FLAG_OP is (MC_NOP, MC_NVZC, MC_NZ, MC_NZC, MC_BIT, MC_SETB, MC_SETI, MC_CLEARC, MC_CLEARD, MC_CLEARI, MC_CLEARV, MC_DIN, MC_SETC, MC_SETD);  -- 14 types

  -- Microcode is approxamately 35 bits wide.


  component mc_rom
    port (opcode     :in std_logic_vector (7 downto 0);
          step       :in std_logic_vector (2 downto 0);
          DONE       :out MCT_DONE;
          ADDR_OP    :out MCT_ADDR_OP;
          DIN_LE     :out MCT_DIN_LE;
          RD_EN      :out MCT_RD_EN;
          DOUT_OP    :out MCT_DOUT_OP;
          DINT1_OP   :out MCT_DINT1_OP;
          DINT2_OP   :out MCT_DINT2_OP;
          DINT3_OP   :out MCT_DINT3_OP;
          PC_OP      :out MCT_PC_OP;
          SP_OP      :out MCT_SP_OP;
          ALU1       :out MCT_ALU1;
          ALU2       :out MCT_ALU2;
          ALU_OP     :out MCT_ALU_OP;
          A_LE       :out MCT_A_LE;
          X_LE       :out MCT_X_LE;
          Y_LE       :out MCT_Y_LE;
          FLAG_OP    :out MCT_FLAG_OP
         );
  end component;

  component DONE_rom
    port (addr       :in std_logic_vector (10 downto 0);
          DONE       :out MCT_DONE
         );
  end component;

  component ADDR_OP_rom
    port (addr       :in std_logic_vector (10 downto 0);
          ADDR_OP    :out MCT_ADDR_OP
         );
  end component;

  component DIN_LE_rom
    port (addr       :in std_logic_vector (10 downto 0);
          DIN_LE     :out MCT_DIN_LE
         );
  end component;

  component RD_EN_rom
    port (addr       :in std_logic_vector (10 downto 0);
          RD_EN      :out MCT_RD_EN
         );
  end component;

  component DOUT_OP_rom
    port (addr       :in std_logic_vector (10 downto 0);
          DOUT_OP    :out MCT_DOUT_OP
         );
  end component;

  component DINT1_OP_rom
    port (addr       :in std_logic_vector (10 downto 0);
          DINT1_OP   :out MCT_DINT1_OP
         );
  end component;

  component DINT2_OP_rom
    port (addr       :in std_logic_vector (10 downto 0);
          DINT2_OP   :out MCT_DINT2_OP
         );
  end component;

  component DINT3_OP_rom
    port (addr       :in std_logic_vector (10 downto 0);
          DINT3_OP   :out MCT_DINT3_OP
         );
  end component;

  component PC_OP_rom
    port (addr       :in std_logic_vector (10 downto 0);
          PC_OP      :out MCT_PC_OP
         );
  end component;

  component SP_OP_rom
    port (addr       :in std_logic_vector (10 downto 0);
          SP_OP      :out MCT_SP_OP
         );
  end component;

  component ALU1_rom
    port (addr       :in std_logic_vector (10 downto 0);
          ALU1       :out MCT_ALU1
         );
  end component;

  component ALU2_rom
    port (addr       :in std_logic_vector (10 downto 0);
          ALU2       :out MCT_ALU2
         );
  end component;

  component ALU_OP_rom
    port (addr       :in std_logic_vector (10 downto 0);
          ALU_OP     :out MCT_ALU_OP
         );
  end component;

  component A_LE_rom
    port (addr       :in std_logic_vector (10 downto 0);
          A_LE       :out MCT_A_LE
         );
  end component;

  component X_LE_rom
    port (addr       :in std_logic_vector (10 downto 0);
          X_LE       :out MCT_X_LE
         );
  end component;

  component Y_LE_rom
    port (addr       :in std_logic_vector (10 downto 0);
          Y_LE       :out MCT_Y_LE
         );
  end component;

  component FLAG_OP_rom
    port (addr       :in std_logic_vector (10 downto 0);
          FLAG_OP    :out MCT_FLAG_OP
         );
  end component;

end microcode;

package body microcode is
end microcode;

----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.microcode.all;

entity DONE_rom is
    port (addr       :in std_logic_vector (10 downto 0);
          DONE       :out MCT_DONE
         );
end DONE_rom;


architecture DONE_rom_arch of DONE_rom is
begin
  process (addr)
  begin
    case addr is
        when "01101101011" =>    DONE <= MC_DONE;
        when "01111101011" =>    DONE <= MC_DONE;
        when "01111001011" =>    DONE <= MC_DONE;
        when "01101001001" =>    DONE <= MC_DONE;
        when "01100001101" =>    DONE <= MC_DONE;
        when "01110001101" =>    DONE <= MC_DONE;
        when "01100101010" =>    DONE <= MC_DONE;
        when "01110101010" =>    DONE <= MC_DONE;
        when "00101101011" =>    DONE <= MC_DONE;
        when "00111101011" =>    DONE <= MC_DONE;
        when "00111001011" =>    DONE <= MC_DONE;
        when "00101001001" =>    DONE <= MC_DONE;
        when "00100001101" =>    DONE <= MC_DONE;
        when "00110001101" =>    DONE <= MC_DONE;
        when "00100101010" =>    DONE <= MC_DONE;
        when "00110101010" =>    DONE <= MC_DONE;
        when "00001110110" =>    DONE <= MC_DONE;
        when "00011110110" =>    DONE <= MC_DONE;
        when "00001010000" =>    DONE <= MC_DONE;
        when "00000110101" =>    DONE <= MC_DONE;
        when "00010110101" =>    DONE <= MC_DONE;
        when "10010000010" =>    DONE <= MC_DONE;
        when "10110000010" =>    DONE <= MC_DONE;
        when "11110000010" =>    DONE <= MC_DONE;
        when "00101100011" =>    DONE <= MC_DONE;
        when "00100100010" =>    DONE <= MC_DONE;
        when "00110000010" =>    DONE <= MC_DONE;
        when "11010000010" =>    DONE <= MC_DONE;
        when "00010000010" =>    DONE <= MC_DONE;
        when "00000000101" =>    DONE <= MC_DONE;
        when "01010000010" =>    DONE <= MC_DONE;
        when "01110000010" =>    DONE <= MC_DONE;
        when "00011000000" =>    DONE <= MC_DONE;
        when "11011000000" =>    DONE <= MC_DONE;
        when "01011000000" =>    DONE <= MC_DONE;
        when "10111000000" =>    DONE <= MC_DONE;
        when "11001101011" =>    DONE <= MC_DONE;
        when "11011101011" =>    DONE <= MC_DONE;
        when "11011001011" =>    DONE <= MC_DONE;
        when "11001001001" =>    DONE <= MC_DONE;
        when "11000001101" =>    DONE <= MC_DONE;
        when "11010001101" =>    DONE <= MC_DONE;
        when "11000101010" =>    DONE <= MC_DONE;
        when "11010101010" =>    DONE <= MC_DONE;
        when "11101100011" =>    DONE <= MC_DONE;
        when "11100000001" =>    DONE <= MC_DONE;
        when "11100100010" =>    DONE <= MC_DONE;
        when "11001100011" =>    DONE <= MC_DONE;
        when "11000000001" =>    DONE <= MC_DONE;
        when "11000100010" =>    DONE <= MC_DONE;
        when "11001110110" =>    DONE <= MC_DONE;
        when "11011110110" =>    DONE <= MC_DONE;
        when "11000110101" =>    DONE <= MC_DONE;
        when "11010110101" =>    DONE <= MC_DONE;
        when "11001010000" =>    DONE <= MC_DONE;
        when "10001000000" =>    DONE <= MC_DONE;
        when "01001101011" =>    DONE <= MC_DONE;
        when "01011101011" =>    DONE <= MC_DONE;
        when "01011001011" =>    DONE <= MC_DONE;
        when "01001001001" =>    DONE <= MC_DONE;
        when "01000001101" =>    DONE <= MC_DONE;
        when "01010001101" =>    DONE <= MC_DONE;
        when "01000101010" =>    DONE <= MC_DONE;
        when "01010101010" =>    DONE <= MC_DONE;
        when "11101110110" =>    DONE <= MC_DONE;
        when "11111110110" =>    DONE <= MC_DONE;
        when "11100110101" =>    DONE <= MC_DONE;
        when "11110110101" =>    DONE <= MC_DONE;
        when "11101000000" =>    DONE <= MC_DONE;
        when "11001000000" =>    DONE <= MC_DONE;
        when "01001100011" =>    DONE <= MC_DONE;
        when "01101100110" =>    DONE <= MC_DONE;
        when "00100000011" =>    DONE <= MC_DONE;
        when "10101101011" =>    DONE <= MC_DONE;
        when "10111101011" =>    DONE <= MC_DONE;
        when "10111001011" =>    DONE <= MC_DONE;
        when "10101001001" =>    DONE <= MC_DONE;
        when "10100101010" =>    DONE <= MC_DONE;
        when "10100001101" =>    DONE <= MC_DONE;
        when "10110001101" =>    DONE <= MC_DONE;
        when "10110101010" =>    DONE <= MC_DONE;
        when "10101110011" =>    DONE <= MC_DONE;
        when "10111110011" =>    DONE <= MC_DONE;
        when "10100010001" =>    DONE <= MC_DONE;
        when "10100110010" =>    DONE <= MC_DONE;
        when "10110110010" =>    DONE <= MC_DONE;
        when "10101100011" =>    DONE <= MC_DONE;
        when "10111100011" =>    DONE <= MC_DONE;
        when "10100000001" =>    DONE <= MC_DONE;
        when "10100100010" =>    DONE <= MC_DONE;
        when "10110100010" =>    DONE <= MC_DONE;
        when "01001110110" =>    DONE <= MC_DONE;
        when "01011110110" =>    DONE <= MC_DONE;
        when "01001010000" =>    DONE <= MC_DONE;
        when "01000110101" =>    DONE <= MC_DONE;
        when "01010110101" =>    DONE <= MC_DONE;
        when "11101010000" =>    DONE <= MC_DONE;
        when "00001101011" =>    DONE <= MC_DONE;
        when "00011101011" =>    DONE <= MC_DONE;
        when "00011001011" =>    DONE <= MC_DONE;
        when "00001001001" =>    DONE <= MC_DONE;
        when "00000001101" =>    DONE <= MC_DONE;
        when "00010001101" =>    DONE <= MC_DONE;
        when "00000101010" =>    DONE <= MC_DONE;
        when "00010101010" =>    DONE <= MC_DONE;
        when "01001000001" =>    DONE <= MC_DONE;
        when "00001000001" =>    DONE <= MC_DONE;
        when "01101000010" =>    DONE <= MC_DONE;
        when "00101000010" =>    DONE <= MC_DONE;
        when "00000011100" =>    DONE <= MC_DONE;
        when "00101110110" =>    DONE <= MC_DONE;
        when "00111110110" =>    DONE <= MC_DONE;
        when "00101010000" =>    DONE <= MC_DONE;
        when "00100110101" =>    DONE <= MC_DONE;
        when "00110110101" =>    DONE <= MC_DONE;
        when "01101110110" =>    DONE <= MC_DONE;
        when "01111110110" =>    DONE <= MC_DONE;
        when "01101010000" =>    DONE <= MC_DONE;
        when "01100110101" =>    DONE <= MC_DONE;
        when "01110110101" =>    DONE <= MC_DONE;
        when "01000000110" =>    DONE <= MC_DONE;
        when "01100000110" =>    DONE <= MC_DONE;
        when "11101101011" =>    DONE <= MC_DONE;
        when "11111101011" =>    DONE <= MC_DONE;
        when "11111001011" =>    DONE <= MC_DONE;
        when "11101001001" =>    DONE <= MC_DONE;
        when "11100001101" =>    DONE <= MC_DONE;
        when "11110001101" =>    DONE <= MC_DONE;
        when "11100101010" =>    DONE <= MC_DONE;
        when "11110101010" =>    DONE <= MC_DONE;
        when "00111000000" =>    DONE <= MC_DONE;
        when "11111000000" =>    DONE <= MC_DONE;
        when "01111000000" =>    DONE <= MC_DONE;
        when "10001101011" =>    DONE <= MC_DONE;
        when "10011001011" =>    DONE <= MC_DONE;
        when "10000001101" =>    DONE <= MC_DONE;
        when "10010001101" =>    DONE <= MC_DONE;
        when "10000101010" =>    DONE <= MC_DONE;
        when "10010101010" =>    DONE <= MC_DONE;
        when "10011101011" =>    DONE <= MC_DONE;
        when "01000011110" =>    DONE <= MC_DONE;
        when "00110011110" =>    DONE <= MC_DONE;
        when "10001110011" =>    DONE <= MC_DONE;
        when "10000110010" =>    DONE <= MC_DONE;
        when "10010110010" =>    DONE <= MC_DONE;
        when "10001100011" =>    DONE <= MC_DONE;
        when "10000100010" =>    DONE <= MC_DONE;
        when "10010100010" =>    DONE <= MC_DONE;
        when "10101010000" =>    DONE <= MC_DONE;
        when "10101000000" =>    DONE <= MC_DONE;
        when "10111010000" =>    DONE <= MC_DONE;
        when "10001010000" =>    DONE <= MC_DONE;
        when "10011010000" =>    DONE <= MC_DONE;
        when "10011000000" =>    DONE <= MC_DONE;
        when others =>    DONE <= MC_NOP;
    end case;
  end process;
end DONE_rom_arch;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.microcode.all;

entity ADDR_OP_rom is
    port (addr       :in std_logic_vector (10 downto 0);
          ADDR_OP    :out MCT_ADDR_OP
         );
end ADDR_OP_rom;


architecture ADDR_OP_rom_arch of ADDR_OP_rom is
begin
  process (addr)
  begin
    case addr is
        when "01101101000" =>    ADDR_OP <= MC_PC_P;
        when "01101101010" =>    ADDR_OP <= MC_SPLIT;
        when "01111101000" =>    ADDR_OP <= MC_PC_P;
        when "01111101010" =>    ADDR_OP <= MC_SPLIT_X;
        when "01111001000" =>    ADDR_OP <= MC_PC_P;
        when "01111001010" =>    ADDR_OP <= MC_SPLIT_Y;
        when "01100001001" =>    ADDR_OP <= MC_DIN_ZX;
        when "01100001010" =>    ADDR_OP <= MC_DIN_ZXP;
        when "01100001100" =>    ADDR_OP <= MC_SPLIT;
        when "01110001001" =>    ADDR_OP <= MC_DIN_Z;
        when "01110001010" =>    ADDR_OP <= MC_DIN_ZP;
        when "01110001100" =>    ADDR_OP <= MC_SPLIT_Y;
        when "01100101001" =>    ADDR_OP <= MC_DIN_Z;
        when "01110101001" =>    ADDR_OP <= MC_DIN_ZX;
        when "00101101000" =>    ADDR_OP <= MC_PC_P;
        when "00101101010" =>    ADDR_OP <= MC_SPLIT;
        when "00111101000" =>    ADDR_OP <= MC_PC_P;
        when "00111101010" =>    ADDR_OP <= MC_SPLIT_X;
        when "00111001000" =>    ADDR_OP <= MC_PC_P;
        when "00111001010" =>    ADDR_OP <= MC_SPLIT_Y;
        when "00100001001" =>    ADDR_OP <= MC_DIN_ZX;
        when "00100001010" =>    ADDR_OP <= MC_DIN_ZXP;
        when "00100001100" =>    ADDR_OP <= MC_SPLIT;
        when "00110001001" =>    ADDR_OP <= MC_DIN_Z;
        when "00110001010" =>    ADDR_OP <= MC_DIN_ZP;
        when "00110001100" =>    ADDR_OP <= MC_SPLIT_Y;
        when "00100101001" =>    ADDR_OP <= MC_DIN_Z;
        when "00110101001" =>    ADDR_OP <= MC_DIN_ZX;
        when "00001110000" =>    ADDR_OP <= MC_PC_P;
        when "00001110010" =>    ADDR_OP <= MC_SPLIT;
        when "00001110101" =>    ADDR_OP <= MC_DINT16;
        when "00011110000" =>    ADDR_OP <= MC_PC_P;
        when "00011110010" =>    ADDR_OP <= MC_SPLIT_X;
        when "00011110101" =>    ADDR_OP <= MC_DINT16_X;
        when "00000110001" =>    ADDR_OP <= MC_DIN_Z;
        when "00000110100" =>    ADDR_OP <= MC_DINT1_Z;
        when "00010110001" =>    ADDR_OP <= MC_DIN_ZX;
        when "00010110100" =>    ADDR_OP <= MC_DINT1_ZX;
        when "00101100000" =>    ADDR_OP <= MC_PC_P;
        when "00101100010" =>    ADDR_OP <= MC_SPLIT;
        when "00100100001" =>    ADDR_OP <= MC_DIN_Z;
        when "00000000000" =>    ADDR_OP <= MC_V_IRQ1;
        when "00000000001" =>    ADDR_OP <= MC_V_IRQ2;
        when "00000000010" =>    ADDR_OP <= MC_SP;
        when "00000000011" =>    ADDR_OP <= MC_SP;
        when "00000000100" =>    ADDR_OP <= MC_SP;
        when "11001101000" =>    ADDR_OP <= MC_PC_P;
        when "11001101010" =>    ADDR_OP <= MC_SPLIT;
        when "11011101000" =>    ADDR_OP <= MC_PC_P;
        when "11011101010" =>    ADDR_OP <= MC_SPLIT_X;
        when "11011001000" =>    ADDR_OP <= MC_PC_P;
        when "11011001010" =>    ADDR_OP <= MC_SPLIT_Y;
        when "11000001001" =>    ADDR_OP <= MC_DIN_ZX;
        when "11000001010" =>    ADDR_OP <= MC_DIN_ZXP;
        when "11000001100" =>    ADDR_OP <= MC_SPLIT;
        when "11010001001" =>    ADDR_OP <= MC_DIN_Z;
        when "11010001010" =>    ADDR_OP <= MC_DIN_ZP;
        when "11010001100" =>    ADDR_OP <= MC_SPLIT_Y;
        when "11000101001" =>    ADDR_OP <= MC_DIN_Z;
        when "11010101001" =>    ADDR_OP <= MC_DIN_ZX;
        when "11101100000" =>    ADDR_OP <= MC_PC_P;
        when "11101100010" =>    ADDR_OP <= MC_SPLIT;
        when "11100100001" =>    ADDR_OP <= MC_DIN_Z;
        when "11001100000" =>    ADDR_OP <= MC_PC_P;
        when "11001100010" =>    ADDR_OP <= MC_SPLIT;
        when "11000100001" =>    ADDR_OP <= MC_DIN_Z;
        when "11001110000" =>    ADDR_OP <= MC_PC_P;
        when "11001110010" =>    ADDR_OP <= MC_SPLIT;
        when "11001110101" =>    ADDR_OP <= MC_DINT16;
        when "11011110000" =>    ADDR_OP <= MC_PC_P;
        when "11011110010" =>    ADDR_OP <= MC_SPLIT_X;
        when "11011110101" =>    ADDR_OP <= MC_DINT16_X;
        when "11000110001" =>    ADDR_OP <= MC_DIN_Z;
        when "11000110100" =>    ADDR_OP <= MC_DINT1_Z;
        when "11010110001" =>    ADDR_OP <= MC_DIN_ZX;
        when "11010110100" =>    ADDR_OP <= MC_DINT1_ZX;
        when "01001101000" =>    ADDR_OP <= MC_PC_P;
        when "01001101010" =>    ADDR_OP <= MC_SPLIT;
        when "01011101000" =>    ADDR_OP <= MC_PC_P;
        when "01011101010" =>    ADDR_OP <= MC_SPLIT_X;
        when "01011001000" =>    ADDR_OP <= MC_PC_P;
        when "01011001010" =>    ADDR_OP <= MC_SPLIT_Y;
        when "01000001001" =>    ADDR_OP <= MC_DIN_ZX;
        when "01000001010" =>    ADDR_OP <= MC_DIN_ZXP;
        when "01000001100" =>    ADDR_OP <= MC_SPLIT;
        when "01010001001" =>    ADDR_OP <= MC_DIN_Z;
        when "01010001010" =>    ADDR_OP <= MC_DIN_ZP;
        when "01010001100" =>    ADDR_OP <= MC_SPLIT_Y;
        when "01000101001" =>    ADDR_OP <= MC_DIN_Z;
        when "01010101001" =>    ADDR_OP <= MC_DIN_ZX;
        when "11101110000" =>    ADDR_OP <= MC_PC_P;
        when "11101110010" =>    ADDR_OP <= MC_SPLIT;
        when "11101110101" =>    ADDR_OP <= MC_DINT16;
        when "11111110000" =>    ADDR_OP <= MC_PC_P;
        when "11111110010" =>    ADDR_OP <= MC_SPLIT_X;
        when "11111110101" =>    ADDR_OP <= MC_DINT16_X;
        when "11100110001" =>    ADDR_OP <= MC_DIN_Z;
        when "11100110100" =>    ADDR_OP <= MC_DINT1_Z;
        when "11110110001" =>    ADDR_OP <= MC_DIN_ZX;
        when "11110110100" =>    ADDR_OP <= MC_DINT1_ZX;
        when "01001100000" =>    ADDR_OP <= MC_PC_P;
        when "01101100000" =>    ADDR_OP <= MC_PC_P;
        when "01101100010" =>    ADDR_OP <= MC_SPLIT;
        when "01101100011" =>    ADDR_OP <= MC_SPLIT_P;
        when "00100000000" =>    ADDR_OP <= MC_PC_P;
        when "00100000001" =>    ADDR_OP <= MC_SP;
        when "00100000010" =>    ADDR_OP <= MC_SP;
        when "10101101000" =>    ADDR_OP <= MC_PC_P;
        when "10101101010" =>    ADDR_OP <= MC_SPLIT;
        when "10111101000" =>    ADDR_OP <= MC_PC_P;
        when "10111101010" =>    ADDR_OP <= MC_SPLIT_X;
        when "10111001000" =>    ADDR_OP <= MC_PC_P;
        when "10111001010" =>    ADDR_OP <= MC_SPLIT_Y;
        when "10100101001" =>    ADDR_OP <= MC_DIN_Z;
        when "10100001001" =>    ADDR_OP <= MC_DIN_ZX;
        when "10100001010" =>    ADDR_OP <= MC_DIN_ZXP;
        when "10100001100" =>    ADDR_OP <= MC_SPLIT;
        when "10110001001" =>    ADDR_OP <= MC_DIN_Z;
        when "10110001010" =>    ADDR_OP <= MC_DIN_ZP;
        when "10110001100" =>    ADDR_OP <= MC_SPLIT_Y;
        when "10110101001" =>    ADDR_OP <= MC_DIN_ZX;
        when "10101110000" =>    ADDR_OP <= MC_PC_P;
        when "10101110010" =>    ADDR_OP <= MC_SPLIT;
        when "10111110000" =>    ADDR_OP <= MC_PC_P;
        when "10111110010" =>    ADDR_OP <= MC_SPLIT_Y;
        when "10100110001" =>    ADDR_OP <= MC_DIN_Z;
        when "10110110001" =>    ADDR_OP <= MC_DIN_ZY;
        when "10101100000" =>    ADDR_OP <= MC_PC_P;
        when "10101100010" =>    ADDR_OP <= MC_SPLIT;
        when "10111100000" =>    ADDR_OP <= MC_PC_P;
        when "10111100010" =>    ADDR_OP <= MC_SPLIT_X;
        when "10100100001" =>    ADDR_OP <= MC_DIN_Z;
        when "10110100001" =>    ADDR_OP <= MC_DIN_ZX;
        when "01001110000" =>    ADDR_OP <= MC_PC_P;
        when "01001110010" =>    ADDR_OP <= MC_SPLIT;
        when "01001110101" =>    ADDR_OP <= MC_DINT16;
        when "01011110000" =>    ADDR_OP <= MC_PC_P;
        when "01011110010" =>    ADDR_OP <= MC_SPLIT_X;
        when "01011110101" =>    ADDR_OP <= MC_DINT16_X;
        when "01000110001" =>    ADDR_OP <= MC_DIN_Z;
        when "01000110100" =>    ADDR_OP <= MC_DINT1_Z;
        when "01010110001" =>    ADDR_OP <= MC_DIN_ZX;
        when "01010110100" =>    ADDR_OP <= MC_DINT1_ZX;
        when "00001101000" =>    ADDR_OP <= MC_PC_P;
        when "00001101010" =>    ADDR_OP <= MC_SPLIT;
        when "00011101000" =>    ADDR_OP <= MC_PC_P;
        when "00011101010" =>    ADDR_OP <= MC_SPLIT_X;
        when "00011001000" =>    ADDR_OP <= MC_PC_P;
        when "00011001010" =>    ADDR_OP <= MC_SPLIT_Y;
        when "00000001001" =>    ADDR_OP <= MC_DIN_ZX;
        when "00000001010" =>    ADDR_OP <= MC_DIN_ZXP;
        when "00000001100" =>    ADDR_OP <= MC_SPLIT;
        when "00010001001" =>    ADDR_OP <= MC_DIN_Z;
        when "00010001010" =>    ADDR_OP <= MC_DIN_ZP;
        when "00010001100" =>    ADDR_OP <= MC_SPLIT_Y;
        when "00000101001" =>    ADDR_OP <= MC_DIN_Z;
        when "00010101001" =>    ADDR_OP <= MC_DIN_ZX;
        when "01001000000" =>    ADDR_OP <= MC_SP;
        when "00001000000" =>    ADDR_OP <= MC_SP;
        when "01101000001" =>    ADDR_OP <= MC_SP;
        when "00101000001" =>    ADDR_OP <= MC_SP;
        when "00000011000" =>    ADDR_OP <= MC_V_RESET1;
        when "00000011001" =>    ADDR_OP <= MC_V_RESET2;
        when "00101110000" =>    ADDR_OP <= MC_PC_P;
        when "00101110010" =>    ADDR_OP <= MC_SPLIT;
        when "00101110101" =>    ADDR_OP <= MC_DINT16;
        when "00111110000" =>    ADDR_OP <= MC_PC_P;
        when "00111110010" =>    ADDR_OP <= MC_SPLIT_X;
        when "00111110101" =>    ADDR_OP <= MC_DINT16_X;
        when "00100110001" =>    ADDR_OP <= MC_DIN_Z;
        when "00100110100" =>    ADDR_OP <= MC_DINT1_Z;
        when "00110110001" =>    ADDR_OP <= MC_DIN_ZX;
        when "00110110100" =>    ADDR_OP <= MC_DINT1_ZX;
        when "01101110000" =>    ADDR_OP <= MC_PC_P;
        when "01101110010" =>    ADDR_OP <= MC_SPLIT;
        when "01101110101" =>    ADDR_OP <= MC_DINT16;
        when "01111110000" =>    ADDR_OP <= MC_PC_P;
        when "01111110010" =>    ADDR_OP <= MC_SPLIT_X;
        when "01111110101" =>    ADDR_OP <= MC_DINT16_X;
        when "01100110001" =>    ADDR_OP <= MC_DIN_Z;
        when "01100110100" =>    ADDR_OP <= MC_DINT1_Z;
        when "01110110001" =>    ADDR_OP <= MC_DIN_ZX;
        when "01110110100" =>    ADDR_OP <= MC_DINT1_ZX;
        when "01000000001" =>    ADDR_OP <= MC_SP;
        when "01000000010" =>    ADDR_OP <= MC_SP;
        when "01000000011" =>    ADDR_OP <= MC_SP;
        when "01100000001" =>    ADDR_OP <= MC_SP;
        when "01100000010" =>    ADDR_OP <= MC_SP;
        when "11101101000" =>    ADDR_OP <= MC_PC_P;
        when "11101101010" =>    ADDR_OP <= MC_SPLIT;
        when "11111101000" =>    ADDR_OP <= MC_PC_P;
        when "11111101010" =>    ADDR_OP <= MC_SPLIT_X;
        when "11111001000" =>    ADDR_OP <= MC_PC_P;
        when "11111001010" =>    ADDR_OP <= MC_SPLIT_Y;
        when "11100001001" =>    ADDR_OP <= MC_DIN_ZX;
        when "11100001010" =>    ADDR_OP <= MC_DIN_ZXP;
        when "11100001100" =>    ADDR_OP <= MC_SPLIT;
        when "11110001001" =>    ADDR_OP <= MC_DIN_Z;
        when "11110001010" =>    ADDR_OP <= MC_DIN_ZP;
        when "11110001100" =>    ADDR_OP <= MC_SPLIT_Y;
        when "11100101001" =>    ADDR_OP <= MC_DIN_Z;
        when "11110101001" =>    ADDR_OP <= MC_DIN_ZX;
        when "10001101000" =>    ADDR_OP <= MC_PC_P;
        when "10001101010" =>    ADDR_OP <= MC_SPLIT;
        when "10011001000" =>    ADDR_OP <= MC_PC_P;
        when "10011001010" =>    ADDR_OP <= MC_SPLIT_Y;
        when "10000001001" =>    ADDR_OP <= MC_DIN_ZX;
        when "10000001010" =>    ADDR_OP <= MC_DIN_ZXP;
        when "10000001100" =>    ADDR_OP <= MC_SPLIT;
        when "10010001001" =>    ADDR_OP <= MC_DIN_Z;
        when "10010001010" =>    ADDR_OP <= MC_DIN_ZP;
        when "10010001100" =>    ADDR_OP <= MC_SPLIT_Y;
        when "10000101001" =>    ADDR_OP <= MC_DIN_Z;
        when "10010101001" =>    ADDR_OP <= MC_DIN_ZX;
        when "10011101000" =>    ADDR_OP <= MC_PC_P;
        when "10011101010" =>    ADDR_OP <= MC_SPLIT_X;
        when "01000011000" =>    ADDR_OP <= MC_V_IRQ1;
        when "01000011001" =>    ADDR_OP <= MC_V_IRQ2;
        when "01000011010" =>    ADDR_OP <= MC_SP;
        when "01000011011" =>    ADDR_OP <= MC_SP;
        when "01000011100" =>    ADDR_OP <= MC_SP;
        when "00110011000" =>    ADDR_OP <= MC_V_NMI1;
        when "00110011001" =>    ADDR_OP <= MC_V_NMI2;
        when "00110011010" =>    ADDR_OP <= MC_SP;
        when "00110011011" =>    ADDR_OP <= MC_SP;
        when "00110011100" =>    ADDR_OP <= MC_SP;
        when "10001110000" =>    ADDR_OP <= MC_PC_P;
        when "10001110010" =>    ADDR_OP <= MC_SPLIT;
        when "10000110001" =>    ADDR_OP <= MC_DIN_Z;
        when "10010110001" =>    ADDR_OP <= MC_DIN_ZY;
        when "10001100000" =>    ADDR_OP <= MC_PC_P;
        when "10001100010" =>    ADDR_OP <= MC_SPLIT;
        when "10000100001" =>    ADDR_OP <= MC_DIN_Z;
        when "10010100001" =>    ADDR_OP <= MC_DIN_ZX;
        when others =>    ADDR_OP <= MC_NOP;
    end case;
  end process;
end ADDR_OP_rom_arch;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.microcode.all;

entity DIN_LE_rom is
    port (addr       :in std_logic_vector (10 downto 0);
          DIN_LE     :out MCT_DIN_LE
         );
end DIN_LE_rom;


architecture DIN_LE_rom_arch of DIN_LE_rom is
begin
  process (addr)
  begin
    case addr is
        when "01101101000" =>    DIN_LE <= MC_EN;
        when "01101101001" =>    DIN_LE <= MC_EN;
        when "01101101011" =>    DIN_LE <= MC_EN;
        when "01111101000" =>    DIN_LE <= MC_EN;
        when "01111101001" =>    DIN_LE <= MC_EN;
        when "01111101011" =>    DIN_LE <= MC_EN;
        when "01111001000" =>    DIN_LE <= MC_EN;
        when "01111001001" =>    DIN_LE <= MC_EN;
        when "01111001011" =>    DIN_LE <= MC_EN;
        when "01101001000" =>    DIN_LE <= MC_EN;
        when "01100001000" =>    DIN_LE <= MC_EN;
        when "01100001010" =>    DIN_LE <= MC_EN;
        when "01100001011" =>    DIN_LE <= MC_EN;
        when "01100001101" =>    DIN_LE <= MC_EN;
        when "01110001000" =>    DIN_LE <= MC_EN;
        when "01110001010" =>    DIN_LE <= MC_EN;
        when "01110001011" =>    DIN_LE <= MC_EN;
        when "01110001101" =>    DIN_LE <= MC_EN;
        when "01100101000" =>    DIN_LE <= MC_EN;
        when "01100101010" =>    DIN_LE <= MC_EN;
        when "01110101000" =>    DIN_LE <= MC_EN;
        when "01110101010" =>    DIN_LE <= MC_EN;
        when "00101101000" =>    DIN_LE <= MC_EN;
        when "00101101001" =>    DIN_LE <= MC_EN;
        when "00101101011" =>    DIN_LE <= MC_EN;
        when "00111101000" =>    DIN_LE <= MC_EN;
        when "00111101001" =>    DIN_LE <= MC_EN;
        when "00111101011" =>    DIN_LE <= MC_EN;
        when "00111001000" =>    DIN_LE <= MC_EN;
        when "00111001001" =>    DIN_LE <= MC_EN;
        when "00111001011" =>    DIN_LE <= MC_EN;
        when "00101001000" =>    DIN_LE <= MC_EN;
        when "00100001000" =>    DIN_LE <= MC_EN;
        when "00100001010" =>    DIN_LE <= MC_EN;
        when "00100001011" =>    DIN_LE <= MC_EN;
        when "00100001101" =>    DIN_LE <= MC_EN;
        when "00110001000" =>    DIN_LE <= MC_EN;
        when "00110001010" =>    DIN_LE <= MC_EN;
        when "00110001011" =>    DIN_LE <= MC_EN;
        when "00110001101" =>    DIN_LE <= MC_EN;
        when "00100101000" =>    DIN_LE <= MC_EN;
        when "00100101010" =>    DIN_LE <= MC_EN;
        when "00110101000" =>    DIN_LE <= MC_EN;
        when "00110101010" =>    DIN_LE <= MC_EN;
        when "00001110000" =>    DIN_LE <= MC_EN;
        when "00001110001" =>    DIN_LE <= MC_EN;
        when "00001110011" =>    DIN_LE <= MC_EN;
        when "00011110000" =>    DIN_LE <= MC_EN;
        when "00011110001" =>    DIN_LE <= MC_EN;
        when "00011110011" =>    DIN_LE <= MC_EN;
        when "00000110000" =>    DIN_LE <= MC_EN;
        when "00000110010" =>    DIN_LE <= MC_EN;
        when "00010110000" =>    DIN_LE <= MC_EN;
        when "00010110010" =>    DIN_LE <= MC_EN;
        when "10010000000" =>    DIN_LE <= MC_EN;
        when "10110000000" =>    DIN_LE <= MC_EN;
        when "11110000000" =>    DIN_LE <= MC_EN;
        when "00101100000" =>    DIN_LE <= MC_EN;
        when "00101100001" =>    DIN_LE <= MC_EN;
        when "00101100011" =>    DIN_LE <= MC_EN;
        when "00100100000" =>    DIN_LE <= MC_EN;
        when "00100100010" =>    DIN_LE <= MC_EN;
        when "00110000000" =>    DIN_LE <= MC_EN;
        when "11010000000" =>    DIN_LE <= MC_EN;
        when "00010000000" =>    DIN_LE <= MC_EN;
        when "00000000001" =>    DIN_LE <= MC_EN;
        when "00000000010" =>    DIN_LE <= MC_EN;
        when "01010000000" =>    DIN_LE <= MC_EN;
        when "01110000000" =>    DIN_LE <= MC_EN;
        when "11001101000" =>    DIN_LE <= MC_EN;
        when "11001101001" =>    DIN_LE <= MC_EN;
        when "11001101011" =>    DIN_LE <= MC_EN;
        when "11011101000" =>    DIN_LE <= MC_EN;
        when "11011101001" =>    DIN_LE <= MC_EN;
        when "11011101011" =>    DIN_LE <= MC_EN;
        when "11011001000" =>    DIN_LE <= MC_EN;
        when "11011001001" =>    DIN_LE <= MC_EN;
        when "11011001011" =>    DIN_LE <= MC_EN;
        when "11001001000" =>    DIN_LE <= MC_EN;
        when "11000001000" =>    DIN_LE <= MC_EN;
        when "11000001010" =>    DIN_LE <= MC_EN;
        when "11000001011" =>    DIN_LE <= MC_EN;
        when "11000001101" =>    DIN_LE <= MC_EN;
        when "11010001000" =>    DIN_LE <= MC_EN;
        when "11010001010" =>    DIN_LE <= MC_EN;
        when "11010001011" =>    DIN_LE <= MC_EN;
        when "11010001101" =>    DIN_LE <= MC_EN;
        when "11000101000" =>    DIN_LE <= MC_EN;
        when "11000101010" =>    DIN_LE <= MC_EN;
        when "11010101000" =>    DIN_LE <= MC_EN;
        when "11010101010" =>    DIN_LE <= MC_EN;
        when "11101100000" =>    DIN_LE <= MC_EN;
        when "11101100001" =>    DIN_LE <= MC_EN;
        when "11101100011" =>    DIN_LE <= MC_EN;
        when "11100000000" =>    DIN_LE <= MC_EN;
        when "11100100000" =>    DIN_LE <= MC_EN;
        when "11100100010" =>    DIN_LE <= MC_EN;
        when "11001100000" =>    DIN_LE <= MC_EN;
        when "11001100001" =>    DIN_LE <= MC_EN;
        when "11001100011" =>    DIN_LE <= MC_EN;
        when "11000000000" =>    DIN_LE <= MC_EN;
        when "11000100000" =>    DIN_LE <= MC_EN;
        when "11000100010" =>    DIN_LE <= MC_EN;
        when "11001110000" =>    DIN_LE <= MC_EN;
        when "11001110001" =>    DIN_LE <= MC_EN;
        when "11001110011" =>    DIN_LE <= MC_EN;
        when "11011110000" =>    DIN_LE <= MC_EN;
        when "11011110001" =>    DIN_LE <= MC_EN;
        when "11011110011" =>    DIN_LE <= MC_EN;
        when "11000110000" =>    DIN_LE <= MC_EN;
        when "11000110010" =>    DIN_LE <= MC_EN;
        when "11010110000" =>    DIN_LE <= MC_EN;
        when "11010110010" =>    DIN_LE <= MC_EN;
        when "01001101000" =>    DIN_LE <= MC_EN;
        when "01001101001" =>    DIN_LE <= MC_EN;
        when "01001101011" =>    DIN_LE <= MC_EN;
        when "01011101000" =>    DIN_LE <= MC_EN;
        when "01011101001" =>    DIN_LE <= MC_EN;
        when "01011101011" =>    DIN_LE <= MC_EN;
        when "01011001000" =>    DIN_LE <= MC_EN;
        when "01011001001" =>    DIN_LE <= MC_EN;
        when "01011001011" =>    DIN_LE <= MC_EN;
        when "01001001000" =>    DIN_LE <= MC_EN;
        when "01000001000" =>    DIN_LE <= MC_EN;
        when "01000001010" =>    DIN_LE <= MC_EN;
        when "01000001011" =>    DIN_LE <= MC_EN;
        when "01000001101" =>    DIN_LE <= MC_EN;
        when "01010001000" =>    DIN_LE <= MC_EN;
        when "01010001010" =>    DIN_LE <= MC_EN;
        when "01010001011" =>    DIN_LE <= MC_EN;
        when "01010001101" =>    DIN_LE <= MC_EN;
        when "01000101000" =>    DIN_LE <= MC_EN;
        when "01000101010" =>    DIN_LE <= MC_EN;
        when "01010101000" =>    DIN_LE <= MC_EN;
        when "01010101010" =>    DIN_LE <= MC_EN;
        when "11101110000" =>    DIN_LE <= MC_EN;
        when "11101110001" =>    DIN_LE <= MC_EN;
        when "11101110011" =>    DIN_LE <= MC_EN;
        when "11111110000" =>    DIN_LE <= MC_EN;
        when "11111110001" =>    DIN_LE <= MC_EN;
        when "11111110011" =>    DIN_LE <= MC_EN;
        when "11100110000" =>    DIN_LE <= MC_EN;
        when "11100110010" =>    DIN_LE <= MC_EN;
        when "11110110000" =>    DIN_LE <= MC_EN;
        when "11110110010" =>    DIN_LE <= MC_EN;
        when "01001100000" =>    DIN_LE <= MC_EN;
        when "01001100001" =>    DIN_LE <= MC_EN;
        when "01101100000" =>    DIN_LE <= MC_EN;
        when "01101100001" =>    DIN_LE <= MC_EN;
        when "01101100011" =>    DIN_LE <= MC_EN;
        when "01101100100" =>    DIN_LE <= MC_EN;
        when "00100000000" =>    DIN_LE <= MC_EN;
        when "00100000001" =>    DIN_LE <= MC_EN;
        when "10101101000" =>    DIN_LE <= MC_EN;
        when "10101101001" =>    DIN_LE <= MC_EN;
        when "10101101011" =>    DIN_LE <= MC_EN;
        when "10111101000" =>    DIN_LE <= MC_EN;
        when "10111101001" =>    DIN_LE <= MC_EN;
        when "10111101011" =>    DIN_LE <= MC_EN;
        when "10111001000" =>    DIN_LE <= MC_EN;
        when "10111001001" =>    DIN_LE <= MC_EN;
        when "10111001011" =>    DIN_LE <= MC_EN;
        when "10101001000" =>    DIN_LE <= MC_EN;
        when "10100101000" =>    DIN_LE <= MC_EN;
        when "10100101010" =>    DIN_LE <= MC_EN;
        when "10100001000" =>    DIN_LE <= MC_EN;
        when "10100001010" =>    DIN_LE <= MC_EN;
        when "10100001011" =>    DIN_LE <= MC_EN;
        when "10100001101" =>    DIN_LE <= MC_EN;
        when "10110001000" =>    DIN_LE <= MC_EN;
        when "10110001010" =>    DIN_LE <= MC_EN;
        when "10110001011" =>    DIN_LE <= MC_EN;
        when "10110001101" =>    DIN_LE <= MC_EN;
        when "10110101000" =>    DIN_LE <= MC_EN;
        when "10110101010" =>    DIN_LE <= MC_EN;
        when "10101110000" =>    DIN_LE <= MC_EN;
        when "10101110001" =>    DIN_LE <= MC_EN;
        when "10101110011" =>    DIN_LE <= MC_EN;
        when "10111110000" =>    DIN_LE <= MC_EN;
        when "10111110001" =>    DIN_LE <= MC_EN;
        when "10111110011" =>    DIN_LE <= MC_EN;
        when "10100010000" =>    DIN_LE <= MC_EN;
        when "10100110000" =>    DIN_LE <= MC_EN;
        when "10100110010" =>    DIN_LE <= MC_EN;
        when "10110110000" =>    DIN_LE <= MC_EN;
        when "10110110010" =>    DIN_LE <= MC_EN;
        when "10101100000" =>    DIN_LE <= MC_EN;
        when "10101100001" =>    DIN_LE <= MC_EN;
        when "10101100011" =>    DIN_LE <= MC_EN;
        when "10111100000" =>    DIN_LE <= MC_EN;
        when "10111100001" =>    DIN_LE <= MC_EN;
        when "10111100011" =>    DIN_LE <= MC_EN;
        when "10100000000" =>    DIN_LE <= MC_EN;
        when "10100100000" =>    DIN_LE <= MC_EN;
        when "10100100010" =>    DIN_LE <= MC_EN;
        when "10110100000" =>    DIN_LE <= MC_EN;
        when "10110100010" =>    DIN_LE <= MC_EN;
        when "01001110000" =>    DIN_LE <= MC_EN;
        when "01001110001" =>    DIN_LE <= MC_EN;
        when "01001110011" =>    DIN_LE <= MC_EN;
        when "01011110000" =>    DIN_LE <= MC_EN;
        when "01011110001" =>    DIN_LE <= MC_EN;
        when "01011110011" =>    DIN_LE <= MC_EN;
        when "01000110000" =>    DIN_LE <= MC_EN;
        when "01000110010" =>    DIN_LE <= MC_EN;
        when "01010110000" =>    DIN_LE <= MC_EN;
        when "01010110010" =>    DIN_LE <= MC_EN;
        when "00001101000" =>    DIN_LE <= MC_EN;
        when "00001101001" =>    DIN_LE <= MC_EN;
        when "00001101011" =>    DIN_LE <= MC_EN;
        when "00011101000" =>    DIN_LE <= MC_EN;
        when "00011101001" =>    DIN_LE <= MC_EN;
        when "00011101011" =>    DIN_LE <= MC_EN;
        when "00011001000" =>    DIN_LE <= MC_EN;
        when "00011001001" =>    DIN_LE <= MC_EN;
        when "00011001011" =>    DIN_LE <= MC_EN;
        when "00001001000" =>    DIN_LE <= MC_EN;
        when "00000001000" =>    DIN_LE <= MC_EN;
        when "00000001010" =>    DIN_LE <= MC_EN;
        when "00000001011" =>    DIN_LE <= MC_EN;
        when "00000001101" =>    DIN_LE <= MC_EN;
        when "00010001000" =>    DIN_LE <= MC_EN;
        when "00010001010" =>    DIN_LE <= MC_EN;
        when "00010001011" =>    DIN_LE <= MC_EN;
        when "00010001101" =>    DIN_LE <= MC_EN;
        when "00000101000" =>    DIN_LE <= MC_EN;
        when "00000101010" =>    DIN_LE <= MC_EN;
        when "00010101000" =>    DIN_LE <= MC_EN;
        when "00010101010" =>    DIN_LE <= MC_EN;
        when "01101000010" =>    DIN_LE <= MC_EN;
        when "00101000010" =>    DIN_LE <= MC_EN;
        when "00000011001" =>    DIN_LE <= MC_EN;
        when "00000011010" =>    DIN_LE <= MC_EN;
        when "00101110000" =>    DIN_LE <= MC_EN;
        when "00101110001" =>    DIN_LE <= MC_EN;
        when "00101110011" =>    DIN_LE <= MC_EN;
        when "00111110000" =>    DIN_LE <= MC_EN;
        when "00111110001" =>    DIN_LE <= MC_EN;
        when "00111110011" =>    DIN_LE <= MC_EN;
        when "00100110000" =>    DIN_LE <= MC_EN;
        when "00100110010" =>    DIN_LE <= MC_EN;
        when "00110110000" =>    DIN_LE <= MC_EN;
        when "00110110010" =>    DIN_LE <= MC_EN;
        when "01101110000" =>    DIN_LE <= MC_EN;
        when "01101110001" =>    DIN_LE <= MC_EN;
        when "01101110011" =>    DIN_LE <= MC_EN;
        when "01111110000" =>    DIN_LE <= MC_EN;
        when "01111110001" =>    DIN_LE <= MC_EN;
        when "01111110011" =>    DIN_LE <= MC_EN;
        when "01100110000" =>    DIN_LE <= MC_EN;
        when "01100110010" =>    DIN_LE <= MC_EN;
        when "01110110000" =>    DIN_LE <= MC_EN;
        when "01110110010" =>    DIN_LE <= MC_EN;
        when "01000000010" =>    DIN_LE <= MC_EN;
        when "01000000011" =>    DIN_LE <= MC_EN;
        when "01000000100" =>    DIN_LE <= MC_EN;
        when "01100000010" =>    DIN_LE <= MC_EN;
        when "01100000011" =>    DIN_LE <= MC_EN;
        when "11101101000" =>    DIN_LE <= MC_EN;
        when "11101101001" =>    DIN_LE <= MC_EN;
        when "11101101011" =>    DIN_LE <= MC_EN;
        when "11111101000" =>    DIN_LE <= MC_EN;
        when "11111101001" =>    DIN_LE <= MC_EN;
        when "11111101011" =>    DIN_LE <= MC_EN;
        when "11111001000" =>    DIN_LE <= MC_EN;
        when "11111001001" =>    DIN_LE <= MC_EN;
        when "11111001011" =>    DIN_LE <= MC_EN;
        when "11101001000" =>    DIN_LE <= MC_EN;
        when "11100001000" =>    DIN_LE <= MC_EN;
        when "11100001010" =>    DIN_LE <= MC_EN;
        when "11100001011" =>    DIN_LE <= MC_EN;
        when "11100001101" =>    DIN_LE <= MC_EN;
        when "11110001000" =>    DIN_LE <= MC_EN;
        when "11110001010" =>    DIN_LE <= MC_EN;
        when "11110001011" =>    DIN_LE <= MC_EN;
        when "11110001101" =>    DIN_LE <= MC_EN;
        when "11100101000" =>    DIN_LE <= MC_EN;
        when "11100101010" =>    DIN_LE <= MC_EN;
        when "11110101000" =>    DIN_LE <= MC_EN;
        when "11110101010" =>    DIN_LE <= MC_EN;
        when "10001101000" =>    DIN_LE <= MC_EN;
        when "10001101001" =>    DIN_LE <= MC_EN;
        when "10011001000" =>    DIN_LE <= MC_EN;
        when "10011001001" =>    DIN_LE <= MC_EN;
        when "10000001000" =>    DIN_LE <= MC_EN;
        when "10000001010" =>    DIN_LE <= MC_EN;
        when "10000001011" =>    DIN_LE <= MC_EN;
        when "10010001000" =>    DIN_LE <= MC_EN;
        when "10010001010" =>    DIN_LE <= MC_EN;
        when "10010001011" =>    DIN_LE <= MC_EN;
        when "10000101000" =>    DIN_LE <= MC_EN;
        when "10010101000" =>    DIN_LE <= MC_EN;
        when "10011101000" =>    DIN_LE <= MC_EN;
        when "10011101001" =>    DIN_LE <= MC_EN;
        when "01000011001" =>    DIN_LE <= MC_EN;
        when "01000011010" =>    DIN_LE <= MC_EN;
        when "00110011001" =>    DIN_LE <= MC_EN;
        when "00110011010" =>    DIN_LE <= MC_EN;
        when "10001110000" =>    DIN_LE <= MC_EN;
        when "10001110001" =>    DIN_LE <= MC_EN;
        when "10000110000" =>    DIN_LE <= MC_EN;
        when "10010110000" =>    DIN_LE <= MC_EN;
        when "10001100000" =>    DIN_LE <= MC_EN;
        when "10001100001" =>    DIN_LE <= MC_EN;
        when "10000100000" =>    DIN_LE <= MC_EN;
        when "10010100000" =>    DIN_LE <= MC_EN;
        when others =>    DIN_LE <= MC_NOP;
    end case;
  end process;
end DIN_LE_rom_arch;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.microcode.all;

entity RD_EN_rom is
    port (addr       :in std_logic_vector (10 downto 0);
          RD_EN      :out MCT_RD_EN
         );
end RD_EN_rom;


architecture RD_EN_rom_arch of RD_EN_rom is
begin
  process (addr)
  begin
    case addr is
        when "01101101000" =>    RD_EN <= MC_READ;
        when "01101101010" =>    RD_EN <= MC_READ;
        when "01111101000" =>    RD_EN <= MC_READ;
        when "01111101010" =>    RD_EN <= MC_READ;
        when "01111001000" =>    RD_EN <= MC_READ;
        when "01111001010" =>    RD_EN <= MC_READ;
        when "01100001001" =>    RD_EN <= MC_READ;
        when "01100001010" =>    RD_EN <= MC_READ;
        when "01100001100" =>    RD_EN <= MC_READ;
        when "01110001001" =>    RD_EN <= MC_READ;
        when "01110001010" =>    RD_EN <= MC_READ;
        when "01110001100" =>    RD_EN <= MC_READ;
        when "01100101001" =>    RD_EN <= MC_READ;
        when "01110101001" =>    RD_EN <= MC_READ;
        when "00101101000" =>    RD_EN <= MC_READ;
        when "00101101010" =>    RD_EN <= MC_READ;
        when "00111101000" =>    RD_EN <= MC_READ;
        when "00111101010" =>    RD_EN <= MC_READ;
        when "00111001000" =>    RD_EN <= MC_READ;
        when "00111001010" =>    RD_EN <= MC_READ;
        when "00100001001" =>    RD_EN <= MC_READ;
        when "00100001010" =>    RD_EN <= MC_READ;
        when "00100001100" =>    RD_EN <= MC_READ;
        when "00110001001" =>    RD_EN <= MC_READ;
        when "00110001010" =>    RD_EN <= MC_READ;
        when "00110001100" =>    RD_EN <= MC_READ;
        when "00100101001" =>    RD_EN <= MC_READ;
        when "00110101001" =>    RD_EN <= MC_READ;
        when "00001110000" =>    RD_EN <= MC_READ;
        when "00001110010" =>    RD_EN <= MC_READ;
        when "00011110000" =>    RD_EN <= MC_READ;
        when "00011110010" =>    RD_EN <= MC_READ;
        when "00000110001" =>    RD_EN <= MC_READ;
        when "00010110001" =>    RD_EN <= MC_READ;
        when "00101100000" =>    RD_EN <= MC_READ;
        when "00101100010" =>    RD_EN <= MC_READ;
        when "00100100001" =>    RD_EN <= MC_READ;
        when "00000000000" =>    RD_EN <= MC_READ;
        when "00000000001" =>    RD_EN <= MC_READ;
        when "11001101000" =>    RD_EN <= MC_READ;
        when "11001101010" =>    RD_EN <= MC_READ;
        when "11011101000" =>    RD_EN <= MC_READ;
        when "11011101010" =>    RD_EN <= MC_READ;
        when "11011001000" =>    RD_EN <= MC_READ;
        when "11011001010" =>    RD_EN <= MC_READ;
        when "11000001001" =>    RD_EN <= MC_READ;
        when "11000001010" =>    RD_EN <= MC_READ;
        when "11000001100" =>    RD_EN <= MC_READ;
        when "11010001001" =>    RD_EN <= MC_READ;
        when "11010001010" =>    RD_EN <= MC_READ;
        when "11010001100" =>    RD_EN <= MC_READ;
        when "11000101001" =>    RD_EN <= MC_READ;
        when "11010101001" =>    RD_EN <= MC_READ;
        when "11101100000" =>    RD_EN <= MC_READ;
        when "11101100010" =>    RD_EN <= MC_READ;
        when "11100100001" =>    RD_EN <= MC_READ;
        when "11001100000" =>    RD_EN <= MC_READ;
        when "11001100010" =>    RD_EN <= MC_READ;
        when "11000100001" =>    RD_EN <= MC_READ;
        when "11001110000" =>    RD_EN <= MC_READ;
        when "11001110010" =>    RD_EN <= MC_READ;
        when "11011110000" =>    RD_EN <= MC_READ;
        when "11011110010" =>    RD_EN <= MC_READ;
        when "11000110001" =>    RD_EN <= MC_READ;
        when "11010110001" =>    RD_EN <= MC_READ;
        when "01001101000" =>    RD_EN <= MC_READ;
        when "01001101010" =>    RD_EN <= MC_READ;
        when "01011101000" =>    RD_EN <= MC_READ;
        when "01011101010" =>    RD_EN <= MC_READ;
        when "01011001000" =>    RD_EN <= MC_READ;
        when "01011001010" =>    RD_EN <= MC_READ;
        when "01000001001" =>    RD_EN <= MC_READ;
        when "01000001010" =>    RD_EN <= MC_READ;
        when "01000001100" =>    RD_EN <= MC_READ;
        when "01010001001" =>    RD_EN <= MC_READ;
        when "01010001010" =>    RD_EN <= MC_READ;
        when "01010001100" =>    RD_EN <= MC_READ;
        when "01000101001" =>    RD_EN <= MC_READ;
        when "01010101001" =>    RD_EN <= MC_READ;
        when "11101110000" =>    RD_EN <= MC_READ;
        when "11101110010" =>    RD_EN <= MC_READ;
        when "11111110000" =>    RD_EN <= MC_READ;
        when "11111110010" =>    RD_EN <= MC_READ;
        when "11100110001" =>    RD_EN <= MC_READ;
        when "11110110001" =>    RD_EN <= MC_READ;
        when "01001100000" =>    RD_EN <= MC_READ;
        when "01101100000" =>    RD_EN <= MC_READ;
        when "01101100010" =>    RD_EN <= MC_READ;
        when "01101100011" =>    RD_EN <= MC_READ;
        when "00100000000" =>    RD_EN <= MC_READ;
        when "10101101000" =>    RD_EN <= MC_READ;
        when "10101101010" =>    RD_EN <= MC_READ;
        when "10111101000" =>    RD_EN <= MC_READ;
        when "10111101010" =>    RD_EN <= MC_READ;
        when "10111001000" =>    RD_EN <= MC_READ;
        when "10111001010" =>    RD_EN <= MC_READ;
        when "10100101001" =>    RD_EN <= MC_READ;
        when "10100001001" =>    RD_EN <= MC_READ;
        when "10100001010" =>    RD_EN <= MC_READ;
        when "10100001100" =>    RD_EN <= MC_READ;
        when "10110001001" =>    RD_EN <= MC_READ;
        when "10110001010" =>    RD_EN <= MC_READ;
        when "10110001100" =>    RD_EN <= MC_READ;
        when "10110101001" =>    RD_EN <= MC_READ;
        when "10101110000" =>    RD_EN <= MC_READ;
        when "10101110010" =>    RD_EN <= MC_READ;
        when "10111110000" =>    RD_EN <= MC_READ;
        when "10111110010" =>    RD_EN <= MC_READ;
        when "10100110001" =>    RD_EN <= MC_READ;
        when "10110110001" =>    RD_EN <= MC_READ;
        when "10101100000" =>    RD_EN <= MC_READ;
        when "10101100010" =>    RD_EN <= MC_READ;
        when "10111100000" =>    RD_EN <= MC_READ;
        when "10111100010" =>    RD_EN <= MC_READ;
        when "10100100001" =>    RD_EN <= MC_READ;
        when "10110100001" =>    RD_EN <= MC_READ;
        when "01001110000" =>    RD_EN <= MC_READ;
        when "01001110010" =>    RD_EN <= MC_READ;
        when "01011110000" =>    RD_EN <= MC_READ;
        when "01011110010" =>    RD_EN <= MC_READ;
        when "01000110001" =>    RD_EN <= MC_READ;
        when "01010110001" =>    RD_EN <= MC_READ;
        when "00001101000" =>    RD_EN <= MC_READ;
        when "00001101010" =>    RD_EN <= MC_READ;
        when "00011101000" =>    RD_EN <= MC_READ;
        when "00011101010" =>    RD_EN <= MC_READ;
        when "00011001000" =>    RD_EN <= MC_READ;
        when "00011001010" =>    RD_EN <= MC_READ;
        when "00000001001" =>    RD_EN <= MC_READ;
        when "00000001010" =>    RD_EN <= MC_READ;
        when "00000001100" =>    RD_EN <= MC_READ;
        when "00010001001" =>    RD_EN <= MC_READ;
        when "00010001010" =>    RD_EN <= MC_READ;
        when "00010001100" =>    RD_EN <= MC_READ;
        when "00000101001" =>    RD_EN <= MC_READ;
        when "00010101001" =>    RD_EN <= MC_READ;
        when "01101000001" =>    RD_EN <= MC_READ;
        when "00101000001" =>    RD_EN <= MC_READ;
        when "00000011000" =>    RD_EN <= MC_READ;
        when "00000011001" =>    RD_EN <= MC_READ;
        when "00101110000" =>    RD_EN <= MC_READ;
        when "00101110010" =>    RD_EN <= MC_READ;
        when "00111110000" =>    RD_EN <= MC_READ;
        when "00111110010" =>    RD_EN <= MC_READ;
        when "00100110001" =>    RD_EN <= MC_READ;
        when "00110110001" =>    RD_EN <= MC_READ;
        when "01101110000" =>    RD_EN <= MC_READ;
        when "01101110010" =>    RD_EN <= MC_READ;
        when "01111110000" =>    RD_EN <= MC_READ;
        when "01111110010" =>    RD_EN <= MC_READ;
        when "01100110001" =>    RD_EN <= MC_READ;
        when "01110110001" =>    RD_EN <= MC_READ;
        when "01000000001" =>    RD_EN <= MC_READ;
        when "01000000010" =>    RD_EN <= MC_READ;
        when "01000000011" =>    RD_EN <= MC_READ;
        when "01100000001" =>    RD_EN <= MC_READ;
        when "01100000010" =>    RD_EN <= MC_READ;
        when "11101101000" =>    RD_EN <= MC_READ;
        when "11101101010" =>    RD_EN <= MC_READ;
        when "11111101000" =>    RD_EN <= MC_READ;
        when "11111101010" =>    RD_EN <= MC_READ;
        when "11111001000" =>    RD_EN <= MC_READ;
        when "11111001010" =>    RD_EN <= MC_READ;
        when "11100001001" =>    RD_EN <= MC_READ;
        when "11100001010" =>    RD_EN <= MC_READ;
        when "11100001100" =>    RD_EN <= MC_READ;
        when "11110001001" =>    RD_EN <= MC_READ;
        when "11110001010" =>    RD_EN <= MC_READ;
        when "11110001100" =>    RD_EN <= MC_READ;
        when "11100101001" =>    RD_EN <= MC_READ;
        when "11110101001" =>    RD_EN <= MC_READ;
        when "10001101000" =>    RD_EN <= MC_READ;
        when "10011001000" =>    RD_EN <= MC_READ;
        when "10000001001" =>    RD_EN <= MC_READ;
        when "10000001010" =>    RD_EN <= MC_READ;
        when "10010001001" =>    RD_EN <= MC_READ;
        when "10010001010" =>    RD_EN <= MC_READ;
        when "10011101000" =>    RD_EN <= MC_READ;
        when "01000011000" =>    RD_EN <= MC_READ;
        when "01000011001" =>    RD_EN <= MC_READ;
        when "00110011000" =>    RD_EN <= MC_READ;
        when "00110011001" =>    RD_EN <= MC_READ;
        when "10001110000" =>    RD_EN <= MC_READ;
        when "10001100000" =>    RD_EN <= MC_READ;
        when others =>    RD_EN <= MC_NOP;
    end case;
  end process;
end RD_EN_rom_arch;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.microcode.all;

entity DOUT_OP_rom is
    port (addr       :in std_logic_vector (10 downto 0);
          DOUT_OP    :out MCT_DOUT_OP
         );
end DOUT_OP_rom;


architecture DOUT_OP_rom_arch of DOUT_OP_rom is
begin
  process (addr)
  begin
    case addr is
        when "00001110101" =>    DOUT_OP <= MC_DINT3;
        when "00011110101" =>    DOUT_OP <= MC_DINT3;
        when "00000110100" =>    DOUT_OP <= MC_DINT3;
        when "00010110100" =>    DOUT_OP <= MC_DINT3;
        when "00000000010" =>    DOUT_OP <= MC_PCH;
        when "00000000011" =>    DOUT_OP <= MC_PCL;
        when "00000000100" =>    DOUT_OP <= MC_P_REG;
        when "11001110101" =>    DOUT_OP <= MC_DINT3;
        when "11011110101" =>    DOUT_OP <= MC_DINT3;
        when "11000110100" =>    DOUT_OP <= MC_DINT3;
        when "11010110100" =>    DOUT_OP <= MC_DINT3;
        when "11101110101" =>    DOUT_OP <= MC_DINT3;
        when "11111110101" =>    DOUT_OP <= MC_DINT3;
        when "11100110100" =>    DOUT_OP <= MC_DINT3;
        when "11110110100" =>    DOUT_OP <= MC_DINT3;
        when "00100000001" =>    DOUT_OP <= MC_PCH;
        when "00100000010" =>    DOUT_OP <= MC_PCL;
        when "01001110101" =>    DOUT_OP <= MC_DINT3;
        when "01011110101" =>    DOUT_OP <= MC_DINT3;
        when "01000110100" =>    DOUT_OP <= MC_DINT3;
        when "01010110100" =>    DOUT_OP <= MC_DINT3;
        when "01001000000" =>    DOUT_OP <= MC_A_REG;
        when "00001000000" =>    DOUT_OP <= MC_P_REG;
        when "00101110101" =>    DOUT_OP <= MC_DINT3;
        when "00111110101" =>    DOUT_OP <= MC_DINT3;
        when "00100110100" =>    DOUT_OP <= MC_DINT3;
        when "00110110100" =>    DOUT_OP <= MC_DINT3;
        when "01101110101" =>    DOUT_OP <= MC_DINT3;
        when "01111110101" =>    DOUT_OP <= MC_DINT3;
        when "01100110100" =>    DOUT_OP <= MC_DINT3;
        when "01110110100" =>    DOUT_OP <= MC_DINT3;
        when "10001101010" =>    DOUT_OP <= MC_A_REG;
        when "10011001010" =>    DOUT_OP <= MC_A_REG;
        when "10000001100" =>    DOUT_OP <= MC_A_REG;
        when "10010001100" =>    DOUT_OP <= MC_A_REG;
        when "10000101001" =>    DOUT_OP <= MC_A_REG;
        when "10010101001" =>    DOUT_OP <= MC_A_REG;
        when "10011101010" =>    DOUT_OP <= MC_A_REG;
        when "01000011010" =>    DOUT_OP <= MC_PCH;
        when "01000011011" =>    DOUT_OP <= MC_PCL;
        when "01000011100" =>    DOUT_OP <= MC_P_REG;
        when "00110011010" =>    DOUT_OP <= MC_PCH;
        when "00110011011" =>    DOUT_OP <= MC_PCL;
        when "00110011100" =>    DOUT_OP <= MC_P_REG;
        when "10001110010" =>    DOUT_OP <= MC_X_REG;
        when "10000110001" =>    DOUT_OP <= MC_X_REG;
        when "10010110001" =>    DOUT_OP <= MC_X_REG;
        when "10001100010" =>    DOUT_OP <= MC_Y_REG;
        when "10000100001" =>    DOUT_OP <= MC_Y_REG;
        when "10010100001" =>    DOUT_OP <= MC_Y_REG;
        when others =>    DOUT_OP <= MC_NOP;
    end case;
  end process;
end DOUT_OP_rom_arch;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.microcode.all;

entity DINT1_OP_rom is
    port (addr       :in std_logic_vector (10 downto 0);
          DINT1_OP   :out MCT_DINT1_OP
         );
end DINT1_OP_rom;


architecture DINT1_OP_rom_arch of DINT1_OP_rom is
begin
  process (addr)
  begin
    case addr is
        when "01101101001" =>    DINT1_OP <= MC_DIN;
        when "01111101001" =>    DINT1_OP <= MC_DIN;
        when "01111001001" =>    DINT1_OP <= MC_DIN;
        when "01100001011" =>    DINT1_OP <= MC_DIN;
        when "01110001011" =>    DINT1_OP <= MC_DIN;
        when "00101101001" =>    DINT1_OP <= MC_DIN;
        when "00111101001" =>    DINT1_OP <= MC_DIN;
        when "00111001001" =>    DINT1_OP <= MC_DIN;
        when "00100001011" =>    DINT1_OP <= MC_DIN;
        when "00110001011" =>    DINT1_OP <= MC_DIN;
        when "00001110001" =>    DINT1_OP <= MC_DIN;
        when "00011110001" =>    DINT1_OP <= MC_DIN;
        when "00000110001" =>    DINT1_OP <= MC_DIN;
        when "00010110001" =>    DINT1_OP <= MC_DIN;
        when "00101100001" =>    DINT1_OP <= MC_DIN;
        when "00000000010" =>    DINT1_OP <= MC_DIN;
        when "11001101001" =>    DINT1_OP <= MC_DIN;
        when "11011101001" =>    DINT1_OP <= MC_DIN;
        when "11011001001" =>    DINT1_OP <= MC_DIN;
        when "11000001011" =>    DINT1_OP <= MC_DIN;
        when "11010001011" =>    DINT1_OP <= MC_DIN;
        when "11101100001" =>    DINT1_OP <= MC_DIN;
        when "11001100001" =>    DINT1_OP <= MC_DIN;
        when "11001110001" =>    DINT1_OP <= MC_DIN;
        when "11011110001" =>    DINT1_OP <= MC_DIN;
        when "11000110001" =>    DINT1_OP <= MC_DIN;
        when "11010110001" =>    DINT1_OP <= MC_DIN;
        when "01001101001" =>    DINT1_OP <= MC_DIN;
        when "01011101001" =>    DINT1_OP <= MC_DIN;
        when "01011001001" =>    DINT1_OP <= MC_DIN;
        when "01000001011" =>    DINT1_OP <= MC_DIN;
        when "01010001011" =>    DINT1_OP <= MC_DIN;
        when "11101110001" =>    DINT1_OP <= MC_DIN;
        when "11111110001" =>    DINT1_OP <= MC_DIN;
        when "11100110001" =>    DINT1_OP <= MC_DIN;
        when "11110110001" =>    DINT1_OP <= MC_DIN;
        when "01001100001" =>    DINT1_OP <= MC_DIN;
        when "01101100001" =>    DINT1_OP <= MC_DIN;
        when "01101100100" =>    DINT1_OP <= MC_DIN;
        when "00100000001" =>    DINT1_OP <= MC_DIN;
        when "10101101001" =>    DINT1_OP <= MC_DIN;
        when "10111101001" =>    DINT1_OP <= MC_DIN;
        when "10111001001" =>    DINT1_OP <= MC_DIN;
        when "10100001011" =>    DINT1_OP <= MC_DIN;
        when "10110001011" =>    DINT1_OP <= MC_DIN;
        when "10101110001" =>    DINT1_OP <= MC_DIN;
        when "10111110001" =>    DINT1_OP <= MC_DIN;
        when "10101100001" =>    DINT1_OP <= MC_DIN;
        when "10111100001" =>    DINT1_OP <= MC_DIN;
        when "01001110001" =>    DINT1_OP <= MC_DIN;
        when "01011110001" =>    DINT1_OP <= MC_DIN;
        when "01000110001" =>    DINT1_OP <= MC_DIN;
        when "01010110001" =>    DINT1_OP <= MC_DIN;
        when "00001101001" =>    DINT1_OP <= MC_DIN;
        when "00011101001" =>    DINT1_OP <= MC_DIN;
        when "00011001001" =>    DINT1_OP <= MC_DIN;
        when "00000001011" =>    DINT1_OP <= MC_DIN;
        when "00010001011" =>    DINT1_OP <= MC_DIN;
        when "00000011010" =>    DINT1_OP <= MC_DIN;
        when "00101110001" =>    DINT1_OP <= MC_DIN;
        when "00111110001" =>    DINT1_OP <= MC_DIN;
        when "00100110001" =>    DINT1_OP <= MC_DIN;
        when "00110110001" =>    DINT1_OP <= MC_DIN;
        when "01101110001" =>    DINT1_OP <= MC_DIN;
        when "01111110001" =>    DINT1_OP <= MC_DIN;
        when "01100110001" =>    DINT1_OP <= MC_DIN;
        when "01110110001" =>    DINT1_OP <= MC_DIN;
        when "01000000100" =>    DINT1_OP <= MC_DIN;
        when "01100000011" =>    DINT1_OP <= MC_DIN;
        when "11101101001" =>    DINT1_OP <= MC_DIN;
        when "11111101001" =>    DINT1_OP <= MC_DIN;
        when "11111001001" =>    DINT1_OP <= MC_DIN;
        when "11100001011" =>    DINT1_OP <= MC_DIN;
        when "11110001011" =>    DINT1_OP <= MC_DIN;
        when "10001101001" =>    DINT1_OP <= MC_DIN;
        when "10011001001" =>    DINT1_OP <= MC_DIN;
        when "10000001011" =>    DINT1_OP <= MC_DIN;
        when "10010001011" =>    DINT1_OP <= MC_DIN;
        when "10011101001" =>    DINT1_OP <= MC_DIN;
        when "01000011010" =>    DINT1_OP <= MC_DIN;
        when "00110011010" =>    DINT1_OP <= MC_DIN;
        when "10001110001" =>    DINT1_OP <= MC_DIN;
        when "10001100001" =>    DINT1_OP <= MC_DIN;
        when others =>    DINT1_OP <= MC_NOP;
    end case;
  end process;
end DINT1_OP_rom_arch;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.microcode.all;

entity DINT2_OP_rom is
    port (addr       :in std_logic_vector (10 downto 0);
          DINT2_OP   :out MCT_DINT2_OP
         );
end DINT2_OP_rom;


architecture DINT2_OP_rom_arch of DINT2_OP_rom is
begin
  process (addr)
  begin
    case addr is
        when "00001110010" =>    DINT2_OP <= MC_DIN;
        when "00011110010" =>    DINT2_OP <= MC_DIN;
        when "11001110010" =>    DINT2_OP <= MC_DIN;
        when "11011110010" =>    DINT2_OP <= MC_DIN;
        when "11101110010" =>    DINT2_OP <= MC_DIN;
        when "11111110010" =>    DINT2_OP <= MC_DIN;
        when "01001110010" =>    DINT2_OP <= MC_DIN;
        when "01011110010" =>    DINT2_OP <= MC_DIN;
        when "00101110010" =>    DINT2_OP <= MC_DIN;
        when "00111110010" =>    DINT2_OP <= MC_DIN;
        when "01101110010" =>    DINT2_OP <= MC_DIN;
        when "01111110010" =>    DINT2_OP <= MC_DIN;
        when others =>    DINT2_OP <= MC_NOP;
    end case;
  end process;
end DINT2_OP_rom_arch;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.microcode.all;

entity DINT3_OP_rom is
    port (addr       :in std_logic_vector (10 downto 0);
          DINT3_OP   :out MCT_DINT3_OP
         );
end DINT3_OP_rom;


architecture DINT3_OP_rom_arch of DINT3_OP_rom is
begin
  process (addr)
  begin
    case addr is
        when "00001110100" =>    DINT3_OP <= MC_ALU;
        when "00011110100" =>    DINT3_OP <= MC_ALU;
        when "00000110011" =>    DINT3_OP <= MC_ALU;
        when "00010110011" =>    DINT3_OP <= MC_ALU;
        when "11001110100" =>    DINT3_OP <= MC_ALU;
        when "11011110100" =>    DINT3_OP <= MC_ALU;
        when "11000110011" =>    DINT3_OP <= MC_ALU;
        when "11010110011" =>    DINT3_OP <= MC_ALU;
        when "11101110100" =>    DINT3_OP <= MC_ALU;
        when "11111110100" =>    DINT3_OP <= MC_ALU;
        when "11100110011" =>    DINT3_OP <= MC_ALU;
        when "11110110011" =>    DINT3_OP <= MC_ALU;
        when "01001110100" =>    DINT3_OP <= MC_ALU;
        when "01011110100" =>    DINT3_OP <= MC_ALU;
        when "01000110011" =>    DINT3_OP <= MC_ALU;
        when "01010110011" =>    DINT3_OP <= MC_ALU;
        when "00101110100" =>    DINT3_OP <= MC_ALU;
        when "00111110100" =>    DINT3_OP <= MC_ALU;
        when "00100110011" =>    DINT3_OP <= MC_ALU;
        when "00110110011" =>    DINT3_OP <= MC_ALU;
        when "01101110100" =>    DINT3_OP <= MC_ALU;
        when "01111110100" =>    DINT3_OP <= MC_ALU;
        when "01100110011" =>    DINT3_OP <= MC_ALU;
        when "01110110011" =>    DINT3_OP <= MC_ALU;
        when others =>    DINT3_OP <= MC_NOP;
    end case;
  end process;
end DINT3_OP_rom_arch;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.microcode.all;

entity PC_OP_rom is
    port (addr       :in std_logic_vector (10 downto 0);
          PC_OP      :out MCT_PC_OP
         );
end PC_OP_rom;


architecture PC_OP_rom_arch of PC_OP_rom is
begin
  process (addr)
  begin
    case addr is
        when "01101101000" =>    PC_OP <= MC_INC;
        when "01101101001" =>    PC_OP <= MC_INC;
        when "01111101000" =>    PC_OP <= MC_INC;
        when "01111101001" =>    PC_OP <= MC_INC;
        when "01111001000" =>    PC_OP <= MC_INC;
        when "01111001001" =>    PC_OP <= MC_INC;
        when "01101001000" =>    PC_OP <= MC_INC;
        when "01100001000" =>    PC_OP <= MC_INC;
        when "01110001000" =>    PC_OP <= MC_INC;
        when "01100101000" =>    PC_OP <= MC_INC;
        when "01110101000" =>    PC_OP <= MC_INC;
        when "00101101000" =>    PC_OP <= MC_INC;
        when "00101101001" =>    PC_OP <= MC_INC;
        when "00111101000" =>    PC_OP <= MC_INC;
        when "00111101001" =>    PC_OP <= MC_INC;
        when "00111001000" =>    PC_OP <= MC_INC;
        when "00111001001" =>    PC_OP <= MC_INC;
        when "00101001000" =>    PC_OP <= MC_INC;
        when "00100001000" =>    PC_OP <= MC_INC;
        when "00110001000" =>    PC_OP <= MC_INC;
        when "00100101000" =>    PC_OP <= MC_INC;
        when "00110101000" =>    PC_OP <= MC_INC;
        when "00001110000" =>    PC_OP <= MC_INC;
        when "00001110001" =>    PC_OP <= MC_INC;
        when "00011110000" =>    PC_OP <= MC_INC;
        when "00011110001" =>    PC_OP <= MC_INC;
        when "00000110000" =>    PC_OP <= MC_INC;
        when "00010110000" =>    PC_OP <= MC_INC;
        when "10010000000" =>    PC_OP <= MC_INC;
        when "10010000001" =>    PC_OP <= MC_BCC;
        when "10110000000" =>    PC_OP <= MC_INC;
        when "10110000001" =>    PC_OP <= MC_BCS;
        when "11110000000" =>    PC_OP <= MC_INC;
        when "11110000001" =>    PC_OP <= MC_BEQ;
        when "00101100000" =>    PC_OP <= MC_INC;
        when "00101100001" =>    PC_OP <= MC_INC;
        when "00100100000" =>    PC_OP <= MC_INC;
        when "00110000000" =>    PC_OP <= MC_INC;
        when "00110000001" =>    PC_OP <= MC_BMI;
        when "11010000000" =>    PC_OP <= MC_INC;
        when "11010000001" =>    PC_OP <= MC_BNE;
        when "00010000000" =>    PC_OP <= MC_INC;
        when "00010000001" =>    PC_OP <= MC_BPL;
        when "00000000000" =>    PC_OP <= MC_INC;
        when "00000000011" =>    PC_OP <= MC_SPLIT;
        when "01010000000" =>    PC_OP <= MC_INC;
        when "01010000001" =>    PC_OP <= MC_BVC;
        when "01110000000" =>    PC_OP <= MC_INC;
        when "01110000001" =>    PC_OP <= MC_BVS;
        when "11001101000" =>    PC_OP <= MC_INC;
        when "11001101001" =>    PC_OP <= MC_INC;
        when "11011101000" =>    PC_OP <= MC_INC;
        when "11011101001" =>    PC_OP <= MC_INC;
        when "11011001000" =>    PC_OP <= MC_INC;
        when "11011001001" =>    PC_OP <= MC_INC;
        when "11001001000" =>    PC_OP <= MC_INC;
        when "11000001000" =>    PC_OP <= MC_INC;
        when "11010001000" =>    PC_OP <= MC_INC;
        when "11000101000" =>    PC_OP <= MC_INC;
        when "11010101000" =>    PC_OP <= MC_INC;
        when "11101100000" =>    PC_OP <= MC_INC;
        when "11101100001" =>    PC_OP <= MC_INC;
        when "11100000000" =>    PC_OP <= MC_INC;
        when "11100100000" =>    PC_OP <= MC_INC;
        when "11001100000" =>    PC_OP <= MC_INC;
        when "11001100001" =>    PC_OP <= MC_INC;
        when "11000000000" =>    PC_OP <= MC_INC;
        when "11000100000" =>    PC_OP <= MC_INC;
        when "11001110000" =>    PC_OP <= MC_INC;
        when "11001110001" =>    PC_OP <= MC_INC;
        when "11011110000" =>    PC_OP <= MC_INC;
        when "11011110001" =>    PC_OP <= MC_INC;
        when "11000110000" =>    PC_OP <= MC_INC;
        when "11010110000" =>    PC_OP <= MC_INC;
        when "01001101000" =>    PC_OP <= MC_INC;
        when "01001101001" =>    PC_OP <= MC_INC;
        when "01011101000" =>    PC_OP <= MC_INC;
        when "01011101001" =>    PC_OP <= MC_INC;
        when "01011001000" =>    PC_OP <= MC_INC;
        when "01011001001" =>    PC_OP <= MC_INC;
        when "01001001000" =>    PC_OP <= MC_INC;
        when "01000001000" =>    PC_OP <= MC_INC;
        when "01010001000" =>    PC_OP <= MC_INC;
        when "01000101000" =>    PC_OP <= MC_INC;
        when "01010101000" =>    PC_OP <= MC_INC;
        when "11101110000" =>    PC_OP <= MC_INC;
        when "11101110001" =>    PC_OP <= MC_INC;
        when "11111110000" =>    PC_OP <= MC_INC;
        when "11111110001" =>    PC_OP <= MC_INC;
        when "11100110000" =>    PC_OP <= MC_INC;
        when "11110110000" =>    PC_OP <= MC_INC;
        when "01001100000" =>    PC_OP <= MC_INC;
        when "01001100001" =>    PC_OP <= MC_INC;
        when "01001100010" =>    PC_OP <= MC_SPLIT;
        when "01101100000" =>    PC_OP <= MC_INC;
        when "01101100101" =>    PC_OP <= MC_SPLIT;
        when "00100000000" =>    PC_OP <= MC_INC;
        when "00100000010" =>    PC_OP <= MC_SPLIT;
        when "10101101000" =>    PC_OP <= MC_INC;
        when "10101101001" =>    PC_OP <= MC_INC;
        when "10111101000" =>    PC_OP <= MC_INC;
        when "10111101001" =>    PC_OP <= MC_INC;
        when "10111001000" =>    PC_OP <= MC_INC;
        when "10111001001" =>    PC_OP <= MC_INC;
        when "10101001000" =>    PC_OP <= MC_INC;
        when "10100101000" =>    PC_OP <= MC_INC;
        when "10100001000" =>    PC_OP <= MC_INC;
        when "10110001000" =>    PC_OP <= MC_INC;
        when "10110101000" =>    PC_OP <= MC_INC;
        when "10101110000" =>    PC_OP <= MC_INC;
        when "10101110001" =>    PC_OP <= MC_INC;
        when "10111110000" =>    PC_OP <= MC_INC;
        when "10111110001" =>    PC_OP <= MC_INC;
        when "10100010000" =>    PC_OP <= MC_INC;
        when "10100110000" =>    PC_OP <= MC_INC;
        when "10110110000" =>    PC_OP <= MC_INC;
        when "10101100000" =>    PC_OP <= MC_INC;
        when "10101100001" =>    PC_OP <= MC_INC;
        when "10111100000" =>    PC_OP <= MC_INC;
        when "10111100001" =>    PC_OP <= MC_INC;
        when "10100000000" =>    PC_OP <= MC_INC;
        when "10100100000" =>    PC_OP <= MC_INC;
        when "10110100000" =>    PC_OP <= MC_INC;
        when "01001110000" =>    PC_OP <= MC_INC;
        when "01001110001" =>    PC_OP <= MC_INC;
        when "01011110000" =>    PC_OP <= MC_INC;
        when "01011110001" =>    PC_OP <= MC_INC;
        when "01000110000" =>    PC_OP <= MC_INC;
        when "01010110000" =>    PC_OP <= MC_INC;
        when "00001101000" =>    PC_OP <= MC_INC;
        when "00001101001" =>    PC_OP <= MC_INC;
        when "00011101000" =>    PC_OP <= MC_INC;
        when "00011101001" =>    PC_OP <= MC_INC;
        when "00011001000" =>    PC_OP <= MC_INC;
        when "00011001001" =>    PC_OP <= MC_INC;
        when "00001001000" =>    PC_OP <= MC_INC;
        when "00000001000" =>    PC_OP <= MC_INC;
        when "00010001000" =>    PC_OP <= MC_INC;
        when "00000101000" =>    PC_OP <= MC_INC;
        when "00010101000" =>    PC_OP <= MC_INC;
        when "00000011011" =>    PC_OP <= MC_SPLIT;
        when "00101110000" =>    PC_OP <= MC_INC;
        when "00101110001" =>    PC_OP <= MC_INC;
        when "00111110000" =>    PC_OP <= MC_INC;
        when "00111110001" =>    PC_OP <= MC_INC;
        when "00100110000" =>    PC_OP <= MC_INC;
        when "00110110000" =>    PC_OP <= MC_INC;
        when "01101110000" =>    PC_OP <= MC_INC;
        when "01101110001" =>    PC_OP <= MC_INC;
        when "01111110000" =>    PC_OP <= MC_INC;
        when "01111110001" =>    PC_OP <= MC_INC;
        when "01100110000" =>    PC_OP <= MC_INC;
        when "01110110000" =>    PC_OP <= MC_INC;
        when "01000000101" =>    PC_OP <= MC_SPLIT;
        when "01100000100" =>    PC_OP <= MC_SPLIT;
        when "01100000101" =>    PC_OP <= MC_INC;
        when "11101101000" =>    PC_OP <= MC_INC;
        when "11101101001" =>    PC_OP <= MC_INC;
        when "11111101000" =>    PC_OP <= MC_INC;
        when "11111101001" =>    PC_OP <= MC_INC;
        when "11111001000" =>    PC_OP <= MC_INC;
        when "11111001001" =>    PC_OP <= MC_INC;
        when "11101001000" =>    PC_OP <= MC_INC;
        when "11100001000" =>    PC_OP <= MC_INC;
        when "11110001000" =>    PC_OP <= MC_INC;
        when "11100101000" =>    PC_OP <= MC_INC;
        when "11110101000" =>    PC_OP <= MC_INC;
        when "10001101000" =>    PC_OP <= MC_INC;
        when "10001101001" =>    PC_OP <= MC_INC;
        when "10011001000" =>    PC_OP <= MC_INC;
        when "10011001001" =>    PC_OP <= MC_INC;
        when "10000001000" =>    PC_OP <= MC_INC;
        when "10010001000" =>    PC_OP <= MC_INC;
        when "10000101000" =>    PC_OP <= MC_INC;
        when "10010101000" =>    PC_OP <= MC_INC;
        when "10011101000" =>    PC_OP <= MC_INC;
        when "10011101001" =>    PC_OP <= MC_INC;
        when "01000011011" =>    PC_OP <= MC_SPLIT;
        when "00110011011" =>    PC_OP <= MC_SPLIT;
        when "10001110000" =>    PC_OP <= MC_INC;
        when "10001110001" =>    PC_OP <= MC_INC;
        when "10000110000" =>    PC_OP <= MC_INC;
        when "10010110000" =>    PC_OP <= MC_INC;
        when "10001100000" =>    PC_OP <= MC_INC;
        when "10001100001" =>    PC_OP <= MC_INC;
        when "10000100000" =>    PC_OP <= MC_INC;
        when "10010100000" =>    PC_OP <= MC_INC;
        when others =>    PC_OP <= MC_NOP;
    end case;
  end process;
end PC_OP_rom_arch;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.microcode.all;

entity SP_OP_rom is
    port (addr       :in std_logic_vector (10 downto 0);
          SP_OP      :out MCT_SP_OP
         );
end SP_OP_rom;


architecture SP_OP_rom_arch of SP_OP_rom is
begin
  process (addr)
  begin
    case addr is
        when "00000000010" =>    SP_OP <= MC_PUSH;
        when "00000000011" =>    SP_OP <= MC_PUSH;
        when "00000000100" =>    SP_OP <= MC_PUSH;
        when "00100000001" =>    SP_OP <= MC_PUSH;
        when "00100000010" =>    SP_OP <= MC_PUSH;
        when "01001000000" =>    SP_OP <= MC_PUSH;
        when "00001000000" =>    SP_OP <= MC_PUSH;
        when "01101000000" =>    SP_OP <= MC_POP;
        when "00101000000" =>    SP_OP <= MC_POP;
        when "01000000000" =>    SP_OP <= MC_POP;
        when "01000000001" =>    SP_OP <= MC_POP;
        when "01000000010" =>    SP_OP <= MC_POP;
        when "01100000000" =>    SP_OP <= MC_POP;
        when "01100000001" =>    SP_OP <= MC_POP;
        when "01000011010" =>    SP_OP <= MC_PUSH;
        when "01000011011" =>    SP_OP <= MC_PUSH;
        when "01000011100" =>    SP_OP <= MC_PUSH;
        when "00110011010" =>    SP_OP <= MC_PUSH;
        when "00110011011" =>    SP_OP <= MC_PUSH;
        when "00110011100" =>    SP_OP <= MC_PUSH;
        when "10011010000" =>    SP_OP <= MC_X_REG;
        when others =>    SP_OP <= MC_NOP;
    end case;
  end process;
end SP_OP_rom_arch;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.microcode.all;

entity ALU1_rom is
    port (addr       :in std_logic_vector (10 downto 0);
          ALU1       :out MCT_ALU1
         );
end ALU1_rom;


architecture ALU1_rom_arch of ALU1_rom is
begin
  process (addr)
  begin
    case addr is
        when "01101101100" =>    ALU1 <= MC_A_REG;
        when "01111101100" =>    ALU1 <= MC_A_REG;
        when "01111001100" =>    ALU1 <= MC_A_REG;
        when "01101001001" =>    ALU1 <= MC_A_REG;
        when "01100001110" =>    ALU1 <= MC_A_REG;
        when "01110001110" =>    ALU1 <= MC_A_REG;
        when "01100101011" =>    ALU1 <= MC_A_REG;
        when "01110101011" =>    ALU1 <= MC_A_REG;
        when "00101101100" =>    ALU1 <= MC_A_REG;
        when "00111101100" =>    ALU1 <= MC_A_REG;
        when "00111001100" =>    ALU1 <= MC_A_REG;
        when "00101001001" =>    ALU1 <= MC_A_REG;
        when "00100001110" =>    ALU1 <= MC_A_REG;
        when "00110001110" =>    ALU1 <= MC_A_REG;
        when "00100101011" =>    ALU1 <= MC_A_REG;
        when "00110101011" =>    ALU1 <= MC_A_REG;
        when "00001110100" =>    ALU1 <= MC_DIN;
        when "00011110100" =>    ALU1 <= MC_DIN;
        when "00001010000" =>    ALU1 <= MC_A_REG;
        when "00000110011" =>    ALU1 <= MC_DIN;
        when "00010110011" =>    ALU1 <= MC_DIN;
        when "00101100100" =>    ALU1 <= MC_A_REG;
        when "00100100011" =>    ALU1 <= MC_A_REG;
        when "11001101100" =>    ALU1 <= MC_A_REG;
        when "11011101100" =>    ALU1 <= MC_A_REG;
        when "11011001100" =>    ALU1 <= MC_A_REG;
        when "11001001001" =>    ALU1 <= MC_A_REG;
        when "11000001110" =>    ALU1 <= MC_A_REG;
        when "11010001110" =>    ALU1 <= MC_A_REG;
        when "11000101011" =>    ALU1 <= MC_A_REG;
        when "11010101011" =>    ALU1 <= MC_A_REG;
        when "11101100100" =>    ALU1 <= MC_X_REG;
        when "11100000001" =>    ALU1 <= MC_X_REG;
        when "11100100011" =>    ALU1 <= MC_X_REG;
        when "11001100100" =>    ALU1 <= MC_Y_REG;
        when "11000000001" =>    ALU1 <= MC_Y_REG;
        when "11000100011" =>    ALU1 <= MC_Y_REG;
        when "11001110100" =>    ALU1 <= MC_DIN;
        when "11011110100" =>    ALU1 <= MC_DIN;
        when "11000110011" =>    ALU1 <= MC_DIN;
        when "11010110011" =>    ALU1 <= MC_DIN;
        when "11001010000" =>    ALU1 <= MC_X_REG;
        when "10001000000" =>    ALU1 <= MC_Y_REG;
        when "01001101100" =>    ALU1 <= MC_A_REG;
        when "01011101100" =>    ALU1 <= MC_A_REG;
        when "01011001100" =>    ALU1 <= MC_A_REG;
        when "01001001001" =>    ALU1 <= MC_A_REG;
        when "01000001110" =>    ALU1 <= MC_A_REG;
        when "01010001110" =>    ALU1 <= MC_A_REG;
        when "01000101011" =>    ALU1 <= MC_A_REG;
        when "01010101011" =>    ALU1 <= MC_A_REG;
        when "11101110100" =>    ALU1 <= MC_DIN;
        when "11111110100" =>    ALU1 <= MC_DIN;
        when "11100110011" =>    ALU1 <= MC_DIN;
        when "11110110011" =>    ALU1 <= MC_DIN;
        when "11101000000" =>    ALU1 <= MC_X_REG;
        when "11001000000" =>    ALU1 <= MC_Y_REG;
        when "01001110100" =>    ALU1 <= MC_DIN;
        when "01011110100" =>    ALU1 <= MC_DIN;
        when "01001010000" =>    ALU1 <= MC_A_REG;
        when "01000110011" =>    ALU1 <= MC_DIN;
        when "01010110011" =>    ALU1 <= MC_DIN;
        when "00001101100" =>    ALU1 <= MC_A_REG;
        when "00011101100" =>    ALU1 <= MC_A_REG;
        when "00011001100" =>    ALU1 <= MC_A_REG;
        when "00001001001" =>    ALU1 <= MC_A_REG;
        when "00000001110" =>    ALU1 <= MC_A_REG;
        when "00010001110" =>    ALU1 <= MC_A_REG;
        when "00000101011" =>    ALU1 <= MC_A_REG;
        when "00010101011" =>    ALU1 <= MC_A_REG;
        when "00101110100" =>    ALU1 <= MC_DIN;
        when "00111110100" =>    ALU1 <= MC_DIN;
        when "00101010000" =>    ALU1 <= MC_A_REG;
        when "00100110011" =>    ALU1 <= MC_DIN;
        when "00110110011" =>    ALU1 <= MC_DIN;
        when "01101110100" =>    ALU1 <= MC_DIN;
        when "01111110100" =>    ALU1 <= MC_DIN;
        when "01101010000" =>    ALU1 <= MC_A_REG;
        when "01100110011" =>    ALU1 <= MC_DIN;
        when "01110110011" =>    ALU1 <= MC_DIN;
        when "11101101100" =>    ALU1 <= MC_A_REG;
        when "11111101100" =>    ALU1 <= MC_A_REG;
        when "11111001100" =>    ALU1 <= MC_A_REG;
        when "11101001001" =>    ALU1 <= MC_A_REG;
        when "11100001110" =>    ALU1 <= MC_A_REG;
        when "11110001110" =>    ALU1 <= MC_A_REG;
        when "11100101011" =>    ALU1 <= MC_A_REG;
        when "11110101011" =>    ALU1 <= MC_A_REG;
        when "10101010000" =>    ALU1 <= MC_A_REG;
        when "10101000000" =>    ALU1 <= MC_A_REG;
        when "10001010000" =>    ALU1 <= MC_X_REG;
        when "10011000000" =>    ALU1 <= MC_Y_REG;
        when others =>    ALU1 <= MC_A_REG;
    end case;
  end process;
end ALU1_rom_arch;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.microcode.all;

entity ALU2_rom is
    port (addr       :in std_logic_vector (10 downto 0);
          ALU2       :out MCT_ALU2
         );
end ALU2_rom;


architecture ALU2_rom_arch of ALU2_rom is
begin
  process (addr)
  begin
    case addr is
        when "01101101100" =>    ALU2 <= MC_DIN;
        when "01111101100" =>    ALU2 <= MC_DIN;
        when "01111001100" =>    ALU2 <= MC_DIN;
        when "01101001001" =>    ALU2 <= MC_DIN;
        when "01100001110" =>    ALU2 <= MC_DIN;
        when "01110001110" =>    ALU2 <= MC_DIN;
        when "01100101011" =>    ALU2 <= MC_DIN;
        when "01110101011" =>    ALU2 <= MC_DIN;
        when "00101101100" =>    ALU2 <= MC_DIN;
        when "00111101100" =>    ALU2 <= MC_DIN;
        when "00111001100" =>    ALU2 <= MC_DIN;
        when "00101001001" =>    ALU2 <= MC_DIN;
        when "00100001110" =>    ALU2 <= MC_DIN;
        when "00110001110" =>    ALU2 <= MC_DIN;
        when "00100101011" =>    ALU2 <= MC_DIN;
        when "00110101011" =>    ALU2 <= MC_DIN;
        when "00101100100" =>    ALU2 <= MC_DIN;
        when "00100100011" =>    ALU2 <= MC_DIN;
        when "11001101100" =>    ALU2 <= MC_DIN;
        when "11011101100" =>    ALU2 <= MC_DIN;
        when "11011001100" =>    ALU2 <= MC_DIN;
        when "11001001001" =>    ALU2 <= MC_DIN;
        when "11000001110" =>    ALU2 <= MC_DIN;
        when "11010001110" =>    ALU2 <= MC_DIN;
        when "11000101011" =>    ALU2 <= MC_DIN;
        when "11010101011" =>    ALU2 <= MC_DIN;
        when "11101100100" =>    ALU2 <= MC_DIN;
        when "11100000001" =>    ALU2 <= MC_DIN;
        when "11100100011" =>    ALU2 <= MC_DIN;
        when "11001100100" =>    ALU2 <= MC_DIN;
        when "11000000001" =>    ALU2 <= MC_DIN;
        when "11000100011" =>    ALU2 <= MC_DIN;
        when "11001110100" =>    ALU2 <= MC_ONE;
        when "11011110100" =>    ALU2 <= MC_ONE;
        when "11000110011" =>    ALU2 <= MC_ONE;
        when "11010110011" =>    ALU2 <= MC_ONE;
        when "11001010000" =>    ALU2 <= MC_ONE;
        when "10001000000" =>    ALU2 <= MC_ONE;
        when "01001101100" =>    ALU2 <= MC_DIN;
        when "01011101100" =>    ALU2 <= MC_DIN;
        when "01011001100" =>    ALU2 <= MC_DIN;
        when "01001001001" =>    ALU2 <= MC_DIN;
        when "01000001110" =>    ALU2 <= MC_DIN;
        when "01010001110" =>    ALU2 <= MC_DIN;
        when "01000101011" =>    ALU2 <= MC_DIN;
        when "01010101011" =>    ALU2 <= MC_DIN;
        when "11101110100" =>    ALU2 <= MC_ONE;
        when "11111110100" =>    ALU2 <= MC_ONE;
        when "11100110011" =>    ALU2 <= MC_ONE;
        when "11110110011" =>    ALU2 <= MC_ONE;
        when "11101000000" =>    ALU2 <= MC_ONE;
        when "11001000000" =>    ALU2 <= MC_ONE;
        when "10101101100" =>    ALU2 <= MC_DIN;
        when "10111101100" =>    ALU2 <= MC_DIN;
        when "10111001100" =>    ALU2 <= MC_DIN;
        when "10101001001" =>    ALU2 <= MC_DIN;
        when "10100101011" =>    ALU2 <= MC_DIN;
        when "10100001110" =>    ALU2 <= MC_DIN;
        when "10110001110" =>    ALU2 <= MC_DIN;
        when "10110101011" =>    ALU2 <= MC_DIN;
        when "10101110100" =>    ALU2 <= MC_DIN;
        when "10111110100" =>    ALU2 <= MC_DIN;
        when "10100010001" =>    ALU2 <= MC_DIN;
        when "10100110011" =>    ALU2 <= MC_DIN;
        when "10110110011" =>    ALU2 <= MC_DIN;
        when "10101100100" =>    ALU2 <= MC_DIN;
        when "10111100100" =>    ALU2 <= MC_DIN;
        when "10100000001" =>    ALU2 <= MC_DIN;
        when "10100100011" =>    ALU2 <= MC_DIN;
        when "10110100011" =>    ALU2 <= MC_DIN;
        when "00001101100" =>    ALU2 <= MC_DIN;
        when "00011101100" =>    ALU2 <= MC_DIN;
        when "00011001100" =>    ALU2 <= MC_DIN;
        when "00001001001" =>    ALU2 <= MC_DIN;
        when "00000001110" =>    ALU2 <= MC_DIN;
        when "00010001110" =>    ALU2 <= MC_DIN;
        when "00000101011" =>    ALU2 <= MC_DIN;
        when "00010101011" =>    ALU2 <= MC_DIN;
        when "01101000011" =>    ALU2 <= MC_DIN;
        when "11101101100" =>    ALU2 <= MC_DIN;
        when "11111101100" =>    ALU2 <= MC_DIN;
        when "11111001100" =>    ALU2 <= MC_DIN;
        when "11101001001" =>    ALU2 <= MC_DIN;
        when "11100001110" =>    ALU2 <= MC_DIN;
        when "11110001110" =>    ALU2 <= MC_DIN;
        when "11100101011" =>    ALU2 <= MC_DIN;
        when "11110101011" =>    ALU2 <= MC_DIN;
        when "10111010000" =>    ALU2 <= MC_SP_REG;
        when others =>    ALU2 <= MC_DIN;
    end case;
  end process;
end ALU2_rom_arch;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.microcode.all;

entity ALU_OP_rom is
    port (addr       :in std_logic_vector (10 downto 0);
          ALU_OP     :out MCT_ALU_OP
         );
end ALU_OP_rom;


architecture ALU_OP_rom_arch of ALU_OP_rom is
begin
  process (addr)
  begin
    case addr is
        when "01101101100" =>    ALU_OP <= MC_ADDC;
        when "01111101100" =>    ALU_OP <= MC_ADDC;
        when "01111001100" =>    ALU_OP <= MC_ADDC;
        when "01101001001" =>    ALU_OP <= MC_ADDC;
        when "01100001110" =>    ALU_OP <= MC_ADDC;
        when "01110001110" =>    ALU_OP <= MC_ADDC;
        when "01100101011" =>    ALU_OP <= MC_ADDC;
        when "01110101011" =>    ALU_OP <= MC_ADDC;
        when "00101101100" =>    ALU_OP <= MC_BIT_AND;
        when "00111101100" =>    ALU_OP <= MC_BIT_AND;
        when "00111001100" =>    ALU_OP <= MC_BIT_AND;
        when "00101001001" =>    ALU_OP <= MC_BIT_AND;
        when "00100001110" =>    ALU_OP <= MC_BIT_AND;
        when "00110001110" =>    ALU_OP <= MC_BIT_AND;
        when "00100101011" =>    ALU_OP <= MC_BIT_AND;
        when "00110101011" =>    ALU_OP <= MC_BIT_AND;
        when "00001110100" =>    ALU_OP <= MC_BIT_ASL;
        when "00011110100" =>    ALU_OP <= MC_BIT_ASL;
        when "00001010000" =>    ALU_OP <= MC_BIT_ASL;
        when "00000110011" =>    ALU_OP <= MC_BIT_ASL;
        when "00010110011" =>    ALU_OP <= MC_BIT_ASL;
        when "00101100100" =>    ALU_OP <= MC_BIT_AND;
        when "00100100011" =>    ALU_OP <= MC_BIT_AND;
        when "11001101100" =>    ALU_OP <= MC_SUB;
        when "11011101100" =>    ALU_OP <= MC_SUB;
        when "11011001100" =>    ALU_OP <= MC_SUB;
        when "11001001001" =>    ALU_OP <= MC_SUB;
        when "11000001110" =>    ALU_OP <= MC_SUB;
        when "11010001110" =>    ALU_OP <= MC_SUB;
        when "11000101011" =>    ALU_OP <= MC_SUB;
        when "11010101011" =>    ALU_OP <= MC_SUB;
        when "11101100100" =>    ALU_OP <= MC_SUB;
        when "11100000001" =>    ALU_OP <= MC_SUB;
        when "11100100011" =>    ALU_OP <= MC_SUB;
        when "11001100100" =>    ALU_OP <= MC_SUB;
        when "11000000001" =>    ALU_OP <= MC_SUB;
        when "11000100011" =>    ALU_OP <= MC_SUB;
        when "11001110100" =>    ALU_OP <= MC_SUB;
        when "11011110100" =>    ALU_OP <= MC_SUB;
        when "11000110011" =>    ALU_OP <= MC_SUB;
        when "11010110011" =>    ALU_OP <= MC_SUB;
        when "11001010000" =>    ALU_OP <= MC_SUB;
        when "10001000000" =>    ALU_OP <= MC_SUB;
        when "01001101100" =>    ALU_OP <= MC_BIT_XOR;
        when "01011101100" =>    ALU_OP <= MC_BIT_XOR;
        when "01011001100" =>    ALU_OP <= MC_BIT_XOR;
        when "01001001001" =>    ALU_OP <= MC_BIT_XOR;
        when "01000001110" =>    ALU_OP <= MC_BIT_XOR;
        when "01010001110" =>    ALU_OP <= MC_BIT_XOR;
        when "01000101011" =>    ALU_OP <= MC_BIT_XOR;
        when "01010101011" =>    ALU_OP <= MC_BIT_XOR;
        when "11101110100" =>    ALU_OP <= MC_ADD;
        when "11111110100" =>    ALU_OP <= MC_ADD;
        when "11100110011" =>    ALU_OP <= MC_ADD;
        when "11110110011" =>    ALU_OP <= MC_ADD;
        when "11101000000" =>    ALU_OP <= MC_ADD;
        when "11001000000" =>    ALU_OP <= MC_ADD;
        when "10101101100" =>    ALU_OP <= MC_PASS2;
        when "10111101100" =>    ALU_OP <= MC_PASS2;
        when "10111001100" =>    ALU_OP <= MC_PASS2;
        when "10101001001" =>    ALU_OP <= MC_PASS2;
        when "10100101011" =>    ALU_OP <= MC_PASS2;
        when "10100001110" =>    ALU_OP <= MC_PASS2;
        when "10110001110" =>    ALU_OP <= MC_PASS2;
        when "10110101011" =>    ALU_OP <= MC_PASS2;
        when "10101110100" =>    ALU_OP <= MC_PASS2;
        when "10111110100" =>    ALU_OP <= MC_PASS2;
        when "10100010001" =>    ALU_OP <= MC_PASS2;
        when "10100110011" =>    ALU_OP <= MC_PASS2;
        when "10110110011" =>    ALU_OP <= MC_PASS2;
        when "10101100100" =>    ALU_OP <= MC_PASS2;
        when "10111100100" =>    ALU_OP <= MC_PASS2;
        when "10100000001" =>    ALU_OP <= MC_PASS2;
        when "10100100011" =>    ALU_OP <= MC_PASS2;
        when "10110100011" =>    ALU_OP <= MC_PASS2;
        when "01001110100" =>    ALU_OP <= MC_BIT_LSR;
        when "01011110100" =>    ALU_OP <= MC_BIT_LSR;
        when "01001010000" =>    ALU_OP <= MC_BIT_LSR;
        when "01000110011" =>    ALU_OP <= MC_BIT_LSR;
        when "01010110011" =>    ALU_OP <= MC_BIT_LSR;
        when "00001101100" =>    ALU_OP <= MC_BIT_OR;
        when "00011101100" =>    ALU_OP <= MC_BIT_OR;
        when "00011001100" =>    ALU_OP <= MC_BIT_OR;
        when "00001001001" =>    ALU_OP <= MC_BIT_OR;
        when "00000001110" =>    ALU_OP <= MC_BIT_OR;
        when "00010001110" =>    ALU_OP <= MC_BIT_OR;
        when "00000101011" =>    ALU_OP <= MC_BIT_OR;
        when "00010101011" =>    ALU_OP <= MC_BIT_OR;
        when "01101000011" =>    ALU_OP <= MC_PASS2;
        when "00101110100" =>    ALU_OP <= MC_BIT_ROL;
        when "00111110100" =>    ALU_OP <= MC_BIT_ROL;
        when "00101010000" =>    ALU_OP <= MC_BIT_ROL;
        when "00100110011" =>    ALU_OP <= MC_BIT_ROL;
        when "00110110011" =>    ALU_OP <= MC_BIT_ROL;
        when "01101110100" =>    ALU_OP <= MC_BIT_ROR;
        when "01111110100" =>    ALU_OP <= MC_BIT_ROR;
        when "01101010000" =>    ALU_OP <= MC_BIT_ROR;
        when "01100110011" =>    ALU_OP <= MC_BIT_ROR;
        when "01110110011" =>    ALU_OP <= MC_BIT_ROR;
        when "11101101100" =>    ALU_OP <= MC_SUBB;
        when "11111101100" =>    ALU_OP <= MC_SUBB;
        when "11111001100" =>    ALU_OP <= MC_SUBB;
        when "11101001001" =>    ALU_OP <= MC_SUBB;
        when "11100001110" =>    ALU_OP <= MC_SUBB;
        when "11110001110" =>    ALU_OP <= MC_SUBB;
        when "11100101011" =>    ALU_OP <= MC_SUBB;
        when "11110101011" =>    ALU_OP <= MC_SUBB;
        when "10101010000" =>    ALU_OP <= MC_PASS1;
        when "10101000000" =>    ALU_OP <= MC_PASS1;
        when "10111010000" =>    ALU_OP <= MC_PASS2;
        when "10001010000" =>    ALU_OP <= MC_PASS1;
        when "10011000000" =>    ALU_OP <= MC_PASS1;
        when others =>    ALU_OP <= MC_PASS1;
    end case;
  end process;
end ALU_OP_rom_arch;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.microcode.all;

entity A_LE_rom is
    port (addr       :in std_logic_vector (10 downto 0);
          A_LE       :out MCT_A_LE
         );
end A_LE_rom;


architecture A_LE_rom_arch of A_LE_rom is
begin
  process (addr)
  begin
    case addr is
        when "01101101100" =>    A_LE <= MC_LE;
        when "01111101100" =>    A_LE <= MC_LE;
        when "01111001100" =>    A_LE <= MC_LE;
        when "01101001001" =>    A_LE <= MC_LE;
        when "01100001110" =>    A_LE <= MC_LE;
        when "01110001110" =>    A_LE <= MC_LE;
        when "01100101011" =>    A_LE <= MC_LE;
        when "01110101011" =>    A_LE <= MC_LE;
        when "00101101100" =>    A_LE <= MC_LE;
        when "00111101100" =>    A_LE <= MC_LE;
        when "00111001100" =>    A_LE <= MC_LE;
        when "00101001001" =>    A_LE <= MC_LE;
        when "00100001110" =>    A_LE <= MC_LE;
        when "00110001110" =>    A_LE <= MC_LE;
        when "00100101011" =>    A_LE <= MC_LE;
        when "00110101011" =>    A_LE <= MC_LE;
        when "00001010000" =>    A_LE <= MC_LE;
        when "01001101100" =>    A_LE <= MC_LE;
        when "01011101100" =>    A_LE <= MC_LE;
        when "01011001100" =>    A_LE <= MC_LE;
        when "01001001001" =>    A_LE <= MC_LE;
        when "01000001110" =>    A_LE <= MC_LE;
        when "01010001110" =>    A_LE <= MC_LE;
        when "01000101011" =>    A_LE <= MC_LE;
        when "01010101011" =>    A_LE <= MC_LE;
        when "10101101100" =>    A_LE <= MC_LE;
        when "10111101100" =>    A_LE <= MC_LE;
        when "10111001100" =>    A_LE <= MC_LE;
        when "10101001001" =>    A_LE <= MC_LE;
        when "10100101011" =>    A_LE <= MC_LE;
        when "10100001110" =>    A_LE <= MC_LE;
        when "10110001110" =>    A_LE <= MC_LE;
        when "10110101011" =>    A_LE <= MC_LE;
        when "01001010000" =>    A_LE <= MC_LE;
        when "00001101100" =>    A_LE <= MC_LE;
        when "00011101100" =>    A_LE <= MC_LE;
        when "00011001100" =>    A_LE <= MC_LE;
        when "00001001001" =>    A_LE <= MC_LE;
        when "00000001110" =>    A_LE <= MC_LE;
        when "00010001110" =>    A_LE <= MC_LE;
        when "00000101011" =>    A_LE <= MC_LE;
        when "00010101011" =>    A_LE <= MC_LE;
        when "01101000011" =>    A_LE <= MC_LE;
        when "00101010000" =>    A_LE <= MC_LE;
        when "01101010000" =>    A_LE <= MC_LE;
        when "11101101100" =>    A_LE <= MC_LE;
        when "11111101100" =>    A_LE <= MC_LE;
        when "11111001100" =>    A_LE <= MC_LE;
        when "11101001001" =>    A_LE <= MC_LE;
        when "11100001110" =>    A_LE <= MC_LE;
        when "11110001110" =>    A_LE <= MC_LE;
        when "11100101011" =>    A_LE <= MC_LE;
        when "11110101011" =>    A_LE <= MC_LE;
        when "10001010000" =>    A_LE <= MC_LE;
        when "10011000000" =>    A_LE <= MC_LE;
        when others =>    A_LE <= MC_NOP;
    end case;
  end process;
end A_LE_rom_arch;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.microcode.all;

entity X_LE_rom is
    port (addr       :in std_logic_vector (10 downto 0);
          X_LE       :out MCT_X_LE
         );
end X_LE_rom;


architecture X_LE_rom_arch of X_LE_rom is
begin
  process (addr)
  begin
    case addr is
        when "11001010000" =>    X_LE <= MC_LE;
        when "11101000000" =>    X_LE <= MC_LE;
        when "10101110100" =>    X_LE <= MC_LE;
        when "10111110100" =>    X_LE <= MC_LE;
        when "10100010001" =>    X_LE <= MC_LE;
        when "10100110011" =>    X_LE <= MC_LE;
        when "10110110011" =>    X_LE <= MC_LE;
        when "10101010000" =>    X_LE <= MC_LE;
        when "10111010000" =>    X_LE <= MC_LE;
        when others =>    X_LE <= MC_NOP;
    end case;
  end process;
end X_LE_rom_arch;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.microcode.all;

entity Y_LE_rom is
    port (addr       :in std_logic_vector (10 downto 0);
          Y_LE       :out MCT_Y_LE
         );
end Y_LE_rom;


architecture Y_LE_rom_arch of Y_LE_rom is
begin
  process (addr)
  begin
    case addr is
        when "10001000000" =>    Y_LE <= MC_LE;
        when "11001000000" =>    Y_LE <= MC_LE;
        when "10101100100" =>    Y_LE <= MC_LE;
        when "10111100100" =>    Y_LE <= MC_LE;
        when "10100000001" =>    Y_LE <= MC_LE;
        when "10100100011" =>    Y_LE <= MC_LE;
        when "10110100011" =>    Y_LE <= MC_LE;
        when "10101000000" =>    Y_LE <= MC_LE;
        when others =>    Y_LE <= MC_NOP;
    end case;
  end process;
end Y_LE_rom_arch;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.microcode.all;

entity FLAG_OP_rom is
    port (addr       :in std_logic_vector (10 downto 0);
          FLAG_OP    :out MCT_FLAG_OP
         );
end FLAG_OP_rom;


architecture FLAG_OP_rom_arch of FLAG_OP_rom is
begin
  process (addr)
  begin
    case addr is
        when "01101101100" =>    FLAG_OP <= MC_NVZC;
        when "01111101100" =>    FLAG_OP <= MC_NVZC;
        when "01111001100" =>    FLAG_OP <= MC_NVZC;
        when "01101001001" =>    FLAG_OP <= MC_NVZC;
        when "01100001110" =>    FLAG_OP <= MC_NVZC;
        when "01110001110" =>    FLAG_OP <= MC_NVZC;
        when "01100101011" =>    FLAG_OP <= MC_NVZC;
        when "01110101011" =>    FLAG_OP <= MC_NVZC;
        when "00101101100" =>    FLAG_OP <= MC_NZ;
        when "00111101100" =>    FLAG_OP <= MC_NZ;
        when "00111001100" =>    FLAG_OP <= MC_NZ;
        when "00101001001" =>    FLAG_OP <= MC_NZ;
        when "00100001110" =>    FLAG_OP <= MC_NZ;
        when "00110001110" =>    FLAG_OP <= MC_NZ;
        when "00100101011" =>    FLAG_OP <= MC_NZ;
        when "00110101011" =>    FLAG_OP <= MC_NZ;
        when "00001110100" =>    FLAG_OP <= MC_NZC;
        when "00011110100" =>    FLAG_OP <= MC_NZC;
        when "00001010000" =>    FLAG_OP <= MC_NZC;
        when "00000110011" =>    FLAG_OP <= MC_NZC;
        when "00010110011" =>    FLAG_OP <= MC_NZC;
        when "00101100100" =>    FLAG_OP <= MC_BIT;
        when "00100100011" =>    FLAG_OP <= MC_BIT;
        when "00000000001" =>    FLAG_OP <= MC_SETB;
        when "00000000101" =>    FLAG_OP <= MC_SETI;
        when "00011000000" =>    FLAG_OP <= MC_CLEARC;
        when "11011000000" =>    FLAG_OP <= MC_CLEARD;
        when "01011000000" =>    FLAG_OP <= MC_CLEARI;
        when "10111000000" =>    FLAG_OP <= MC_CLEARV;
        when "11001101100" =>    FLAG_OP <= MC_NZC;
        when "11011101100" =>    FLAG_OP <= MC_NZC;
        when "11011001100" =>    FLAG_OP <= MC_NZC;
        when "11001001001" =>    FLAG_OP <= MC_NZC;
        when "11000001110" =>    FLAG_OP <= MC_NZC;
        when "11010001110" =>    FLAG_OP <= MC_NZC;
        when "11000101011" =>    FLAG_OP <= MC_NZC;
        when "11010101011" =>    FLAG_OP <= MC_NZC;
        when "11101100100" =>    FLAG_OP <= MC_NZC;
        when "11100000001" =>    FLAG_OP <= MC_NZC;
        when "11100100011" =>    FLAG_OP <= MC_NZC;
        when "11001100100" =>    FLAG_OP <= MC_NZC;
        when "11000000001" =>    FLAG_OP <= MC_NZC;
        when "11000100011" =>    FLAG_OP <= MC_NZC;
        when "11001110100" =>    FLAG_OP <= MC_NZ;
        when "11011110100" =>    FLAG_OP <= MC_NZ;
        when "11000110011" =>    FLAG_OP <= MC_NZ;
        when "11010110011" =>    FLAG_OP <= MC_NZ;
        when "11001010000" =>    FLAG_OP <= MC_NZ;
        when "10001000000" =>    FLAG_OP <= MC_NZ;
        when "01001101100" =>    FLAG_OP <= MC_NZ;
        when "01011101100" =>    FLAG_OP <= MC_NZ;
        when "01011001100" =>    FLAG_OP <= MC_NZ;
        when "01001001001" =>    FLAG_OP <= MC_NZ;
        when "01000001110" =>    FLAG_OP <= MC_NZ;
        when "01010001110" =>    FLAG_OP <= MC_NZ;
        when "01000101011" =>    FLAG_OP <= MC_NZ;
        when "01010101011" =>    FLAG_OP <= MC_NZ;
        when "11101110100" =>    FLAG_OP <= MC_NZ;
        when "11111110100" =>    FLAG_OP <= MC_NZ;
        when "11100110011" =>    FLAG_OP <= MC_NZ;
        when "11110110011" =>    FLAG_OP <= MC_NZ;
        when "11101000000" =>    FLAG_OP <= MC_NZ;
        when "11001000000" =>    FLAG_OP <= MC_NZ;
        when "10101101100" =>    FLAG_OP <= MC_NZ;
        when "10111101100" =>    FLAG_OP <= MC_NZ;
        when "10111001100" =>    FLAG_OP <= MC_NZ;
        when "10101001001" =>    FLAG_OP <= MC_NZ;
        when "10100101011" =>    FLAG_OP <= MC_NZ;
        when "10100001110" =>    FLAG_OP <= MC_NZ;
        when "10110001110" =>    FLAG_OP <= MC_NZ;
        when "10110101011" =>    FLAG_OP <= MC_NZ;
        when "10101110100" =>    FLAG_OP <= MC_NZ;
        when "10111110100" =>    FLAG_OP <= MC_NZ;
        when "10100010001" =>    FLAG_OP <= MC_NZ;
        when "10100110011" =>    FLAG_OP <= MC_NZ;
        when "10110110011" =>    FLAG_OP <= MC_NZ;
        when "10101100100" =>    FLAG_OP <= MC_NZ;
        when "10111100100" =>    FLAG_OP <= MC_NZ;
        when "10100000001" =>    FLAG_OP <= MC_NZ;
        when "10100100011" =>    FLAG_OP <= MC_NZ;
        when "10110100011" =>    FLAG_OP <= MC_NZ;
        when "01001110100" =>    FLAG_OP <= MC_NZC;
        when "01011110100" =>    FLAG_OP <= MC_NZC;
        when "01001010000" =>    FLAG_OP <= MC_NZC;
        when "01000110011" =>    FLAG_OP <= MC_NZC;
        when "01010110011" =>    FLAG_OP <= MC_NZC;
        when "00001101100" =>    FLAG_OP <= MC_NZ;
        when "00011101100" =>    FLAG_OP <= MC_NZ;
        when "00011001100" =>    FLAG_OP <= MC_NZ;
        when "00001001001" =>    FLAG_OP <= MC_NZ;
        when "00000001110" =>    FLAG_OP <= MC_NZ;
        when "00010001110" =>    FLAG_OP <= MC_NZ;
        when "00000101011" =>    FLAG_OP <= MC_NZ;
        when "00010101011" =>    FLAG_OP <= MC_NZ;
        when "01101000011" =>    FLAG_OP <= MC_NZ;
        when "00101000011" =>    FLAG_OP <= MC_DIN;
        when "00000011000" =>    FLAG_OP <= MC_SETI;
        when "00101110100" =>    FLAG_OP <= MC_NZC;
        when "00111110100" =>    FLAG_OP <= MC_NZC;
        when "00101010000" =>    FLAG_OP <= MC_NZC;
        when "00100110011" =>    FLAG_OP <= MC_NZC;
        when "00110110011" =>    FLAG_OP <= MC_NZC;
        when "01101110100" =>    FLAG_OP <= MC_NZC;
        when "01111110100" =>    FLAG_OP <= MC_NZC;
        when "01101010000" =>    FLAG_OP <= MC_NZC;
        when "01100110011" =>    FLAG_OP <= MC_NZC;
        when "01110110011" =>    FLAG_OP <= MC_NZC;
        when "01000000011" =>    FLAG_OP <= MC_DIN;
        when "11101101100" =>    FLAG_OP <= MC_NVZC;
        when "11111101100" =>    FLAG_OP <= MC_NVZC;
        when "11111001100" =>    FLAG_OP <= MC_NVZC;
        when "11101001001" =>    FLAG_OP <= MC_NVZC;
        when "11100001110" =>    FLAG_OP <= MC_NVZC;
        when "11110001110" =>    FLAG_OP <= MC_NVZC;
        when "11100101011" =>    FLAG_OP <= MC_NVZC;
        when "11110101011" =>    FLAG_OP <= MC_NVZC;
        when "00111000000" =>    FLAG_OP <= MC_SETC;
        when "11111000000" =>    FLAG_OP <= MC_SETD;
        when "01111000000" =>    FLAG_OP <= MC_SETI;
        when "01000011101" =>    FLAG_OP <= MC_SETI;
        when "00110011101" =>    FLAG_OP <= MC_SETI;
        when "10101010000" =>    FLAG_OP <= MC_NZ;
        when "10101000000" =>    FLAG_OP <= MC_NZ;
        when "10111010000" =>    FLAG_OP <= MC_NZ;
        when "10001010000" =>    FLAG_OP <= MC_NZ;
        when "10011000000" =>    FLAG_OP <= MC_NZ;
        when others =>    FLAG_OP <= MC_NOP;
    end case;
  end process;
end FLAG_OP_rom_arch;


----------------------------------------------------------------------------
----------------------------------------------------------------------------

----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.microcode.all;

entity mc_rom is
    port (opcode     :in std_logic_vector (7 downto 0);
          step       :in std_logic_vector (2 downto 0);
          DONE       :out MCT_DONE;
          ADDR_OP    :out MCT_ADDR_OP;
          DIN_LE     :out MCT_DIN_LE;
          RD_EN      :out MCT_RD_EN;
          DOUT_OP    :out MCT_DOUT_OP;
          DINT1_OP   :out MCT_DINT1_OP;
          DINT2_OP   :out MCT_DINT2_OP;
          DINT3_OP   :out MCT_DINT3_OP;
          PC_OP      :out MCT_PC_OP;
          SP_OP      :out MCT_SP_OP;
          ALU1       :out MCT_ALU1;
          ALU2       :out MCT_ALU2;
          ALU_OP     :out MCT_ALU_OP;
          A_LE       :out MCT_A_LE;
          X_LE       :out MCT_X_LE;
          Y_LE       :out MCT_Y_LE;
          FLAG_OP    :out MCT_FLAG_OP
         );
end mc_rom;


architecture mc_rom_arch of mc_rom is
  signal addr :std_logic_vector (10 downto 0);
begin

  addr <= opcode & step;

  U00: DONE_rom port map (addr, DONE);
  U01: ADDR_OP_rom port map (addr, ADDR_OP);
  U02: DIN_LE_rom port map (addr, DIN_LE);
  U03: RD_EN_rom port map (addr, RD_EN);
  U04: DOUT_OP_rom port map (addr, DOUT_OP);
  U05: DINT1_OP_rom port map (addr, DINT1_OP);
  U06: DINT2_OP_rom port map (addr, DINT2_OP);
  U07: DINT3_OP_rom port map (addr, DINT3_OP);
  U08: PC_OP_rom port map (addr, PC_OP);
  U09: SP_OP_rom port map (addr, SP_OP);
  U10: ALU1_rom port map (addr, ALU1);
  U11: ALU2_rom port map (addr, ALU2);
  U12: ALU_OP_rom port map (addr, ALU_OP);
  U13: A_LE_rom port map (addr, A_LE);
  U14: X_LE_rom port map (addr, X_LE);
  U15: Y_LE_rom port map (addr, Y_LE);
  U16: FLAG_OP_rom port map (addr, FLAG_OP);
end mc_rom_arch;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
--,Free-6502 Opcode Summary
--  
--,Neumonic,Addr Mode,Opcode,Original Clks,Free-6502 Clks,Flags
--,ADC,"ABS",6D,4,5,NVZC
--,ADC,"ABS,X",7D,4,5,NVZC
--,ADC,"ABS,Y",79,4,5,NVZC
--,ADC,"IMM",69,2,3,NVZC
--,ADC,"(IND,X)",61,6,7,NVZC
--,ADC,"(IND),Y",71,5,7,NVZC
--,ADC,"Z-PAGE",65,3,4,NVZC
--,ADC,"Z-PAGE,X",75,4,4,NVZC
--,AND,"ABS",2D,4,5,NZ
--,AND,"ABS,X",3D,4,5,NZ
--,AND,"ABS,Y",39,4,5,NZ
--,AND,"IMM",29,2,3,NZ
--,AND,"(IND,X)",21,6,7,NZ
--,AND,"(IND),Y",31,5,7,NZ
--,AND,"Z-PAGE",25,3,4,NZ
--,AND,"Z-PAGE,X",35,4,4,NZ
--,ASL,"ABS",0E,6,8,NZC
--,ASL,"ABS,X",1E,7,8,NZC
--,ASL,"ACC",0A,2,2,NZC
--,ASL,"Z-PAGE",06,5,7,NZC
--,ASL,"Z-PAGE,X",16,6,7,NZC
--,BCC,"REL",90,2,4,
--,BCS,"REL",B0,2,4,
--,BEQ,"REL",F0,2,4,
--,BIT,"ABS",2C,4,5,BIT
--,BIT,"Z-PAGE",24,3,4,BIT
--,BMI,"REL",30,2,4,
--,BNE,"REL",D0,2,4,
--,BPL,"REL",10,2,4,
--,BRK,"IMP",00,7,7,SETI
--,BVC,"REL",50,2,4,
--,BVS,"REL",70,2,4,
--,CLC,"IMP",18,2,2,CLEARC
--,CLD,"IMP",D8,2,2,CLEARD
--,CLI,"IMP",58,2,2,CLEARI
--,CLV,"IMP",B8,2,2,CLEARV
--,CMP,"ABS",CD,4,5,NZC
--,CMP,"ABS,X",DD,4,5,NZC
--,CMP,"ABS,Y",D9,4,5,NZC
--,CMP,"IMM",C9,2,3,NZC
--,CMP,"(IND,X)",C1,6,7,NZC
--,CMP,"(IND),Y",D1,5,7,NZC
--,CMP,"Z-PAGE",C5,3,4,NZC
--,CMP,"Z-PAGE,X",D5,4,4,NZC
--,CPX,"ABS",EC,4,5,NZC
--,CPX,"IMM",E0,2,3,NZC
--,CPX,"Z-PAGE",E4,3,4,NZC
--,CPY,"ABS",CC,4,5,NZC
--,CPY,"IMM",C0,2,3,NZC
--,CPY,"Z-PAGE",C4,3,4,NZC
--,DEC,"ABS",CE,6,8,NZ
--,DEC,"ABS,X",DE,7,8,NZ
--,DEC,"Z-PAGE",C6,5,7,NZ
--,DEC,"Z-PAGE,X",D6,6,7,NZ
--,DEX,"IMP",CA,2,2,NZ
--,DEY,"IMP",88,2,2,NZ
--,EOR,"ABS",4D,4,5,NZ
--,EOR,"ABS,X",5D,4,5,NZ
--,EOR,"ABS,Y",59,4,5,NZ
--,EOR,"IMM",49,2,3,NZ
--,EOR,"(IND,X)",41,6,7,NZ
--,EOR,"(IND),Y",51,5,7,NZ
--,EOR,"Z-PAGE",45,3,4,NZ
--,EOR,"Z-PAGE,X",55,4,4,NZ
--,INC,"ABS",EE,6,8,NZ
--,INC,"ABS,X",FE,7,8,NZ
--,INC,"Z-PAGE",E6,5,7,NZ
--,INC,"Z-PAGE,X",F6,6,7,NZ
--,INX,"IMP",E8,2,2,NZ
--,INY,"IMP",C8,2,2,NZ
--,JMP,"ABS",4C,3,5,
--,JMP,"(IND)",6C,5,8,
--,JSR,"ABS",20,6,5,
--,LDA,"ABS",AD,4,5,NZ
--,LDA,"ABS,X",BD,4,5,NZ
--,LDA,"ABS,Y",B9,4,5,NZ
--,LDA,"IMM",A9,2,3,NZ
--,LDA,"Z-PAGE",A5,4,4,NZ
--,LDA,"(IND,X)",A1,6,7,NZ
--,LDA,"(IND),Y",B1,5,7,NZ
--,LDA,"Z-PAGE,X",B5,4,4,NZ
--,LDX,"ABS",AE,4,5,NZ
--,LDX,"ABS,Y",BE,4,5,NZ
--,LDX,"IMM",A2,2,3,NZ
--,LDX,"Z-PAGE",A6,3,4,NZ
--,LDX,"Z-PAGE,Y",B6,4,4,NZ
--,LDY,"ABS",AC,4,5,NZ
--,LDY,"ABS,X",BC,4,5,NZ
--,LDY,"IMM",A0,2,3,NZ
--,LDY,"Z-PAGE",A4,3,4,NZ
--,LDY,"Z-PAGE,X",B4,4,4,NZ
--,LSR,"ABS",4E,6,8,NZC
--,LSR,"ABS,X",5E,7,8,NZC
--,LSR,"ACC",4A,2,2,NZC
--,LSR,"Z-PAGE",46,5,7,NZC
--,LSR,"Z-PAGE,X",56,6,7,NZC
--,NOP,"IMP",EA,2,2,
--,ORA,"ABS",0D,4,5,NZ
--,ORA,"ABS,X",1D,4,5,NZ
--,ORA,"ABS,Y",19,4,5,NZ
--,ORA,"IMM",09,2,3,NZ
--,ORA,"(IND,X)",01,6,7,NZ
--,ORA,"(IND),Y",11,5,7,NZ
--,ORA,"Z-PAGE",05,3,4,NZ
--,ORA,"Z-PAGE,X",15,4,4,NZ
--,PHA,"IMP",48,3,3,
--,PHP,"IMP",08,3,3,
--,PLA,"IMP",68,4,4,NZ
--,PLP,"IMP",28,4,4,DIN
--,RESET,"INTERNAL",03,0,6,SETI
--,ROL,"ABS",2E,6,8,NZC
--,ROL,"ABS,X",3E,7,8,NZC
--,ROL,"ACC",2A,2,2,NZC
--,ROL,"Z-PAGE",26,5,7,NZC
--,ROL,"Z-PAGE,X",36,6,7,NZC
--,ROR,"ABS",6E,6,8,NZC
--,ROR,"ABS,X",7E,7,8,NZC
--,ROR,"ACC",6A,2,2,NZC
--,ROR,"Z-PAGE",66,5,7,NZC
--,ROR,"Z-PAGE,X",76,6,7,NZC
--,RTI,"IMP",40,6,8,DIN
--,RTS,"IMP",60,6,8,
--,SBC,"ABS",ED,4,5,NVZC
--,SBC,"ABS,X",FD,4,5,NVZC
--,SBC,"ABS,Y",F9,4,5,NVZC
--,SBC,"IMM",E9,2,3,NVZC
--,SBC,"(IND,X)",E1,6,7,NVZC
--,SBC,"(IND),Y",F1,5,7,NVZC
--,SBC,"Z-PAGE",E5,3,4,NVZC
--,SBC,"Z-PAGE,X",F5,4,4,NVZC
--,SEC,"IMP",38,2,2,SETC
--,SED,"IMP",F8,2,2,SETD
--,SEI,"IMP",78,2,2,SETI
--,STA,"ABS",8D,4,5,
--,STA,"ABS,Y",99,5,5,
--,STA,"(IND,X)",81,6,7,
--,STA,"(IND),Y",91,6,7,
--,STA,"Z-PAGE",85,3,4,
--,STA,"Z-PAGE,X",95,4,4,
--,STA,"ABS,X",9D,5,5,
--,S_IRQ,"INTERNAL",43,0,8,SETI
--,S_NMI,"INTERNAL",33,0,8,SETI
--,STX,"ABS",8E,4,5,
--,STX,"Z-PAGE",86,3,4,
--,STX,"Z-PAGE,Y",96,4,4,
--,STY,"ABS",8C,4,5,
--,STY,"Z-PAGE",84,3,4,
--,STY,"Z-PAGE,X",94,4,4,
--,TAX,"IMP",AA,2,2,NZ
--,TAY,"IMP",A8,2,2,NZ
--,TSX,"IMP",BA,2,2,NZ
--,TXA,"IMP",8A,2,2,NZ
--,TXS,"IMP",9A,2,2,
--,TYA,"IMP",98,2,3,NZ
--
--
----------------------------------------------------------------------------
----------------------------------------------------------------------------


