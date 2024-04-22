library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AXI_WRITE_DATA_RESPONSE_CHANNEL_TB is
end AXI_WRITE_DATA_RESPONSE_CHANNEL_TB;

architecture Behavioral of AXI_WRITE_DATA_RESPONSE_CHANNEL_TB is

-- Simulation Constants
constant C_S_AXI_DATA_WIDTH     : integer := 32;
constant C_S_AXI_ADDR_WIDTH     : integer := 9;

constant m_axi_aclk_FREQ_HZ     : integer := 100000000;
constant m_axi_aclk_period_NS   : integer := 1000000000 / m_axi_aclk_FREQ_HZ;
constant m_axi_aclk_period_PS   : integer := m_axi_aclk_period_NS * 1000;
constant m_axi_aclk_period_time : time := 1 ns * m_axi_aclk_period_NS;

constant simulation_interval    : time := 100 ns;
constant data_width             : integer := 32;


COMPONENT AXI_WRITE_DATA_RESPONSE_CHANNEL is
	PORT
        (
        clk             : in  STD_LOGIC;
        resetn          : in  STD_LOGIC;
        transaction_ID  : out STD_LOGIC_VECTOR (3 downto 0);
        BID             : in  STD_LOGIC_VECTOR (3 downto 0);
        BRESP           : in  STD_LOGIC_VECTOR (1 downto 0);
        BVALID          : in  STD_LOGIC;
        BREADY          : out STD_LOGIC
        );
end COMPONENT;


COMPONENT AXI_WRITE_DATA_RESPONSE_CHANNEL_MODEL is
	PORT
        (
        clk             : in  STD_LOGIC;
        resetn          : in  STD_LOGIC;
		go              : in  STD_LOGIC;
        done            : out STD_LOGIC;
        transaction_ID  : in  STD_LOGIC_VECTOR (3 downto 0);
        BID             : out STD_LOGIC_VECTOR (3 downto 0);
        BRESP           : out STD_LOGIC_VECTOR (1 downto 0);
        BVALID          : out STD_LOGIC;
        BREADY          : in  STD_LOGIC
        );
end COMPONENT;


-- UUT signals
signal transaction_ID   : STD_LOGIC_VECTOR (3 downto 0);
signal go               : STD_LOGIC;
signal done             : STD_LOGIC;
signal error            : STD_LOGIC;

-- AXI4 Signals
signal m_axi_aclk       : STD_LOGIC;
signal m_axi_aresetn    : STD_LOGIC;
signal m_axi_bresp      : STD_LOGIC_VECTOR (1 downto 0);
signal m_axi_bready     : std_logic;
signal m_axi_bvalid     : std_logic;
signal m_axi_bid        : STD_LOGIC_VECTOR (3 downto 0);


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
    go <= '0';
    wait for m_axi_aclk_period_time * 40;
    go <= '1';
    wait until done = '1';
    wait until m_axi_aclk = '1';
    go <= '0';
    
    wait for 1 us;
    sim_end <= true;
    wait;
end process;




UUT : AXI_WRITE_DATA_RESPONSE_CHANNEL
    PORT MAP
        (
        clk             => m_axi_aclk,
        resetn          => m_axi_aresetn,
        transaction_ID  => transaction_ID,
        BID             => m_axi_bid,
        BRESP           => m_axi_bresp,
        BVALID          => m_axi_bvalid,
        BREADY          => m_axi_bready
       );



AXI_MODEL : AXI_WRITE_DATA_RESPONSE_CHANNEL_MODEL
    PORT MAP
        (
        clk			    => m_axi_aclk,
        resetn          => m_axi_aresetn,
        go              => go,
        done            => done,                     
        transaction_ID  => transaction_ID,
        BID             => m_axi_bid,     
        BRESP           => m_axi_bresp,
        BVALID          => m_axi_bvalid,  
        BREADY          => m_axi_bready   
        );                  

end Behavioral;

