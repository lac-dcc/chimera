-- --------------------------------------------------------- --
--  scc_interpo test bench                                   --
-- ========================================================= --
--  Copyright (c)2007 t.hara                                 --
-- --------------------------------------------------------- --

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.std_logic_arith.all;

entity tb is
end tb;

architecture behavior of tb is

    -- test target
    component scc_interpo
        port(
            reset       : in    std_logic;                          -- 非同期リセット
            clk         : in    std_logic;                          -- ベースクロック
            clkena      : in    std_logic;                          -- クロックイネーブラ
            clear       : in    std_logic;                          -- 同期リセット
            left        : in    std_logic_vector(  7 downto 0 );    -- 補間左側サンプル
            right       : in    std_logic_vector(  7 downto 0 );    -- 補間右側サンプル
            wave        : out   std_logic_vector(  7 downto 0 );    -- 出力サンプル
            reg_en      : in    std_logic;                          -- 補間有効/無効
            reg_th1     : in    std_logic_vector(  7 downto 0 );    -- 閾値1
            reg_th2     : in    std_logic_vector(  7 downto 0 );    -- 閾値2
            reg_th3     : in    std_logic_vector(  7 downto 0 );    -- 閾値3
            reg_cnt     : in    std_logic_vector( 11 downto 0 )     -- 分周比
        );
    end component;

    constant CYCLE : time := 10 ns;

    signal reset        : std_logic;
    signal clk          : std_logic;
    signal clkena       : std_logic;
    signal clear        : std_logic;
    signal left         : std_logic_vector(  7 downto 0 );
    signal right        : std_logic_vector(  7 downto 0 );
    signal wave         : std_logic_vector(  7 downto 0 );
    signal reg_en       : std_logic;
    signal reg_th1      : std_logic_vector(  7 downto 0 );
    signal reg_th2      : std_logic_vector(  7 downto 0 );
    signal reg_th3      : std_logic_vector(  7 downto 0 );
    signal reg_cnt      : std_logic_vector( 11 downto 0 );

    signal  tb_clkcnt       : integer := 0;
    signal  tb_clkcnt_clr   : std_logic := '1';
    signal  tb_end          : std_logic := '0';
