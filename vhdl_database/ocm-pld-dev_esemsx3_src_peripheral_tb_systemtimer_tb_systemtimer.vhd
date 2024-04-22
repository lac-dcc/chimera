-- --------------------------------------------------------- --
--  system timer test bench                                  --
-- ========================================================= --
--  Copyright (c)2006 t.hara                                 --
-- --------------------------------------------------------- --

library ieee;
use     ieee.std_logic_1164.all;
use     ieee.std_logic_unsigned.all;

entity tb is
end tb;

architecture behavior of tb is

    -- test target
    component system_timer
        port(
            clk21m  : in    std_logic;
            reset   : in    std_logic;
            req     : in    std_logic;
            ack     : out   std_logic;
            wrt     : in    std_logic;
            adr     : in    std_logic_vector( 15 downto 0 );
            dbi     : out   std_logic_vector(  7 downto 0 );
            dbo     : in    std_logic_vector(  7 downto 0 )
        );
    end component;

    constant CYCLE : time := 10 ns;

    signal  clk21m  : std_logic;
    signal  reset   : std_logic;
    signal  req     : std_logic;
    signal  ack     : std_logic;
    signal  wrt     : std_logic;
    signal  adr     : std_logic_vector(15 downto 0);
    signal  dbi     : std_logic_vector(7 downto 0);
    signal  dbo     : std_logic_vector(7 downto 0);

    signal  tb_end  : std_logic := '0';
begin

    --  instance
    u_target: system_timer
    port map(
        clk21m  => clk21m   ,
        reset   => reset    ,
        req     => req      ,
        ack     => ack      ,
        wrt     => wrt      ,
        adr     => adr      ,
        dbi     => dbi      ,
        dbo     => dbo
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
        req     <= '0';
        wrt     <= '0';
        adr     <= (others => '0');
        dbo     <= (others => '0');

        -- reset
        reset   <= '1';
        wait until( clk21m'event and clk21m = '1' );
        reset   <= '0';
        wait until( clk21m'event and clk21m = '1' );

        -- read E6h
        adr     <= "0000000011100110";
        req     <= '1';
        wrt     <= '0';
        wait until( clk21m'event and clk21m = '1' );

        req     <= '0';
        wrt     <= '0';
        wait until( clk21m'event and clk21m = '1' );

        -- read E7h
        adr     <= "0000000011100111";
        req     <= '1';
        wrt     <= '0';
        wait until( clk21m'event and clk21m = '1' );

        req     <= '0';
        wrt     <= '0';
        wait until( clk21m'event and clk21m = '1' );

        for i in 0 to 10 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        -- write E6h
        adr     <= "0000000011100110";
        req     <= '1';
        wrt     <= '1';
        dbo     <= "01010101";
        wait until( clk21m'event and clk21m = '1' );

        req     <= '0';
        wrt     <= '0';
        dbo     <= "00000000";
        wait until( clk21m'event and clk21m = '1' );

        for i in 0 to 10 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        -- write E7h
        adr     <= "0000000011100111";
        req     <= '1';
        wrt     <= '1';
        dbo     <= "00010010";
        wait until( clk21m'event and clk21m = '1' );

        req     <= '0';
        wrt     <= '0';
        dbo     <= "00000000";
        wait until( clk21m'event and clk21m = '1' );

        for i in 0 to 10 loop
            wait until( clk21m'event and clk21m = '1' );
        end loop;

        -- wait
        tb_end <= '1';
        wait;
    end process;

end behavior;
