library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.filter_shared_package.all;

entity filter_coeff_controller is
    generic
        (
            MAC_FILTER_CH : natural := MC;    -- MAC operations per channel for Main filter operation
            RMS_CH_EN     : natural := RMS;   -- Enable flag for RMS function.    0-disabled 1- enabled.
            MEAN_CH_EN    : natural := MEAN;  -- Enable flag for MEAN function.    0-disabled 1- enabled.
            CHANNELS      : natural := C
            );
    port
        (
            cnt_mac : in std_logic_vector(natural(ceil(log2(real(MAC_FILTER_CH+RMS_CH_EN+MEAN_CH_EN))))-1 downto 0);
            cnt_ch  : in std_logic_vector(natural(ceil(log2(real(CHANNELS))))-1 downto 0);

            valid : in std_logic;

            coeff_rdaddr : out COEFF_ADD_T;
            coeff_rden   : out std_logic
            );
end filter_coeff_controller;


architecture behaviour of filter_coeff_controller is
begin

    -- read interface
    coeff_rdaddr <= std_logic_vector(resize(unsigned(cnt_mac) * to_unsigned(CHANNELS,cnt_ch'length), coeff_rdaddr'length) + unsigned(cnt_ch));
    coeff_rden   <= valid;
    
end behaviour;
