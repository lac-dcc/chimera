----------------------------------------------------------------------------------
-- Company: Peralex Electronics
-- Engineer: Gavin Teague
-- 
-- Create Date: 05.09.2014 10:19:29
-- Design Name: 
-- Module Name: ska_mac_rx_crc - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Calculate CRC for MAC RX (assumes no specific data alignment)
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

entity ska_mac_rx_crc_multi is
    port (
        clk             : in std_logic;
        rst             : in std_logic;
        crc_reset       : in std_logic;
        crc_init        : in std_logic_vector(31 downto 0);
        data_in         : in std_logic_vector(255 downto 0);
        data_in_val     : in std_logic_vector(31 downto 0);
        crc_out         : out std_logic_vector(31 downto 0));
end ska_mac_rx_crc_multi;

architecture arch_ska_mac_rx_crc_multi of ska_mac_rx_crc_multi is

    type T_CRC_STATE is (
    IDLE,
    FULL,
    TRAIL_PART_1,
    TRAIL_PART_2,
    TRAIL_PART_3);

    component crc_8 
    port ( 
        data_in : in std_logic_vector(7 downto 0);
        crc_in  : in std_logic_vector(31 downto 0);
        crc_out : out std_logic_vector(31 downto 0));
    end component;

    component crc_16 
    port ( 
        data_in : in std_logic_vector(15 downto 0);
        crc_in  : in std_logic_vector(31 downto 0);
        crc_out : out std_logic_vector(31 downto 0));
    end component;

    component crc_24 
    port ( 
        data_in : in std_logic_vector(23 downto 0);
        crc_in  : in std_logic_vector(31 downto 0);
        crc_out : out std_logic_vector(31 downto 0));
    end component;

    component crc_32 
    port ( 
        data_in : in std_logic_vector(31 downto 0);
        crc_in  : in std_logic_vector(31 downto 0);
        crc_out : out std_logic_vector(31 downto 0));
    end component;

    component crc_40 
    port ( 
        data_in : in std_logic_vector(39 downto 0);
        crc_in  : in std_logic_vector(31 downto 0);
        crc_out : out std_logic_vector(31 downto 0));
    end component;

    component crc_48 
    port ( 
        data_in : in std_logic_vector(47 downto 0);
        crc_in  : in std_logic_vector(31 downto 0);
        crc_out : out std_logic_vector(31 downto 0));
    end component;

    component crc_56 
    port ( 
        data_in : in std_logic_vector(55 downto 0);
        crc_in  : in std_logic_vector(31 downto 0);
        crc_out : out std_logic_vector(31 downto 0));
    end component;

    component crc_64 
    port ( 
        data_in : in std_logic_vector(63 downto 0);
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
    signal crc_out_int256_reg : std_logic_vector(31 downto 0);
    signal crc_out_int64 : std_logic_vector(31 downto 0);
    signal crc_out_int56 : std_logic_vector(31 downto 0);
    signal crc_out_int48 : std_logic_vector(31 downto 0);
    signal crc_out_int40 : std_logic_vector(31 downto 0);
    signal crc_out_int32 : std_logic_vector(31 downto 0);
    signal crc_out_int24 : std_logic_vector(31 downto 0);
    signal crc_out_int16 : std_logic_vector(31 downto 0);
    signal crc_out_int8 : std_logic_vector(31 downto 0);

    signal data_in_byte_swapped : std_logic_vector(255 downto 0);
    signal data_in_bit_swapped : std_logic_vector(255 downto 0);
    
    signal crc_out_byte_reverse : std_logic_vector(31 downto 0);

    signal crc_in_256 : std_logic_vector(31 downto 0);
    signal crc_in_tail : std_logic_vector(31 downto 0);
    signal crc_in_tail_part_1 : std_logic_vector(31 downto 0);
    signal crc_in_tail_part_2 : std_logic_vector(31 downto 0);
    signal crc_in_tail_part_3 : std_logic_vector(31 downto 0);
   
    signal current_crc_state : T_CRC_STATE;
    signal trail_part_1_crc : std_logic_vector(31 downto 0);
    signal trail_part_2_crc : std_logic_vector(31 downto 0);
    signal trail_part_3_crc : std_logic_vector(31 downto 0);
    
    signal final_crc_val : std_logic;
    signal final_crc : std_logic_vector(31 downto 0);
    
    signal last_data_in_bit_swapped : std_logic_vector(255 downto 0);
    signal last_data_in_val : std_logic_vector(31 downto 0);

    signal data_in_8 : std_logic_vector(7 downto 0);
    signal data_in_16 : std_logic_vector(15 downto 0);
    signal data_in_24 : std_logic_vector(23 downto 0);
    signal data_in_32 : std_logic_vector(31 downto 0);
    signal data_in_40 : std_logic_vector(39 downto 0);
    signal data_in_48 : std_logic_vector(47 downto 0);
    signal data_in_56 : std_logic_vector(55 downto 0);
    signal data_in_64 : std_logic_vector(63 downto 0);
       
begin

    gen_current_crc_state : process(rst, clk)
    begin
        if (rst = '1')then
            last_data_in_bit_swapped <= (others => '0');
            last_data_in_val <= (others => '0');
            crc_in_tail_part_1 <= (others => '0');
            crc_in_tail_part_2 <= (others => '0');
            crc_in_tail_part_3 <= (others => '0');
            final_crc <= (others => '0');
            trail_part_1_crc <= (others => '0');
            trail_part_2_crc <= (others => '0');
            trail_part_3_crc <= (others => '0');
            current_crc_state <= IDLE;
        elsif (rising_edge(clk))then
            case current_crc_state is    
                when IDLE =>
                current_crc_state <= IDLE;
                
                if ((data_in_val = X"FFFFFFFF")and(crc_reset = '1'))then
                    current_crc_state <= FULL;
                end if;
                
                when FULL =>
                current_crc_state <= FULL;
                
                if (data_in_val /= X"FFFFFFFF")then
                    last_data_in_bit_swapped <= data_in_bit_swapped;
                    last_data_in_val <= data_in_val;

                    if (data_in_val(7) = '1')then
                        -- COULD BE MORE TAIL TO PROCESS
                        -- COULD ALSO BE END
                        crc_in_tail_part_1 <= crc_out_int64;
                        trail_part_1_crc <= crc_out_int64;
                    elsif (data_in_val(6) = '1')then
                        -- NO MORE TAIL TO PROCESS SO CAPTURE CURRENT CRC VALUE
                        trail_part_1_crc <= crc_out_int56;
                    elsif (data_in_val(5) = '1')then
                        trail_part_1_crc <= crc_out_int48;
                    elsif (data_in_val(4) = '1')then
                        trail_part_1_crc <= crc_out_int40;
                    elsif (data_in_val(3) = '1')then
                        trail_part_1_crc <= crc_out_int32;
                    elsif (data_in_val(2) = '1')then
                        trail_part_1_crc <= crc_out_int24;
                    elsif (data_in_val(1) = '1')then
                        trail_part_1_crc <= crc_out_int16;
                    elsif (data_in_val(0) = '1')then
                        trail_part_1_crc <= crc_out_int8;
                    else
                        -- NO TAIL TO PROCESS AT ALL SO TAKE LAST FULL CRC RESULT
                        trail_part_1_crc <= crc_out_int256_reg;
                    end if;    
                        
                    current_crc_state <= TRAIL_PART_1;
                end if;
                
                when TRAIL_PART_1 =>
                current_crc_state <= TRAIL_PART_2;
                
                if (last_data_in_val(15) = '1')then
                    -- COULD BE MORE TAIL TO PROCESS
                    -- COULD ALSO BE END
                    crc_in_tail_part_2 <= crc_out_int64;
                    trail_part_2_crc <= crc_out_int64;
                elsif (last_data_in_val(14) = '1')then
                    -- NO MORE TAIL TO PROCESS
                    trail_part_2_crc <= crc_out_int56;
                elsif (last_data_in_val(13) = '1')then
                    trail_part_2_crc <= crc_out_int48;
                elsif (last_data_in_val(12) = '1')then
                    trail_part_2_crc <= crc_out_int40;
                elsif (last_data_in_val(11) = '1')then
                    trail_part_2_crc <= crc_out_int32;
                elsif (last_data_in_val(10) = '1')then
                    trail_part_2_crc <= crc_out_int24;
                elsif (last_data_in_val(9) = '1')then
                    trail_part_2_crc <= crc_out_int16;
                elsif (last_data_in_val(8) = '1')then
                    trail_part_2_crc <= crc_out_int8;
                else
                    -- NO TAIL TO PROCESS SO CAPTURE PREVIOUS VALUE
                    trail_part_2_crc <= trail_part_1_crc;
                end if;    
                
                when TRAIL_PART_2 =>
                current_crc_state <= TRAIL_PART_3;

                if (last_data_in_val(23) = '1')then
                    -- COULD BE MORE TAIL TO PROCESS
                    -- COULD ALSO BE END
                    crc_in_tail_part_3 <= crc_out_int64;
                    trail_part_3_crc <= crc_out_int64;
                elsif (last_data_in_val(22) = '1')then
                    -- NO MORE TAIL TO PROCESS
                    trail_part_3_crc <= crc_out_int56;
                elsif (last_data_in_val(21) = '1')then
                    trail_part_3_crc <= crc_out_int48;
                elsif (last_data_in_val(20) = '1')then
                    trail_part_3_crc <= crc_out_int40;
                elsif (last_data_in_val(19) = '1')then
                    trail_part_3_crc <= crc_out_int32;
                elsif (last_data_in_val(18) = '1')then
                    trail_part_3_crc <= crc_out_int24;
                elsif (last_data_in_val(17) = '1')then
                    trail_part_3_crc <= crc_out_int16;
                elsif (last_data_in_val(16) = '1')then
                    trail_part_3_crc <= crc_out_int8;
                else
                    -- NO TAIL TO PROCESS SO CAPTURE PREVIOUS VALUE
                    trail_part_3_crc <= trail_part_2_crc;
                end if;    
                
                when TRAIL_PART_3 =>
                if (last_data_in_val(31) = '1')then
                    -- SHOULDN'T ACTUALLY GET HERE
                    -- MUST BE END
                    crc_in_tail_part_3 <= crc_out_int64;
                    final_crc <= crc_out_int64;
                elsif (last_data_in_val(30) = '1')then
                    final_crc <= crc_out_int56;
                elsif (last_data_in_val(29) = '1')then
                    final_crc <= crc_out_int48;
                elsif (last_data_in_val(28) = '1')then
                    final_crc <= crc_out_int40;
                elsif (last_data_in_val(27) = '1')then
                    final_crc <= crc_out_int32;
                elsif (last_data_in_val(26) = '1')then
                    final_crc <= crc_out_int24;
                elsif (last_data_in_val(25) = '1')then
                    final_crc <= crc_out_int16;
                elsif (last_data_in_val(24) = '1')then
                    final_crc <= crc_out_int8;
                else
                    -- NO TAIL TO PROCESS SO CAPTURE PREVIOUS VALUE
                    final_crc <= trail_part_3_crc;
                end if;    

                if (data_in_val = X"FFFFFFFF")then
                    current_crc_state <= FULL;
                else
                    current_crc_state <= IDLE;
                end if;
    
            end case;
        end if;
    end process;

    final_crc_val <= '1' when (current_crc_state = TRAIL_PART_3) else '0';

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

    -- DO BIT SWAP
    bit_swap: for a in 0 to 7 generate
        data_in_bit_swapped(a) <= data_in_byte_swapped(7 - a);
        data_in_bit_swapped(8 + a) <= data_in_byte_swapped(15 - a);
        data_in_bit_swapped(16 + a) <= data_in_byte_swapped(23 - a);
        data_in_bit_swapped(24 + a) <= data_in_byte_swapped(31 - a);
        data_in_bit_swapped(32 + a) <= data_in_byte_swapped(39 - a);
        data_in_bit_swapped(40 + a) <= data_in_byte_swapped(47 - a);
        data_in_bit_swapped(48 + a) <= data_in_byte_swapped(55 - a);
        data_in_bit_swapped(56 + a) <= data_in_byte_swapped(63 - a);

        data_in_bit_swapped(64 + a) <= data_in_byte_swapped(71 - a);
        data_in_bit_swapped(72 + a) <= data_in_byte_swapped(79 - a);
        data_in_bit_swapped(80 + a) <= data_in_byte_swapped(87 - a);
        data_in_bit_swapped(88 + a) <= data_in_byte_swapped(95 - a);
        data_in_bit_swapped(96 + a) <= data_in_byte_swapped(103 - a);
        data_in_bit_swapped(104 + a) <= data_in_byte_swapped(111 - a);
        data_in_bit_swapped(112 + a) <= data_in_byte_swapped(119 - a);
        data_in_bit_swapped(120 + a) <= data_in_byte_swapped(127 - a);

        data_in_bit_swapped(128 + a) <= data_in_byte_swapped(135 - a);
        data_in_bit_swapped(136 + a) <= data_in_byte_swapped(143 - a);
        data_in_bit_swapped(144 + a) <= data_in_byte_swapped(151 - a);
        data_in_bit_swapped(152 + a) <= data_in_byte_swapped(159 - a);
        data_in_bit_swapped(160 + a) <= data_in_byte_swapped(167 - a);
        data_in_bit_swapped(168 + a) <= data_in_byte_swapped(175 - a);
        data_in_bit_swapped(176 + a) <= data_in_byte_swapped(183 - a);
        data_in_bit_swapped(184 + a) <= data_in_byte_swapped(191 - a);

        data_in_bit_swapped(192 + a) <= data_in_byte_swapped(199 - a);
        data_in_bit_swapped(200 + a) <= data_in_byte_swapped(207 - a);
        data_in_bit_swapped(208 + a) <= data_in_byte_swapped(215 - a);
        data_in_bit_swapped(216 + a) <= data_in_byte_swapped(223 - a);
        data_in_bit_swapped(224 + a) <= data_in_byte_swapped(231 - a);
        data_in_bit_swapped(232 + a) <= data_in_byte_swapped(239 - a);
        data_in_bit_swapped(240 + a) <= data_in_byte_swapped(247 - a);
        data_in_bit_swapped(248 + a) <= data_in_byte_swapped(255 - a);

    end generate bit_swap;

    -- FULL 256 BIT CRC
    crc_in_256 <= crc_init when (crc_reset = '1') else crc_out_int256_reg;
    
    -- 256 BITS
    crc_256_0 : crc_256 
    port map( 
        data_in => data_in_bit_swapped,
        crc_in  => crc_in_256,
        crc_out => crc_out_int256);
        
    gen_crc_out_int256_reg : process(clk)
    begin
        if (rising_edge(clk))then
            crc_out_int256_reg <= crc_out_int256;
        end if;
    end process;
    
    -- CRC FOR TAIL PORTION
    crc_in_tail <=
    crc_out_int256_reg when (current_crc_state = FULL) else
    crc_in_tail_part_1 when (current_crc_state = TRAIL_PART_1)else
    crc_in_tail_part_2 when (current_crc_state = TRAIL_PART_2)else
    crc_in_tail_part_3;
    
    -- 8 BITS
    data_in_8 <=
    data_in_bit_swapped(255 downto 248) when (current_crc_state = FULL)else
    last_data_in_bit_swapped(191 downto 184) when (current_crc_state = TRAIL_PART_1)else
    last_data_in_bit_swapped(127 downto 120) when (current_crc_state = TRAIL_PART_2)else
    last_data_in_bit_swapped(63 downto 56) when (current_crc_state = TRAIL_PART_3)else
    (others => '0');
    
    crc_8_0 : crc_8 
    port map( 
        data_in => data_in_8,
        crc_in  => crc_in_tail,
        crc_out => crc_out_int8);
    
    -- 16 BITS
    data_in_16 <=
    data_in_bit_swapped(255 downto 240) when (current_crc_state = FULL)else
    last_data_in_bit_swapped(191 downto 176) when (current_crc_state = TRAIL_PART_1)else
    last_data_in_bit_swapped(127 downto 112) when (current_crc_state = TRAIL_PART_2)else
    last_data_in_bit_swapped(63 downto 48) when (current_crc_state = TRAIL_PART_3)else
    (others => '0');

    crc_16_0 : crc_16 
    port map( 
        data_in => data_in_16,
        crc_in  => crc_in_tail,
        crc_out => crc_out_int16);
    
    -- 24 BITS
    data_in_24 <=
    data_in_bit_swapped(255 downto 232) when (current_crc_state = FULL)else
    last_data_in_bit_swapped(191 downto 168) when (current_crc_state = TRAIL_PART_1)else
    last_data_in_bit_swapped(127 downto 104) when (current_crc_state = TRAIL_PART_2)else
    last_data_in_bit_swapped(63 downto 40) when (current_crc_state = TRAIL_PART_3)else
    (others => '0');

    crc_24_0 : crc_24 
    port map( 
        data_in => data_in_24,
        crc_in  => crc_in_tail,
        crc_out => crc_out_int24);

    -- 32 BITS
    data_in_32 <=
    data_in_bit_swapped(255 downto 224) when (current_crc_state = FULL)else
    last_data_in_bit_swapped(191 downto 160) when (current_crc_state = TRAIL_PART_1)else
    last_data_in_bit_swapped(127 downto 96) when (current_crc_state = TRAIL_PART_2)else
    last_data_in_bit_swapped(63 downto 32) when (current_crc_state = TRAIL_PART_3)else
    (others => '0');

    crc_32_0 : crc_32 
    port map( 
        data_in => data_in_32,
        crc_in  => crc_in_tail,
        crc_out => crc_out_int32);
    
    -- 40 BITS
    data_in_40 <=
    data_in_bit_swapped(255 downto 216) when (current_crc_state = FULL)else
    last_data_in_bit_swapped(191 downto 152) when (current_crc_state = TRAIL_PART_1)else
    last_data_in_bit_swapped(127 downto 88) when (current_crc_state = TRAIL_PART_2)else
    last_data_in_bit_swapped(63 downto 24) when (current_crc_state = TRAIL_PART_3)else
    (others => '0');

    crc_40_0 : crc_40 
    port map( 
        data_in => data_in_40,
        crc_in  => crc_in_tail,
        crc_out => crc_out_int40);

    -- 48 BITS
    data_in_48 <=
    data_in_bit_swapped(255 downto 208) when (current_crc_state = FULL)else
    last_data_in_bit_swapped(191 downto 144) when (current_crc_state = TRAIL_PART_1)else
    last_data_in_bit_swapped(127 downto 80) when (current_crc_state = TRAIL_PART_2)else
    last_data_in_bit_swapped(63 downto 16) when (current_crc_state = TRAIL_PART_3)else
    (others => '0');

    crc_48_0 : crc_48 
    port map( 
        data_in => data_in_48,
        crc_in  => crc_in_tail,
        crc_out => crc_out_int48);

    -- 56 BITS
    data_in_56 <=
    data_in_bit_swapped(255 downto 200) when (current_crc_state = FULL)else
    last_data_in_bit_swapped(191 downto 136) when (current_crc_state = TRAIL_PART_1)else
    last_data_in_bit_swapped(127 downto 72) when (current_crc_state = TRAIL_PART_2)else
    last_data_in_bit_swapped(63 downto 8) when (current_crc_state = TRAIL_PART_3)else
    (others => '0');

    crc_56_0 : crc_56 
    port map( 
        data_in => data_in_56,
        crc_in  => crc_in_tail,
        crc_out => crc_out_int56);
    
    -- 64 BITS
    data_in_64 <=
    data_in_bit_swapped(255 downto 192) when (current_crc_state = FULL)else
    last_data_in_bit_swapped(191 downto 128) when (current_crc_state = TRAIL_PART_1)else
    last_data_in_bit_swapped(127 downto 64) when (current_crc_state = TRAIL_PART_2)else
    last_data_in_bit_swapped(63 downto 0) when (current_crc_state = TRAIL_PART_3)else
    (others => '0');

    crc_64_0 : crc_64 
    port map( 
        data_in => data_in_64,
        crc_in  => crc_in_tail,
        crc_out => crc_out_int64);
    
    -- ADD BIT REVERSAL AND BIT INVERSION
    generate_crc_out_byte_reversal : for b in 0 to 7 generate
                 crc_out_byte_reverse(b) <= not final_crc(7 - b);
                 crc_out_byte_reverse(8 + b) <= not final_crc(15 - b);
                 crc_out_byte_reverse(16 + b) <= not final_crc(23 - b);
                 crc_out_byte_reverse(24 + b) <= not final_crc(31 - b);
    end generate generate_crc_out_byte_reversal;
	
	-- LASTLY, SWAP BYTES
	crc_out(7 downto 0) <= crc_out_byte_reverse(31 downto 24);
	crc_out(15 downto 8) <= crc_out_byte_reverse(23 downto 16);
	crc_out(23 downto 16) <= crc_out_byte_reverse(15 downto 8);
	crc_out(31 downto 24) <= crc_out_byte_reverse(7 downto 0);
	
end arch_ska_mac_rx_crc_multi;
