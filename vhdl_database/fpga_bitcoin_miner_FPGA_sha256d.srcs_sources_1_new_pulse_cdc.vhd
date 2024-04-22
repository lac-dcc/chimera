----------------------------------------------------------------------------------
-- Richie Harris
-- rkharris12@gmail.com
-- 5/23/2021
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity pulse_cdc is
    port (
        CLK_IN     : in  std_logic;
        ARST_IN_N  : in  std_logic;
        CLK_OUT    : in  std_logic;
        ARST_OUT_N : in  std_logic;
        DIN        : in  std_logic;
        DOUT       : out std_logic
    );
end pulse_cdc;

architecture rtl of pulse_cdc is

    signal toggle    : std_logic;
    signal toggle_sr : std_logic_vector(3 downto 0);

begin

    -- input toggle
    process(CLK_IN, ARST_IN_N) begin
        if (ARST_IN_N = '0') then
            toggle <= '0';
        elsif rising_edge(CLK_IN) then
            toggle <= toggle xor DIN;
        end if;
    end process;

    -- toggle resync
    process(CLK_OUT, ARST_OUT_N) begin
        if (ARST_OUT_N = '0') then
            toggle_sr <= (others => '0');
        elsif rising_edge(CLK_OUT) then
            toggle_sr <= toggle_sr(toggle_sr'high - 1 downto 0) & toggle;
        end if;
    end process;

    -- output pulse
    DOUT <= toggle_sr(toggle_sr'high) xor toggle_sr(toggle_sr'high - 1);

end rtl;
