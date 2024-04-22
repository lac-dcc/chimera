-------------------------------------------------------------------------------
--
-- Title       : rx_crc64
-- Design      : FRM120801U1R1
-- Author      : Gavin Teague
-- Company     : Peralex
--
-------------------------------------------------------------------------------
--
-- File        : rx_crc64.vhd
-- Generated   : Mon Dec 19 09:31:25 2005
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
-------------------------------------------------------------------------------
--
-- Description :
--
-- This component replaces the CRC64 hard macro because it is not supported in the
-- Virtex6. The rx variant is an exact replica of the CRC64 hard macro.
--
-- CAUSES TIMING PROBLEMS AND CONSUMES 300+ SLICES. ONLY INCLUDE IF NECESSARY.
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {rx_crc64} architecture {arch_rx_crc64}}

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.PCK_CRC32_D8.all;
use work.PCK_CRC32_D16.all;
use work.PCK_CRC32_D24.all;
use work.PCK_CRC32_D32.all;
use work.PCK_CRC32_D40.all;
use work.PCK_CRC32_D48.all;
use work.PCK_CRC32_D56.all;
use work.PCK_CRC32_D64.all;

entity rx_crc64 is
    port (
        CRC_INIT        : in std_logic_vector(31 downto 0);
        CRCOUT          : out std_logic_vector(31 downto 0);
        CRCCLK          : in std_logic;
        CRCDATAVALID    : in std_logic;
        CRC_DATAWIDTH   : in std_logic_vector(2 downto 0);
        CRCIN           : in std_logic_vector(63 downto 0);
        CRCRESET        : in std_logic);
end rx_crc64;

--}} End of automatically maintained section

architecture arch_rx_crc64 of rx_crc64 is
   
    signal CRCIN_bit_swapped : std_logic_vector(63 downto 0);   
    signal CRCOUT_int8 : std_logic_vector(31 downto 0);
    signal CRCOUT_int16 : std_logic_vector(31 downto 0);
    signal CRCOUT_int24 : std_logic_vector(31 downto 0);
    signal CRCOUT_int32 : std_logic_vector(31 downto 0);
    signal CRCOUT_int40 : std_logic_vector(31 downto 0);
    signal CRCOUT_int48 : std_logic_vector(31 downto 0);
    signal CRCOUT_int56 : std_logic_vector(31 downto 0);
    signal CRCOUT_int64 : std_logic_vector(31 downto 0);
    signal CRCOUT_int : std_logic_vector(31 downto 0);
    signal CRC_DATAWIDTH_z : std_logic_vector(2 downto 0);
    signal CRCRESET_z : std_logic;
    signal CRCDATAVALID_z : std_logic;
        
begin						  

    -- DO BIT SWAP TO HANDLE DIFFERENCE BETWEEN CRC64 AND EASICS CRC
--    bit_swap: for a in 0 to 7 generate
--        CRCIN_bit_swapped(a) <= CRCIN(7 - a);
--        CRCIN_bit_swapped(8 + a) <= CRCIN(15 - a);
--        CRCIN_bit_swapped(16 + a) <= CRCIN(23 - a);
--        CRCIN_bit_swapped(24 + a) <= CRCIN(31 - a);
--        CRCIN_bit_swapped(32 + a) <= CRCIN(39 - a);
--        CRCIN_bit_swapped(40 + a) <= CRCIN(47 - a);
--        CRCIN_bit_swapped(48 + a) <= CRCIN(55 - a);
--        CRCIN_bit_swapped(56 + a) <= CRCIN(63 - a);
--    end generate bit_swap;

    gen_CRCIN_bit_swapped : process(CRCCLK)
    begin
        if (rising_edge(CRCCLK))then
            for a in 0 to 7 loop
                CRCIN_bit_swapped(a) <= CRCIN(7 - a);
                CRCIN_bit_swapped(8 + a) <= CRCIN(15 - a);
                CRCIN_bit_swapped(16 + a) <= CRCIN(23 - a);
                CRCIN_bit_swapped(24 + a) <= CRCIN(31 - a);
                CRCIN_bit_swapped(32 + a) <= CRCIN(39 - a);
                CRCIN_bit_swapped(40 + a) <= CRCIN(47 - a);
                CRCIN_bit_swapped(48 + a) <= CRCIN(55 - a);
                CRCIN_bit_swapped(56 + a) <= CRCIN(63 - a);
            end loop;
        end if;
    end process;

    -- CALCULATE CRC
