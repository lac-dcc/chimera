library IEEE;
use IEEE.std_logic_1164.all;

use work.types.all;
use work.constants.all;


entity display_buffers is
    port (
        clk_write: in std_logic;
        en_write: in std_logic;
        we_write: in std_logic_vector(0 downto 0);
        addr_write: in std_logic_vector(16 downto 0);
        din_write: in std_logic_vector(11 downto 0);
        clk_read: in std_logic;
        en_read: in std_logic;
        addr_read: in std_logic_vector(16 downto 0);
        dout_read: out std_logic_vector(11 downto 0);
        clk_ppl, rst, enable: in std_logic;
        swap_sync: in std_logic
    );
end entity;


architecture Behavioral of display_buffers is
    component display_ram is
        port (
            clka: in std_logic;
            ena: in std_logic;
            wea: in std_logic_vector(0 downto 0);
            addra: in std_logic_vector(16 downto 0);
            dina: in std_logic_vector(11 downto 0);
            clkb: in std_logic;
            enb: in std_logic;
            addrb: in std_logic_vector(16 downto 0);
            doutb: out std_logic_vector(11 downto 0)
        );
    end component;

    signal mode, mode_next: std_logic;  -- which one is the displaying buffer (reading)
    signal clka_0, clka_1, clkb_0, clkb_1: std_logic;
    signal ena_0, ena_1, enb_0, enb_1: std_logic;
    signal wea_0, wea_1: std_logic_vector(0 downto 0);
    signal addra_0, addra_1, addrb_0, addrb_1: std_logic_vector(16 downto 0);
    signal dina_0, dina_1, doutb_0, doutb_1: std_logic_vector(11 downto 0);
begin
    disp_ram_0: display_ram
        port map (
            clka => clka_0,
            ena => ena_0,
            wea => wea_0,
            addra => addra_0,
            dina => dina_0,
            clkb => clkb_0,
            enb => enb_0,
            addrb => addrb_0,
            doutb => doutb_0
        );
    
    disp_ram_1: display_ram
        port map (
            clka => clka_1,
            ena => ena_1,
            wea => wea_1,
            addra => addra_1,
            dina => dina_1,
            clkb => clkb_1,
            enb => enb_1,
            addrb => addrb_1,
            doutb => doutb_1
        );

    clka_0 <= '0'               when mode = '0' else clk_write;
    ena_0 <= '0'                when mode = '0' else en_write;
    wea_0 <= "0"                when mode = '0' else we_write;
    addra_0 <= (others => '0')  when mode = '0' else addr_write;
    dina_0 <= (others => '0')   when mode = '0' else din_write;
    clkb_0 <= clk_read          when mode = '0' else '0';
    enb_0 <= en_read            when mode = '0' else '0';
    addrb_0 <= addr_read        when mode = '0' else (others => '0');

    clka_1 <= clk_write         when mode = '0' else '0';
    ena_1 <= en_write           when mode = '0' else '0';
    wea_1 <= we_write           when mode = '0' else "0";
    addra_1 <= addr_write       when mode = '0' else (others => '0');
    dina_1 <= din_write         when mode = '0' else (others => '0');
    clkb_1 <= '0'               when mode = '0' else clk_read;
    enb_1 <= '0'                when mode = '0' else en_read;
    addrb_1 <= (others => '0')  when mode = '0' else addr_read;

    dout_read <= doutb_0        when mode = '0' else doutb_1;

    process (clk_ppl, rst) is
    begin
        if rst = '1' then
            mode <= '0';
        elsif rising_edge(clk_ppl) and enable = '1' then
            mode <= mode_next;
        end if;
    end process;
    mode_next <= not mode when swap_sync = '1' else mode;
end architecture;
