----------------------------------------------------------------------------------
-- Engineer: Mike Field <hamster@snap.net.nz<
--
-- Module Name:    adau1761_configuraiton_data - Behavioral
-- Description: A script for the I3C2, which sends out I2c transactions to configure
--              the ADAU1761 codec.
--
-- See i3c2program for original source for script
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adau1761_configuration_data is
    Port ( clk : in  STD_LOGIC;
           address : in  STD_LOGIC_VECTOR (9 downto 0);
           data : out  STD_LOGIC_VECTOR (8 downto 0));
end adau1761_configuration_data;

architecture Behavioral of adau1761_configuration_data is

    -- |Opcode   | Instruction | Action
-- +---------+-------------+----------------------------------------
-- |00nnnnnnn| JUMP m      | Set PC to m (n = m/8)
-- |01000nnnn| SKIPCLEAR n | Skip if input n clear
-- |01001nnnn| SKIPSET n   | skip if input n set
-- |01010nnnn| CLEAR n     | Clear output n
-- |01011nnnn| SET n       | Set output n
-- |0110nnnnn| READ n      | Read to register n
-- |01110nnnn| DELAY m     | Delay m clock cycles (n = log2(m))
-- |011110000| SKIPNACK    | Skip if NACK is set
-- |011110001| SKIPACK     | Skip if ACK is set
-- |011110010| WRITELOW    | Write inputs 7 downto 0 to the I2C bus
-- |011110011| WRITEHI     | Write inputs 15 downto 8 to the I2C bus
-- |011110100| USER0       | User defined
-- |.........|             |
-- |011111110| USER9       | User defined
-- |011111111| STOP        | Send Stop on i2C bus
-- |1nnnnnnnn| WRITE n     | Output n on I2C bus

-- PLL = Fin * (R +  N/  M) / (X + 1)
--     =  24 * (4 + 12/125) / 2
--     =  49.152
-- Fin in range 8-27MHz
--



begin
    process(clk)
    begin
        if rising_edge(clk) then
            case address is

-- L000

--              when "0000000000" => data <= "011101111"; -- DELAY 1111
--              when "0000000001" => data <= "101110110"; -- WRITE 01110110 76 - Clock Control
--              when "0000000010" => data <= "101000000"; -- WRITE 01000000 40
--              when "0000000011" => data <= "100000000"; -- WRITE 00000000 00
--              when "0000000100" => data <= "100001110"; -- WRITE 00001110 0E
--              when "0000000101" => data <= "011111111"; -- STOP
--              when "0000000110" => data <= "101110110"; -- WRITE 01110110 76 - PLL Control
--              when "0000000111" => data <= "101000000"; -- WRITE 01000000 40
--              when "0000001000" => data <= "100000010"; -- WRITE 00000010 02
--              when "0000001001" => data <= "100000000"; -- WRITE 00000000 00
--              when "0000001010" => data <= "101111101"; -- WRITE 01111101 7D - M=125
--              when "0000001011" => data <= "100000000"; -- WRITE 00000000 00
--              when "0000001100" => data <= "100001100"; -- WRITE 00001100 0C - N=12
--              when "0000001101" => data <= "100100011"; -- WRITE 00100011 23 - R=4 X=1 Type=1
--              when "0000001110" => data <= "100000001"; -- WRITE 00000001 01 - Enable PLL
--              when "0000001111" => data <= "011111111"; -- STOP

                when "0000000000" => data <= "011111111"; -- NOP
                when "0000000001" => data <= "011111111"; -- NOP
                when "0000000010" => data <= "011111111"; -- NOP
                when "0000000011" => data <= "011111111"; -- NOP
                when "0000000100" => data <= "011111111"; -- NOP
                when "0000000101" => data <= "011111111"; -- NOP
                when "0000000110" => data <= "011111111"; -- NOP
                when "0000000111" => data <= "011111111"; -- NOP
                when "0000001000" => data <= "011111111"; -- NOP
                when "0000001001" => data <= "011111111"; -- NOP
                when "0000001010" => data <= "011111111"; -- NOP
                when "0000001011" => data <= "011111111"; -- NOP
                when "0000001100" => data <= "011111111"; -- NOP
                when "0000001101" => data <= "011111111"; -- NOP
                when "0000001110" => data <= "011111111"; -- NOP
                when "0000001111" => data <= "011111111"; -- NOP

                when "0000010000" => data <= "011101111"; -- DELAY 1111
                when "0000010001" => data <= "101110110"; -- WRITE 01110110 76 - Clock Control
                when "0000010010" => data <= "101000000"; -- WRITE 01000000 40
                when "0000010011" => data <= "100000000"; -- WRITE 00000000 00
