----------------------------------------------------------------------------------
-- Company:
-- Engineer: David Banks
--
-- Create Date:    13:11:42 11/15/2014
-- Design Name:
-- Module Name:    Music5000 - Behavioral
-- Project Name:
-- Target Devices:
-- Tool versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Music5000 is
    generic (
        sumwidth : integer := 20;
        dacwidth : integer := 16;
        id       : std_logic_vector(3 downto 0) := "0011"
    );
    port (
        -- This is the cpu clock
        clk      : in     std_logic;
        clken    : in     std_logic;
        -- This is the 6MHz audio clock
        clk6     : in     std_logic;
        clk6en   : in     std_logic;
        rnw      : in     std_logic;
        rst_n    : in     std_logic;
        pgfc_n   : in     std_logic;
        pgfd_n   : in     std_logic;
        a        : in     std_logic_vector (7 downto 0);
        din      : in     std_logic_vector (7 downto 0);
        dout     : out    std_logic_vector (7 downto 0);
        dout_oel : out    std_logic;
        audio_l  : out    std_logic_vector (dacwidth - 1 downto 0);
        audio_r  : out    std_logic_vector (dacwidth - 1 downto 0);
        cycle    : out    std_logic_vector (6 downto 0);
        test     : out    std_logic
    );
end Music5000;

architecture Behavioral of Music5000 is

signal sum : std_logic_vector (8 downto 0);
signal sum1 : std_logic_vector (7 downto 0);
signal aa : std_logic_vector (7 downto 0);
signal bb : std_logic_vector (7 downto 0);

signal ram_clk : std_logic;
signal ram_din : std_logic_vector (7 downto 0);
signal ram_dout : std_logic_vector (7 downto 0);
signal ram_addr : std_logic_vector (10 downto 0);
signal ram_we : std_logic;
signal wave_dout : std_logic_vector (7 downto 0);
signal wave_dout_int : std_logic_vector (7 downto 0);
signal wave_addr : std_logic_vector (10 downto 0);

signal phase_we : std_logic;
signal phase_addr : std_logic_vector (10 downto 0);
signal phase_dout : std_logic_vector (7 downto 0);
signal phase_dout_int : std_logic_vector (7 downto 0);

signal addr : std_logic_vector (6 downto 0);
signal pa   : std_logic_vector (2 downto 1);

signal s0_n : std_logic;
signal s1_n : std_logic;
signal s4_n : std_logic;
signal s6_n : std_logic;
signal s7_n : std_logic;
signal sx_n : std_logic;
signal index : std_logic;
signal invert : std_logic;
signal c0 : std_logic_vector(0 downto 0);
signal c4 : std_logic;
signal c4tmp : std_logic;
signal c4d : std_logic;
signal sign : std_logic;
signal gate_n: std_logic;
signal load : std_logic;

signal dac_input_log : std_logic_vector (6 downto 0);
signal dac_input_lin : std_logic_vector (12 downto 0);
signal dac_input_lin_l : unsigned (sumwidth - 1 downto 0);
signal dac_input_lin_r : unsigned(sumwidth - 1 downto 0);
signal dac_pos : std_logic_vector (3 downto 0);
signal dac_sign : std_logic;
signal dac_sb : std_logic;
signal dac_ed : std_logic;

signal reg_s0 : std_logic_vector (2 downto 0);
signal reg_s4 : std_logic_vector (3 downto 0);

-- bits of address fcff
signal wrg : std_logic;
signal bank : std_logic_vector(2 downto 0);
signal spare : std_logic;

