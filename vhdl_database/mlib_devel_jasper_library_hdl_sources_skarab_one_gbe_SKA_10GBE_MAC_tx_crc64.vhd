-------------------------------------------------------------------------------
--
-- Title       : tx_crc64
-- Design      : FRM120801U1R1
-- Author      : Gavin Teague
-- Company     : Peralex
--
-------------------------------------------------------------------------------
--
-- File        : tx_crc64.vhd
-- Generated   : Mon Dec 19 09:31:25 2005
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
-------------------------------------------------------------------------------
--
-- Description :
--
-- This component replaces the CRC64 hard macro because it is not supported in the
-- Virtex6. The tx variant only supports 64 and 16 bit data widths (these are the
-- only widths required by the tx side).
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {tx_crc64} architecture {arch_tx_crc64}}

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.PCK_CRC32_D64.all;
use work.PCK_CRC32_D16.all;

entity tx_crc64 is
    port (
        CRC_INIT        : in std_logic_vector(31 downto 0);
        CRCOUT          : out std_logic_vector(31 downto 0);
        CRCCLK          : in std_logic;
        CRCDATAVALID    : in std_logic;
        CRC_DATAWIDTH   : in std_logic_vector(2 downto 0);
        CRCIN           : in std_logic_vector(63 downto 0);
        CRCRESET        : in std_logic);
end tx_crc64;

--}} End of automatically maintained section

architecture arch_tx_crc64 of tx_crc64 is
   
    signal CRCIN_bit_swapped : std_logic_vector(63 downto 0);   
    signal CRCOUT_int64 : std_logic_vector(31 downto 0);
    signal CRCOUT_int16 : std_logic_vector(31 downto 0);
    signal CRCOUT_int : std_logic_vector(31 downto 0);
    signal CRC_DATAWIDTH_z2 : std_logic_vector(2 downto 0);
    
    signal CRCIN_z : std_logic_vector(63 downto 0);
    signal CRCRESET_z : std_logic;
    signal CRC_DATAWIDTH_z : std_logic_vector(2 downto 0);
    signal CRCDATAVALID_z : std_logic;
    signal CRC_INIT_z : std_logic_vector(31 downto 0);
        
begin						  

    gen_CRCIN_z : process(CRCCLK)
    begin   
        if (rising_edge(CRCCLK))then
            CRCIN_z <= CRCIN;
            CRCRESET_z <= CRCRESET;
            CRC_DATAWIDTH_z <= CRC_DATAWIDTH;
            CRCDATAVALID_z <= CRCDATAVALID; 
            CRC_INIT_z <= CRC_INIT; 
        end if;
    end process;

    -- DO BIT SWAP TO HANDLE DIFFERENCE BETWEEN CRC64 AND EASICS CRC
    bit_swap: for a in 0 to 7 generate
        CRCIN_bit_swapped(a) <= CRCIN_z(7 - a);
        CRCIN_bit_swapped(8 + a) <= CRCIN_z(15 - a);
        CRCIN_bit_swapped(16 + a) <= CRCIN_z(23 - a);
        CRCIN_bit_swapped(24 + a) <= CRCIN_z(31 - a);
        CRCIN_bit_swapped(32 + a) <= CRCIN_z(39 - a);
        CRCIN_bit_swapped(40 + a) <= CRCIN_z(47 - a);
        CRCIN_bit_swapped(48 + a) <= CRCIN_z(55 - a);
        CRCIN_bit_swapped(56 + a) <= CRCIN_z(63 - a);
    end generate bit_swap;

    -- CALCULATE CRC
    gen_CRCOUT_int64 : process(CRCCLK)
    begin
        if (rising_edge(CRCCLK))then
            if (CRCDATAVALID_z = '1')then
                if (CRCRESET_z = '1')then
                    CRCOUT_int64 <= nextCRC32_D64(CRCIN_bit_swapped, CRC_INIT_z);
                else
                    CRCOUT_int64 <= nextCRC32_D64(CRCIN_bit_swapped, CRCOUT_int);
                end if;
            end if;
        end if;
    end process;

    gen_CRCOUT_int16 : process(CRCCLK)
    begin
        if (rising_edge(CRCCLK))then
            if (CRCDATAVALID_z = '1')then
                if (CRCRESET_z = '1')then
                    CRCOUT_int16 <= nextCRC32_D16(CRCIN_bit_swapped(63 downto 48), CRC_INIT_z);
                else
                    CRCOUT_int16 <= nextCRC32_D16(CRCIN_bit_swapped(63 downto 48), CRCOUT_int);
                end if;
            end if;
        end if;
    end process;

    CRCOUT_int <= CRCOUT_int64 when (CRC_DATAWIDTH_z2 = "111") else CRCOUT_int16;

    -- REGISTER CRC_DATAWIDTH SO KNOW WHICH CRC TO CHOOSE
    gen_CRC_DATAWIDTH_z : process(CRCCLK)
    begin
        if (rising_edge(CRCCLK))then
            if (CRCDATAVALID_z = '1')then    
                CRC_DATAWIDTH_z2 <= CRC_DATAWIDTH_z;
            end if;
        end if;
    end process;

    -- ADD BYTE REVERSAL AND BIT INVERSION
    gen_CRCOUT : process(CRCCLK)
    begin
        if (rising_edge(CRCCLK))then
             for b in 0 to 7 loop
                 CRCOUT(b) <= not CRCOUT_int(7 - b);
                 CRCOUT(8 + b) <= not CRCOUT_int(15 - b);
                 CRCOUT(16 + b) <= not CRCOUT_int(23 - b);
                 CRCOUT(24 + b) <= not CRCOUT_int(31 - b);
             end loop;
        end if;
    end process;

end arch_tx_crc64;
