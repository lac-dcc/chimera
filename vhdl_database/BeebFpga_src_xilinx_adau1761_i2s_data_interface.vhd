----------------------------------------------------------------------------------
-- Engineer: Mike Field <hamster@snap.net.nz>
--
-- Module Name:    i2s_data_interface - Behavioral
-- Description: Send & Receive I2S data
--              New_sample is asserted for one cycle when a new sample has been
--              received (and one transmitted)
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity i2s_data_interface is
    Port ( clk           : in  STD_LOGIC;
           audio_l_in    : in  STD_LOGIC_VECTOR (23 downto 0);
           audio_r_in    : in  STD_LOGIC_VECTOR (23 downto 0);
           audio_l_out   : out STD_LOGIC_VECTOR (23 downto 0);
           audio_r_out   : out STD_LOGIC_VECTOR (23 downto 0);
           new_sample    : out STD_LOGIC;
           i2s_bclk      : in  STD_LOGIC;
           i2s_d_out     : out STD_LOGIC;
           i2s_d_in      : in  STD_LOGIC;
           i2s_lr        : in  STD_LOGIC);
end i2s_data_interface;

architecture Behavioral of i2s_data_interface is
    signal bit_counter   : unsigned(5 downto 0) := (others => '0');
    signal bclk_delay    : std_logic_vector(9 downto 0)   := (others => '0');
    signal lr_delay      : std_logic_vector(9 downto 0)   := (others => '0');
    signal sr_in         : std_logic_vector(126 downto 0) := (others => '0');
    signal sr_out        : std_logic_vector(63 downto 0)  := (others => '0');
    signal i2s_lr_last   : std_logic := '0';
    signal i2s_d_in_last : std_logic := '0';
begin

    process(clk)
    begin
        -- Process to predict when the falling edge of i2s_bclk should be
        if rising_edge(clk) then
            new_sample <= '0';

            ------------------------------
            -- is there a rising edge two cycles ago? If so the data bit is
            -- validand we can capture a bit
            ------------------------------
            if bclk_delay(bclk_delay'high-1 downto bclk_delay'high-2) = "10" then
                sr_in <= sr_in(sr_in'high-1 downto 0) & i2s_d_in_last;
            end if;

            ------------------------------
            -- Was there a rising edge on BCLK 9 cycles ago?
            -- If so, this should be about the falling edge so
            -- the output can change.
            ------------------------------
            if bclk_delay(1 downto 0) = "10" then
                --i2s_d_out    <= sr_out(sr_out'high);

                -- if we are starting a new frame, then load the samples into the shift register
                if i2s_lr = '1' and i2s_lr_last = '0' then
                    audio_l_out <= sr_in(sr_in'high    downto sr_in'high-23);
                    audio_r_out <= sr_in(sr_in'high-32 downto sr_in'high-23-32);
                    sr_out      <= audio_l_in & x"00" & audio_r_in & x"00";
                    new_sample <= '1';
                else
                    sr_out <= sr_out(sr_out'high-1 downto 0) & '0';
                end if;
                -- remember what lr was, for edge detection
                i2s_lr_last  <= i2s_lr;
            end if;

            -- move out of loop to avoid one extra bit delay
            i2s_d_out    <= sr_out(sr_out'high);

            bclk_delay <= i2s_bclk & bclk_delay(bclk_delay'high downto 1);
            i2s_d_in_last <= i2s_d_in;
        end if;
    end process;
end Behavioral;
