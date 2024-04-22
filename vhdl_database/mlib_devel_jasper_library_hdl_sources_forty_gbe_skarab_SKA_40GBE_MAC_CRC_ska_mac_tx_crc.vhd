----------------------------------------------------------------------------------
-- Company: Peralex Electronics
-- Engineer: Gavin Teague
-- 
-- Create Date: 05.09.2014 10:19:29
-- Design Name: 
-- Module Name: ska_mac_tx_crc - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Calculate CRC for MAC TX only (assumes specific data alignment)
--
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ska_mac_tx_crc is
    port (
        clk             : in std_logic;
        crc_reset       : in std_logic;
        crc_init        : in std_logic_vector(31 downto 0);
        data_in         : in std_logic_vector(255 downto 0);
        data_in_val     : in std_logic_vector(31 downto 0);
        crc_out         : out std_logic_vector(31 downto 0));
end ska_mac_tx_crc;

architecture arch_ska_mac_tx_crc of ska_mac_tx_crc is

    component crc_16 
    port ( 
        data_in : in std_logic_vector(15 downto 0);
        crc_in  : in std_logic_vector(31 downto 0);
        crc_out : out std_logic_vector(31 downto 0));
    end component;

    component crc_64 
    port ( 
        data_in : in std_logic_vector(63 downto 0);
        crc_in  : in std_logic_vector(31 downto 0);
        crc_out : out std_logic_vector(31 downto 0));
    end component;

    component crc_80 
    port ( 
        data_in : in std_logic_vector(79 downto 0);
        crc_in  : in std_logic_vector(31 downto 0);
        crc_out : out std_logic_vector(31 downto 0));
    end component;

    component crc_128 
    port ( 
        data_in : in std_logic_vector(127 downto 0);
        crc_in  : in std_logic_vector(31 downto 0);
        crc_out : out std_logic_vector(31 downto 0));
    end component;

    component crc_144 
    port ( 
        data_in : in std_logic_vector(143 downto 0);
        crc_in  : in std_logic_vector(31 downto 0);
        crc_out : out std_logic_vector(31 downto 0));
    end component;

    component crc_192 
    port ( 
        data_in : in std_logic_vector(191 downto 0);
        crc_in  : in std_logic_vector(31 downto 0);
        crc_out : out std_logic_vector(31 downto 0));
    end component;

    component crc_208 
    port ( 
        data_in : in std_logic_vector(207 downto 0);
        crc_in  : in std_logic_vector(31 downto 0);
        crc_out : out std_logic_vector(31 downto 0));
    end component;

    component crc_256 
    port ( 
        data_in : in std_logic_vector(255 downto 0);
        crc_in  : in std_logic_vector(31 downto 0);
        crc_out : out std_logic_vector(31 downto 0));
    end component;
 
    signal crc_out_int256 : std_logic_vector(31 downto 0);
    signal crc_out_int256_normal : std_logic_vector(31 downto 0);
    signal crc_out_int256_reset : std_logic_vector(31 downto 0);
    signal crc_out_int208 : std_logic_vector(31 downto 0);
    signal crc_out_int208_normal : std_logic_vector(31 downto 0);
    signal crc_out_int208_reset : std_logic_vector(31 downto 0);
    signal crc_out_int192 : std_logic_vector(31 downto 0);
    signal crc_out_int192_normal : std_logic_vector(31 downto 0);
    signal crc_out_int192_reset : std_logic_vector(31 downto 0);
    signal crc_out_int144 : std_logic_vector(31 downto 0);
    signal crc_out_int144_normal : std_logic_vector(31 downto 0);
    signal crc_out_int144_reset : std_logic_vector(31 downto 0);
    signal crc_out_int128 : std_logic_vector(31 downto 0);
    signal crc_out_int128_normal : std_logic_vector(31 downto 0);
    signal crc_out_int128_reset : std_logic_vector(31 downto 0);
    signal crc_out_int80 : std_logic_vector(31 downto 0);
    signal crc_out_int80_normal : std_logic_vector(31 downto 0);
    signal crc_out_int80_reset : std_logic_vector(31 downto 0);
    signal crc_out_int64 : std_logic_vector(31 downto 0);
    signal crc_out_int64_normal : std_logic_vector(31 downto 0);
    signal crc_out_int64_reset : std_logic_vector(31 downto 0);
    signal crc_out_int16 : std_logic_vector(31 downto 0);
    signal crc_out_int16_normal : std_logic_vector(31 downto 0);
    signal crc_out_int16_reset : std_logic_vector(31 downto 0);
    signal crc_out_int : std_logic_vector(31 downto 0);

    signal data_in_byte_swapped : std_logic_vector(255 downto 0);
    signal data_in_bit_swapped : std_logic_vector(255 downto 0);
    signal data_in_z1 : std_logic_vector(255 downto 0);
    signal crc_reset_z1 : std_logic;
    signal data_in_val_z1 : std_logic_vector(31 downto 0);
    signal data_in_val_z2 : std_logic_vector(31 downto 0);
    signal crc_init_z1 : std_logic_vector(31 downto 0);
    
    signal crc_out_byte_reverse : std_logic_vector(31 downto 0);

    signal crc_in : std_logic_vector(31 downto 0);
   
