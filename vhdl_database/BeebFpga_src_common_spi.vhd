library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity SPI_Port is
    port (
        nRST    : in  std_logic;
        clk     : in  std_logic;
        clken   : in  std_logic;
        enable  : in  std_logic;
        nwe     : in  std_logic;
        datain  : in  std_logic_vector (7 downto 0);
        dataout : out std_logic_vector (7 downto 0);
        SDMISO  : in  std_logic;
        SDMOSI  : out std_logic;
        SDSS    : out std_logic;
        SDCLK   : out std_logic
        );
end SPI_Port;

architecture Behavioral of SPI_Port is
    type STATE_TYPE is (init, s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17);
    signal state     : STATE_TYPE;
    signal SerialOut : std_logic_vector(7 downto 0);
    signal SerialIn  : std_logic_vector(7 downto 0);
    signal count  : std_logic_vector(12 downto 0);
begin

--------------------------------------------------------------
-- Process Copies SPI port word to appropriate ctrl register
--------------------------------------------------------------
    SPIport : process (nRST, clk, SerialOut, SerialIn)
    begin

        if nRST = '0' then

            state     <= init;
            SDSS      <= '1';
            SDMOSI    <= '1';
            SDCLK     <= '0';
            SerialOut <= (others => '1');
            count     <= (others => '0');

        elsif rising_edge(clk) then

            if clken = '1' then
                if (state = init) then
                    if (count = 5663) then -- 88 * 64 + 31
                        state <= s0;
                        SDCLK <= '0';
                        SDSS  <= '0';
                    else
                        SDCLK <= count(5); -- 250 KHz
                        count <= count + 1;
                    end if;

                elsif enable = '1' and nwe = '0' and state = s0 then

                    SerialOut <= datain;
                    state <= s1;

                else
                    -- SD Operates in Mode 0
                    --    - Idle clock is low
                    --    - Receiver latches data on rising edge
                    --    - Transmitter shifts data on falling edge
                    case state is
                        when s1     => state <=  s2; SDCLK <= '0'; SDMOSI <= SerialOut(7);
                        when s2     => state <=  s3; SDCLK <= '1'; SerialIn(7) <= SDMISO;    -- Latch on rising edge
                        when s3     => state <=  s4; SDCLK <= '0'; SDMOSI <= SerialOut(6);   -- Shift on falling edge
                        when s4     => state <=  s5; SDCLK <= '1'; SerialIn(6) <= SDMISO;
                        when s5     => state <=  s6; SDCLK <= '0'; SDMOSI <= SerialOut(5);
                        when s6     => state <=  s7; SDCLK <= '1'; SerialIn(5) <= SDMISO;
                        when s7     => state <=  s8; SDCLK <= '0'; SDMOSI <= SerialOut(4);
                        when s8     => state <=  s9; SDCLK <= '1'; SerialIn(4) <= SDMISO;
                        when s9     => state <= s10; SDCLK <= '0'; SDMOSI <= SerialOut(3);
                        when s10    => state <= s11; SDCLK <= '1'; SerialIn(3) <= SDMISO;
                        when s11    => state <= s12; SDCLK <= '0'; SDMOSI <= SerialOut(2);
                        when s12    => state <= s13; SDCLK <= '1'; SerialIn(2) <= SDMISO;
                        when s13    => state <= s14; SDCLK <= '0'; SDMOSI <= SerialOut(1);
                        when s14    => state <= s15; SDCLK <= '1'; SerialIn(1) <= SDMISO;
                        when s15    => state <= s16; SDCLK <= '0'; SDMOSI <= SerialOut(0);
                        when s16    => state <= s17; SDCLK <= '1'; SerialIn(0) <= SDMISO;
                        when s17    => state <= s0;  SDCLK <= '0'; SDMOSI <= '0';
                        when others => state <= s0;
                    end case;
                end if;

                dataout <= SerialIn;

            end if;
        end if;
    end process;

end Behavioral;
