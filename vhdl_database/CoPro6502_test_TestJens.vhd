LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY TestJens IS
END TestJens;

ARCHITECTURE behavior OF TestJens IS

    -- Clock period definitions
    constant clk_period : time := 100 ns;

    signal clk : std_logic := '0';
    signal cpu_RSTn : std_logic := '0';
    signal cpu_addr : std_logic_vector(15 downto 0);
    signal cpu_din : std_logic_vector(7 downto 0);
    signal cpu_dout : std_logic_vector(7 downto 0);
    signal cpu_R_W_n : std_logic;


    type   ram_type is array (65535 downto 0) of std_logic_vector (7 downto 0);
    signal RAM                 : ram_type := (65535 downto 0 => X"00");

BEGIN

    uut: entity work.r65c02_tc PORT MAP(
        clk_clk_i   => clk,
        d_i         => cpu_din,
        irq_n_i     => '1',
        nmi_n_i     => '1',
        rdy_i       => '1',
        rst_rst_n_i => cpu_RSTn,
        so_n_i      => '1',
        a_o         => cpu_addr,
        d_o         => cpu_dout,
        rd_o        => open,
        sync_o      => open,
        wr_n_o      => cpu_R_W_n,
        wr_o        => open
        );



    -- CPU clock on rising edge, so for simplicity lets clock RAM on falling ende
    process (clk)
    begin
        if falling_edge(clk) then
            --if cpu_R_W_n = '0' then
            --    RAM(to_integer(unsigned(cpu_addr))) <= cpu_dout;
            --end if;
            cpu_din <= RAM(to_integer(unsigned(cpu_addr)));
        end if;
    end process;

    -- Clock process definitions
    process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    process
    begin
        wait until falling_edge(clk);
        cpu_RSTn <= '0';

        for i in 0 to 9 loop
            wait until falling_edge(clk);
        end loop;

        -- Initialize RAM with test program
        RAM(16#0000#) <= x"4C";
        RAM(16#0001#) <= x"FE";
        RAM(16#0002#) <= x"10";

        RAM(16#0003#) <= x"4C";
        RAM(16#0004#) <= x"03";
        RAM(16#0005#) <= x"00";

        RAM(16#1000#) <= x"10";

        RAM(16#1003#) <= x"4C";
        RAM(16#1004#) <= x"03";
        RAM(16#1005#) <= x"10";

        RAM(16#10FE#) <= x"4C";
        RAM(16#10FF#) <= x"03";
        RAM(16#1100#) <= x"00";

        RAM(16#FFFE#) <= x"00";
        RAM(16#FFFF#) <= x"00";

        wait until falling_edge(clk);

        cpu_RSTn <= '1';

        for i in 0 to 999 loop
            wait until falling_edge(clk);
        end loop;

        assert false
            report "simulation ended"
            severity failure;


    end process;

END;
