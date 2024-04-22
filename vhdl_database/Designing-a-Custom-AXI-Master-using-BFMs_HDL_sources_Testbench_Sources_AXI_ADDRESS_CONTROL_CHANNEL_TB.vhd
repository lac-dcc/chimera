library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AXI_ADDRESS_CONTROL_CHANNEL_TB is
end AXI_ADDRESS_CONTROL_CHANNEL_TB;



architecture Behavioral of AXI_ADDRESS_CONTROL_CHANNEL_TB is

COMPONENT AXI_ADDRESS_CONTROL_CHANNEL_MODEL is
	PORT
		(
		-- User signals
		clk               : in  STD_LOGIC;
		resetn            : in  STD_LOGIC;
		go                : out STD_LOGIC;
		done              : in  STD_LOGIC;
        error             : in  STD_LOGIC;
        address           : out STD_LOGIC_VECTOR(31 downto 0);
        burst_length      : out INTEGER range 1 to 256;
        burst_size        : out INTEGER range 1 to 128;
        increment_burst   : out STD_LOGIC;
		
		-- AXI Master signals
		AxID              : in  STD_LOGIC_VECTOR (3 downto 0);
		AxADDR		      : in  STD_LOGIC_VECTOR (31 downto 0);
		AxLEN             : in  STD_LOGIC_VECTOR (7 downto 0);
		AxSIZE            : in  STD_LOGIC_VECTOR (2 downto 0);
		AxBURST           : in  STD_LOGIC_VECTOR (1 downto 0);
		AxLOCK            : in  STD_LOGIC_VECTOR (1 downto 0);
		AxCACHE           : in  STD_LOGIC_VECTOR (3 downto 0);
		AxPROT            : in  STD_LOGIC_VECTOR (2 downto 0);
		AxVALID		      : in  STD_LOGIC;
		AxREADY		      : out STD_LOGIC;
		AxQOS             : in  STD_LOGIC_VECTOR (3 downto 0);
		AxREGION          : in  STD_LOGIC_VECTOR (3 downto 0)
		);
end COMPONENT;


COMPONENT AXI_ADDRESS_CONTROL_CHANNEL is
	PORT
		(
		-- User signals
		clk               : in  STD_LOGIC;
		resetn            : in  STD_LOGIC;
		go                : in  STD_LOGIC;
		done              : out STD_LOGIC;
        error             : out STD_LOGIC;
        address           : in  STD_LOGIC_VECTOR(31 downto 0);
        burst_length      : in  INTEGER range 1 to 256;
        burst_size        : in  INTEGER range 1 to 128;
        increment_burst   : in  STD_LOGIC;
		
		-- AXI Master signals
		AxID              : out STD_LOGIC_VECTOR (3 downto 0);
		AxADDR		      : out STD_LOGIC_VECTOR (31 downto 0);
		AxLEN             : out STD_LOGIC_VECTOR (7 downto 0);
		AxSIZE            : out STD_LOGIC_VECTOR (2 downto 0);
		AxBURST           : out STD_LOGIC_VECTOR (1 downto 0);
		AxLOCK            : out STD_LOGIC_VECTOR (1 downto 0);
		AxCACHE           : out STD_LOGIC_VECTOR (3 downto 0);
		AxPROT            : out STD_LOGIC_VECTOR (2 downto 0);
		AxVALID		      : out STD_LOGIC;
		AxREADY		      : in  STD_LOGIC;
		AxQOS             : out STD_LOGIC_VECTOR (3 downto 0);
		AxREGION          : out STD_LOGIC_VECTOR (3 downto 0)
		);
end COMPONENT;


-- User signals
signal go               : STD_LOGIC;
signal done             : STD_LOGIC;
signal error            : STD_LOGIC;
signal address          : STD_LOGIC_VECTOR(31 downto 0);
signal burst_length     : INTEGER range 1 to 256;
signal burst_size       : INTEGER range 1 to 128;
signal increment_burst  : STD_LOGIC;

