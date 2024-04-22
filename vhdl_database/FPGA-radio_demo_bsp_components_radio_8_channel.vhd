library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity radio is
  port(
    clk : in std_logic;
    rst : in std_logic;
    
    rf : in std_logic;
    lo_out : out std_logic;
    mixer_out : out std_logic;

    --Frequency control input
    frequency : in std_logic_vector(31 downto 0);
    frequency_stb : in std_logic;
    frequency_ack : out std_logic;

    --Average samples
    average_samples : in std_logic_vector(31 downto 0);
    average_samples_stb : in std_logic;
    average_samples_ack : out std_logic;

    --Audio output
    audio : out std_logic_vector(31 downto 0);
    audio_stb : out std_logic;
    audio_ack : in std_logic
  );
end entity radio;

architecture rtl of radio is

  type sin_array_type is array (0 to 1023) of signed(9 downto 0);

  function initialise_sin_array return sin_array_type is
    variable x : sin_array_type;
  begin
    for i in 0 to 1023 loop
      x(i) := to_signed(integer(round(512.0 * sin(real(i) * ((2.0 * math_pi)/1024.0)))), 10);
    end loop;
    return x;
  end function;

  function initialise_cos_array return sin_array_type is
    variable x : sin_array_type;
  begin
    for i in 0 to 1023 loop
      x(i) := to_signed(integer(round(512.0 * cos(real(i) * ((2.0 * math_pi)/1024.0)))), 10);
    end loop;
    return x;
  end function;

  component rectangular_to_polar is
    generic(
      width : integer
    );
    port(
      clk : in std_logic;
      rst : in std_logic;
      stb_in : in std_logic;
      stb_out : out std_logic;
      i   : in std_logic_vector(width-1 downto 0);
      q   : in std_logic_vector(width-1 downto 0);
      phase : out std_logic_vector(width downto 0);
      magnitude : out std_logic_vector(width downto 0)
    );
  end component rectangular_to_polar;

  constant sin_array : sin_array_type := initialise_sin_array;
  constant cos_array : sin_array_type := initialise_cos_array;

  signal CLK_100 : std_logic;
  signal CLK_100_s : std_logic;
  signal CLK_400 : std_logic;
  signal CLK_400_s : std_logic;
  signal CLK_400_N : std_logic;
  signal CLK_400_N_s : std_logic;
  signal CLKFBIN : std_logic;
  signal CLKFBOUT : std_logic;

  signal rf_0 : std_logic;
  signal rf_1 : std_logic;
  signal rf_2 : std_logic;
  signal rf_3 : std_logic;
  signal rf_4 : std_logic;
  signal rf_5 : std_logic;
  signal rf_6 : std_logic;
  signal rf_7 : std_logic;
  signal rf_0_d1 : std_logic;
  signal rf_0_d2 : std_logic;
  signal rf_1_d1 : std_logic;
  signal rf_1_d2 : std_logic;
  signal rf_2_d1 : std_logic;
  signal rf_2_d2 : std_logic;
  signal rf_3_d1 : std_logic;
  signal rf_3_d2 : std_logic;
  signal rf_4_d1 : std_logic;
  signal rf_4_d2 : std_logic;
  signal rf_5_d1 : std_logic;
  signal rf_5_d2 : std_logic;
  signal rf_6_d1 : std_logic;
  signal rf_6_d2 : std_logic;
  signal rf_7_d1 : std_logic;
  signal rf_7_d2 : std_logic;
  signal s_audio_stb : std_logic;
  signal rect_stb : std_logic;
  signal magnitude_stb : std_logic;
  signal lo_i_0 : signed(9 downto 0) := (others => '0');
  signal lo_q_0 : signed(9 downto 0) := (others => '0');
  signal lo_i_1 : signed(9 downto 0) := (others => '0');
  signal lo_q_1 : signed(9 downto 0) := (others => '0');
  signal lo_i_2 : signed(9 downto 0) := (others => '0');
  signal lo_q_2 : signed(9 downto 0) := (others => '0');
  signal lo_i_3 : signed(9 downto 0) := (others => '0');
  signal lo_q_3 : signed(9 downto 0) := (others => '0');
  signal lo_i_4 : signed(9 downto 0) := (others => '0');
  signal lo_q_4 : signed(9 downto 0) := (others => '0');
  signal lo_i_5 : signed(9 downto 0) := (others => '0');
  signal lo_q_5 : signed(9 downto 0) := (others => '0');
  signal lo_i_6 : signed(9 downto 0) := (others => '0');
  signal lo_q_6 : signed(9 downto 0) := (others => '0');
  signal lo_i_7 : signed(9 downto 0) := (others => '0');
  signal lo_q_7 : signed(9 downto 0) := (others => '0');
  signal i_0 : signed(11 downto 0);
  signal i_1 : signed(11 downto 0);
  signal i_2 : signed(11 downto 0);
  signal i_3 : signed(11 downto 0);
  signal i_4 : signed(11 downto 0);
  signal i_5 : signed(11 downto 0);
  signal i_6 : signed(11 downto 0);
  signal i_7 : signed(11 downto 0);
  signal q_0 : signed(11 downto 0);
  signal q_1 : signed(11 downto 0);
  signal q_2 : signed(11 downto 0);
  signal q_3 : signed(11 downto 0);
  signal q_4 : signed(11 downto 0);
  signal q_5 : signed(11 downto 0);
  signal q_6 : signed(11 downto 0);
  signal q_7 : signed(11 downto 0);
  signal i : signed(11 downto 0);
  signal q : signed(11 downto 0);
  signal rf_0_signed : signed(1 downto 0);
  signal rf_1_signed : signed(1 downto 0);
  signal rf_2_signed : signed(1 downto 0);
  signal rf_3_signed : signed(1 downto 0);
  signal rf_4_signed : signed(1 downto 0);
  signal rf_5_signed : signed(1 downto 0);
  signal rf_6_signed : signed(1 downto 0);
  signal rf_7_signed : signed(1 downto 0);
  signal t : unsigned(31 downto 0) := (others => '0');
  signal t_0 : unsigned(31 downto 0) := (others => '0');
  signal t_1 : unsigned(31 downto 0) := (others => '0');
  signal t_2 : unsigned(31 downto 0) := (others => '0');
  signal t_3 : unsigned(31 downto 0) := (others => '0');
  signal t_4 : unsigned(31 downto 0) := (others => '0');
  signal t_5 : unsigned(31 downto 0) := (others => '0');
  signal t_6 : unsigned(31 downto 0) := (others => '0');
  signal t_7 : unsigned(31 downto 0) := (others => '0');
  signal wt_0 : unsigned(63 downto 0) := (others => '0');
  signal wt_1 : unsigned(63 downto 0) := (others => '0');
  signal wt_2 : unsigned(63 downto 0) := (others => '0');
  signal wt_3 : unsigned(63 downto 0) := (others => '0');
  signal wt_4 : unsigned(63 downto 0) := (others => '0');
  signal wt_5 : unsigned(63 downto 0) := (others => '0');
  signal wt_6 : unsigned(63 downto 0) := (others => '0');
  signal wt_7 : unsigned(63 downto 0) := (others => '0');
  signal frequency_reg  : unsigned(31 downto 0) := (others => '0');
  signal rect_i : std_logic_vector(30 downto 0) := (others => '0');
  signal rect_q : std_logic_vector(30 downto 0) := (others => '0');
  signal magnitude : std_logic_vector(31 downto 0) := (others => '0');
  signal phase : std_logic_vector(31 downto 0) := (others => '0');
  signal average_samples_reg : unsigned(31 downto 0) := (others => '0');
  signal sample_count : unsigned(31 downto 0) := (others => '0');
  signal integrator_0_i   : signed(30 downto 0);
  signal integrator_0_q   : signed(30 downto 0);
  signal integrator_1_i   : signed(30 downto 0);
  signal integrator_1_q   : signed(30 downto 0);
  signal integrator_1_d_i : signed(30 downto 0);
  signal integrator_1_d_q : signed(30 downto 0);
  signal comb_0_i : signed(30 downto 0);
  signal comb_0_q : signed(30 downto 0);
  signal comb_0_d_i : signed(30 downto 0);
  signal comb_0_d_q : signed(30 downto 0);

