-- --------------------------------------------------------- --
--  SCC test bench                                           --
-- ========================================================= --
--  Copyright (c)2007 t.hara                                 --
-- --------------------------------------------------------- --

library ieee;
use     ieee.std_logic_1164.all;
use     ieee.std_logic_unsigned.all;

entity tb is
end tb;

architecture behavior of tb is

    -- test target
    component scc_wave
        port(
            clk21m      : in    std_logic;
            reset       : in    std_logic;
            clkena      : in    std_logic;
            req         : in    std_logic;
            ack         : out   std_logic;
            wrt         : in    std_logic;
            adr         : in    std_logic_vector( 7 downto 0 );
            dbi         : out   std_logic_vector( 7 downto 0 );
            dbo         : in    std_logic_vector( 7 downto 0 );
            wave        : out   std_logic_vector( 14 downto 0 )
        );
    end component;

    component scc_mix_mul
        port(
            a           : in    std_logic_vector(  8 downto 0 );    -- 9bit ２の補数
            b           : in    std_logic_vector(  2 downto 0 );    -- 3bit バイナリ
            c           : out   std_logic_vector( 11 downto 0 )     -- 12bit ２の補数
        );
    end component;

    constant CYCLE : time := 10 ns;

    signal  clk21m  : std_logic;
    signal  reset   : std_logic;
    signal  clkena  : std_logic;
    signal  req     : std_logic;
    signal  ack     : std_logic;
    signal  wrt     : std_logic;
    signal  adr     : std_logic_vector(7 downto 0);
    signal  dbi     : std_logic_vector(7 downto 0);
    signal  dbo     : std_logic_vector(7 downto 0);
    signal  wave    : std_logic_vector(14 downto 0);

    signal  tb_end  : std_logic := '0';
begin

    --  instance
    u_target: scc_wave
    port map (
        clk21m  => clk21m   ,
        reset   => reset    ,
        clkena  => clkena   ,
        req     => req      ,
        ack     => ack      ,
        wrt     => wrt      ,
        adr     => adr      ,
        dbi     => dbi      ,
        dbo     => dbo      ,
        wave    => wave
    );

    -- ----------------------------------------------------- --
    --  clock generator                                      --
    -- ----------------------------------------------------- --
    process
    begin
        if( tb_end = '1' )then
            wait;
        end if;
        clk21m <= '0';
        wait for 5 ns;
        clk21m <= '1';
        wait for 5 ns;
    end process;

    -- ----------------------------------------------------- --
    --  test bench                                           --
    -- ----------------------------------------------------- --
    process
    begin
        -- init
        clkena  <= '0';
        req     <= '0';
        wrt     <= '0';
        adr     <= (others => '0');
        dbo     <= (others => '0');

        -- reset
        reset <= '1';
        wait until( clk21m'event and clk21m = '1' );
        reset <= '0';
        wait until( clk21m'event and clk21m = '1' );

        -- B800h-B81Fh 波形設定
        adr     <= X"00";       -- B800h
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"80";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"01";       -- B801h
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"90";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"02";       -- B802h
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"A0";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"03";       -- B803h
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"B0";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"04";       -- B804h
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"C0";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"05";       -- B805h
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"D0";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"06";       -- B806h
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"E0";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"07";       -- B807h
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"F0";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"08";       -- B808h
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"F0";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"09";       -- B809h
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"E0";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"0A";       -- B80Ah
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"D0";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"0B";       -- B80Bh
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"C0";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"0C";       -- B80Ch
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"B0";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"0D";       -- B80Dh
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"A0";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"0E";       -- B80Eh
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"90";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"0F";       -- B80Fh
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"80";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"10";       -- B810h
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"80";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"11";       -- B811h
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"70";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"12";       -- B812h
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"60";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"13";       -- B813h
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"50";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"14";       -- B814h
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"40";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"15";       -- B815h
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"30";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"16";       -- B816h
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"20";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"17";       -- B817h
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"10";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"18";       -- B818h
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"10";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"19";       -- B819h
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"20";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"1A";       -- B81Ah
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"30";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"1B";       -- B81Bh
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"40";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"1C";       -- B81Ch
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"50";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"1D";       -- B81Dh
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"60";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"1E";       -- B81Eh
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"70";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"1F";       -- B81Fh
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"80";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        --  B8AAh   音量設定
        adr     <= X"AA";       -- B8AAh
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"0F";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        --  B8AFh   イネーブラ設定
        adr     <= X"AF";       -- B8AFh
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"01";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        --  B8C0h   モード設定
        adr     <= X"C0";       -- B8C0h
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"20";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        --  B8A0h   周波数設定
        adr     <= X"A0";       -- B8A0h
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"08";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        adr     <= X"A1";       -- B8A1h
        req     <= '1';
        wrt     <= '1';
        dbo     <= X"00";
        clkena  <= '1';
        wait until( clk21m'event and clk21m = '1' );
        req     <= '0';
        wrt     <= '0';
        clkena  <= '0';
        for i in 1 to 5 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        for i in 0 to 500 loop
            clkena  <= '1';
            wait until( clk21m'event and clk21m = '1' );
            clkena  <= '0';
            for j in 1 to 5 loop
                wait until( clk21m'event and clk21m = '1' );
            end loop;
        end loop;

        tb_end <= '1';
        wait;
    end process;

end behavior;