--              when "0000010100" => data <= "100001111"; -- WRITE 00001111 0F
                when "0000010100" => data <= "100000111"; -- WRITE 00001111 07
                when "0000010101" => data <= "011111111"; -- STOP
                when "0000010110" => data <= "011101111"; -- DELAY 1111
                when "0000010111" => data <= "101110110"; -- WRITE 01110110 76 - Serial Port 0
                when "0000011000" => data <= "101000000"; -- WRITE 01000000 40
                when "0000011001" => data <= "100010101"; -- WRITE 00010101 15
                when "0000011010" => data <= "100000001"; -- WRITE 00000001 01
                when "0000011011" => data <= "011111111"; -- STOP
                when "0000011100" => data <= "101110110"; -- WRITE 01110110 76 - Rec Mixer Left 0
                when "0000011101" => data <= "101000000"; -- WRITE 01000000 40
                when "0000011110" => data <= "100001010"; -- WRITE 00001010 0A
                when "0000011111" => data <= "100000001"; -- WRITE 00000001 01
                when "0000100000" => data <= "011111111"; -- STOP
                when "0000100001" => data <= "101110110"; -- WRITE 01110110 76 - Rec Mixer Left 1
                when "0000100010" => data <= "101000000"; -- WRITE 01000000 40
                when "0000100011" => data <= "100001011"; -- WRITE 00001011 0B
                when "0000100100" => data <= "100000101"; -- WRITE 00000101 05
                when "0000100101" => data <= "011111111"; -- STOP
                when "0000100110" => data <= "101110110"; -- WRITE 01110110 76 - Rec Mixer Right 0
                when "0000100111" => data <= "101000000"; -- WRITE 01000000 40
                when "0000101000" => data <= "100001100"; -- WRITE 00001100 0C
                when "0000101001" => data <= "100000001"; -- WRITE 00000001 01
                when "0000101010" => data <= "011111111"; -- STOP
                when "0000101011" => data <= "101110110"; -- WRITE 01110110 76 - Rec Mixer Right 1
                when "0000101100" => data <= "101000000"; -- WRITE 01000000 40
                when "0000101101" => data <= "100001101"; -- WRITE 00001101 0D
                when "0000101110" => data <= "100000101"; -- WRITE 00000101 05
                when "0000101111" => data <= "011111111"; -- STOP
                when "0000110000" => data <= "101110110"; -- WRITE 01110110 76 - Play Mixer Left 0
                when "0000110001" => data <= "101000000"; -- WRITE 01000000 40
                when "0000110010" => data <= "100011100"; -- WRITE 00011100 1C
                when "0000110011" => data <= "100100001"; -- WRITE 00100001 21
                when "0000110100" => data <= "011111111"; -- STOP
                when "0000110101" => data <= "101110110"; -- WRITE 01110110 76 - Play Mixer Right 0
                when "0000110110" => data <= "101000000"; -- WRITE 01000000 40
                when "0000110111" => data <= "100011110"; -- WRITE 00011110 1E
                when "0000111000" => data <= "101000001"; -- WRITE 01000001 41
                when "0000111001" => data <= "011111111"; -- STOP
                when "0000111010" => data <= "101110110"; -- WRITE 01110110 76 - Play HP Vol Left
                when "0000111011" => data <= "101000000"; -- WRITE 01000000 40
                when "0000111100" => data <= "100100011"; -- WRITE 00100011 23
                when "0000111101" => data <= "111100111"; -- WRITE 11100111 E7
                when "0000111110" => data <= "011111111"; -- STOP
                when "0000111111" => data <= "101110110"; -- WRITE 01110110 76 - Play HP Vol Right
                when "0001000000" => data <= "101000000"; -- WRITE 01000000 40
                when "0001000001" => data <= "100100100"; -- WRITE 00100100 24
                when "0001000010" => data <= "111100111"; -- WRITE 11100111 E7
                when "0001000011" => data <= "011111111"; -- STOP
                when "0001000100" => data <= "101110110"; -- WRITE 01110110 76 - Line Out Vol Left
                when "0001000101" => data <= "101000000"; -- WRITE 01000000 40
                when "0001000110" => data <= "100100101"; -- WRITE 00100101 25
                when "0001000111" => data <= "111100111"; -- WRITE 11100111 E7
                when "0001001000" => data <= "011111111"; -- STOP
                when "0001001001" => data <= "101110110"; -- WRITE 01110110 76 - Line Out Right Vol
                when "0001001010" => data <= "101000000"; -- WRITE 01000000 40
                when "0001001011" => data <= "100100110"; -- WRITE 00100110 26
                when "0001001100" => data <= "111100111"; -- WRITE 11100111 E7
                when "0001001101" => data <= "011111111"; -- STOP
                when "0001001110" => data <= "101110110"; -- WRITE 01110110 76 - ADC Control
                when "0001001111" => data <= "101000000"; -- WRITE 01000000 40
                when "0001010000" => data <= "100011001"; -- WRITE 00011001 19
                when "0001010001" => data <= "100000011"; -- WRITE 00000011 03
                when "0001010010" => data <= "011111111"; -- STOP
                when "0001010011" => data <= "101110110"; -- WRITE 01110110 76 - Play Power Mgmt
                when "0001010100" => data <= "101000000"; -- WRITE 01000000 40
                when "0001010101" => data <= "100101001"; -- WRITE 00101001 29
                when "0001010110" => data <= "100000011"; -- WRITE 00000011 03
                when "0001010111" => data <= "011111111"; -- STOP
                when "0001011000" => data <= "101110110"; -- WRITE 01110110 76 - DAC Control 0
                when "0001011001" => data <= "101000000"; -- WRITE 01000000 40
                when "0001011010" => data <= "100101010"; -- WRITE 00101010 2A
                when "0001011011" => data <= "100000011"; -- WRITE 00000011 03
                when "0001011100" => data <= "011111111"; -- STOP
                when "0001011101" => data <= "101110110"; -- WRITE 01110110 76 - Serial In Route
                when "0001011110" => data <= "101000000"; -- WRITE 01000000 40
                when "0001011111" => data <= "111110010"; -- WRITE 11110010 F2
                when "0001100000" => data <= "100000001"; -- WRITE 00000001 01
                when "0001100001" => data <= "011111111"; -- STOP
                when "0001100010" => data <= "101110110"; -- WRITE 01110110 76 - Serial Out Route
                when "0001100011" => data <= "101000000"; -- WRITE 01000000 40
                when "0001100100" => data <= "111110011"; -- WRITE 11110011 F3
                when "0001100101" => data <= "100000001"; -- WRITE 00000001 01
                when "0001100110" => data <= "011111111"; -- STOP
                when "0001100111" => data <= "101110110"; -- WRITE 01110110 76 - Clock Enable 0
                when "0001101000" => data <= "101000000"; -- WRITE 01000000 40
                when "0001101001" => data <= "111111001"; -- WRITE 11111001 F9
                when "0001101010" => data <= "101111111"; -- WRITE 01111111 7F
                when "0001101011" => data <= "011111111"; -- STOP
                when "0001101100" => data <= "101110110"; -- WRITE 01110110 76 - Clock Enable 1
                when "0001101101" => data <= "101000000"; -- WRITE 01000000 40
                when "0001101110" => data <= "111111010"; -- WRITE 11111010 FA
                when "0001101111" => data <= "100000011"; -- WRITE 00000011 03
                when "0001110000" => data <= "011111111"; -- STOP
                when "0001110001" => data <= "000010011"; -- JUMP 0010011000 L098
                when "0001110010" => data <= "011111110"; -- NOP
                when "0001110011" => data <= "011111110"; -- NOP
                when "0001110100" => data <= "011111110"; -- NOP
                when "0001110101" => data <= "011111110"; -- NOP
                when "0001110110" => data <= "011111110"; -- NOP
                when "0001110111" => data <= "011111110"; -- NOP