--    gen_CRCOUT_int8 : process(CRCCLK)
--    begin
--        if (rising_edge(CRCCLK))then
--            if (CRCDATAVALID = '1')then
--                if (CRCRESET = '1')then
--                    CRCOUT_int8 <= nextCRC32_D8(CRCIN_bit_swapped(63 downto 56), CRC_INIT);
--                else
--                    CRCOUT_int8 <= nextCRC32_D8(CRCIN_bit_swapped(63 downto 56), CRCOUT_int);
--                end if;
--            end if;
--        end if;
--    end process;

      CRCOUT_int8 <= nextCRC32_D8(CRCIN_bit_swapped(63 downto 56), CRC_INIT) when (CRCRESET_z = '1') else
        nextCRC32_D8(CRCIN_bit_swapped(63 downto 56), CRCOUT_int);

--    gen_CRCOUT_int16 : process(CRCCLK)
--    begin
--        if (rising_edge(CRCCLK))then
--            if (CRCDATAVALID = '1')then
--                if (CRCRESET = '1')then
--                    CRCOUT_int16 <= nextCRC32_D16(CRCIN_bit_swapped(63 downto 48), CRC_INIT);
--                else
--                    CRCOUT_int16 <= nextCRC32_D16(CRCIN_bit_swapped(63 downto 48), CRCOUT_int);
--                end if;
--            end if;
--        end if;
--    end process;

      CRCOUT_int16 <= nextCRC32_D16(CRCIN_bit_swapped(63 downto 48), CRC_INIT) when (CRCRESET_z = '1') else
        nextCRC32_D16(CRCIN_bit_swapped(63 downto 48), CRCOUT_int);

--    gen_CRCOUT_int24 : process(CRCCLK)
--    begin
--        if (rising_edge(CRCCLK))then
--            if (CRCDATAVALID = '1')then
--                if (CRCRESET = '1')then
--                    CRCOUT_int24 <= nextCRC32_D24(CRCIN_bit_swapped(63 downto 40), CRC_INIT);
--                else
--                    CRCOUT_int24 <= nextCRC32_D24(CRCIN_bit_swapped(63 downto 40), CRCOUT_int);
--                end if;
--            end if;
--        end if;
--    end process;

      CRCOUT_int24 <= nextCRC32_D24(CRCIN_bit_swapped(63 downto 40), CRC_INIT) when (CRCRESET_z = '1') else
        nextCRC32_D24(CRCIN_bit_swapped(63 downto 40), CRCOUT_int);

--    gen_CRCOUT_int32 : process(CRCCLK)
--    begin
--        if (rising_edge(CRCCLK))then
--            if (CRCDATAVALID = '1')then
--                if (CRCRESET = '1')then
--                    CRCOUT_int32 <= nextCRC32_D32(CRCIN_bit_swapped(63 downto 32), CRC_INIT);
--                else
--                    CRCOUT_int32 <= nextCRC32_D32(CRCIN_bit_swapped(63 downto 32), CRCOUT_int);
--                end if;
--            end if;
--        end if;
--    end process;

      CRCOUT_int32 <= nextCRC32_D32(CRCIN_bit_swapped(63 downto 32), CRC_INIT) when (CRCRESET_z = '1') else
        nextCRC32_D32(CRCIN_bit_swapped(63 downto 32), CRCOUT_int);

--    gen_CRCOUT_int40 : process(CRCCLK)
--    begin
--        if (rising_edge(CRCCLK))then
--            if (CRCDATAVALID = '1')then
--                if (CRCRESET = '1')then
--                    CRCOUT_int40 <= nextCRC32_D40(CRCIN_bit_swapped(63 downto 24), CRC_INIT);
--                else
--                    CRCOUT_int40 <= nextCRC32_D40(CRCIN_bit_swapped(63 downto 24), CRCOUT_int);
--                end if;
--            end if;
--        end if;
--    end process;

      CRCOUT_int40 <= nextCRC32_D40(CRCIN_bit_swapped(63 downto 24), CRC_INIT) when (CRCRESET_z = '1') else
        nextCRC32_D40(CRCIN_bit_swapped(63 downto 24), CRCOUT_int);

--    gen_CRCOUT_int48 : process(CRCCLK)
--    begin
--        if (rising_edge(CRCCLK))then
--            if (CRCDATAVALID = '1')then
--                if (CRCRESET = '1')then
--                    CRCOUT_int48 <= nextCRC32_D48(CRCIN_bit_swapped(63 downto 16), CRC_INIT);
--                else
--                    CRCOUT_int48 <= nextCRC32_D48(CRCIN_bit_swapped(63 downto 16), CRCOUT_int);
--                end if;
--            end if;
--        end if;
--    end process;

      CRCOUT_int48 <= nextCRC32_D48(CRCIN_bit_swapped(63 downto 16), CRC_INIT) when (CRCRESET_z = '1') else
        nextCRC32_D48(CRCIN_bit_swapped(63 downto 16), CRCOUT_int);