--  AXI4 Signals
signal m_axi_aclk       : STD_LOGIC;
signal m_axi_axesetn    : STD_LOGIC;
signal m_axi_axready    : STD_LOGIC;
signal m_axi_axvalid    : STD_LOGIC;
signal m_axi_axaddr     : STD_LOGIC_VECTOR(31 downto 0);
signal m_axi_axid       : STD_LOGIC_VECTOR (3 downto 0);
signal m_axi_axlen      : STD_LOGIC_VECTOR (7 downto 0);
signal m_axi_axsize     : STD_LOGIC_VECTOR (2 downto 0);
signal m_axi_axburst    : STD_LOGIC_VECTOR (1 downto 0);
signal m_axi_axlock     : STD_LOGIC_VECTOR (1 downto 0);
signal m_axi_axcache    : STD_LOGIC_VECTOR (3 downto 0);
signal m_axi_axprot     : STD_LOGIC_VECTOR (2 downto 0);
signal m_axi_axqos      : STD_LOGIC_VECTOR (3 downto 0);
signal m_axi_axregion   : STD_LOGIC_VECTOR (3 downto 0);

-- Testbench control signals
signal sim_end : BOOLEAN := false;
signal cycle_count : INTEGER := 0;

-- Simulation Constants
constant C_S_AXI_DATA_WIDTH : INTEGER := 32;
constant C_S_AXI_ADDR_WIDTH : INTEGER := 9;

constant m_axi_aclk_FREQ_HZ : INTEGER := 100000000;
constant m_axi_aclk_period_NS : INTEGER := 1000000000 / m_axi_aclk_FREQ_HZ;
constant m_axi_aclk_period_PS : INTEGER := m_axi_aclk_period_NS * 1000;
constant m_axi_aclk_period_time : TIME := 1 ns * m_axi_aclk_period_NS;
constant simulation_interval : TIME := 100 ns;

begin

axi_clk_gen : process
begin
   while (not sim_end) loop
	  m_axi_aclk <= '0';
		 wait for m_axi_aclk_period_time / 2;
	  m_axi_aclk <= '1';
		 wait for m_axi_aclk_period_time / 2;
   end loop;
   wait;
end process axi_clk_gen;

axi_rst_gen : process
begin
    m_axi_axesetn <= '1';
    wait for m_axi_aclk_period_time * 20;
    m_axi_axesetn <= '0';
    wait for m_axi_aclk_period_time * 5;
    m_axi_axesetn <= '1';
    wait;
end process axi_rst_gen;


stimulus : process
begin
    wait for 1 us;
    sim_end <= true;
    wait;
end process;


UUT : AXI_ADDRESS_CONTROL_CHANNEL
    PORT MAP
        (
        clk => m_axi_aclk,
        resetn => m_axi_axesetn,
        go => go,
        done => done,
        error => error,
        address => address,
        burst_length => burst_length,
        burst_size => burst_size,
        increment_burst => increment_burst,
        AxADDR => m_axi_axaddr,
        AxVALID => m_axi_axvalid,
        AxREADY => m_axi_axready,
        AxID => m_axi_axid,
        AxLEN => m_axi_axlen,
        AxSIZE => m_axi_axsize,
        AxBURST => m_axi_axburst,
        AxLOCK => m_axi_axlock,
        AxCACHE => m_axi_axcache,
        AxPROT => m_axi_axprot,
        AxQOS => m_axi_axqos,
        AxREGION => m_axi_axregion
        );

AXI_MODEL : AXI_ADDRESS_CONTROL_CHANNEL_MODEL
    PORT MAP
        (
        clk => m_axi_aclk,
        resetn => m_axi_axesetn,
        go => go,
        done => done,
        error => error,
        address => address,
        burst_length => burst_length,
        burst_size => burst_size,
        increment_burst => increment_burst,
        AxADDR => m_axi_axaddr,
        AxVALID => m_axi_axvalid,
        AxREADY => m_axi_axready,
        AxID => m_axi_axid,
        AxLEN => m_axi_axlen,
        AxSIZE => m_axi_axsize,
        AxBURST => m_axi_axburst,
        AxLOCK => m_axi_axlock,
        AxCACHE => m_axi_axcache,
        AxPROT => m_axi_axprot,
        AxQOS => m_axi_axqos,
        AxREGION => m_axi_axregion
        );
end Behavioral;