-- L078
                when "0001111000" => data <= "101110110"; -- WRITE 01110110 76 - Play Mixer Left 0
                when "0001111001" => data <= "101000000"; -- WRITE 01000000 40
                when "0001111010" => data <= "100011100"; -- WRITE 00011100 1C
                when "0001111011" => data <= "100100000"; -- WRITE 00100000 20
                when "0001111100" => data <= "011111111"; -- STOP
                when "0001111101" => data <= "101110110"; -- WRITE 01110110 76 - Play Mixer Right 0
                when "0001111110" => data <= "101000000"; -- WRITE 01000000 40
                when "0001111111" => data <= "100011110"; -- WRITE 00011110 1E
                when "0010000000" => data <= "101000000"; -- WRITE 01000000 40
                when "0010000001" => data <= "011111111"; -- STOP
                when "0010000010" => data <= "011101111"; -- DELAY 1111
                when "0010000011" => data <= "011101111"; -- DELAY 1111
                when "0010000100" => data <= "011101111"; -- DELAY 1111
                when "0010000101" => data <= "011101111"; -- DELAY 1111
                when "0010000110" => data <= "010100000"; -- CLEAR 0           - Set output to 00
                when "0010000111" => data <= "010100001"; -- CLEAR 1
                when "0010001000" => data <= "011101111"; -- DELAY 1111
                when "0010001001" => data <= "011101111"; -- DELAY 1111
                when "0010001010" => data <= "101110110"; -- WRITE 01110110 76 - Play Mixer Left 0
                when "0010001011" => data <= "101000000"; -- WRITE 01000000 40
                when "0010001100" => data <= "100011100"; -- WRITE 00011100 1C
                when "0010001101" => data <= "100100001"; -- WRITE 00100001 21
                when "0010001110" => data <= "011111111"; -- STOP
                when "0010001111" => data <= "101110110"; -- WRITE 01110110 76 - Play Mixer Right 0
                when "0010010000" => data <= "101000000"; -- WRITE 01000000 40
                when "0010010001" => data <= "100011110"; -- WRITE 00011110 1E
                when "0010010010" => data <= "101000001"; -- WRITE 01000001 41
                when "0010010011" => data <= "011111111"; -- STOP
                when "0010010100" => data <= "011111110"; -- NOP
                when "0010010101" => data <= "011111110"; -- NOP
                when "0010010110" => data <= "011111110"; -- NOP
                when "0010010111" => data <= "011111110"; -- NOP
