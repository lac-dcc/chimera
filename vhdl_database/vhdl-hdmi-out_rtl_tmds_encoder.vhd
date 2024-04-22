-- author: Furkan Cayci, 2018
-- description: 8b/10b based tmds encoder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tmds_encoder is
    port (
        clk  : in  std_logic;
        en   : in  std_logic;
        ctrl : in  std_logic_vector(1 downto 0);
        din  : in  std_logic_vector(7 downto 0);
        dout : out std_logic_vector(9 downto 0)
    );
end tmds_encoder;

architecture rtl of tmds_encoder is
    signal n_ones_din : integer range 0 to 8;

    signal xored, xnored : std_logic_vector(8 downto 0);
    signal q_m : std_logic_vector(8 downto 0);

    -- a positive value represents the excess number of 1's that have been transmitted
    -- a negative value represents the excess number of 0's that have been transmitted
    signal disparity : signed(3 downto 0) := to_signed(0, 4);
    -- difference between 1's and 0's (/2 since the last bit is never used)
    signal diff : signed(3 downto 0) := to_signed(0, 4);

begin

    -- ones counter for input data
    process(din) is
        variable c : integer range 0 to 8;
    begin
        c := 0;
        for i in 0 to 7 loop
            if din(i) = '1' then
                c := c + 1;
            end if;
        end loop;
        n_ones_din <= c;
    end process;

    -- create xor encodings
    xored(0) <= din(0);
    encode_xor: for i in 1 to 7 generate
    begin
        xored(i) <= din(i) xor xored(i - 1);
    end generate;
    xored(8) <= '1';

    -- create xnor encodings
    xnored(0) <= din(0);
    encode_xnor: for i in 1 to 7 generate
    begin
        xnored(i) <= din(i) xnor xnored(i - 1);
    end generate;
    xnored(8) <= '0';

    -- use xnored or xored data based on the ones
    q_m <= xnored when n_ones_din > 4 or (n_ones_din = 4 and din(0) = '0') else xored;

    -- ones counter for internal data
    process(q_m) is
        variable c : integer range 0 to 8;
    begin
        c := 0;
        for i in 0 to 7 loop
            if q_m(i) = '1' then
                c := c + 1;
            end if;
        end loop;
        diff <= to_signed(c-4, 4);
    end process;

    process(clk) is
    begin
        if rising_edge(clk) then
            if en = '0' then
                case ctrl is
                    when "00"   => dout <= "1101010100";
                    when "01"   => dout <= "0010101011";
                    when "10"   => dout <= "0101010100";
                    when others => dout <= "1010101011";
                end case;
                disparity <= (others => '0');
             else
                if disparity = 0 or diff = 0 then
                    -- xnored data
                    if q_m(8) = '0' then
                        dout <= "10" & not q_m(7 downto 0);
                        disparity <= disparity - diff;
                    -- xored data
                    else
                        dout <= "01" & q_m(7 downto 0);
                        disparity <= disparity + diff;
                    end if;
                elsif (diff(diff'left) = '0' and disparity(disparity'left) = '0') or
                      (diff(diff'left) = '1' and disparity(disparity'left) = '1') then
                    dout <= '1' & q_m(8) & not q_m(7 downto 0);
                    if q_m(8) = '1' then
                        disparity <= disparity + 1 - diff;
                    else
                        disparity <= disparity - diff;
                    end if;
                else
                    dout <= '0' & q_m;
                    if q_m(8) = '1' then
                        disparity <= disparity + diff;
                    else
                        disparity <= disparity - 1 + diff;
                    end if;
                end if;
             end if;
        end if;
    end process;
end rtl;