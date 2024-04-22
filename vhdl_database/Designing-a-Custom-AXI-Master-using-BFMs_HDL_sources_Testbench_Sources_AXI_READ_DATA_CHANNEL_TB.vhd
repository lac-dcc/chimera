library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AXI_READ_DATA_CHANNEL_TB is
end AXI_READ_DATA_CHANNEL_TB;



architecture Behavioral of AXI_READ_DATA_CHANNEL_TB is

-- Simulation Constants
constant C_S_AXI_DATA_WIDTH     : INTEGER := 32;
constant C_S_AXI_ADDR_WIDTH     : INTEGER := 9;

constant m_axi_aclk_FREQ_HZ     : INTEGER := 100000000;
constant m_axi_aclk_period_NS   : INTEGER := 1000000000 / m_axi_aclk_FREQ_HZ;
constant m_axi_aclk_period_PS   : INTEGER := m_axi_aclk_period_NS * 1000;
constant m_axi_aclk_period_time : TIME    := 1 ns * m_axi_aclk_period_NS;

constant simulation_interval    : TIME    := 100 ns;
constant data_width             : INTEGER := 32;


COMPONENT AXI_READ_DATA_CHANNEL is
    GENERIC
        (
        data_width : INTEGER range 32 to 64 := 32
        );
	PORT
		(
		-- User signals
		clk			    : in  STD_LOGIC;
        resetn          : in  STD_LOGIC;
        data            : out STD_LOGIC_VECTOR(data_width-1 downto 0);
        data_valid      : out STD_LOGIC;
        fifo_ready      : in  STD_LOGIC;
        last_transfer   : out STD_LOGIC;
        transaction_ID  : out STD_LOGIC_VECTOR (3 downto 0);
        go              : in  STD_LOGIC;
        done            : out STD_LOGIC;
        error           : out STD_LOGIC;
		
		-- AXI Master signals
		RID         : in  STD_LOGIC_VECTOR (3 downto 0);
		RDATA		: in  STD_LOGIC_VECTOR (data_width-1 downto 0);
		RRESP		: in  STD_LOGIC_VECTOR (1 downto 0);
		RLAST		: in  STD_LOGIC;
		RVALID		: in  STD_LOGIC;
		RREADY		: out STD_LOGIC
		);
end COMPONENT;

COMPONENT AXI_READ_DATA_CHANNEL_MODEL is
    GENERIC
        (
        data_width : INTEGER range 32 to 64 := 32
        );
	PORT
		(
		-- User signals
		clk			    : in  STD_LOGIC;
        resetn          : in  STD_LOGIC;
        go              : out STD_LOGIC;
        data            : in  STD_LOGIC_vector(data_width-1 downto 0);
        data_valid      : in  STD_LOGIC;
        fifo_ready      : out STD_LOGIC;
        last_transfer   : in  STD_LOGIC;
        transaction_ID  : in  STD_LOGIC_VECTOR (3 downto 0);
        done            : in  STD_LOGIC;
        error           : in  STD_LOGIC;
        
        -- AXI Master signals
        RID             : out STD_LOGIC_VECTOR (3 downto 0);
        RDATA           : out STD_LOGIC_VECTOR (data_width-1 downto 0);
        RRESP           : out STD_LOGIC_VECTOR (1 downto 0);
        RLAST           : out STD_LOGIC;
        RVALID          : out STD_LOGIC;
        RREADY          : in  STD_LOGIC
		);
end COMPONENT;


-- User signals
signal clk             : STD_LOGIC;
signal resetn          : STD_LOGIC;
signal data            : STD_LOGIC_VECTOR(data_width-1 downto 0);
signal data_valid      : STD_LOGIC;
signal fifo_ready      : STD_LOGIC;
signal last_transfer   : STD_LOGIC;
signal transaction_ID  : STD_LOGIC_VECTOR (3 downto 0);
signal go              : STD_LOGIC;
signal done            : STD_LOGIC;
signal error           : STD_LOGIC;

-- AXI4 Signals
signal m_axi_aclk       : STD_LOGIC;
signal m_axi_aresetn    : STD_LOGIC;
signal m_axi_rready     : STD_LOGIC;
signal m_axi_rvalid     : STD_LOGIC;
signal m_axi_rdata      : STD_LOGIC_VECTOR(data_width-1 downto 0);
signal m_axi_rresp      : STD_LOGIC_VECTOR(1 downto 0);
signal m_axi_rid        : STD_LOGIC_VECTOR (3 downto 0);
signal m_axi_rlast      : STD_LOGIC;


-- Testbench control signals
signal sim_end          : boolean := false;
signal cycle_count      : INTEGER := 0;


begin

-- Generate a clock
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

-- Generate a reset pulse
axi_rst_gen : process
begin
    m_axi_aresetn <= '1';
    wait for m_axi_aclk_period_time * 20;
    m_axi_aresetn <= '0';
    wait for m_axi_aclk_period_time * 5;
    m_axi_aresetn <= '1';
    wait;
end process axi_rst_gen;


stimulus : process
begin
    wait for 1 us;
    sim_end <= true;
    wait;
end process;


UUT : AXI_READ_DATA_CHANNEL
    GENERIC MAP
        (
        data_width => data_width
        )
    PORT MAP
        (
        clk             => m_axi_aclk,
        resetn          => m_axi_aresetn,
        data            => data,
        data_valid      => data_valid,
        fifo_ready      => fifo_ready,
        last_transfer   => last_transfer,
        transaction_ID  => transaction_ID,
        go              => go,
        done            => done,
        error           => error,
        RID             => m_axi_rid,
        RDATA           => m_axi_rdata,
        RRESP           => m_axi_rresp,
        RLAST           => m_axi_rlast,
        RVALID          => m_axi_rvalid,
        RREADY          => m_axi_rready
       );

AXI_MODEL : AXI_READ_DATA_CHANNEL_MODEL
    PORT MAP
        (
        clk             => m_axi_aclk,
        resetn          => m_axi_aresetn,
        data            => data,
        data_valid      => data_valid,
        fifo_ready      => fifo_ready,
        last_transfer   => last_transfer,
        transaction_ID  => transaction_ID,
        go              => go,
        done            => done,
        error           => error,
        RID             => m_axi_rid,
        RDATA           => m_axi_rdata,
        RRESP           => m_axi_rresp,
        RLAST           => m_axi_rlast,
        RVALID          => m_axi_rvalid,
        RREADY          => m_axi_rready
        );
end Behavioral;

