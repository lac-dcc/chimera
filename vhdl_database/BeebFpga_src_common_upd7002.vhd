library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity upd7002 is
    port (
        clk        : in  std_logic;
        cpu_clken  : in  std_logic;
        mhz1_clken : in  std_logic;
        reset_n    : in  std_logic;
        cs         : in  std_logic;
        r_nw       : in  std_logic;
        addr       : in  std_logic_vector(1 downto 0);
        di         : in  std_logic_vector(7 downto 0);
        do         : out std_logic_vector(7 downto 0);
        eoc_n      : out std_logic;
        ch0        : in  std_logic_vector(11 downto 0);
        ch1        : in  std_logic_vector(11 downto 0);
        ch2        : in  std_logic_vector(11 downto 0);
        ch3        : in  std_logic_vector(11 downto 0)
    );
end entity;

architecture rtl of upd7002 is

constant convert_time_8bit : integer := 4000;
constant convert_time_12bit : integer := 10000;

signal mux         : std_logic_vector(1 downto 0);
signal mode        : std_logic;
signal flag        : std_logic;
signal value       : std_logic_vector(11 downto 0);
signal busy_n      : std_logic;
signal completed_n : std_logic;
signal counter     : unsigned(13 downto 0);

begin

    process(clk, reset_n)
    begin
        if reset_n = '0' then
            mux          <= (others => '0');
            mode         <= '0';
            flag         <= '0';
            counter      <= (others => '0');
            busy_n       <= '1';
            completed_n  <= '1';
        elsif rising_edge(clk) then
            if cpu_clken = '1' then
                -- Write
                if cs = '1' and r_nw = '0' and addr = "00" then
                    busy_n       <= '0';
                    completed_n  <= '1';
                    mux          <= di(1 downto 0);
                    flag         <= di(2);
                    mode         <= di(3);
                    if di(3) = '0' then
                        counter <= to_unsigned(convert_time_8bit, counter'length);
                    else
                        counter <= to_unsigned(convert_time_12bit, counter'length);
                    end if;
                end if;
            end if;
            if mhz1_clken = '1' then
                if busy_n = '0' then
                    counter <= counter - 1;
                    if counter = 0 then
                        busy_n       <= '1';
                        completed_n  <= '0';
                    end if;
                end if;
            end if;
        end if;
    end process;

    process(cs, r_nw, addr, completed_n, busy_n, value, flag, mode, mux)
    begin
        -- Read
        do <= (others => '0');
        if cs = '1' and r_nw = '1' then
            case addr is
                when "00" =>
                    -- read status
                    do <= completed_n & busy_n & value(11 downto 10) & mode & flag & mux;
                when "01" =>
                    -- read high byte of result
                    do <= value(11 downto 4);
                when "10" =>
                    -- read low byte of result
                    do <= value(3 downto 0) & "0000";
                when others =>
            end case;
        end if;
    end process;


    value <= ch0 when mux = "00" else
             ch1 when mux = "01" else
             ch2 when mux = "10" else
             ch3;
             
    eoc_n <= completed_n;

end architecture rtl;
