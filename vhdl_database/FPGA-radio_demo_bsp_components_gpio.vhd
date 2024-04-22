library ieee;
use ieee.std_logic_1164.all;

entity GPIO is
    port(

        CLK : std_logic;
        RST : std_logic;

        DATA_IN : out std_logic_vector(31 downto 0);
        DATA_IN_STB : out std_logic;
        DATA_IN_ACK : in std_logic;
        DATA_OUT : in std_logic_vector(31 downto 0);
        DATA_OUT_STB : in std_logic;
        DATA_OUT_ACK : out std_logic;
        DATA_EN : in std_logic_vector(31 downto 0);
        DATA_EN_STB : in std_logic;
        DATA_EN_ACK : out std_logic;

        DATA : inout std_logic_vector(31 downto 0)

    );
end entity GPIO;

architecture RTL of GPIO is
    signal S_DATA_IN : std_logic_vector(31 downto 0);
    signal S_DATA_OUT : std_logic_vector(31 downto 0);
    signal S_DATA_EN : std_logic_vector(31 downto 0);
    signal DATA_DEL : std_logic_vector(31 downto 0);
    signal DATA_DEL_DEL : std_logic_vector(31 downto 0);
begin

    process
    begin
        wait until rising_edge(CLK);
        DATA_IN <= DATA_DEL_DEL;
        DATA_DEL_DEL <= DATA_DEL;
        DATA_DEL <= DATA;

        if DATA_EN_STB = '1' then
           S_DATA_EN <= DATA_EN;
        end if;

        if DATA_OUT_STB = '1' then
           S_DATA_OUT <= DATA_OUT;
        end if;

        if RST = '1' then
            S_DATA_OUT <= (others => '0');
            S_DATA_EN <= (others => '0');
        end if;

    end process;

    GENERATE_TRISTATES : for I in 0 to 31 generate
        DATA(I) <= S_DATA_OUT(I) when S_DATA_EN(I) = '1' else 'Z';
    end generate;

    DATA_IN_STB <= '1';
    DATA_OUT_ACK <= '1';
    DATA_EN_ACK <= '1';

end architecture RTL;