-- L098
                when "0010011000" => data <= "010000000"; -- SKIPCLEAR 0
                when "0010011001" => data <= "000010100"; -- JUMP 0010100000 L0A0
                when "0010011010" => data <= "010000001"; -- SKIPCLEAR 1
                when "0010011011" => data <= "000011001"; -- JUMP 0011001000 L0C8
                when "0010011100" => data <= "000010011"; -- JUMP 0010011000 L098 -- Loop while sw=00
                when "0010011101" => data <= "011111110"; -- NOP
                when "0010011110" => data <= "011111110"; -- NOP
                when "0010011111" => data <= "011111110"; -- NOP
-- L0A0
                when "0010100000" => data <= "101110110"; -- WRITE 01110110 76 - Play Mixer Left 0
                when "0010100001" => data <= "101000000"; -- WRITE 01000000 40
                when "0010100010" => data <= "100011100"; -- WRITE 00011100 1C
                when "0010100011" => data <= "100100000"; -- WRITE 00100000 20
                when "0010100100" => data <= "011111111"; -- STOP
                when "0010100101" => data <= "101110110"; -- WRITE 01110110 76 - Play Mixer Right 0
                when "0010100110" => data <= "101000000"; -- WRITE 01000000 40
                when "0010100111" => data <= "100011110"; -- WRITE 00011110 1E
                when "0010101000" => data <= "101000000"; -- WRITE 01000000 40
                when "0010101001" => data <= "011111111"; -- STOP
                when "0010101010" => data <= "011101111"; -- DELAY 1111
                when "0010101011" => data <= "011101111"; -- DELAY 1111
                when "0010101100" => data <= "011101111"; -- DELAY 1111
                when "0010101101" => data <= "011101111"; -- DELAY 1111
                when "0010101110" => data <= "010110000"; -- SET 0
                when "0010101111" => data <= "010100001"; -- CLEAR 1           - Set output to 01
                when "0010110000" => data <= "011101111"; -- DELAY 1111
                when "0010110001" => data <= "011101111"; -- DELAY 1111
                when "0010110010" => data <= "101110110"; -- WRITE 01110110 76 - Play Mixer Left 0
                when "0010110011" => data <= "101000000"; -- WRITE 01000000 40
                when "0010110100" => data <= "100011100"; -- WRITE 00011100 1C
                when "0010110101" => data <= "100100001"; -- WRITE 00100001 21
                when "0010110110" => data <= "011111111"; -- STOP
                when "0010110111" => data <= "101110110"; -- WRITE 01110110 76 - Play Mixer Right 0
                when "0010111000" => data <= "101000000"; -- WRITE 01000000 40
                when "0010111001" => data <= "100011110"; -- WRITE 00011110 1E
                when "0010111010" => data <= "101000001"; -- WRITE 01000001 41
                when "0010111011" => data <= "011111111"; -- STOP
                when "0010111100" => data <= "011111110"; -- NOP
                when "0010111101" => data <= "011111110"; -- NOP
                when "0010111110" => data <= "011111110"; -- NOP
                when "0010111111" => data <= "011111110"; -- NOP