begin

    ------------------------------------------------
    -- Bus Interface
    ------------------------------------------------

    bus_interface_fc : process(clk)
    begin
        if rising_edge(clk) then
            if clken = '1' then
                if (pgfc_n = '0' and a = "11111111" and rnw = '0') then
                    if (din(7 downto 4) = id) then
                        wrg <= '1';
                    else
                        wrg <= '0';
                    end if;
                    bank <= din(3 downto 1);
                    spare <= din(0);
                end if;
            end if;
        end if;
    end process;

    dout <= (id & bank & spare) xor x"FF" when pgfc_n = '0' and rnw = '1' else
            ram_dout                      when pgfd_n = '0' and rnw = '1' else
            (others => '0');

    dout_oel <= '0' when rnw = '1' and pgfc_n = '0' and wrg = '1' and a = "11111111" else
                '0' when rnw = '1' and pgfd_n = '0' and wrg = '1'                    else
                '1';

    ------------------------------------------------
    -- Wave RAM
    ------------------------------------------------

    -- Running Wave RAM of seperate clocks
    ram_we <= '1' when clken = '1' and pgfd_n = '0' and rnw = '0' and wrg = '1' else '0';
    ram_clk <= clk;

    -- Running Wave RAM of the same clock
    -- this is a cludge to workaround an issue with early Cyclone II parts
    -- google for:
    --ram_clk <= clk6;
    --process (clk6)
    --    variable we1 : std_logic;
    --    variable we2 : std_logic;
    --begin
    --    if rising_edge(clk6) then
    --        if clk6en = '1' then
    --            if we2 = '0' and we1 = '1' then
    --                ram_we <= '1';
    --            else
    --                ram_we <= '0';
    --            end if;
    --            we2 := we1;
    --            if pgfd_n = '0' and rnw = '0' and wrg = '1' then
    --                we1 := '1';
    --            else
    --                we1 := '0';
    --            end if;
    --        end if;
    --    end if;
    --end process;

    ram_addr <= bank & a;

    ram_din <= din;

    wave_addr <= reg_s4 & sum(7 downto 1) when s6_n = '0' else
                 "111" & index & addr(0) & addr(2) & addr(1) & addr(3) & addr(6) & addr(5) & addr(4);

    inst_WaveRam : entity work.Ram2K
        port map (
            -- port A connects to 1MHz Bus
            clka  => ram_clk,
            wea   => ram_we,
            addra => ram_addr,
            dina  => ram_din,
            douta => ram_dout,
            -- port B connects to DSP
            clkb  => clk6,
            web   => not rst_n,    -- write zero to the RAM on reset
            addrb => wave_addr,
            dinb  => (others => '0'),
            doutb => wave_dout_int
            );

    waveram_reg : process(clk6)
    begin
        if rising_edge(clk6) then
            if clk6en = '1' then
                wave_dout <= wave_dout_int;
            end if;
        end if;
    end process;

    ------------------------------------------------
    -- Controller
    ------------------------------------------------

    controller_sync1 : process(clk6)
    begin
        if rising_edge(clk6) then
            if clk6en = '1' then
                addr <= std_logic_vector(unsigned(addr) + 1);
                pa(2 downto 1) <= addr(2 downto 1);
                if (s0_n = '0') then
                    reg_s0 <= (c4d or sign) & wave_dout(5 downto 4);
                end if;
                if (s4_n = '0') then
                    reg_s4 <= wave_dout(7 downto 4);
                end if;
            end if;
        end if;
    end process;

    controller_sync2 : process(clk6, rst_n)
    begin
        if rst_n = '0' then
            index <= '0';
        elsif rising_edge(clk6) then
            if clk6en = '1' then
                if (s7_n = '0') then
                    index <= reg_s0(1) and reg_s0(2);
                end if;
            end if;
        end if;
     end process;

    invert <= reg_s0(0);

    s0_n <= '0' when addr(2 downto 0) = "000" else '1';
    s1_n <= '0' when addr(2 downto 0) = "001" else '1';
    s4_n <= '0' when addr(2 downto 0) = "100" else '1';
    s6_n <= '0' when addr(2 downto 0) = "110" else '1';
    s7_n <= '0' when addr(2 downto 0) = "111" else '1';
    sx_n <= '0' when c4tmp = '1' and s7_n = '0' else '1';

    ------------------------------------------------
    -- Phase RAM
    ------------------------------------------------

    phase_we <= clk6en and s0_n and not (sx_n and addr(0));
    phase_addr <= "00000" & addr(6 downto 3) & pa(2 downto 1);

    inst_PhaseRam : entity work.Ram2K
        port map (
            -- port A
            clka  => clk6,
            wea   => phase_we,
            addra => phase_addr,
            dina  => sum(7 downto 0),
            douta => phase_dout_int,
            -- port B is not used
            clkb  => '0',
            web   => '0',
            addrb => (others => '0'),
            dinb  => (others => '0'),
            doutb => open
            );

    phaseram_reg : process(clk6)
    begin
        if rising_edge(clk6) then
            if clk6en = '1' then
                phase_dout <= phase_dout_int;
            end if;
        end if;
    end process;

    ------------------------------------------------
    -- ALU
    ------------------------------------------------

    alu_sync : process(clk6)
    begin
        if rising_edge(clk6) then
            if clk6en = '1' then
                c4tmp <= c4;
                c4d <= c4tmp;
                aa <= wave_dout;
                if (s1_n = '0') then
                    load <= wave_dout(0);
                elsif (s6_n = '0') then
                    load <= '0';
                end if;
                sum1 <= sum(7 downto 0);
            end if;
        end if;
    end process;

    c0(0) <= addr(2) and c4d;
    bb <= sum1 when s0_n = '0' and load = '0' else
         phase_dout when addr(0) = '0' and load = '0' else
         (others => '0');

    sum <= std_logic_vector(unsigned("0" & aa) + unsigned("0" & bb) + unsigned("00000000" & c0));
    c4 <= sum(8);
    sign <= aa(7);
    gate_n <= sum(7) xnor sign;

    ------------------------------------------------
    -- Wave Positioner
    ------------------------------------------------

    pos_sync : process(clk6)
    begin
        if rising_edge(clk6) then
            if clk6en = '1' then
                if (s0_n = '0' and gate_n = '0') then
                    dac_input_log <= sum(6 downto 0);
                    dac_sign <= sign;
                    dac_pos <= wave_dout(3 downto 0);
                elsif (s6_n <= '0') then
                    dac_input_log <= (others => '0');
                    dac_sign <= '0';
                    dac_pos <= (others => '0');
                elsif (dac_pos(3) = '1') then
                    dac_pos <= std_logic_vector(unsigned(dac_pos) + 1);
                end if;
                -- Delay these by one clock, to componsate for ROM delay
                dac_sb <= dac_sign xor invert;
                dac_ed <= dac_pos(3);
            end if;
        end if;
    end process;


    ------------------------------------------------
    -- DAC log to linear convertor
    ------------------------------------------------

    inst_LogLinRom : entity work.LogLinRom
        port map (
          CLK  => clk6,
          ADDR => dac_input_log,
          DATA => dac_input_lin
       );

    ------------------------------------------------
    -- Mixer
    ------------------------------------------------

    mixer_sync : process(clk6)
    begin
        if rising_edge(clk6) then
            if clk6en = '1' then
                -- Todo: this expression may not be correct
                if (addr = "0000000") then
                    dac_input_lin_l <= (others => '0');
                    dac_input_lin_r <= (others => '0');
                    --dac_input_lin_l(sumwidth - 1) <= '1';
                    --dac_input_lin_r(sumwidth - 1) <= '1';
                    audio_l <= std_logic_vector(dac_input_lin_l(sumwidth - 1 downto sumwidth - dacwidth));
                    audio_r <= std_logic_vector(dac_input_lin_r(sumwidth - 1 downto sumwidth - dacwidth));
                else
                    if dac_ed = '1' then
                        if dac_sb = '1' then
                            dac_input_lin_l <= dac_input_lin_l - unsigned("0" & dac_input_lin);
                        else
                            dac_input_lin_l <= dac_input_lin_l + unsigned("0" & dac_input_lin);
                        end if;
                    else
                        if dac_sb = '1' then
                            dac_input_lin_r <= dac_input_lin_r - unsigned("0" & dac_input_lin);
                        else
                            dac_input_lin_r <= dac_input_lin_r + unsigned("0" & dac_input_lin);
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process;

    ------------------------------------------------
    -- Miscelleneous
    ------------------------------------------------
    cycle <= addr;
    test  <= index;

end Behavioral;