begin

    -- BYTE SWAP
    data_in_byte_swapped(7 downto 0) <= data_in(255 downto 248);
    data_in_byte_swapped(15 downto 8) <= data_in(247 downto 240);
    data_in_byte_swapped(23 downto 16) <= data_in(239 downto 232);
    data_in_byte_swapped(31 downto 24) <= data_in(231 downto 224);
    data_in_byte_swapped(39 downto 32) <= data_in(223 downto 216);
    data_in_byte_swapped(47 downto 40) <= data_in(215 downto 208);
    data_in_byte_swapped(55 downto 48) <= data_in(207 downto 200);
    data_in_byte_swapped(63 downto 56) <= data_in(199 downto 192);

    data_in_byte_swapped(71 downto 64) <= data_in(191 downto 184);
    data_in_byte_swapped(79 downto 72) <= data_in(183 downto 176);
    data_in_byte_swapped(87 downto 80) <= data_in(175 downto 168);
    data_in_byte_swapped(95 downto 88) <= data_in(167 downto 160);
    data_in_byte_swapped(103 downto 96) <= data_in(159 downto 152);
    data_in_byte_swapped(111 downto 104) <= data_in(151 downto 144);
    data_in_byte_swapped(119 downto 112) <= data_in(143 downto 136);
    data_in_byte_swapped(127 downto 120) <= data_in(135 downto 128);

    data_in_byte_swapped(135 downto 128) <= data_in(127 downto 120);
    data_in_byte_swapped(143 downto 136) <= data_in(119 downto 112);
    data_in_byte_swapped(151 downto 144) <= data_in(111 downto 104);
    data_in_byte_swapped(159 downto 152) <= data_in(103 downto 96);
    data_in_byte_swapped(167 downto 160) <= data_in(95 downto 88);
    data_in_byte_swapped(175 downto 168) <= data_in(87 downto 80);
    data_in_byte_swapped(183 downto 176) <= data_in(79 downto 72);
    data_in_byte_swapped(191 downto 184) <= data_in(71 downto 64);

    data_in_byte_swapped(199 downto 192) <= data_in(63 downto 56);
    data_in_byte_swapped(207 downto 200) <= data_in(55 downto 48);
    data_in_byte_swapped(215 downto 208) <= data_in(47 downto 40);
    data_in_byte_swapped(223 downto 216) <= data_in(39 downto 32);
    data_in_byte_swapped(231 downto 224) <= data_in(31 downto 24);
    data_in_byte_swapped(239 downto 232) <= data_in(23 downto 16);
    data_in_byte_swapped(247 downto 240) <= data_in(15 downto 8);
    data_in_byte_swapped(255 downto 248) <= data_in(7 downto 0);

    -- REGISTER TO IMPROVE TIMING
    data_in_z1 <= data_in_byte_swapped;
    crc_reset_z1 <= crc_reset;
    data_in_val_z1 <= data_in_val;
    crc_init_z1 <= crc_init; 


    gen_data_in_z : process(clk)
    begin   
        if (rising_edge(clk))then
            --data_in_z1 <= data_in_byte_swapped;
            --crc_reset_z1 <= crc_reset;
            --data_in_val_z1 <= data_in_val;
            data_in_val_z2 <= data_in_val_z1;
            --crc_init_z1 <= crc_init; 
        end if;
    end process;

    -- DO BIT SWAP
    bit_swap: for a in 0 to 7 generate
        data_in_bit_swapped(a) <= data_in_z1(7 - a);
        data_in_bit_swapped(8 + a) <= data_in_z1(15 - a);
        data_in_bit_swapped(16 + a) <= data_in_z1(23 - a);
        data_in_bit_swapped(24 + a) <= data_in_z1(31 - a);
        data_in_bit_swapped(32 + a) <= data_in_z1(39 - a);
        data_in_bit_swapped(40 + a) <= data_in_z1(47 - a);
        data_in_bit_swapped(48 + a) <= data_in_z1(55 - a);
        data_in_bit_swapped(56 + a) <= data_in_z1(63 - a);

        data_in_bit_swapped(64 + a) <= data_in_z1(71 - a);
        data_in_bit_swapped(72 + a) <= data_in_z1(79 - a);
        data_in_bit_swapped(80 + a) <= data_in_z1(87 - a);
        data_in_bit_swapped(88 + a) <= data_in_z1(95 - a);
        data_in_bit_swapped(96 + a) <= data_in_z1(103 - a);
        data_in_bit_swapped(104 + a) <= data_in_z1(111 - a);
        data_in_bit_swapped(112 + a) <= data_in_z1(119 - a);
        data_in_bit_swapped(120 + a) <= data_in_z1(127 - a);

        data_in_bit_swapped(128 + a) <= data_in_z1(135 - a);
        data_in_bit_swapped(136 + a) <= data_in_z1(143 - a);
        data_in_bit_swapped(144 + a) <= data_in_z1(151 - a);
        data_in_bit_swapped(152 + a) <= data_in_z1(159 - a);
        data_in_bit_swapped(160 + a) <= data_in_z1(167 - a);
        data_in_bit_swapped(168 + a) <= data_in_z1(175 - a);
        data_in_bit_swapped(176 + a) <= data_in_z1(183 - a);
        data_in_bit_swapped(184 + a) <= data_in_z1(191 - a);

        data_in_bit_swapped(192 + a) <= data_in_z1(199 - a);
        data_in_bit_swapped(200 + a) <= data_in_z1(207 - a);
        data_in_bit_swapped(208 + a) <= data_in_z1(215 - a);
        data_in_bit_swapped(216 + a) <= data_in_z1(223 - a);
        data_in_bit_swapped(224 + a) <= data_in_z1(231 - a);
        data_in_bit_swapped(232 + a) <= data_in_z1(239 - a);
        data_in_bit_swapped(240 + a) <= data_in_z1(247 - a);
        data_in_bit_swapped(248 + a) <= data_in_z1(255 - a);

    end generate bit_swap;

    -- CALCULATE INDIVIDUAL CRCS
    crc_in <= crc_init when (crc_reset_z1 = '1') else crc_out_int;
    
    -- 16 BITS