-- L0C0
                when "0011000000" => data <= "010010000"; -- SKIPSET 0
                when "0011000001" => data <= "000001111"; -- JUMP 0001111000 L078
                when "0011000010" => data <= "010000001"; -- SKIPCLEAR 1
                when "0011000011" => data <= "000011110"; -- JUMP 0011110000 L0F0
                when "0011000100" => data <= "000011000"; -- JUMP 0011000000 L0C0 -- Loop while sw=01
                when "0011000101" => data <= "011111110"; -- NOP
                when "0011000110" => data <= "011111110"; -- NOP
                when "0011000111" => data <= "011111110"; -- NOP
-- L0C8
                when "0011001000" => data <= "101110110"; -- WRITE 01110110 76 - Play Mixer Left 0
                when "0011001001" => data <= "101000000"; -- WRITE 01000000 40
                when "0011001010" => data <= "100011100"; -- WRITE 00011100 1C
                when "0011001011" => data <= "100100000"; -- WRITE 00100000 20
                when "0011001100" => data <= "011111111"; -- STOP
                when "0011001101" => data <= "101110110"; -- WRITE 01110110 76 - Play Mixer Right 0
                when "0011001110" => data <= "101000000"; -- WRITE 01000000 40
                when "0011001111" => data <= "100011110"; -- WRITE 00011110 1E
                when "0011010000" => data <= "101000000"; -- WRITE 01000000 40
                when "0011010001" => data <= "011111111"; -- STOP
                when "0011010010" => data <= "011101111"; -- DELAY 1111
                when "0011010011" => data <= "011101111"; -- DELAY 1111
                when "0011010100" => data <= "011101111"; -- DELAY 1111
                when "0011010101" => data <= "011101111"; -- DELAY 1111
                when "0011010110" => data <= "010100000"; -- CLEAR 0
                when "0011010111" => data <= "010110001"; -- SET 1             - Set output to 10
                when "0011011000" => data <= "011101111"; -- DELAY 1111
                when "0011011001" => data <= "011101111"; -- DELAY 1111
                when "0011011010" => data <= "101110110"; -- WRITE 01110110 76 - Play Mixer Left 0
                when "0011011011" => data <= "101000000"; -- WRITE 01000000 40
                when "0011011100" => data <= "100011100"; -- WRITE 00011100 1C
                when "0011011101" => data <= "100100001"; -- WRITE 00100001 21
                when "0011011110" => data <= "011111111"; -- STOP
                when "0011011111" => data <= "101110110"; -- WRITE 01110110 76 - Play Mixer Right 0
                when "0011100000" => data <= "101000000"; -- WRITE 01000000 40
                when "0011100001" => data <= "100011110"; -- WRITE 00011110 1E
                when "0011100010" => data <= "101000001"; -- WRITE 01000001 41
                when "0011100011" => data <= "011111111"; -- STOP
                when "0011100100" => data <= "011111110"; -- NOP
                when "0011100101" => data <= "011111110"; -- NOP
                when "0011100110" => data <= "011111110"; -- NOP
                when "0011100111" => data <= "011111110"; -- NOP