begin

    --  instance
    u_target: scc_interpo
    port map(
        reset       => reset    ,
        clk         => clk      ,
        clkena      => clkena   ,
        clear       => clear    ,
        left        => left     ,
        right       => right    ,
        wave        => wave     ,
        reg_en      => reg_en   ,
        reg_th1     => reg_th1  ,
        reg_th2     => reg_th2  ,
        reg_th3     => reg_th3  ,
        reg_cnt     => reg_cnt
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

    process( clk )
    begin
        if( clk'event and clk = '1' )then
            if( tb_clkcnt_clr = '1' )then
                tb_clkcnt <= 0;
            elsif( clkena = '1' )then
                tb_clkcnt <= tb_clkcnt + 1;
            end if;
        end if;
    end process;

    -- ----------------------------------------------------- --
    --  test bench                                           --
    -- ----------------------------------------------------- --
    process
    begin
        -- init
        clkena  <= '0';
        clear   <= '0';
        reset   <= '1';
        reg_en  <= '1';
        reg_th1 <= conv_std_logic_vector(  32, reg_th1'high + 1 );
        reg_th2 <= conv_std_logic_vector(  64, reg_th2'high + 1 );
        reg_th3 <= conv_std_logic_vector( 128, reg_th3'high + 1 );
        reg_cnt <= conv_std_logic_vector( 500, reg_cnt'high + 1 );
        left    <= conv_std_logic_vector( 0, left'high  + 1 );
        right   <= conv_std_logic_vector( 0, right'high + 1 );

        -- reset
        wait until( clk'event and clk = '1' );
        wait until( clk'event and clk = '1' );
        reset <= '0';

        -- 差が +5 の場合
        clear           <= '1';
        clkena          <= '1';
        wait until( clk'event and clk = '1' );

        left            <= conv_std_logic_vector( 40     , left'high  + 1 );
        right           <= conv_std_logic_vector( 40 +  5, right'high + 1 );
        clear   <= '0';
        tb_clkcnt_clr   <= '0';
        for i in 0 to 500 loop
            wait until( clk'event and clk = '1' );
        end loop;
        tb_clkcnt_clr   <= '1';

        -- 差が -5 の場合
        clear           <= '1';
        clkena          <= '1';
        wait until( clk'event and clk = '1' );

        left            <= conv_std_logic_vector( 40 +  5, left'high  + 1 );
        right           <= conv_std_logic_vector( 40     , right'high + 1 );
        clear   <= '0';
        tb_clkcnt_clr   <= '0';
        for i in 0 to 500 loop
            wait until( clk'event and clk = '1' );
        end loop;
        tb_clkcnt_clr   <= '1';

        -- 差が +10 の場合
        clear           <= '1';
        clkena          <= '1';
        wait until( clk'event and clk = '1' );

        left            <= conv_std_logic_vector( 40     , left'high  + 1 );
        right           <= conv_std_logic_vector( 40 + 10, right'high + 1 );
        clear   <= '0';
        tb_clkcnt_clr   <= '0';
        for i in 0 to 500 loop
            wait until( clk'event and clk = '1' );
        end loop;
        tb_clkcnt_clr   <= '1';

        -- 差が -10 の場合
        clear           <= '1';
        clkena          <= '1';
        wait until( clk'event and clk = '1' );

        left            <= conv_std_logic_vector( 40 + 10, left'high  + 1 );
        right           <= conv_std_logic_vector( 40     , right'high + 1 );
        clear   <= '0';
        tb_clkcnt_clr   <= '0';
        for i in 0 to 500 loop
            wait until( clk'event and clk = '1' );
        end loop;
        tb_clkcnt_clr   <= '1';

        -- 差が +20 の場合
        clear           <= '1';
        clkena          <= '1';
        wait until( clk'event and clk = '1' );

        left            <= conv_std_logic_vector( 40     , left'high  + 1 );
        right           <= conv_std_logic_vector( 40 + 20, right'high + 1 );
        clear   <= '0';
        tb_clkcnt_clr   <= '0';
        for i in 0 to 500 loop
            wait until( clk'event and clk = '1' );
        end loop;
        tb_clkcnt_clr   <= '1';

        -- 差が -20 の場合
        clear           <= '1';
        clkena          <= '1';
        wait until( clk'event and clk = '1' );

        left            <= conv_std_logic_vector( 40 + 20, left'high  + 1 );
        right           <= conv_std_logic_vector( 40     , right'high + 1 );
        clear   <= '0';
        tb_clkcnt_clr   <= '0';
        for i in 0 to 500 loop
            wait until( clk'event and clk = '1' );
        end loop;
        tb_clkcnt_clr   <= '1';

        -- 差が +50 の場合
        clear           <= '1';
        clkena          <= '1';
        wait until( clk'event and clk = '1' );

        left            <= conv_std_logic_vector( 40     , left'high  + 1 );
        right           <= conv_std_logic_vector( 40 + 50, right'high + 1 );
        clear   <= '0';
        tb_clkcnt_clr   <= '0';
        for i in 0 to 500 loop
            wait until( clk'event and clk = '1' );
        end loop;
        tb_clkcnt_clr   <= '1';

        -- 差が -50 の場合
        clear           <= '1';
        clkena          <= '1';
        wait until( clk'event and clk = '1' );

        left            <= conv_std_logic_vector( 40 + 50, left'high  + 1 );
        right           <= conv_std_logic_vector( 40     , right'high + 1 );
        clear   <= '0';
        tb_clkcnt_clr   <= '0';
        for i in 0 to 500 loop
            wait until( clk'event and clk = '1' );
        end loop;
        tb_clkcnt_clr   <= '1';

        -- 差が +70 の場合
        clear           <= '1';
        clkena          <= '1';
        wait until( clk'event and clk = '1' );

        left            <= conv_std_logic_vector( 40     , left'high  + 1 );
        right           <= conv_std_logic_vector( 40 + 70, right'high + 1 );
        clear   <= '0';
        tb_clkcnt_clr   <= '0';
        for i in 0 to 500 loop
            wait until( clk'event and clk = '1' );
        end loop;
        tb_clkcnt_clr   <= '1';

        -- 差が -70 の場合
        clear           <= '1';
        clkena          <= '1';
        wait until( clk'event and clk = '1' );

        left            <= conv_std_logic_vector( 40 + 70, left'high  + 1 );
        right           <= conv_std_logic_vector( 40     , right'high + 1 );
        clear   <= '0';
        tb_clkcnt_clr   <= '0';
        for i in 0 to 500 loop
            wait until( clk'event and clk = '1' );
        end loop;
        tb_clkcnt_clr   <= '1';

        -- 40 → -80 へ連絡
        clear           <= '1';
        clkena          <= '1';
        wait until( clk'event and clk = '1' );

        left            <= conv_std_logic_vector( 40      , left'high  + 1 );
        right           <= conv_std_logic_vector( 256 - 80, right'high + 1 );   --  -80 の意味
        clear   <= '0';
        tb_clkcnt_clr   <= '0';
        for i in 0 to 500 loop
            wait until( clk'event and clk = '1' );
        end loop;
        tb_clkcnt_clr   <= '1';

        -- 差が +160 の場合
        clear           <= '1';
        clkena          <= '1';
        wait until( clk'event and clk = '1' );

        left            <= conv_std_logic_vector( 256 - 80, left'high  + 1 );   --  -80 の意味
        right           <= conv_std_logic_vector(       80, right'high + 1 );
        clear   <= '0';
        tb_clkcnt_clr   <= '0';
        for i in 0 to 500 loop
            wait until( clk'event and clk = '1' );
        end loop;
        tb_clkcnt_clr   <= '1';

        -- 差が -160 の場合
        clear           <= '1';
        clkena          <= '1';
        wait until( clk'event and clk = '1' );

        left            <= conv_std_logic_vector(       80, right'high + 1 );
        right           <= conv_std_logic_vector( 256 - 80, left'high  + 1 );   --  -80 の意味
        clear   <= '0';
        tb_clkcnt_clr   <= '0';
        for i in 0 to 500 loop
            wait until( clk'event and clk = '1' );
        end loop;
        tb_clkcnt_clr   <= '1';

        -- -80 → -100 へ連絡
        clear           <= '1';
        clkena          <= '1';
        wait until( clk'event and clk = '1' );

        left            <= conv_std_logic_vector( 256 - 80, right'high + 1 );   --  -80 の意味
        right           <= conv_std_logic_vector( 256 -100, left'high  + 1 );   --  -100 の意味
        clear   <= '0';
        tb_clkcnt_clr   <= '0';
        for i in 0 to 500 loop
            wait until( clk'event and clk = '1' );
        end loop;
        tb_clkcnt_clr   <= '1';

        -- 差が +200 の場合
        clear           <= '1';
        clkena          <= '1';
        wait until( clk'event and clk = '1' );

        left            <= conv_std_logic_vector( 256 -100, left'high  + 1 );   --  -100 の意味
        right           <= conv_std_logic_vector(      100, right'high + 1 );
        clear   <= '0';
        tb_clkcnt_clr   <= '0';
        for i in 0 to 500 loop
            wait until( clk'event and clk = '1' );
        end loop;
        tb_clkcnt_clr   <= '1';

        -- 差が -200 の場合
        clear           <= '1';
        clkena          <= '1';
        wait until( clk'event and clk = '1' );

        left            <= conv_std_logic_vector(      100, right'high + 1 );
        right           <= conv_std_logic_vector( 256 -100, left'high  + 1 );   --  -100 の意味
        clear   <= '0';
        tb_clkcnt_clr   <= '0';
        for i in 0 to 500 loop
            wait until( clk'event and clk = '1' );
        end loop;
        tb_clkcnt_clr   <= '1';

        -- -100 → 40 へ連絡
        clear           <= '1';
        clkena          <= '1';
        wait until( clk'event and clk = '1' );

        left            <= conv_std_logic_vector( 256 -100, left'high  + 1 );   --  -100 の意味
        right           <= conv_std_logic_vector( 40     , left'high  + 1 );
        clear   <= '0';
        tb_clkcnt_clr   <= '0';
        for i in 0 to 500 loop
            wait until( clk'event and clk = '1' );
        end loop;
        tb_clkcnt_clr   <= '1';

        -- 差が +20 の場合に、突然波形の右側が変化した場合
        clear           <= '1';
        clkena          <= '1';
        wait until( clk'event and clk = '1' );

        left            <= conv_std_logic_vector( 40     , left'high  + 1 );
        right           <= conv_std_logic_vector( 40 + 20, right'high + 1 );
        clear   <= '0';
        tb_clkcnt_clr   <= '0';
        for i in 0 to 200 loop
            wait until( clk'event and clk = '1' );
        end loop;

        right           <= conv_std_logic_vector( 40 - 20, right'high + 1 );
        for i in 0 to 300 loop
            wait until( clk'event and clk = '1' );
        end loop;
        tb_clkcnt_clr   <= '1';

        tb_end <= '1';
        wait;
    end process;

end behavior;
