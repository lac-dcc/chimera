LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY work;

ENTITY sim_siphash_main IS
END sim_siphash_main;

ARCHITECTURE rtl OF sim_siphash_main IS
  COMPONENT siphasher
    PORT (
      clk : IN STD_LOGIC;
      in_key : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      in_data : IN STD_LOGIC_VECTOR(959 DOWNTO 0);
      in_start : IN STD_LOGIC;
      out_data : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      out_ready : OUT STD_LOGIC
    );
  END COMPONENT;

  SIGNAL clk : STD_LOGIC := '0';
  SIGNAL IN_KEY : STD_LOGIC_VECTOR(127 DOWNTO 0) := (OTHERS => '0');
  SIGNAL IN_DATA : STD_LOGIC_VECTOR(959 DOWNTO 0) := (OTHERS => '0');
  SIGNAL IN_START : STD_LOGIC := '0';

  SIGNAL OUT_DATA : STD_LOGIC_VECTOR(63 DOWNTO 0) := (OTHERS => '0');
  SIGNAL OUT_READY : STD_LOGIC := '0';

  CONSTANT clk_period : TIME := 10 ns;
BEGIN

  uut : siphasher PORT MAP(
    clk => clk,
    in_key => IN_KEY,
    in_data => IN_DATA,
    in_start => IN_START,
    out_data => OUT_DATA,
    out_ready => OUT_READY
  );

  -- Clock process definitions
  clk_process : PROCESS
  BEGIN
    clk <= '0';
    WAIT FOR clk_period/2;
    clk <= '1';
    WAIT FOR clk_period/2;
  END PROCESS;

  -- Stimulus process
  stim_proc : PROCESS
  BEGIN
    -- hold reset state for 100 ns.
    WAIT FOR 100 ns;

    WAIT FOR clk_period * 10;

    IN_KEY <= x"decaface1eadf1a91713440219990927";
    IN_DATA <= (OTHERS => '0');
    IN_START <= '1';

    WAIT FOR clk_period;
    IN_START <= '0';

    WAIT UNTIL OUT_READY = '1';

    WAIT FOR clk_period * 100;


  END PROCESS;

END;