--    crc_16_0 : crc_16 
--    port map( 
--        data_in => data_in_bit_swapped(255 downto 240),
--        crc_in  => crc_init,
--        crc_out => crc_out_int16_reset);
--
--    crc_16_1 : crc_16 
--    port map( 
--        data_in => data_in_bit_swapped(255 downto 240),
--        crc_in  => crc_out_int,
--        crc_out => crc_out_int16_normal);

    crc_16_0 : crc_16 
    port map( 
        data_in => data_in_bit_swapped(255 downto 240),
        crc_in  => crc_in,
        crc_out => crc_out_int16_normal);
    
    gen_crc_out_int16 : process(clk)
    begin
        if (rising_edge(clk))then
            --if (crc_reset_z1 = '1')then
            --    crc_out_int16 <= crc_out_int16_reset;
            --else
                crc_out_int16 <= crc_out_int16_normal;
            --end if;
        end if;
    end process;

    -- 64 BITS
--    crc_64_0 : crc_64 
--    port map( 
--        data_in => data_in_bit_swapped(255 downto 192),
--        crc_in  => crc_init,
--        crc_out => crc_out_int64_reset);
--
--    crc_64_1 : crc_64 
--    port map( 
--        data_in => data_in_bit_swapped(255 downto 192),
--        crc_in  => crc_out_int,
--        crc_out => crc_out_int64_normal);

    crc_64_0 : crc_64 
    port map( 
        data_in => data_in_bit_swapped(255 downto 192),
        crc_in  => crc_in,
        crc_out => crc_out_int64_normal);
    
    gen_crc_out_int64 : process(clk)
    begin
        if (rising_edge(clk))then
            --if (crc_reset_z1 = '1')then
            --    crc_out_int64 <= crc_out_int64_reset;
            --else
                crc_out_int64 <= crc_out_int64_normal;
            --end if;
        end if;
    end process;

    -- 80 BITS