begin

  process
  begin

    wait until rising_edge(clk);

    rf_0_d1 <= rf_0;
    rf_0_d2 <= rf_0_d1;
    rf_1_d1 <= rf_1;
    rf_1_d2 <= rf_1_d1;
    rf_2_d1 <= rf_2;
    rf_2_d2 <= rf_2_d1;
    rf_3_d1 <= rf_3;
    rf_3_d2 <= rf_3_d1;
    rf_4_d1 <= rf_4;
    rf_4_d2 <= rf_4_d1;
    rf_5_d1 <= rf_5;
    rf_5_d2 <= rf_5_d1;
    rf_6_d1 <= rf_6;
    rf_6_d2 <= rf_6_d1;
    rf_7_d1 <= rf_7;
    rf_7_d2 <= rf_7_d1;

    rf_0_signed <= rf_0_d2 & '1';
    rf_1_signed <= rf_1_d2 & '1';
    rf_2_signed <= rf_2_d2 & '1';
    rf_3_signed <= rf_3_d2 & '1';
    rf_4_signed <= rf_4_d2 & '1';
    rf_5_signed <= rf_5_d2 & '1';
    rf_6_signed <= rf_6_d2 & '1';
    rf_7_signed <= rf_7_d2 & '1';

    t <= t + 1;
    t_0 <= t(28 downto 0) & "000";
    t_1 <= t(28 downto 0) & "001";
    t_2 <= t(28 downto 0) & "010";
    t_3 <= t(28 downto 0) & "011";
    t_4 <= t(28 downto 0) & "100";
    t_5 <= t(28 downto 0) & "101";
    t_6 <= t(28 downto 0) & "110";
    t_7 <= t(28 downto 0) & "111";
    wt_0 <= t_0 * frequency_reg;
    wt_1 <= t_1 * frequency_reg;
    wt_2 <= t_2 * frequency_reg;
    wt_3 <= t_3 * frequency_reg;
    wt_4 <= t_4 * frequency_reg;
    wt_5 <= t_5 * frequency_reg;
    wt_6 <= t_6 * frequency_reg;
    wt_7 <= t_7 * frequency_reg;
    lo_i_0 <= sin_array(to_integer(unsigned(wt_0(31 downto 22))));
    lo_q_0 <= cos_array(to_integer(unsigned(wt_0(31 downto 22))));
    lo_i_1 <= sin_array(to_integer(unsigned(wt_1(31 downto 22))));
    lo_q_1 <= cos_array(to_integer(unsigned(wt_1(31 downto 22))));
    lo_i_2 <= sin_array(to_integer(unsigned(wt_2(31 downto 22))));
    lo_q_2 <= cos_array(to_integer(unsigned(wt_2(31 downto 22))));
    lo_i_3 <= sin_array(to_integer(unsigned(wt_3(31 downto 22))));
    lo_q_3 <= cos_array(to_integer(unsigned(wt_3(31 downto 22))));
    lo_i_4 <= sin_array(to_integer(unsigned(wt_4(31 downto 22))));
    lo_q_4 <= cos_array(to_integer(unsigned(wt_4(31 downto 22))));
    lo_i_5 <= sin_array(to_integer(unsigned(wt_5(31 downto 22))));
    lo_q_5 <= cos_array(to_integer(unsigned(wt_5(31 downto 22))));
    lo_i_6 <= sin_array(to_integer(unsigned(wt_6(31 downto 22))));
    lo_q_6 <= cos_array(to_integer(unsigned(wt_6(31 downto 22))));
    lo_i_7 <= sin_array(to_integer(unsigned(wt_7(31 downto 22))));
    lo_q_7 <= cos_array(to_integer(unsigned(wt_7(31 downto 22))));
    i_0 <= rf_0_signed * lo_i_0;
    q_0 <= rf_0_signed * lo_q_0;
    i_1 <= rf_1_signed * lo_i_1;
    q_1 <= rf_1_signed * lo_q_1;
    i_2 <= rf_2_signed * lo_i_2;
    q_2 <= rf_2_signed * lo_q_2;
    i_3 <= rf_3_signed * lo_i_3;
    q_3 <= rf_3_signed * lo_q_3;
    i_4 <= rf_4_signed * lo_i_4;
    q_4 <= rf_4_signed * lo_q_4;
    i_5 <= rf_5_signed * lo_i_5;
    q_5 <= rf_5_signed * lo_q_5;
    i_6 <= rf_6_signed * lo_i_6;
    q_6 <= rf_6_signed * lo_q_6;
    i_7 <= rf_7_signed * lo_i_7;
    q_7 <= rf_7_signed * lo_q_7;
    i <= i_0 + i_1 + i_2 + i_3 + i_4 + i_5 + i_6 + i_7;
    q <= q_0 + q_1 + q_2 + q_3 + q_4 + q_5 + q_6 + q_7;

    integrator_0_i <= integrator_0_i + i(11 downto 8);
    integrator_0_q <= integrator_0_q + q(11 downto 8);
    integrator_1_i <= integrator_1_i + integrator_0_i;
    integrator_1_q <= integrator_1_q + integrator_0_q;

    if sample_count = average_samples_reg - 1 then
      sample_count <= (others => '0');
      integrator_1_d_i <= integrator_1_i;
      integrator_1_d_q <= integrator_1_q;
      comb_0_i <= integrator_1_i - integrator_1_d_i;
      comb_0_q <= integrator_1_q - integrator_1_d_q;
      comb_0_d_i <= comb_0_i;
      comb_0_d_q <= comb_0_q;
      rect_i <= std_logic_vector(comb_0_i - comb_0_d_i);
      rect_q <= std_logic_vector(comb_0_q - comb_0_d_q);
      rect_stb <= '1';
    else
      sample_count <= sample_count + 1;
      rect_stb <= '0';
    end if;

    if frequency_stb = '1' then
      frequency_reg <= unsigned(frequency);
    end if;

    if average_samples_stb = '1' then
      average_samples_reg <= unsigned(average_samples);
    end if;

    if magnitude_stb = '1' then
      s_audio_stb <= '1';
      audio <= magnitude;
    end if;

    if s_audio_stb = '1' and audio_ack = '1' then
      s_audio_stb <= '0';
    end if;

    if rst = '1' then
      s_audio_stb <= '0';
    end if;

  end process;

  rectangular_to_polar_inst_1 : rectangular_to_polar generic map(
      width => 31
  ) port map(
      clk => clk,
      rst => rst,
      stb_in => rect_stb,
      stb_out => magnitude_stb,
      i => rect_i,
      q => rect_q,
      phase => phase,
      magnitude => magnitude
  );

  audio_stb <= s_audio_stb;
  frequency_ack <= '1';
  average_samples_ack <= '1';
  lo_out <= '0';
  mixer_out <= '0';

  ISERDESE2_inst : ISERDESE2
  generic map (
    DATA_RATE => "DDR", -- DDR, SDR
    DATA_WIDTH => 8, -- Parallel data width (2-8,10,14)
    DYN_CLKDIV_INV_EN => "FALSE", -- Enable DYNCLKDIVINVSEL inversion (FALSE, TRUE)
    DYN_CLK_INV_EN => "FALSE", -- Enable DYNCLKINVSEL inversion (FALSE, TRUE)
    -- INIT_Q1 - INIT_Q4: Initial value on the Q outputs (0/1)
    INIT_Q1 => '0',
    INIT_Q2 => '0',
    INIT_Q3 => '0',
    INIT_Q4 => '0',
    INTERFACE_TYPE => "NETWORKING", -- MEMORY, MEMORY_DDR3, MEMORY_QDR, NETWORKING, OVERSAMPLE
    IOBDELAY => "NONE", -- NONE, BOTH, IBUF, IFD
    NUM_CE => 2, -- Number of clock enables (1,2)
    OFB_USED => "FALSE", -- Select OFB path (FALSE, TRUE)
    SERDES_MODE => "MASTER", -- MASTER, SLAVE
    -- SRVAL_Q1 - SRVAL_Q4: Q output values when SR is used (0/1)
    SRVAL_Q1 => '0',
    SRVAL_Q2 => '0',
    SRVAL_Q3 => '0',
    SRVAL_Q4 => '0'
  )
  port map (
    O => open, -- 1-bit output: Combinatorial output
    -- Q1 - Q8: 1-bit (each) output: Registered data outputs
    Q1 => rf_7,
    Q2 => rf_6,
    Q3 => rf_5,
    Q4 => rf_4,
    Q5 => rf_3,
    Q6 => rf_2,
    Q7 => rf_1,
    Q8 => rf_0,
    -- SHIFTOUT1-SHIFTOUT2: 1-bit (each) output: Data width expansion output ports
    SHIFTOUT1 => open,
    SHIFTOUT2 => open,
    BITSLIP => '0', -- 1-bit input: The BITSLIP pin performs a Bitslip operation synchronous to
    -- CLKDIV when asserted (active High). Subsequently, the data seen on the
    -- Q1 to Q8 output ports will shift, as in a barrel-shifter operation, one
    -- position every time Bitslip is invoked (DDR operation is different from
    -- SDR).
    -- CE1, CE2: 1-bit (each) input: Data register clock enable inputs
    CE1 => '1',
    CE2 => '1',
    CLKDIVP => '0', -- 1-bit input: TBD
    -- Clocks: 1-bit (each) input: ISERDESE2 clock input ports
    CLK => CLK_400, -- 1-bit input: High-speed clock
    CLKB => CLK_400_N, -- 1-bit input: High-speed secondary clock
    CLKDIV => CLK_100, -- 1-bit input: Divided clock
    OCLK => '0', -- 1-bit input: High speed output clock used when INTERFACE_TYPE="MEMORY"
    -- Dynamic Clock Inversions: 1-bit (each) input: Dynamic clock inversion pins to switch clock polarity
    DYNCLKDIVSEL => '0', -- 1-bit input: Dynamic CLKDIV inversion
    DYNCLKSEL => '0', -- 1-bit input: Dynamic CLK/CLKB inversion
    -- Input Data: 1-bit (each) input: ISERDESE2 data input ports
    D => rf, -- 1-bit input: Data input
    DDLY => '0', -- 1-bit input: Serial data from IDELAYE2
    OFB => '0', -- 1-bit input: Data feedback from OSERDESE2
    OCLKB => '0', -- 1-bit input: High speed negative edge output clock
    RST => RST, -- 1-bit input: Active high asynchronous reset
    -- SHIFTIN1-SHIFTIN2: 1-bit (each) input: Data width expansion input ports
    SHIFTIN1 => '0',
    SHIFTIN2 => '0'
  );

  PLLE2_BASE_inst : PLLE2_BASE
  generic map (
    BANDWIDTH => "OPTIMIZED", -- OPTIMIZED, HIGH, LOW
    CLKFBOUT_MULT => 8, -- Multiply value for all CLKOUT, (2-64)
    CLKFBOUT_PHASE => 0.0, -- Phase offset in degrees of CLKFB, (-360.000-360.000).
    CLKIN1_PERIOD => 10.0, -- Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
    -- CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for each CLKOUT (1-128)
    CLKOUT0_DIVIDE => 8,
    CLKOUT1_DIVIDE => 2,
    CLKOUT2_DIVIDE => 2,
    CLKOUT3_DIVIDE => 1,
    CLKOUT4_DIVIDE => 1,
    CLKOUT5_DIVIDE => 1,
    -- CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for each CLKOUT (0.001-0.999).
    CLKOUT0_DUTY_CYCLE => 0.5,
    CLKOUT1_DUTY_CYCLE => 0.5,
    CLKOUT2_DUTY_CYCLE => 0.5,
    CLKOUT3_DUTY_CYCLE => 0.5,
    CLKOUT4_DUTY_CYCLE => 0.5,
    CLKOUT5_DUTY_CYCLE => 0.5,
    -- CLKOUT0_PHASE - CLKOUT5_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
    CLKOUT0_PHASE => 0.0,
    CLKOUT1_PHASE => 0.0,
    CLKOUT2_PHASE => 180.0,
    CLKOUT3_PHASE => 0.0,
    CLKOUT4_PHASE => 0.0,
    CLKOUT5_PHASE => 0.0,
    DIVCLK_DIVIDE => 1, -- Master division value, (1-56)
    REF_JITTER1 => 0.0, -- Reference input jitter in UI, (0.000-0.999).
    STARTUP_WAIT => "FALSE" -- Delay DONE until PLL Locks, ("TRUE"/"FALSE")
  )
  port map (
    -- Clock Outputs: 1-bit (each) output: User configurable clock outputs
    CLKOUT0 => CLK_100_s,
    CLKOUT1 => CLK_400_s,
    CLKOUT2 => CLK_400_N_s,
    CLKOUT3 => open,
    CLKOUT4 => open,
    CLKOUT5 => open,
    -- Feedback Clocks: 1-bit (each) output: Clock feedback ports
    CLKFBOUT => CLKFBOUT, -- 1-bit output: Feedback clock
    -- Status Port: 1-bit (each) output: PLL status ports
    LOCKED => open, -- 1-bit output: LOCK
    -- Clock Input: 1-bit (each) input: Clock input
    CLKIN1 => CLK, -- 1-bit input: Input clock
    -- Control Ports: 1-bit (each) input: PLL control ports
    PWRDWN => '0', -- 1-bit input: Power-down
    RST => '0', -- 1-bit input: Reset
    -- Feedback Clocks: 1-bit (each) input: Clock feedback ports
    CLKFBIN => CLKFBIN -- 1-bit input: Feedback clock
  );

  BUFG_inst_1 : BUFG
  port map (
  O => CLK_100, -- 1-bit output: Clock output
  I => CLK_100_s -- 1-bit input: Clock input
  );

  BUFG_inst_2 : BUFG
  port map (
  O => CLK_400, -- 1-bit output: Clock output
  I => CLK_400_s -- 1-bit input: Clock input
  );

  BUFG_inst_3 : BUFG
  port map (
  O => CLK_400_N, -- 1-bit output: Clock output
  I => CLK_400_N_s -- 1-bit input: Clock input
  );

  BUFG_inst_4 : BUFG
  port map (
  O => CLKFBIN,
  I => CLKFBOUT
  );


end rtl;

