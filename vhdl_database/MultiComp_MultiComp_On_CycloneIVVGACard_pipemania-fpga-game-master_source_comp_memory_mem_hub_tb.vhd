--------------------------------------------------------------------------------
-- PROJECT: PIPE MANIA - GAME FOR FPGA
--------------------------------------------------------------------------------
-- NAME:    MEM_HUB_TB
-- AUTHORS: Jakub Cabal <xcabal05@stud.feec.vutbr.cz>
-- LICENSE: The MIT License, please read LICENSE file
-- WEBSITE: https://github.com/jakubcabal/pipemania-fpga-game
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MEM_HUB_TB is
end MEM_HUB_TB;

architecture behavior of MEM_HUB_TB is

    -- CLK and RST
    signal CLK                : std_logic := '0';
    signal RST                : std_logic := '0';

    -- Memory signals
    signal sig_we_hub         : std_logic;
    signal sig_addr_hub       : std_logic_vector(8 downto 0);
    signal sig_dout_hub       : std_logic_vector(31 downto 0);
    signal sig_din_hub        : std_logic_vector(31 downto 0);

    -- MEM_HUB signals
    signal hub_we_a           : std_logic;
    signal hub_en_a           : std_logic;
    signal hub_addr_a         : std_logic_vector(8 downto 0);
    signal hub_din_a          : std_logic_vector(31 downto 0);
    signal hub_dout_a         : std_logic_vector(31 downto 0);
    signal hub_ack_a          : std_logic;

    signal hub_we_b           : std_logic;
    signal hub_en_b           : std_logic;
    signal hub_addr_b         : std_logic_vector(8 downto 0);
    signal hub_din_b          : std_logic_vector(31 downto 0);
    signal hub_dout_b         : std_logic_vector(31 downto 0);
    signal hub_ack_b          : std_logic;

    -- Clock period definitions
    constant CLK_period : time := 10 ns;

begin

    uut : entity work.MEM_HUB
    port map (
        CLK    => CLK,
        RST    => RST,
        -- Port A
        EN_A   => hub_en_a,
        WE_A   => hub_we_a,
        ADDR_A => hub_addr_a,
        DIN_A  => hub_din_a,
        DOUT_A => hub_dout_a,
        ACK_A  => hub_ack_a,
        -- Port B
        EN_B   => hub_en_b,
        WE_B   => hub_we_b,
        ADDR_B => hub_addr_b,
        DIN_B  => hub_din_b,
        DOUT_B => hub_dout_b,
        ACK_B  => hub_ack_b,
        -- Port to memory
        WE     => sig_we_hub,
        ADDR   => sig_addr_hub,
        DIN    => sig_din_hub,
        DOUT   => sig_dout_hub
    );

   mem : entity work.BRAM_SYNC_TDP
   port map (
      -- Port A
      CLK       => CLK,
      WE_A      => sig_we_hub,
      ADDR_A    => sig_addr_hub,
      DATAIN_A  => sig_din_hub,
      DATAOUT_A => sig_dout_hub,
      -- Port B
      WE_A      => '0',
      ADDR_A    => (others => '0'),
      DATAIN_A  => (others => '0'),
      DATAOUT_A => open
   );


    clk_process : process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;

    sim_proc : process
    begin
        wait for 100 ns;
        wait until rising_edge(CLK);
        hub_en_a <= '1';
        hub_we_a <= '1';
        hub_addr_a <= "000000001";
        hub_din_a <= "11111111110000001111111111000000";
        wait until rising_edge(CLK);
        hub_en_a <= '1';
        hub_we_a <= '1';
        hub_addr_a <= "000000010";
        hub_din_a <= "11111111111111111111111111111111";
        wait until rising_edge(CLK);
        hub_en_a <= '1';
        hub_we_a <= '1';
        hub_addr_a <= "000000011";
        hub_din_a <= "00000001111111111100000000011111";
        wait until rising_edge(CLK);
        hub_en_a <= '1';
        hub_we_a <= '0';
        hub_addr_a <= "000000001";
        hub_din_a <= "00000000000000000000000000000000";
        wait until rising_edge(CLK);
        hub_en_a <= '0';
        hub_we_a <= '0';
        hub_addr_a <= (others => '0');
        wait until rising_edge(CLK);
        hub_en_a <= '1';
        hub_we_a <= '0';
        hub_addr_a <= (others => '0');
        wait until rising_edge(CLK);
        hub_en_a <= '1';
        hub_we_a <= '0';
        hub_addr_a <= "000000001";
        wait until rising_edge(CLK);
        hub_en_a <= '1';
        hub_we_a <= '0';
        hub_addr_a <= "000000010";
        wait until rising_edge(CLK);
        hub_en_a <= '1';
        hub_we_a <= '0';
        hub_addr_a <= "000000011";
        wait until rising_edge(CLK);
        hub_en_a <= '0';
        hub_we_a <= '0';
        hub_addr_a <= (others => '0');
        wait;
    end process;

end;