-- L0E8
                when "0011101000" => data <= "010000000"; -- SKIPCLEAR 0
                when "0011101001" => data <= "000000000"; -- JUMP 0000000000 L000
                when "0011101010" => data <= "010010001"; -- SKIPSET 1
                when "0011101011" => data <= "000001111"; -- JUMP 0001111000 L078
                when "0011101100" => data <= "000011101"; -- JUMP 0011101000 L0E8 -- Loop while sw=10
                when "0011101101" => data <= "011111110"; -- NOP
                when "0011101110" => data <= "011111110"; -- NOP
                when "0011101111" => data <= "011111110"; -- NOP
-- L0F0
                when "0011110000" => data <= "101110110"; -- WRITE 01110110 76 - Play Mixer Left 0
                when "0011110001" => data <= "101000000"; -- WRITE 01000000 40
                when "0011110010" => data <= "100011100"; -- WRITE 00011100 1C
                when "0011110011" => data <= "100100000"; -- WRITE 00100000 20
                when "0011110100" => data <= "011111111"; -- STOP
                when "0011110101" => data <= "101110110"; -- WRITE 01110110 76 - Play Mixer Right 0
                when "0011110110" => data <= "101000000"; -- WRITE 01000000 40
                when "0011110111" => data <= "100011110"; -- WRITE 00011110 1E
                when "0011111000" => data <= "101000000"; -- WRITE 01000000 40
                when "0011111001" => data <= "011111111"; -- STOP
                when "0011111010" => data <= "011101111"; -- DELAY 1111
                when "0011111011" => data <= "011101111"; -- DELAY 1111
                when "0011111100" => data <= "011101111"; -- DELAY 1111
                when "0011111101" => data <= "011101111"; -- DELAY 1111
                when "0011111110" => data <= "010110000"; -- SET 0
                when "0011111111" => data <= "010110001"; -- SET 1             - Set output to 11
                when "0100000000" => data <= "011101111"; -- DELAY 1111
                when "0100000001" => data <= "011101111"; -- DELAY 1111
                when "0100000010" => data <= "101110110"; -- WRITE 01110110 76 - Play Mixer Left 0
                when "0100000011" => data <= "101000000"; -- WRITE 01000000 40
                when "0100000100" => data <= "100011100"; -- WRITE 00011100 1C
                when "0100000101" => data <= "100100001"; -- WRITE 00100001 21
                when "0100000110" => data <= "011111111"; -- STOP
                when "0100000111" => data <= "101110110"; -- WRITE 01110110 76 - Play Mixer Right 0
                when "0100001000" => data <= "101000000"; -- WRITE 01000000 40
                when "0100001001" => data <= "100011110"; -- WRITE 00011110 1E
                when "0100001010" => data <= "101000001"; -- WRITE 01000001 41
                when "0100001011" => data <= "011111111"; -- STOP
                when "0100001100" => data <= "011111110"; -- NOP
                when "0100001101" => data <= "011111110"; -- NOP
                when "0100001110" => data <= "011111110"; -- NOP
                when "0100001111" => data <= "011111110"; -- NOP
-- L110
                when "0100010000" => data <= "010010000"; -- SKIPSET 0
                when "0100010001" => data <= "000011001"; -- JUMP 0011001000 L0C8
                when "0100010010" => data <= "010010001"; -- SKIPSET 1
                when "0100010011" => data <= "000010100"; -- JUMP 0010100000 L0A0
                when "0100010100" => data <= "000100010"; -- JUMP 0100010000 L110 -- Loop while sw=11
                when others => data <= (others =>'0');
            end case;
        end if;
    end process;
end Behavioral;
