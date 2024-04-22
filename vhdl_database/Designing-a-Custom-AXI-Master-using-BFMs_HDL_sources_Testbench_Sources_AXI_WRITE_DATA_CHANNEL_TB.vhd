library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AXI_WRITE_DATA_CHANNEL_TB is
end AXI_WRITE_DATA_CHANNEL_TB;



architecture Behavioral of AXI_WRITE_DATA_CHANNEL_TB is

-- Simulation Constants
constant C_S_AXI_DATA_WIDTH     : integer := 32;
constant C_S_AXI_ADDR_WIDTH     : integer := 9;

constant m_axi_aclk_FREQ_HZ     : integer := 100000000;
constant m_axi_aclk_period_NS   : integer := 1000000000 / m_axi_aclk_FREQ_HZ;
constant m_axi_aclk_period_PS   : integer := m_axi_aclk_period_NS * 1000;
constant m_axi_aclk_period_time : time := 1 ns * m_axi_aclk_period_NS;

constant simulation_interval    : time := 100 ns;
constant data_width             : integer := 32;


COMPONENT AXI_WRITE_DATA_CHANNEL is
    GENERIC
        (
        data_width      : integer range 32 to 64 := 32
        );
	PORT
		(
		-- User signals
		clk             : in  STD_LOGIC;
		resetn          : in STD_LOGIC;
		data            : in STD_LOGIC_VECTOR(data_width-1 downto 0);
		data_valid      : in std_logic;
		go              : in STD_LOGIC;
        done            : out STD_LOGIC;
        transaction_ID  : in STD_LOGIC_VECTOR (3 downto 0);
		last_transfer   : in std_logic;
        data_sent       : out std_logic;
       
		-- AXI write data channel signals
		WID			    : out  STD_LOGIC_VECTOR(3 downto 0);
		WDATA		    : out  STD_LOGIC_VECTOR(data_width-1 downto 0);
		WSTRB		    : out  STD_LOGIC_VECTOR((data_width/8)-1 downto 0);
		WLAST           : out  STD_LOGIC;
		WVALID		    : out  STD_LOGIC;
		WREADY		    : in  STD_LOGIC
		);
end COMPONENT;


COMPONENT AXI_WRITE_DATA_CHANNEL_MODEL is
    GENERIC
        (
        data_width : integer range 32 to 64 := 32
        );
	PORT
		(
		-- User signals
		clk			    : in STD_LOGIC;
        resetn          : in STD_LOGIC;
        go              : out STD_LOGIC;
        data            : out STD_LOGIC_vector(data_width-1 downto 0);
        data_valid      : out STD_LOGIC;
        data_sent       : in std_logic;
        last_transfer   : out STD_LOGIC;
        transaction_ID  : out STD_LOGIC_VECTOR (3 downto 0);
        done            : in STD_LOGIC;
--        error           : in STD_LOGIC;
        
        -- AXI Master signals
        WID             : in STD_LOGIC_VECTOR (3 downto 0);
        WDATA           : in STD_LOGIC_VECTOR (data_width-1 downto 0);
        WSTRB           : out  STD_LOGIC_VECTOR((data_width/8)-1 downto 0);
        WLAST           : in STD_LOGIC;
        WVALID          : in STD_LOGIC;
        WREADY          : out STD_LOGIC
		);
end COMPONENT;


-- UUT signals
signal data             : std_logic_vector(data_width-1 downto 0);
signal data_valid       : std_logic;
signal data_sent        : std_logic;
signal last_transfer    : std_logic;
signal transaction_ID   : STD_LOGIC_VECTOR (3 downto 0);
signal go               : std_logic;
signal done             : std_logic;

-- AXI4 Signals
signal m_axi_aclk       : STD_LOGIC;
signal m_axi_aresetn    : STD_LOGIC;
signal m_axi_wready     : std_logic;
signal m_axi_wvalid     : std_logic;
signal m_axi_wdata      : std_logic_vector(data_width-1 downto 0);
signal m_axi_wstrb      : STD_LOGIC_VECTOR((data_width/8)-1 downto 0);
signal m_axi_wid        : STD_LOGIC_VECTOR (3 downto 0);
signal m_axi_wlast      : STD_LOGIC;


-- Testbench control signals
signal sim_end          : boolean := false;
signal cycle_count      : INTEGER := 0;


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
    m_axi_aresetn <= '1';
    wait for m_axi_aclk_period_time * 20;
    m_axi_aresetn <= '0';
    wait for m_axi_aclk_period_time * 5;
    m_axi_aresetn <= '1';
    wait;
end process axi_rst_gen;


stimulus : process
begin
    wait for 5 us;
    sim_end <= true;
    wait;
end process;




UUT : AXI_WRITE_DATA_CHANNEL
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
        data_sent       => data_sent,
        last_transfer   => last_transfer,
        transaction_ID  => transaction_ID,
        go              => go,
        done            => done,
--        error           => error,
        WID             => m_axi_wid,
        WDATA           => m_axi_wdata,
        WSTRB           => m_axi_wstrb,
        WLAST           => m_axi_wlast,
        WVALID          => m_axi_wvalid,
        WREADY          => m_axi_wready
       );



AXI_MODEL : AXI_WRITE_DATA_CHANNEL_MODEL
    PORT MAP
        (
        clk			    => m_axi_aclk,
        resetn          => m_axi_aresetn,
        go              => go,
        data            => data,          
        data_valid      => data_valid,    
        data_sent       => data_sent,    
        last_transfer   => last_transfer, 
        transaction_ID  => transaction_ID,
        done            => done,                     
--        error           => error,         
        WID             => m_axi_wid,     
        WDATA           => m_axi_wdata,   
        WLAST           => m_axi_wlast,   
        WVALID          => m_axi_wvalid,  
        WREADY          => m_axi_wready   
        );                  

end Behavioral;

