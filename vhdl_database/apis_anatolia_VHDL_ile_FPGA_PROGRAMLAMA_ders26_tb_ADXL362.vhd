library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_ADXL362 is
generic (
	c_clkfreq 			: integer := 100_000_000;
	c_sclkfreq 			: integer := 1_000_000;
	c_readfreq			: integer := 1_000;
	c_cpol				: std_logic := '0';
	c_cpha				: std_logic := '0'
);
end tb_ADXL362;

architecture Behavioral of tb_ADXL362 is

-- Component Declaration for the Unit Under Test (UUT)

COMPONENT ADXL362 is
generic (
	c_clkfreq 			: integer := 100_000_000;
	c_sclkfreq 			: integer := 1_000_000;
	c_readfreq			: integer := 1_000;
	c_cpol				: std_logic := '0';
	c_cpha				: std_logic := '0'
);
Port ( 
	clk_i 	: in STD_LOGIC;
	miso_i 	: in STD_LOGIC;
	mosi_o 	: out STD_LOGIC;
	sclk_o 	: out STD_LOGIC;
	cs_o 	: out STD_LOGIC;
	ax_o 	: out STD_LOGIC_VECTOR (15 downto 0);
	ay_o 	: out STD_LOGIC_VECTOR (15 downto 0);
	az_o 	: out STD_LOGIC_VECTOR (15 downto 0);
	ready_o	: out STD_LOGIC
);
end COMPONENT;
	
--Inputs
signal clk_i : std_logic := '0';
signal miso_i : std_logic := '0';

--Outputs
signal ax_o 	: STD_LOGIC_VECTOR (15 downto 0);
signal ay_o 	: STD_LOGIC_VECTOR (15 downto 0);
signal az_o 	: STD_LOGIC_VECTOR (15 downto 0);
signal ready_o	: STD_LOGIC;
signal cs_o 	: std_logic;
signal sclk_o 	: std_logic;
signal mosi_o 	: std_logic;

-- Clock period definitions
constant clk_i_period 	: time := 10 ns;
constant sckPeriod 		: time := 1 us;

signal SPISIGNAL : std_logic_vector(7 downto 0) := (others => '0');
signal spiWrite : std_logic := '0';
signal spiWriteDone : std_logic := '0';   

begin

-- Instantiate the Unit Under Test (UUT)
DUT : ADXL362
generic map(
	c_clkfreq 	=> c_clkfreq 	,
	c_sclkfreq 	=> c_sclkfreq 	,
	c_readfreq	=> c_readfreq	,
	c_cpol		=> c_cpol		,
	c_cpha		=> c_cpha		
)
Port map( 
	clk_i 	=> clk_i 	   ,
	miso_i 	=> miso_i 	   ,
	mosi_o 	=> mosi_o 	   ,
	sclk_o 	=> sclk_o 	   ,
	cs_o 	=> cs_o 	   ,
	ax_o 	=> ax_o 	   ,
	ay_o 	=> ay_o 	   ,
	az_o 	=> az_o 	   ,
	ready_o	=> ready_o	
);

-- Clock process definitions
clk_i_process :process
begin
	clk_i <= '0';
	wait for clk_i_period/2;
	clk_i <= '1';
	wait for clk_i_period/2;
end process;

SPIWRITE_P : process begin

	wait until rising_edge(spiWrite);

    if (c_cpol = '0' and c_cpha = '0') or (c_cpol = '1' and c_cpha = '1') then
        for i in 0 to 7 loop
            miso_i    <= SPISIGNAL(7-i);  wait until falling_edge(sclk_o);
        end loop;
    end if ;

	if (c_cpol = '0' and c_cpha = '1') or (c_cpol = '1' and c_cpha = '0') then
        for i in 0 to 7 loop
            miso_i    <= SPISIGNAL(7-i); wait until rising_edge(sclk_o); 
        end loop;
    end if ;
	spiWriteDone    <= '1'; wait for 1 ps; spiWriteDone    <= '0';
	
end process;