--    crc_80_0 : crc_80 
--    port map( 
--        data_in => data_in_bit_swapped(255 downto 176),
--        crc_in  => crc_init,
--        crc_out => crc_out_int80_reset);
--
--    crc_80_1 : crc_80 
--    port map( 
--        data_in => data_in_bit_swapped(255 downto 176),
--        crc_in  => crc_out_int,
--        crc_out => crc_out_int80_normal);
    
    crc_80_0 : crc_80 
    port map( 
        data_in => data_in_bit_swapped(255 downto 176),
        crc_in  => crc_in,
        crc_out => crc_out_int80_normal);

    gen_crc_out_int80 : process(clk)
    begin
        if (rising_edge(clk))then
            --if (crc_reset_z1 = '1')then
            --    crc_out_int80 <= crc_out_int80_reset;
            --else
                crc_out_int80 <= crc_out_int80_normal;
            --end if;
        end if;
    end process;

    -- 128 BITS
    crc_128_0 : crc_128 
    port map( 
        data_in => data_in_bit_swapped(255 downto 128),
        crc_in  => crc_in,
        crc_out => crc_out_int128_normal);

    gen_crc_out_int128 : process(clk)
    begin
        if (rising_edge(clk))then
            crc_out_int128 <= crc_out_int128_normal;
        end if;
    end process;

    -- 144 BITS
    crc_144_0 : crc_144 
    port map( 
        data_in => data_in_bit_swapped(255 downto 112),
        crc_in  => crc_in,
        crc_out => crc_out_int144_normal);

    gen_crc_out_int144 : process(clk)
    begin
        if (rising_edge(clk))then
            crc_out_int144 <= crc_out_int144_normal;
        end if;
    end process;

    -- 192 BITS
    crc_192_0 : crc_192 
    port map( 
        data_in => data_in_bit_swapped(255 downto 64),
        crc_in  => crc_in,
        crc_out => crc_out_int192_normal);

    gen_crc_out_int192 : process(clk)
    begin
        if (rising_edge(clk))then
            crc_out_int192 <= crc_out_int192_normal;
        end if;
    end process;

    -- 208 BITS
    crc_208_0 : crc_208 
    port map( 
        data_in => data_in_bit_swapped(255 downto 48),
        crc_in  => crc_in,
        crc_out => crc_out_int208_normal);

    gen_crc_out_int208 : process(clk)
    begin
        if (rising_edge(clk))then
            crc_out_int208 <= crc_out_int208_normal;
        end if;
    end process;

    -- 256 BITS
    crc_256_0 : crc_256 
    port map( 
        data_in => data_in_bit_swapped,
        crc_in  => crc_in,
        crc_out => crc_out_int256_normal);

    gen_crc_out_int256 : process(clk)
    begin
        if (rising_edge(clk))then
            crc_out_int256 <= crc_out_int256_normal;
        end if;
    end process;
	
	crc_out_int <=
	crc_out_int256 when (data_in_val_z2(31) = '1') else 
	crc_out_int208 when (data_in_val_z2(25) = '1') else 
	crc_out_int192 when (data_in_val_z2(23) = '1') else 
	crc_out_int144 when (data_in_val_z2(17) = '1') else 
	crc_out_int128 when (data_in_val_z2(15) = '1') else 
	crc_out_int80 when (data_in_val_z2(9) = '1') else 
	crc_out_int64 when (data_in_val_z2(7) = '1') else
	crc_out_int16; 
	
    -- ADD BIT REVERSAL AND BIT INVERSION
    --gen_crc_out_byte_reverse : process(clk)
    --begin
    --    if (rising_edge(clk))then
    --         for b in 0 to 7 loop
    generate_crc_out_byte_reverse : for b in 0 to 7 generate
                 crc_out_byte_reverse(b) <= not crc_out_int(7 - b);
                 crc_out_byte_reverse(8 + b) <= not crc_out_int(15 - b);
                 crc_out_byte_reverse(16 + b) <= not crc_out_int(23 - b);
                 crc_out_byte_reverse(24 + b) <= not crc_out_int(31 - b);
    end generate generate_crc_out_byte_reverse;
    --         end loop;
    --    end if;
    --end process;
	
	-- LASTLY, SWAP BYTES
	crc_out(7 downto 0) <= crc_out_byte_reverse(31 downto 24);
	crc_out(15 downto 8) <= crc_out_byte_reverse(23 downto 16);
	crc_out(23 downto 16) <= crc_out_byte_reverse(15 downto 8);
	crc_out(31 downto 24) <= crc_out_byte_reverse(7 downto 0);
	
end arch_ska_mac_tx_crc;
