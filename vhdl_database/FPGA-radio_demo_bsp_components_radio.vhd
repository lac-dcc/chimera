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
    rf_out : out std_logic;

    --Frequency control input
    frequency : in std_logic_vector(31 downto 0);
    frequency_stb : in std_logic;
    frequency_ack : out std_logic;

    --Average samples
    average_samples : in std_logic_vector(31 downto 0);
    average_samples_stb : in std_logic;
    average_samples_ack : out std_logic;

    --Audio output
    am : out std_logic_vector(31 downto 0);
    am_stb : out std_logic;
    am_ack : in std_logic;

    fm : out std_logic_vector(31 downto 0);
    fm_stb : out std_logic;
    fm_ack : in std_logic
  );
end entity radio;

architecture rtl of radio is

  constant sin_bits : integer := 10;
  constant sin_scale : real := 2.0**real(sin_bits);
  constant sin_output_scale : real := (2.0**real(sin_bits-1))-1.0;
  constant decimator_bits : integer := 55;
  constant channels : integer := 8;
  constant channel_bits : integer := 3;

  type sin_array_type is array (0 to (2**sin_bits)-1) of signed(sin_bits-1 downto 0);

  function initialise_sin_array return sin_array_type is
    variable x : sin_array_type;
  begin
    for i in 0 to (2**sin_bits)-1 loop
      x(i) := to_signed(integer(round(sin_output_scale * sin(real(i) * ((2.0 * math_pi)/sin_scale)))), sin_bits);
    end loop;
    return x;
  end function;

  function initialise_cos_array return sin_array_type is
    variable x : sin_array_type;
  begin
    for i in 0 to (2**sin_bits)-1 loop
      x(i) := to_signed(integer(round(sin_output_scale * cos(real(i) * ((2.0 * math_pi)/sin_scale)))), sin_bits);
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
      i : in std_logic_vector(width-1 downto 0);
      q : in std_logic_vector(width-1 downto 0);
      phase : out std_logic_vector(width downto 0);
      magnitude : out std_logic_vector(width downto 0)
    );
  end component rectangular_to_polar;

  component cic_filter is
    generic(
      bits : integer := 31;
      stages : integer := 2
    );
    port(
      clk : in std_logic;
      rst : in std_logic;
      decimation : in std_logic_vector(31 downto 0);
      data_in    : in std_logic_vector(bits-1 downto 0);
      data_out_stb : out std_logic;
      data_out   : out std_logic_vector(bits-1 downto 0)
    );
  end component cic_filter;

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

  signal rf_0 : std_logic_vector(channels-1 downto 0);
  signal rf_1 : std_logic_vector(channels-1 downto 0);
  signal rf_2 : std_logic_vector(channels-1 downto 0);
  type rf_signed_type is array (channels-1 downto 0) of signed(1 downto 0);
  signal rf_signed : rf_signed_type;

  type lo_type is array (channels-1 downto 0) of signed(sin_bits-1 downto 0);
  signal lo_i : lo_type := (others => (others => '0'));
  signal lo_q : lo_type := (others => (others => '0'));

  type iq_type is array (channels-1 downto 0) of signed(sin_bits+1 downto 0);
  signal i : iq_type;
  signal q : iq_type;

  signal count : unsigned(31 downto 0);
  type t_type is array (channels-1 downto 0) of unsigned(31 + channel_bits downto 0);
  signal t : t_type := (others => (others => '0'));

  type wt_type is array (channels-1 downto 0) of unsigned(63 + channel_bits + channel_bits downto 0);
  signal wt : wt_type := (others => (others => '0'));

  signal i_full_rate : std_logic_vector(decimator_bits-1 downto 0);
  signal q_full_rate : std_logic_vector(decimator_bits-1 downto 0);
  signal downsampled_i : std_logic_vector(decimator_bits-1 downto 0) := (others => '0');
  signal downsampled_q : std_logic_vector(decimator_bits-1 downto 0) := (others => '0');

  signal frequency_reg  : unsigned(31 downto 0) := (others => '0');
  signal downsampled_stb : std_logic;
  signal magnitude : std_logic_vector(decimator_bits downto 0) := (others => '0');
  signal phase : std_logic_vector(decimator_bits downto 0) := (others => '0');
  signal s_am_stb : std_logic;
  signal s_fm_stb : std_logic;
  signal polar_stb : std_logic;
  signal average_samples_reg : std_logic_vector(31 downto 0) := (others => '0');
  signal fm_d : signed(31 downto 0) := (others => '0');

