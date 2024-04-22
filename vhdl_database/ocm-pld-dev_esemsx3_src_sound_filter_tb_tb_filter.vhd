-- --------------------------------------------------------- --
--  filter test bench                                        --
-- ========================================================= --
--  Copyright (c)2007 t.hara                                 --
-- --------------------------------------------------------- --

library ieee;
use     ieee.std_logic_1164.all;
use     ieee.std_logic_unsigned.all;
use     ieee.std_logic_arith.all;

entity tb is
end tb;

architecture behavior of tb is

    -- test target
    component esefir5
      generic (
        MSBI : integer
      );
      port (
        clk    : in std_logic;
        reset  : in std_logic;
        wavin  : in std_logic_vector ( MSBI downto 0 );
        wavout : out std_logic_vector ( MSBI downto 0 )
      );
    end component;

    constant CYCLE : time := 10 ns;

    signal clk    : std_logic;
    signal reset  : std_logic;
    signal wavin  : std_logic_vector ( 11 downto 0 );
    signal wavout : std_logic_vector ( 11 downto 0 );

    signal  tb_end  : std_logic := '0';
begin

    --  instance
    u_target: esefir5
    generic map (
        MSBI    =>  11
    )
    port map (
        clk    => clk    ,
        reset  => reset  ,
        wavin  => wavin  ,
        wavout => wavout
    );

    -- ----------------------------------------------------- --
    --  clock generator                                      --
    -- ----------------------------------------------------- --
    process
    begin
        if( tb_end = '1' )then
            wait;
        end if;
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;

    -- ----------------------------------------------------- --
    --  test bench                                           --
    -- ----------------------------------------------------- --
    process
    begin
        -- init
        wavin  <= (others => '0');

        -- reset
        reset <= '1';
        for I in 0 to 4 loop
            wait until( clk'event and clk = '1');
        end loop;
        reset <= '0';
        wait until( clk'event and clk = '1');

        -- tapram に インクリメント値を詰める
        for J in 0 to 12 loop
            wavin <= conv_std_logic_vector( J, 12 );
            for I in 0 to 5 loop
                wait until( clk'event and clk = '1');
            end loop;
        end loop;

        -- tapram に 0 が詰まるのを待つ
        wavin <= (others => '0');
        for J in 0 to 6 loop
            for I in 0 to 5 loop
                wait until( clk'event and clk = '1');
            end loop;
        end loop;

        -- インパルス応答を見る
        wavin <= (others => '1');
        for I in 0 to 5 loop
            wait until( clk'event and clk = '1');
        end loop;

        wavin <= (others => '0');
        for J in 0 to 6 loop
            for I in 0 to 5 loop
                wait until( clk'event and clk = '1');
            end loop;
        end loop;

        -- wait
        for J in 0 to 10 loop
            for I in 0 to 5 loop
                wait until( clk'event and clk = '1');
            end loop;
        end loop;

        -- 矩形応答を見る
        wavin <= (others => '1');
        for J in 0 to 6 loop
            for I in 0 to 5 loop
                wait until( clk'event and clk = '1');
            end loop;
        end loop;

        -- wait
        wavin <= (others => '0');
        for J in 0 to 10 loop
            for I in 0 to 5 loop
                wait until( clk'event and clk = '1');
            end loop;
        end loop;

        -- ランダム応答を見る
        wavin <= (others => '1');
        for I in 0 to 5 loop
            wait until( clk'event and clk = '1');
        end loop;

        wavin <= (others => '0');
        for J in 0 to 2 loop
            for I in 0 to 5 loop
                wait until( clk'event and clk = '1');
            end loop;
        end loop;

        wavin <= (others => '1');
        for I in 0 to 5 loop
            wait until( clk'event and clk = '1');
        end loop;

        wavin <= (others => '0');
        for J in 0 to 1 loop
            for I in 0 to 5 loop
                wait until( clk'event and clk = '1');
            end loop;
        end loop;

        wavin <= (others => '1');
        for I in 0 to 5 loop
            wait until( clk'event and clk = '1');
        end loop;

        wavin <= (others => '0');
        for J in 0 to 3 loop
            for I in 0 to 5 loop
                wait until( clk'event and clk = '1');
            end loop;
        end loop;

        wavin <= (others => '1');
        for I in 0 to 5 loop
            wait until( clk'event and clk = '1');
        end loop;

        wavin <= (others => '0');
        for J in 0 to 10 loop
            for I in 0 to 5 loop
                wait until( clk'event and clk = '1');
            end loop;
        end loop;

        tb_end <= '1';
        wait;
    end process;

end behavior;
