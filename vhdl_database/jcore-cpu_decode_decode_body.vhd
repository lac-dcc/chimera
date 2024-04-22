-- ******************************************************************
-- ******************************************************************
-- ******************************************************************
-- This file is generated. Changing this file directly is probably
-- not what you want to do. Any changes will be overwritten next time
-- the generator is run.
-- ******************************************************************
-- ******************************************************************
-- ******************************************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.decode_pack.all;
use work.cpu2j0_components_pack.all;
use work.mult_pkg.all;
package body decode_pack is
    function predecode_rom_addr (code : std_logic_vector(15 downto 0)) return std_logic_vector is
        variable addr : std_logic_vector(7 downto 0);
    begin
        case code(15 downto 12) is
            when x"0" =>
                -- 0000 0000 0000 1000 => 00000000  CLRT
                -- 0000 0000 0000 1001 => 00000011  NOP
                -- 0000 0000 0000 1011 => 00001000  RTS
                -- 0000 0000 0001 1000 => 00001010  SETT
                -- 0000 0000 0001 1001 => 00000010  DIV0U
                -- 0000 0000 0001 1011 => 00001011  SLEEP
                -- 0000 0000 0010 1000 => 00000001  CLRMAC
                -- 0000 0000 0010 1011 => 00000100  RTE
                -- 0000 0000 0011 1011 => 00001111  BGND
                -- 0000 mmmm 0000 0011 => 01010110  BSRF Rm
                -- 0000 mmmm 0010 0011 => 01010100  BRAF Rm
                -- 0000 nnnn 0000 0010 => 00100010  STC SR, Rn
                -- 0000 nnnn 0000 1010 => 00100101  STS MACH, Rn
                -- 0000 nnnn 0001 0010 => 00100011  STC GBR, Rn
                -- 0000 nnnn 0001 1010 => 00100110  STS MACL, Rn
                -- 0000 nnnn 0010 0010 => 00100100  STC VBR, Rn
                -- 0000 nnnn 0010 1001 => 00010011  MOVT Rn
                -- 0000 nnnn 0010 1010 => 00100111  STS PR, Rn
                -- 0000 nnnn 0101 1010 => 00110111  STS CPI_COM, Rn
                -- 0000 nnnn mmmm 0100 => 10010100  MOV.B Rm, @(R0, Rn)
                -- 0000 nnnn mmmm 0101 => 10010101  MOV.W Rm, @(R0, Rn)
                -- 0000 nnnn mmmm 0110 => 10010110  MOV.L Rm, @(R0, Rn)
                -- 0000 nnnn mmmm 0111 => 01101111  MUL.L Rm, Rn
                -- 0000 nnnn mmmm 1100 => 10010111  MOV.B @(R0, Rm), Rn
                -- 0000 nnnn mmmm 1101 => 10011000  MOV.W @(R0, Rm), Rn
                -- 0000 nnnn mmmm 1110 => 10011001  MOV.L @(R0, Rm), Rn
                -- 0000 nnnn mmmm 1111 => 10000110  MAC.L @Rm+, @Rn+
                addr(0) := not ((not code(11) and not code(10) and not code(9) and not code(8) and not code(7) and not code(6) and not code(5) and code(3) and not code(2) and not code(1) and not code(0)) or (not code(11) and not code(10) and not code(9) and not code(8) and not code(7) and not code(6) and not code(5) and code(4) and code(3) and not code(2) and not code(1)) or (not code(11) and not code(10) and not code(9) and not code(8) and not code(7) and not code(6) and not code(4) and code(3) and not code(2) and code(1) and code(0)) or (not code(7) and not code(6) and not code(4) and not code(3) and not code(2) and code(1)) or (not code(7) and not code(6) and not code(5) and code(4) and code(3) and not code(2) and code(1) and not code(0)) or (code(3) and code(2) and code(0)) or (not code(3) and code(2) and not code(0)));
                addr(1) := not ((not code(11) and not code(10) and not code(9) and not code(8) and not code(7) and not code(6) and not code(4) and code(3) and not code(2) and not code(1) and not code(0)) or (not code(11) and not code(10) and not code(9) and not code(8) and not code(7) and not code(6) and not code(4) and code(3) and not code(2) and code(1) and code(0)) or (not code(7) and not code(6) and code(5) and not code(4) and not code(3) and not code(2) and code(1)) or (not code(7) and not code(6) and not code(5) and not code(4) and code(3) and not code(2) and code(1) and not code(0)) or (not code(3) and code(2) and not code(1)) or (code(2) and not code(1) and code(0)) or (code(3) and code(2) and code(1) and not code(0)));
                addr(2) := not ((not code(11) and not code(10) and not code(9) and not code(8) and not code(7) and not code(6) and not code(4) and code(3) and not code(2) and not code(1) and not code(0)) or (not code(11) and not code(10) and not code(9) and not code(8) and not code(7) and not code(6) and not code(5) and code(3) and not code(2) and code(0)) or (not code(11) and not code(10) and not code(9) and not code(8) and not code(7) and not code(6) and not code(5) and code(3) and not code(2) and not code(1)) or (not code(7) and not code(6) and code(5) and not code(4) and code(3) and not code(2) and not code(1) and code(0)) or (not code(7) and not code(6) and not code(5) and not code(3) and not code(2) and code(1) and not code(0)) or (code(3) and code(2) and not code(1) and code(0)) or (code(3) and code(2) and code(1) and not code(0)));
                addr(3) := ((not code(11) and not code(10) and not code(9) and not code(8) and not code(7) and not code(6) and not code(5) and code(3) and not code(2) and code(1) and code(0)) or (not code(11) and not code(10) and not code(9) and not code(8) and not code(7) and not code(6) and not code(5) and code(4) and code(3) and not code(2) and not code(1) and not code(0)) or (not code(11) and not code(10) and not code(9) and not code(8) and not code(7) and not code(6) and code(4) and code(3) and not code(2) and code(1) and code(0)) or (not code(3) and code(2) and code(1) and code(0)) or (code(3) and code(2) and not code(1) and code(0)) or (code(3) and code(2) and code(1) and not code(0)));
                addr(4) := ((not code(7) and not code(6) and code(5) and not code(4) and code(3) and not code(2) and not code(1) and code(0)) or (not code(7) and code(6) and not code(5) and code(4) and code(3) and not code(2) and code(1) and not code(0)) or (not code(7) and not code(6) and not code(4) and not code(3) and not code(2) and code(1) and code(0)) or (code(2) and not code(1)) or (code(2) and not code(0)));
                addr(5) := ((not code(7) and not code(6) and not code(5) and not code(2) and code(1) and not code(0)) or (not code(7) and not code(6) and not code(4) and not code(2) and code(1) and not code(0)) or (not code(7) and not code(5) and code(4) and code(3) and not code(2) and code(1) and not code(0)) or (not code(3) and code(2) and code(1) and code(0)));
                addr(6) := ((not code(7) and not code(6) and not code(4) and not code(3) and not code(2) and code(1) and code(0)) or (not code(3) and code(2) and code(1) and code(0)));
                addr(7) := ((code(3) and code(2)) or (code(2) and not code(1)) or (code(2) and not code(0)));

            when x"1" =>
                -- 0001 nnnn mmmm dddd => 10011110  MOV.L Rm, @(disp, Rn)
                addr := x"9e";

            when x"2" =>
                -- 0010 nnnn mmmm 0000 => 10000000  MOV.B Rm, @Rn
                -- 0010 nnnn mmmm 0001 => 10000001  MOV.W Rm, @Rn
                -- 0010 nnnn mmmm 0010 => 10000010  MOV.L Rm, @Rn
                -- 0010 nnnn mmmm 0011 => 01100010  CAS.L Rm, Rn, @R0
                -- 0010 nnnn mmmm 0100 => 10010001  MOV.B Rm,@-Rn
                -- 0010 nnnn mmmm 0101 => 10010010  MOV.W Rm,@-Rn
                -- 0010 nnnn mmmm 0110 => 10010011  MOV.L Rm,@-Rn
                -- 0010 nnnn mmmm 0111 => 01100111  DIV0S Rm, Rn
                -- 0010 nnnn mmmm 1000 => 01111011  TST Rm, Rn
                -- 0010 nnnn mmmm 1001 => 01011011  AND Rm, Rn
                -- 0010 nnnn mmmm 1010 => 01111100  XOR Rm, Rn
                -- 0010 nnnn mmmm 1011 => 01110101  OR Rm, Rn
                -- 0010 nnnn mmmm 1100 => 01100001  CMP /STR Rm, Rn
                -- 0010 nnnn mmmm 1101 => 01111101  XTRACT Rm, Rn
                -- 0010 nnnn mmmm 1110 => 01110001  MULU.W Rm, Rn
                -- 0010 nnnn mmmm 1111 => 01110000  MULS.W Rm, Rn
                addr(0) := not ((not code(3) and not code(2) and code(1)) or (code(3) and code(2) and code(1) and code(0)) or (not code(2) and code(1) and not code(0)) or (not code(3) and not code(2) and not code(0)) or (not code(3) and code(2) and not code(1) and code(0)));
                addr(1) := ((code(3) and not code(2) and not code(1)) or (not code(3) and code(1)) or (not code(3) and code(2) and code(0)));
                addr(2) := ((not code(3) and code(2) and code(1) and code(0)) or (code(3) and not code(2) and code(1)) or (code(3) and code(2) and not code(1) and code(0)));
                addr(3) := ((code(3) and not code(2) and not code(0)) or (code(3) and not code(1) and code(0)));
                addr(4) := not ((code(3) and code(2) and not code(1) and not code(0)) or (not code(3) and code(1) and code(0)) or (not code(3) and not code(2)));
                addr(5) := not ((not code(2) and not code(1) and code(0)) or (not code(3) and not code(0)) or (not code(3) and not code(1)));
                addr(6) := not ((not code(3) and not code(1)) or (not code(3) and not code(0)));
                addr(7) := not (code(3) or (code(1) and code(0)));

            when x"3" =>
                -- 0011 nnnn mmmm 0000 => 01011100  CMP /EQ Rm, Rn
                -- 0011 nnnn mmmm 0010 => 01011101  CMP /HS Rm, Rn
                -- 0011 nnnn mmmm 0011 => 01011110  CMP /GE Rm, Rn
                -- 0011 nnnn mmmm 0100 => 01100110  DIV1 Rm, Rn
                -- 0011 nnnn mmmm 0101 => 01101001  DMULU.L Rm, Rn
                -- 0011 nnnn mmmm 0110 => 01011111  CMP /HI Rm, Rn
                -- 0011 nnnn mmmm 0111 => 01100000  CMP /GT Rm, Rn
                -- 0011 nnnn mmmm 1000 => 01110110  SUB Rm, Rn
                -- 0011 nnnn mmmm 1010 => 01110111  SUBC Rm, Rn
                -- 0011 nnnn mmmm 1011 => 01111000  SUBV Rm, Rn
                -- 0011 nnnn mmmm 1100 => 01011000  ADD Rm, Rn
                -- 0011 nnnn mmmm 1101 => 01101000  DMULS.L Rm, Rn
                -- 0011 nnnn mmmm 1110 => 01011001  ADDC Rm, Rn
                -- 0011 nnnn mmmm 1111 => 01011010  ADDV Rm, Rn
                addr(0) := ((code(1) and not code(0)) or (not code(3) and code(2) and not code(1) and code(0)));
                addr(1) := ((code(3) and code(2) and code(1) and code(0)) or (not code(3) and not code(2) and code(1) and code(0)) or (not code(3) and code(2) and not code(0)) or (code(3) and not code(2) and not code(0)));
                addr(2) := not ((code(3) and code(2)) or (code(2) and code(0)) or (code(3) and code(1) and code(0)));
                addr(3) := not ((not code(3) and code(2) and code(1) and code(0)) or (not code(3) and code(2) and not code(1) and not code(0)) or (code(3) and not code(2) and not code(0)));
                addr(4) := not ((not code(3) and code(2) and code(0)) or (not code(3) and code(2) and not code(1)) or (code(2) and not code(1) and code(0)));
                addr(5) := not ((code(3) and code(2) and not code(0)) or (code(3) and code(2) and code(1)) or (not code(3) and not code(2) and not code(0)) or (not code(3) and not code(2) and code(1)) or (not code(3) and code(1) and not code(0)));
                addr(6) := '1';
                addr(7) := '0';

            when x"4" =>
                -- 0100 mmmm 0000 0110 => 01001100  LDS.L @Rm+, MACH
                -- 0100 mmmm 0000 0111 => 01000011  LDC.L @Rm+, SR
                -- 0100 mmmm 0000 1010 => 00111100  LDS Rm, MACH
                -- 0100 mmmm 0000 1011 => 01000001  JSR @Rm
                -- 0100 mmmm 0000 1110 => 00111001  LDC Rm, SR
                -- 0100 mmmm 0001 0110 => 01001101  LDS.L @Rm+, MACL
                -- 0100 mmmm 0001 0111 => 01000110  LDC.L @Rm+, GBR
                -- 0100 mmmm 0001 1010 => 00111101  LDS Rm, MACL
                -- 0100 mmmm 0001 1110 => 00111010  LDC, Rm, GBR
                -- 0100 mmmm 0010 0110 => 01001110  LDS.L @Rm+, PR
                -- 0100 mmmm 0010 0111 => 01001001  LDC.L @Rm+, VBR
                -- 0100 mmmm 0010 1010 => 00111110  LDS Rm, PR
                -- 0100 mmmm 0010 1011 => 00111111  JMP @Rm
                -- 0100 mmmm 0010 1110 => 00111011  LDC Rm, VBR
                -- 0100 mmmm 0101 1010 => 01010010  LDS Rm, CPI_COM
                -- 0100 mmmm 1000 1000 => 01010000  LDS Rm, CP0_COM
                -- 0100 mmmm 1000 1001 => 01010001  CLDS CP0_Rm, CP0_COM
                -- 0100 nnnn 0000 0000 => 00011010  SHLL Rn
                -- 0100 nnnn 0000 0001 => 00011011  SHLR Rn
                -- 0100 nnnn 0000 0010 => 00110010  STS.L MACH, @-Rn
                -- 0100 nnnn 0000 0011 => 00101100  STC.L SR, @-Rn
                -- 0100 nnnn 0000 0100 => 00010100  ROTL Rn
                -- 0100 nnnn 0000 0101 => 00010101  ROTR Rn
                -- 0100 nnnn 0000 1000 => 00011100  SHLL2 Rn
                -- 0100 nnnn 0000 1001 => 00011101  SHLR2 Rn
                -- 0100 nnnn 0001 0000 => 00010010  DT Rn
                -- 0100 nnnn 0001 0001 => 00010001  CMP/PZ Rn
                -- 0100 nnnn 0001 0010 => 00110011  STS.L MACL, @-Rn
                -- 0100 nnnn 0001 0011 => 00101110  STC.L GBR, @-Rn
                -- 0100 nnnn 0001 0101 => 00010000  CMP/PL Rn
                -- 0100 nnnn 0001 1000 => 00011110  SHLL8 Rn
                -- 0100 nnnn 0001 1001 => 00011111  SHLR8 Rn
                -- 0100 nnnn 0001 1011 => 00101000  TAS.B @Rn
                -- 0100 nnnn 0010 0000 => 00011000  SHAL Rn
                -- 0100 nnnn 0010 0001 => 00011001  SHAR Rn
                -- 0100 nnnn 0010 0010 => 00110100  STS.L PR, @-Rn
                -- 0100 nnnn 0010 0011 => 00110000  STC.L VBR, @-Rn
                -- 0100 nnnn 0010 0100 => 00010110  ROTCL Rn
                -- 0100 nnnn 0010 0101 => 00010111  ROTCR Rn
                -- 0100 nnnn 0010 1000 => 00100000  SHLL16 Rn
                -- 0100 nnnn 0010 1001 => 00100001  SHLR16 Rn
                -- 0100 nnnn 1100 1000 => 00110101  STS CP0_COM, Rn
                -- 0100 nnnn 1100 1001 => 00110110  CSTS CP0_COM, CP0_Rn
                -- 0100 nnnn mmmm 1100 => 01111110  SHAD Rm, Rn
                -- 0100 nnnn mmmm 1101 => 01111111  SHLD Rm, Rn
                -- 0100 nnnn mmmm 1111 => 10001001  MAC.W @Rm+, @Rn+
                addr(0) := ((not code(7) and not code(6) and not code(5) and not code(2) and not code(1) and code(0)) or (code(7) and code(6) and not code(5) and not code(4) and code(3) and not code(2) and not code(1) and not code(0)) or (not code(7) and not code(6) and not code(4) and code(3) and code(2) and code(1) and not code(0)) or (not code(7) and not code(6) and not code(5) and code(4) and not code(2) and code(1) and not code(0)) or (not code(7) and not code(6) and not code(4) and code(3) and not code(2) and code(0)) or (not code(7) and not code(6) and not code(4) and not code(3) and code(2) and code(0)) or (not code(7) and not code(6) and not code(5) and code(4) and not code(3) and code(1) and not code(0)) or (not code(6) and not code(5) and not code(4) and code(3) and not code(2) and not code(1) and code(0)) or (code(3) and code(2) and code(0)) or (not code(7) and not code(6) and not code(4) and not code(3) and not code(1) and code(0)));
                addr(1) := not ((not code(7) and not code(6) and not code(5) and code(4) and not code(3) and not code(1) and code(0)) or (not code(7) and not code(6) and not code(5) and code(3) and not code(2) and code(1)) or (not code(7) and not code(6) and code(5) and not code(4) and not code(3) and not code(2)) or (code(7) and not code(5) and not code(4) and code(3) and not code(2) and not code(1) and not code(0)) or (not code(7) and not code(6) and code(5) and not code(4) and not code(3) and code(1) and code(0)) or (not code(7) and not code(6) and not code(5) and not code(3) and code(2) and code(1) and not code(0)) or (not code(6) and not code(5) and not code(4) and code(3) and not code(2) and not code(1)) or (code(3) and code(2) and code(1) and code(0)) or (not code(7) and not code(6) and not code(5) and not code(4) and not code(3) and code(2) and not code(1)) or (not code(7) and not code(6) and code(5) and not code(4) and not code(2) and not code(1)) or (not code(7) and not code(6) and not code(4) and not code(3) and not code(2) and code(1) and code(0)) or (not code(7) and not code(6) and not code(5) and not code(4) and code(3) and code(1) and not code(0)));
                addr(2) := ((not code(7) and not code(6) and not code(4) and not code(3) and code(2) and not code(1)) or (not code(7) and not code(6) and not code(5) and code(3) and not code(2) and not code(1)) or (not code(7) and not code(6) and not code(5) and not code(3) and not code(2) and code(1) and code(0)) or (code(7) and code(6) and not code(5) and not code(4) and code(3) and not code(2) and not code(1)) or (not code(7) and not code(6) and not code(5) and code(3) and not code(2) and not code(0)) or (not code(7) and not code(6) and code(5) and not code(4) and code(3) and not code(2) and code(1)) or (code(3) and code(2) and not code(1)) or (not code(7) and not code(6) and code(5) and not code(4) and not code(3) and code(1) and not code(0)) or (not code(7) and not code(6) and not code(5) and not code(3) and code(2) and code(1) and not code(0)) or (not code(7) and not code(6) and not code(5) and code(4) and not code(3) and code(1) and code(0)));
                addr(3) := not ((not code(7) and not code(6) and not code(4) and not code(3) and code(2) and not code(1)) or (not code(7) and not code(6) and code(5) and not code(4) and code(3) and not code(2) and not code(1)) or (not code(7) and not code(6) and code(5) and not code(4) and not code(3) and not code(2) and code(1)) or (code(7) and not code(5) and not code(4) and code(3) and not code(2) and not code(1)) or (not code(7) and not code(6) and not code(5) and not code(4) and code(3) and not code(2) and code(1) and code(0)) or (not code(7) and not code(6) and not code(5) and not code(3) and code(2) and code(0)) or (not code(7) and code(6) and not code(5) and code(4) and code(3) and not code(2) and code(1) and not code(0)) or (not code(7) and not code(6) and not code(5) and code(4) and not code(3) and not code(2) and not code(1)) or (not code(7) and not code(6) and not code(5) and not code(3) and not code(2) and code(1) and not code(0)));
                addr(4) := not ((not code(7) and not code(6) and code(5) and not code(4) and code(3) and not code(2) and not code(1)) or (not code(7) and not code(6) and not code(5) and not code(2) and code(1) and code(0)) or (not code(7) and not code(6) and not code(4) and not code(3) and code(2) and code(1)) or (not code(7) and not code(6) and not code(5) and not code(3) and code(2) and code(1)) or (code(3) and code(2) and code(1) and code(0)));
                addr(5) := ((not code(7) and not code(6) and code(5) and not code(4) and code(3) and not code(2)) or (not code(7) and not code(6) and not code(5) and code(4) and not code(2) and code(1)) or (code(7) and code(6) and not code(5) and not code(4) and code(3) and not code(2) and not code(1)) or (not code(7) and not code(6) and not code(5) and code(3) and code(1) and not code(0)) or (not code(7) and not code(6) and not code(4) and code(3) and code(1) and not code(0)) or (code(3) and code(2) and not code(1)) or (not code(7) and not code(6) and not code(4) and not code(3) and not code(2) and code(1)));
                addr(6) := ((not code(7) and not code(6) and not code(5) and not code(4) and code(3) and not code(2) and code(1) and code(0)) or (not code(7) and not code(6) and not code(5) and not code(3) and code(2) and code(1)) or (not code(7) and not code(6) and not code(4) and not code(3) and code(2) and code(1)) or (code(7) and not code(6) and not code(5) and not code(4) and code(3) and not code(2) and not code(1)) or (not code(7) and code(6) and not code(5) and code(4) and code(3) and not code(2) and code(1) and not code(0)) or (code(3) and code(2) and not code(1)));
                addr(7) := ((code(3) and code(2) and code(1) and code(0)));

            when x"5" =>
                -- 0101 nnnn mmmm dddd => 10011111  MOV.L @(disp, Rm), Rn
                addr := x"9f";

            when x"6" =>
                -- 0110 nnnn mmmm 0000 => 10000011  MOV.B @Rm, Rn
                -- 0110 nnnn mmmm 0001 => 10000100  MOV.W @Rm, Rn
                -- 0110 nnnn mmmm 0010 => 10000101  MOV.L @Rm, Rn
                -- 0110 nnnn mmmm 0011 => 01101110  MOV Rm, Rn
                -- 0110 nnnn mmmm 0100 => 10001011  MOV.B @Rm+, Rn
                -- 0110 nnnn mmmm 0101 => 10001101  MOV.W @Rm+, Rn
                -- 0110 nnnn mmmm 0110 => 10001111  MOV.L @Rm+, Rn
                -- 0110 nnnn mmmm 0111 => 01110100  NOT Rm, Rn
                -- 0110 nnnn mmmm 1000 => 01111001  SWAP.B Rm, Rn
                -- 0110 nnnn mmmm 1001 => 01111010  SWAP.W Rm, Rn
                -- 0110 nnnn mmmm 1010 => 01110011  NEGC Rm, Rn
                -- 0110 nnnn mmmm 1011 => 01110010  NEG Rm, Rn
                -- 0110 nnnn mmmm 1100 => 01101100  EXTU.B Rm, Rn
                -- 0110 nnnn mmmm 1101 => 01101101  EXTU.W Rm, Rn
                -- 0110 nnnn mmmm 1110 => 01101010  EXTS.B Rm, Rn
                -- 0110 nnnn mmmm 1111 => 01101011  EXTS.W Rm, Rn
                addr(0) := not ((code(3) and code(2) and not code(0)) or (not code(2) and code(0)) or (not code(3) and code(1) and code(0)));
                addr(1) := not ((not code(3) and code(2) and code(0)) or (code(3) and not code(1) and not code(0)) or (not code(3) and not code(1) and code(0)) or (not code(3) and not code(2) and code(1) and not code(0)) or (code(3) and code(2) and not code(1)));
                addr(2) := not ((code(3) and code(1)) or (code(3) and not code(2)) or (not code(3) and not code(1) and not code(0)));
                addr(3) := not ((code(3) and not code(2) and code(1)) or (not code(3) and code(2) and code(1) and code(0)) or (not code(3) and not code(2) and not code(1)) or (not code(3) and not code(2) and not code(0)));
                addr(4) := ((code(3) and not code(2)) or (not code(3) and code(2) and code(1) and code(0)));
                addr(5) := not ((not code(3) and not code(1)) or (not code(3) and not code(0)));
                addr(6) := not ((not code(3) and not code(1)) or (not code(3) and not code(0)));
                addr(7) := not (code(3) or (code(1) and code(0)));

            when x"7" =>
                -- 0111 nnnn iiii iiii => 11001111  ADD #imm, Rn
                addr := x"cf";

            when x"8" =>
                -- 1000 0000 nnnn dddd => 10011100  MOV.B R0, @(disp, Rn)
                -- 1000 0001 nnnn dddd => 10011101  MOV.W R0, @(disp, Rn)
                -- 1000 0100 mmmm dddd => 10011010  MOV.B @(disp, Rm), R0
                -- 1000 0101 mmmm dddd => 10011011  MOV.W @(disp, Rm), R0
                -- 1000 1000 iiii iiii => 11000100  CMP /EQ #imm, R0
                -- 1000 1001 dddd dddd => 10101100  BT label
                -- 1000 1011 dddd dddd => 10100111  BF label
                -- 1000 1101 dddd dddd => 10101111  BT /S label
                -- 1000 1111 dddd dddd => 10101010  BF /S label
                addr(0) := not ((not code(11) and not code(9) and not code(8)) or (code(11) and code(10) and code(9) and code(8)) or (code(11) and not code(10) and not code(9)));
                addr(1) := not ((not code(10) and not code(9)));
                addr(2) := not ((not code(11) and code(10) and not code(9)) or (code(11) and code(10) and code(9) and code(8)));
                addr(3) := not ((code(11) and not code(10) and code(9) and code(8)) or (code(11) and not code(10) and not code(9) and not code(8)));
                addr(4) := ((not code(11) and not code(9)));
                addr(5) := ((code(11) and code(8)));
                addr(6) := ((code(11) and not code(10) and not code(9) and not code(8)));
                addr(7) := '1';

            when x"9" =>
                -- 1001 nnnn dddd dddd => 10110101  MOV.W @(disp, PC), Rn
                addr := x"b5";

            when x"a" =>
                -- 1010 dddd dddd dddd => 10110001  BRA label
                addr := x"b1";

            when x"b" =>
                -- 1011 dddd dddd dddd => 10110011  BSR label
                addr := x"b3";

            when x"c" =>
                -- 1100 0000 dddd dddd => 10100000  MOV.B R0, @(disp, GBR)
                -- 1100 0001 dddd dddd => 10100001  MOV.W R0, @(disp, GBR)
                -- 1100 0010 dddd dddd => 10100010  MOV.L R0, @(disp, GBR)
                -- 1100 0011 iiii iiii => 11001000  TRAPA #imm
                -- 1100 0100 dddd dddd => 10100011  MOV.B @(disp, GBR), R0
                -- 1100 0101 dddd dddd => 10100100  MOV.W @(disp, GBR), R0
                -- 1100 0110 dddd dddd => 10100101  MOV.L @(disp, GBR), R0
                -- 1100 0111 dddd dddd => 10100110  MOVA @(disp, PC), R0
                -- 1100 1000 iiii iiii => 11000110  TST #imm, R0
                -- 1100 1001 iiii iiii => 11000011  AND #imm, R0
                -- 1100 1010 iiii iiii => 11000111  XOR #imm, R0
                -- 1100 1011 iiii iiii => 11000101  OR #imm, R0
                -- 1100 1100 iiii iiii => 10111101  TST.B #imm, @(R0, GBR)
                -- 1100 1101 iiii iiii => 10110111  AND.B #imm, @(R0, GBR)
                -- 1100 1110 iiii iiii => 11000000  XOR.B #imm, @(R0, GBR)
                -- 1100 1111 iiii iiii => 10111010  OR.B #imm, @(R0, GBR)
                addr(0) := not ((not code(11) and code(10) and code(8)) or (code(11) and code(10) and code(9)) or (not code(10) and not code(9) and not code(8)) or (not code(11) and not code(10) and code(9)));
                addr(1) := not ((not code(11) and not code(10) and not code(9)) or (not code(11) and not code(9) and code(8)) or (code(10) and code(9) and not code(8)) or (code(11) and code(10) and not code(8)) or (not code(10) and code(9) and code(8)));
                addr(2) := not ((not code(11) and not code(10)) or (not code(11) and not code(9) and not code(8)) or (code(11) and code(10) and code(9)) or (not code(10) and not code(9) and code(8)));
                addr(3) := ((code(11) and code(10) and code(9) and code(8)) or (code(11) and code(10) and not code(9) and not code(8)) or (not code(11) and not code(10) and code(9) and code(8)));
                addr(4) := ((code(11) and code(10) and code(8)) or (code(11) and code(10) and not code(9)));
                addr(5) := not ((code(11) and code(9) and not code(8)) or (code(11) and not code(10)) or (not code(10) and code(9) and code(8)));
                addr(6) := ((code(11) and code(9) and not code(8)) or (code(11) and not code(10)) or (not code(10) and code(9) and code(8)));
                addr(7) := '1';

            when x"d" =>
                -- 1101 nnnn dddd dddd => 10110110  MOV.L @(disp, PC), Rn
                addr := x"b6";

            when x"e" =>
                -- 1110 nnnn iiii iiii => 11010000  MOV #imm, Rn
                addr := x"d0";

            when x"f" =>
                -- 1111 mmmm 0001 1101 => 01010011  CLDS CPI_Rm, CPI_COM
                -- 1111 nnnn 0000 1101 => 00111000  CSTS CPI_COM, CPI_Rn
                addr(0) := not ((not code(7) and not code(6) and not code(5) and not code(4) and code(3) and code(2) and not code(1) and code(0)));
                addr(1) := not ((not code(7) and not code(6) and not code(5) and not code(4) and code(3) and code(2) and not code(1) and code(0)));
                addr(2) := '0';
                addr(3) := not ((not code(7) and not code(6) and not code(5) and code(4) and code(3) and code(2) and not code(1) and code(0)));
                addr(4) := '1';
                addr(5) := not ((not code(7) and not code(6) and not code(5) and code(4) and code(3) and code(2) and not code(1) and code(0)));
                addr(6) := not ((not code(7) and not code(6) and not code(5) and not code(4) and code(3) and code(2) and not code(1) and code(0)));
                addr(7) := '0';

            when others =>
                addr := x"ff";

        end case;
        return addr;
    end;
    function check_illegal_delay_slot (code : std_logic_vector(15 downto 0)) return std_logic is
    begin
        -- Check for instructions that assign to PC:
        -- RTE, RTS, JMP @Rm, JSR @Rm, BRAF Rm, BSRF Rm, BF label, BF /S label, BT label, BT /S label, BRA label, BSR label, TRAPA #imm
        if ((code(15 downto 12) = "0000" and code(3 downto 2) = "00" and code(0) = '1') or (code(15 downto 14) = "10" and code(12 downto 11) = "01" and code(8) = '1') or code(15 downto 13) = "101" or (code(15) = '1' and code(13 downto 8) = "000011") or (code(15) = '0' and code(13 downto 12) = "00" and code(4 downto 0) = "01011")) then
            return '1';
        else
            return '0';
        end if;
    end;
    function check_illegal_instruction (code : std_logic_vector(15 downto 0)) return std_logic is
    begin
        -- TODO: Improve detection of illegal instructions
        if code(15 downto 8) = x"ff" then
            return '1';
        else
            return '0';
        end if;
    end;
end;