begin

  process
    variable i_sum_var : signed(decimator_bits - 1 downto 0);
    variable q_sum_var : signed(decimator_bits - 1 downto 0);
  begin

    wait until rising_edge(clk);


    --synchronise to local clock domain
    rf_1 <= rf_0;
    rf_2 <= rf_1;

    --convert from 0/1 to -1/+1
    for n in rf_2'range loop
      rf_signed(n) <= rf_2(n) & '1';
    end loop;

    --numerically controlled oscillator
    count <= count + 1;
    i_sum_var := (others => '0');
    q_sum_var := (others => '0');
    for n in 0 to channels - 1 loop
      t(n) <= count(31-channel_bits downto 0) & to_unsigned(n, channel_bits);
      wt(n) <= t(n) * frequency_reg;
      lo_i(n) <= sin_array(to_integer(unsigned(wt(n)(31 downto 32-sin_bits))));
      lo_q(n) <= cos_array(to_integer(unsigned(wt(n)(31 downto 32-sin_bits))));
      --mixer
      i(n) <= rf_signed(n) * lo_i(n);
      q(n) <= rf_signed(n) * lo_q(n);
      --average samples
      i_sum_var := i_sum_var + i(n);
      q_sum_var := q_sum_var + q(n);

    end loop;
    i_full_rate <= std_logic_vector(i_sum_var);
    q_full_rate <= std_logic_vector(q_sum_var);


    --software input registers
    if frequency_stb = '1' then
      frequency_reg <= unsigned(frequency);
    end if;

    if average_samples_stb = '1' then
      average_samples_reg <= average_samples;
    end if;

    --am output registers
    if polar_stb = '1' then
      s_am_stb <= '1';
      s_fm_stb <= '1';
      am <= magnitude(decimator_bits downto decimator_bits-31);
      fm_d <= signed(phase(decimator_bits downto decimator_bits-31));
      fm <= std_logic_vector(signed(phase(decimator_bits downto decimator_bits-31))-fm_d);
    end if;

    if s_am_stb = '1' and am_ack = '1' then
      s_am_stb <= '0';
    end if;

    if s_fm_stb = '1' and fm_ack = '1' then
      s_fm_stb <= '0';
    end if;

    --reset
    if rst = '1' then
      s_am_stb <= '0';
      s_fm_stb <= '0';
    end if;

  end process;

  cic_filter_inst_i : cic_filter generic map(
    bits => decimator_bits,
    stages => 3
  ) port map (
    clk => clk,
    rst => rst,
    decimation => average_samples_reg,
    data_in => i_full_rate,
    data_out_stb => downsampled_stb,
    data_out => downsampled_i
  );

  cic_filter_inst_q : cic_filter generic map(
    bits => decimator_bits,
    stages => 3
  ) port map (
    clk => clk,
    rst => rst,
    decimation => average_samples_reg,
    data_in => q_full_rate,
    data_out_stb => open,
    data_out => downsampled_q
  );

  rectangular_to_polar_inst_1 : rectangular_to_polar generic map(
    width => decimator_bits
  ) port map (
    clk => clk,
    rst => rst,
    stb_in => downsampled_stb,
    stb_out => polar_stb,
    i => downsampled_i,
    q => downsampled_q,
    phase => phase,
    magnitude => magnitude
  );

  am_stb <= s_am_stb;
  fm_stb <= s_fm_stb;
  frequency_ack <= '1';
  average_samples_ack <= '1';

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
    O => rf_out, -- 1-bit output: Combinatorial output
    -- Q1 - Q8: 1-bit (each) output: Registered data outputs
    Q1 => rf_0(7),
    Q2 => rf_0(6),
    Q3 => rf_0(5),
    Q4 => rf_0(4),
    Q5 => rf_0(3),
    Q6 => rf_0(2),
    Q7 => rf_0(1),
    Q8 => rf_0(0),
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