--    gen_CRCOUT_int56 : process(CRCCLK)
--    begin
--        if (rising_edge(CRCCLK))then
--            if (CRCDATAVALID = '1')then
--                if (CRCRESET = '1')then
--                    CRCOUT_int56 <= nextCRC32_D56(CRCIN_bit_swapped(63 downto 8), CRC_INIT);
--                else
--                    CRCOUT_int56 <= nextCRC32_D56(CRCIN_bit_swapped(63 downto 8), CRCOUT_int);
--                end if;
--            end if;
--        end if;
--    end process;

      CRCOUT_int56 <= nextCRC32_D56(CRCIN_bit_swapped(63 downto 8), CRC_INIT) when (CRCRESET_z = '1') else
        nextCRC32_D56(CRCIN_bit_swapped(63 downto 8), CRCOUT_int);

--    gen_CRCOUT_int64 : process(CRCCLK)
--    begin
--        if (rising_edge(CRCCLK))then
--            if (CRCDATAVALID = '1')then
--                if (CRCRESET = '1')then
--                    CRCOUT_int64 <= nextCRC32_D64(CRCIN_bit_swapped, CRC_INIT);
--                else
--                    CRCOUT_int64 <= nextCRC32_D64(CRCIN_bit_swapped, CRCOUT_int);
--                end if;
--            end if;
--        end if;
--    end process;

      CRCOUT_int64 <= nextCRC32_D64(CRCIN_bit_swapped, CRC_INIT) when (CRCRESET_z = '1') else
        nextCRC32_D64(CRCIN_bit_swapped, CRCOUT_int);

    gen_CRCOUT_int : process(CRCCLK)
    begin
        if (rising_edge(CRCCLK))then
            if (CRCDATAVALID_z = '1')then
                case CRC_DATAWIDTH_z is
                    when "000" => CRCOUT_int <= CRCOUT_int8; 
                    when "001" => CRCOUT_int <= CRCOUT_int16; 
                    when "010" => CRCOUT_int <= CRCOUT_int24; 
                    when "011" => CRCOUT_int <= CRCOUT_int32; 
                    when "100" => CRCOUT_int <= CRCOUT_int40; 
                    when "101" => CRCOUT_int <= CRCOUT_int48; 
                    when "110" => CRCOUT_int <= CRCOUT_int56; 
                    when others => CRCOUT_int <= CRCOUT_int64; 
                end case;    
            end if;
        end if;
    end process;

--    CRCOUT_int <= CRCOUT_int8 when (CRC_DATAWIDTH_z = "000") else 
--    CRCOUT_int16 when (CRC_DATAWIDTH_z = "001") else
--    CRCOUT_int24 when (CRC_DATAWIDTH_z = "010") else
--    CRCOUT_int32 when (CRC_DATAWIDTH_z = "011") else
--    CRCOUT_int40 when (CRC_DATAWIDTH_z = "100") else
--    CRCOUT_int48 when (CRC_DATAWIDTH_z = "101") else
--    CRCOUT_int56 when (CRC_DATAWIDTH_z = "110") else
--    CRCOUT_int64;

    -- REGISTER CRC_DATAWIDTH SO KNOW WHICH CRC TO CHOOSE
    gen_CRC_DATAWIDTH_z : process(CRCCLK)
    begin
        if (rising_edge(CRCCLK))then
            CRC_DATAWIDTH_z <= CRC_DATAWIDTH;
            CRCRESET_z <= CRCRESET;
            CRCDATAVALID_z <= CRCDATAVALID;
        end if;
    end process;

    
--    -- ADD BYTE REVERSAL AND BIT INVERSION
--    gen_CRCOUT : process(CRCCLK)
--    begin
--        if (rising_edge(CRCCLK))then
--             for b in 0 to 7 loop
--                 CRCOUT(b) <= not CRCOUT_int(7 - b);
--                 CRCOUT(8 + b) <= not CRCOUT_int(15 - b);
--                 CRCOUT(16 + b) <= not CRCOUT_int(23 - b);
--                 CRCOUT(24 + b) <= not CRCOUT_int(31 - b);
--             end loop;
--        end if;
--    end process;

    byte_reverse_and_bit_invert : for b in 0 to 7 generate
        CRCOUT(b) <= not CRCOUT_int(7 - b);
        CRCOUT(8 + b) <= not CRCOUT_int(15 - b);
        CRCOUT(16 + b) <= not CRCOUT_int(23 - b);
        CRCOUT(24 + b) <= not CRCOUT_int(31 - b);
    end generate byte_reverse_and_bit_invert;
    
    
    
end arch_rx_crc64;
