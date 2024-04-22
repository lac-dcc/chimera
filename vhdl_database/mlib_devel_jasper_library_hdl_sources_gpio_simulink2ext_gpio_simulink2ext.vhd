library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity gpio_simulink2ext is
    Generic (
    		  WIDTH : integer := 4;
    		  DDR : integer := 0;
    		  CLK_PHASE  : integer := 0;
              REG_IOB 	 : string := "true";
			  PORT_BYPASS : integer := 0;
          USE_DELAY : integer := 0
	);
	 Port (
		gateway   : in  std_logic_vector(((WIDTH)-1)       downto 0);
		io_pad    : out std_logic_vector((WIDTH/(DDR+1)-1) downto 0);

		clk       : in  std_logic;
		clk90     : in  std_logic;

    delay_load_en : in std_logic := '0';
    delay_val     : in std_logic_vector(8 downto 0) := "000000000";
    delay_rst     : in std_logic := '0'
	 );
end gpio_simulink2ext;

architecture Behavioral of gpio_simulink2ext is
	signal sample_clk : std_logic;
	signal not_sample_clk : std_logic;
    attribute IOB: string;
	signal one  : std_logic := '1';
	signal zero : std_logic := '0';
  signal io_pad_buf : std_logic_vector((WIDTH/(DDR+1)-1) downto 0);

	signal integer_convert : std_logic_vector(0 downto 0);
  signal io_pad_delay: std_logic_vector(WIDTH/(DDR+1)-1 downto 0);
  signal delay_load_enR: std_logic;
  signal delay_load_strobe: std_logic;
begin

-- clock selection
	PHASE0: if CLK_PHASE = 0 generate
		sample_clk     <=     clk;
		not_sample_clk <= not clk;
	end generate PHASE0;
	PHASE90: if CLK_PHASE = 90 generate
		sample_clk     <=     clk90;
		not_sample_clk <= not clk90;
	end generate PHASE90;
	PHASE180: if CLK_PHASE = 180 generate
		sample_clk     <= not clk;
		not_sample_clk <=     clk;
	end generate PHASE180;
	PHASE270: if CLK_PHASE = 270 generate
		sample_clk     <= not clk90;
		not_sample_clk <=     clk90;
	end generate PHASE270;

-- delay load strobe generation
  process (sample_clk)
  begin
  if rising_edge(sample_clk) then
    delay_load_enR <= delay_load_en;
  end if;
  end process;

  delay_load_strobe <= (not delay_load_enR) and delay_load_en;

  DELAYGEN: if USE_DELAY = 1 generate
		DELAY_BITGEN : for i in 0 to (WIDTH/(DDR+1)-1) generate
      ODELAY_INST: ODELAYE3
      generic map(
        DELAY_TYPE => "VAR_LOAD",
        DELAY_FORMAT => "COUNT",
        UPDATE_MODE => "ASYNC",
        CASCADE => "None",
        REFCLK_FREQUENCY => 200.0
      )
      port map(
        CLK => sample_clk,
        LOAD => delay_load_strobe,
        ODATAIN => io_pad_delay(i),
        CNTVALUEIN => delay_val,
        INC => '0',
        CE => '0',
        EN_VTC => '0',
        DATAOUT => io_pad(i),
        CASC_IN => '0',
        RST => delay_rst,
        CASC_RETURN => '0'
      );
    end generate DELAY_BITGEN;
  end generate DELAYGEN;

  NODELAYGEN: if USE_DELAY = 0 generate
    io_pad <= io_pad_delay;
  end generate NODELAYGEN;

-- ddr/sdr selection and register instantiation
	DDR_GEN: if DDR = 1 generate
		REG_DDR_GEN: for i in 0 to (WIDTH/(DDR+1)-1) generate
			attribute IOB of Q_REG_DDR:label is REG_IOB;
		begin
			Q_REG_DDR: FDDRRSE
			port map (
				Q => io_pad_delay(i),
				C0 => sample_clk,
				C1 => not_sample_clk,
				CE => one,
				D0 => gateway(i*2),
				D1 => gateway(i*2+1),
				R => zero,
				S => zero
			);
		end generate REG_DDR_GEN;
	end generate DDR_GEN;
	
	SDR_GEN: if DDR = 0 and PORT_BYPASS = 0 generate
		REG_SDR_GEN: for i in 0 to (WIDTH/(DDR+1)-1) generate
			attribute IOB of Q_REG_SDR:label is REG_IOB;
		begin
			Q_REG_SDR: FD
			port map( 
				D => gateway(i),
				Q => io_pad_buf(i),
				C => sample_clk
			);

      OBUF_SDR: OBUF
      port map(
        I => io_pad_buf(i),
        O => io_pad_delay(i)
      );
		end generate REG_SDR_GEN;
	end generate SDR_GEN;

	-- This generate statement is used when bypassing the Port Assignment for a GPIO yellow block
	-- -> e.g. When a signal(s) need to be routed to the BSP and NOT to a physical PORT/Output
	-- -> Needs an equivalent handling wire/port on the other end, e.g. forty_gbe.vhd
	PORT_BYPASS_GEN: if DDR = 0 and PORT_BYPASS = 1 generate
		io_pad <= gateway;
	end generate PORT_BYPASS_GEN;

end Behavioral;