stim_proc: process  -- Stimulus process
begin		

    wait for clk_i_period*10;
	wait for 1 ms;
    
	-- CPOL,CPHA = 00  -- write 0xAA, 0xBB, 0xCC,  read 0xA1, 0xA2,
    wait until falling_edge(cs_o);      
	wait for 15.51 us; wait until falling_edge(sclk_o);
	wait for clk_i_period ; wait for 1 ps;
	SPISIGNAL <= x"A1"; spiWrite    <= '1';  wait for 1 ps;  spiWrite    <= '0';           -- AX_L
	wait until rising_edge(spiWriteDone); wait for 1 ps; 
	-- wait until falling_edge(sclk_o);  wait for 1 ps; wait until falling_edge(sclk_o); wait for 1 ps;
	SPISIGNAL <= x"A2"; spiWrite    <= '1';  wait for 1 ps;  spiWrite    <= '0';           -- AX_H
	wait until rising_edge(spiWriteDone); wait for 1 ps;
	-- wait until falling_edge(sclk_o);  wait for 1 ps; wait until falling_edge(sclk_o); wait for 1 ps;
	SPISIGNAL <= x"A3"; spiWrite    <= '1';  wait for 1 ps;  spiWrite    <= '0';           -- AY_L
	wait until rising_edge(spiWriteDone); wait for 1 ps;
	-- wait until falling_edge(sclk_o);  wait for 1 ps; wait until falling_edge(sclk_o); wait for 1 ps;
	SPISIGNAL <= x"A4"; spiWrite    <= '1';  wait for 1 ps;  spiWrite    <= '0';           -- AY_H
	wait until rising_edge(spiWriteDone); wait for 1 ps;
	-- wait until falling_edge(sclk_o);  wait for 1 ps; wait until falling_edge(sclk_o); wait for 1 ps;
	SPISIGNAL <= x"A5"; spiWrite    <= '1';  wait for 1 ps;  spiWrite    <= '0';           -- AZ_L
	wait until rising_edge(spiWriteDone); wait for 1 ps;
	-- wait until falling_edge(sclk_o);  wait for 1 ps; wait until falling_edge(sclk_o); wait for 1 ps;
	SPISIGNAL <= x"A6"; spiWrite    <= '1';  wait for 1 ps;  spiWrite    <= '0';           -- AZ_H	
	wait until rising_edge(spiWriteDone); wait for 1 ps;
	wait until rising_edge(cs_o);
	
	
	wait for 20 us;
	-- wait until rising_edge(data_ready_o); wait for clk_i_period ;
	
    -- wait until rising_edge(data_ready_o); wait for clk_i_period ; wait for 1 ps;
	-- SPISIGNAL <= x"A1"; spiWrite    <= '1';  wait for 1 ps;  spiWrite    <= '0';           -- AX_L
	-- wait until rising_edge(data_ready_o); wait for clk_i_period ; wait for 1 ps;           
    -- SPISIGNAL <= x"A2"; spiWrite    <= '1';  wait for 1 ps;  spiWrite    <= '0';           -- AX_H
    -- wait until rising_edge(data_ready_o); wait for clk_i_period ; wait for 1 ps;
	-- SPISIGNAL <= x"A3"; spiWrite    <= '1';  wait for 1 ps;  spiWrite    <= '0';           -- AY_L
	-- wait until rising_edge(data_ready_o); wait for clk_i_period ; wait for 1 ps;           
    -- SPISIGNAL <= x"A4"; spiWrite    <= '1';  wait for 1 ps;  spiWrite    <= '0';           -- AY_H
    -- wait until rising_edge(data_ready_o); wait for clk_i_period ; wait for 1 ps;	
	-- SPISIGNAL <= x"A5"; spiWrite    <= '1';  wait for 1 ps;  spiWrite    <= '0';           -- AZ_L
	-- wait until rising_edge(data_ready_o); wait for clk_i_period ; wait for 1 ps;           
    -- SPISIGNAL <= x"A6"; spiWrite    <= '1';  wait for 1 ps;  spiWrite    <= '0';           -- AZ_H
    -- wait until rising_edge(data_ready_o); wait for clk_i_period ; wait for 1 ps;
    
    wait for clk_i_period*40 ;
    
    assert false  report "SIM DONE" severity failure;
    
end process;


end Behavioral;
