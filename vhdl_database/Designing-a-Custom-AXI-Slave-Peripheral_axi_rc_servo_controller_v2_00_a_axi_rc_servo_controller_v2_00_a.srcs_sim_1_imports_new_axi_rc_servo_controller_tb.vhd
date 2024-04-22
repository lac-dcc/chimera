LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;


ENTITY axi_rc_servo_controller_testbench IS
END axi_rc_servo_controller_testbench;
 

ARCHITECTURE behaviour OF axi_rc_servo_controller_testbench IS 

-- Simulation Constants
constant NUMBER_OF_SERVOS : integer := 4;
constant C_S_AXI_DATA_WIDTH : integer := 32;
constant C_S_AXI_ADDR_WIDTH : integer := 9;

constant C_S_AXI_ACLK_FREQ_HZ : integer := 50000000;
constant AXI_ACLK_period : time := 20 ns;  -- 50MHz

constant simulation_interval : time := 50 ms;

 
-- Component Declaration for the Unit Under Test (UUT)
COMPONENT axi_rc_servo_controller is
    generic
        (
        C_FAMILY           : string       := "virtex7";
        -- AXI Parameters
        C_S_AXI_ACLK_FREQ_HZ  : integer   := 100_000_000;
        C_S_AXI_DATA_WIDTH : integer := 32;
        C_S_AXI_ADDR_WIDTH : integer := 9;  
        -- Servo Parameters
        NUMBER_OF_SERVOS : integer range 1 to 32 := 1;
        MINIMUM_HIGH_PULSE_WIDTH_NS : integer := 1000000;
        MAXIMUM_HIGH_PULSE_WIDTH_NS : integer := 2000000
        );
    port
        (
        servo_control_output           : out std_logic_vector(0 to NUMBER_OF_SERVOS-1);
        S_AXI_ACLK                     : in  std_logic;
        S_AXI_ARESETN                  : in  std_logic;
        S_AXI_AWADDR                   : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
        S_AXI_AWVALID                  : in  std_logic;
        S_AXI_AWREADY                  : out std_logic;
        S_AXI_ARADDR                   : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
        S_AXI_ARVALID                  : in  std_logic;
        S_AXI_ARREADY                  : out std_logic;
        S_AXI_WDATA                    : in  std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
        S_AXI_WSTRB                    : in  std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
        S_AXI_WVALID                   : in  std_logic;
        S_AXI_WREADY                   : out std_logic;
        S_AXI_RDATA                    : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
        S_AXI_RRESP                    : out std_logic_vector(1 downto 0);
        S_AXI_RVALID                   : out std_logic;
        S_AXI_RREADY                   : in  std_logic;
        S_AXI_BRESP                    : out std_logic_vector(1 downto 0);
        S_AXI_BVALID                   : out std_logic;
        S_AXI_BREADY                   : in  std_logic
        );
END COMPONENT;

COMPONENT AXI_lite_master_transaction_model is
    Port
    (
    -- User signals
    go  : in std_logic;
    busy : out std_logic;
    done : out std_logic;
    rnw : in std_logic;
    address : in std_logic_vector(31 downto 0);
    write_data : in std_logic_vector(31 downto 0);
    read_data : out std_logic_vector(31 downto 0);
    --  AXI4 Signals
    --  AXI4 Clock / Reset
    m_axi_lite_aclk            : in  std_logic;
    m_axi_lite_aresetn         : in  std_logic;
    --  AXI4 Read Address Channel
    m_axi_lite_arready         : in  std_logic;
    m_axi_lite_arvalid         : out std_logic;
    m_axi_lite_araddr          : out std_logic_vector(31 downto 0);
    --  AXI4 Read Data Channel
    m_axi_lite_rready          : out std_logic;
    m_axi_lite_rvalid          : in  std_logic;
    m_axi_lite_rdata           : in  std_logic_vector(31 downto 0);
    m_axi_lite_rresp           : in  std_logic_vector(1 downto 0);
    -- AXI4 Write Address Channel
    m_axi_lite_awready         : in  std_logic;
    m_axi_lite_awvalid         : out std_logic;
    m_axi_lite_awaddr          : out std_logic_vector(31 downto 0);
    -- AXI4 Write Data Channel
    m_axi_lite_wready          : in  std_logic;
    m_axi_lite_wvalid          : out std_logic;
    m_axi_lite_wdata           : out std_logic_vector(31 downto 0);
    m_axi_lite_wstrb           : out std_logic_vector(3 downto 0);
    -- AXI4 Write Response Channel
    m_axi_lite_bready          : out std_logic;
    m_axi_lite_bvalid          : in  std_logic;
    m_axi_lite_bresp           : in  std_logic_vector(1 downto 0)
    );
end component;


signal AXI_ACLK_period_PS : integer := (AXI_ACLK_period / 1 ps);
signal servo_control_output           : std_logic_vector(0 to NUMBER_OF_SERVOS-1);
signal AXI_ACLK                     : std_logic;
signal AXI_ARESETN                  : std_logic;
signal AXI_AWADDR                   : std_logic_vector(31 downto 0);
signal AXI_AWVALID                  : std_logic;
signal AXI_WDATA                    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
signal AXI_WSTRB                    : std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
signal AXI_WVALID                   : std_logic;
signal AXI_BREADY                   : std_logic;
signal AXI_ARADDR                   : std_logic_vector(31 downto 0);
signal AXI_ARVALID                  : std_logic;
signal AXI_RREADY                   : std_logic;
signal AXI_ARREADY                  : std_logic;
signal AXI_RDATA                    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
signal AXI_RRESP                    : std_logic_vector(1 downto 0);
signal AXI_RVALID                   : std_logic;
signal AXI_WREADY                   : std_logic;
signal AXI_BRESP                    : std_logic_vector(1 downto 0);
signal AXI_BVALID                   : std_logic;
signal AXI_AWREADY                  : std_logic;
 
signal go  : std_logic;
signal busy : std_logic;
signal done : std_logic;
signal rnw : std_logic;
signal address : std_logic_vector(31 downto 0);
signal write_data : std_logic_vector(31 downto 0);
signal read_data : std_logic_vector(31 downto 0);

-- Testbench control signals
signal sim_end : boolean := false;
signal cycle_count : integer := 0;


BEGIN

axi_clk_gen : process
begin
   while (not sim_end) loop
	  AXI_ACLK <= '0';
		 wait for AXI_ACLK_period / 2;
	  AXI_ACLK <= '1';
		 wait for AXI_ACLK_period / 2;
   end loop;
   wait;
end process axi_clk_gen;

axi_rst_gen : process
begin
    AXI_ARESETN <= '1';
    wait for AXI_ACLK_period * 20;
    AXI_ARESETN <= '0';
    wait for AXI_ACLK_period * 5;
    AXI_ARESETN <= '1';
    wait;
end process axi_rst_gen;


stimulus : process
begin
	-- Set an idle state
    address <= X"00000000";
    write_data <= X"00000000";
    rnw <= '0';
    go <= '0';

	wait for simulation_interval;


	-- Generate a write transaction to the Manual Mode Control Register
	address <= X"30000000";
    write_data <= X"DEADBEEF";
    rnw <= '0';
    go <= '1';
	wait for AXI_ACLK_period;
	wait until done = '1';
    go <= '0';
	wait for AXI_ACLK_period;
	address <= X"00000000";
    
	wait for simulation_interval;

	-- Generate a read transaction from the Manual Mode Control Register
	address <= X"30000000";
    write_data <= X"00000000";
    rnw <= '1';
    go <= '1';
	wait for AXI_ACLK_period;
	wait until done = '1';
    go <= '0';
	wait for AXI_ACLK_period;
	address <= X"00000000";

	wait for simulation_interval;

    -- Write to the Manual Mode Control Register to set only the fourth servo controller only to manual mode
    address <= X"30000000";
    write_data <= X"00000008";
    rnw <= '0';
    go <= '1';
    wait for AXI_ACLK_period;
    wait until done = '1';
    go <= '0';
    wait for AXI_ACLK_period;
    address <= X"00000000";

	wait for simulation_interval;

	-- Set the Manual Mode Data Register to lock the output from servos 3 & 4 high (but only the 4th will be affected)
	address <= X"30000004";
    write_data <= X"0000000C";
    rnw <= '0';
    go <= '1';
    wait for AXI_ACLK_period;
    wait until done = '1';
    go <= '0';
    wait for AXI_ACLK_period;
    address <= X"00000000";

	wait for simulation_interval;

	-- Generate a read transaction from the Manual Mode Data Register
    address <= X"30000004";
    write_data <= X"00000000";
    rnw <= '1';
    go <= '1';
    wait for AXI_ACLK_period;
    wait until done = '1';
    go <= '0';
    wait for AXI_ACLK_period;
    address <= X"00000000";

	wait for simulation_interval;


   -- Update the Manual Mode Control Register to set only the third servo controller only to manual mode, and release the fourth into automatic
    address <= X"30000000";
    write_data <= X"00000004";
    rnw <= '0';
    go <= '1';
    wait for AXI_ACLK_period;
    wait until done = '1';
    go <= '0';
    wait for AXI_ACLK_period;
    address <= X"00000000";

	wait for simulation_interval;

	-- Set the 1st servo controller to a specific position
	address <= X"30000080";
    write_data <= X"00000080";
    rnw <= '0';
    go <= '1';
    wait for AXI_ACLK_period;
    wait until done = '1';
    go <= '0';
    wait for AXI_ACLK_period;
    address <= X"00000000";

    wait for simulation_interval;


	-- Set the 2nd servo controller to a specific position
	address <= X"30000084";
    write_data <= X"000000E0";
    rnw <= '0';
    go <= '1';
    wait for AXI_ACLK_period;
    wait until done = '1';
    go <= '0';
    wait for AXI_ACLK_period;
    address <= X"00000000";

    wait for simulation_interval;


	-- Set the 3rd servo controller to a specific position
	address <= X"30000088";
    write_data <= X"00000010";
    rnw <= '0';
    go <= '1';
    wait for AXI_ACLK_period;
    wait until done = '1';
    go <= '0';
    wait for AXI_ACLK_period;
    address <= X"00000000";

    wait for simulation_interval;


	-- Set the 4rd servo controller to a specific position
	address <= X"3000008C";
    write_data <= X"00000020";
    rnw <= '0';
    go <= '1';
    wait for AXI_ACLK_period;
    wait until done = '1';
    go <= '0';
    wait for AXI_ACLK_period;
    address <= X"00000000";

    wait for simulation_interval * 5;


	-- Read back the position of the 1st servo
	address <= X"30000080";
    write_data <= X"00000000";
    rnw <= '1';
    go <= '1';
    wait for AXI_ACLK_period;
    wait until done = '1';
    go <= '0';
    wait for AXI_ACLK_period;
    address <= X"00000000";

    wait for simulation_interval * 5;

    
    -- NOW WE WILL TEST THE PULSE WIDTH MIN AND MAX SETTINGS
    -- SET ALL OF THE SERVO POSITIONS TO THE SAME VALUE, BUT WITH DIFFERENT MIN/MAX VALUES

	-- Set the 1st servo controller to the mid position
	address <= X"30000080";
    write_data <= X"00000080";
    rnw <= '0';
    go <= '1';
    wait for AXI_ACLK_period;
    wait until done = '1';
    go <= '0';
    wait for AXI_ACLK_period;
    address <= X"00000000";
    wait for AXI_ACLK_period;

	-- Set the 2nd servo controller to the mid position
	address <= X"30000084";
    write_data <= X"00000080";
    rnw <= '0';
    go <= '1';
    wait for AXI_ACLK_period;
    wait until done = '1';
    go <= '0';
    wait for AXI_ACLK_period;
    address <= X"00000000";
    wait for AXI_ACLK_period;

	-- Set the 3rd servo controller to the mid position
    address <= X"30000088";
    write_data <= X"00000080";
    rnw <= '0';
    go <= '1';
    wait for AXI_ACLK_period;
    wait until done = '1';
    go <= '0';
    wait for AXI_ACLK_period;
    address <= X"00000000";
    wait for AXI_ACLK_period;

	-- Set the 4th servo controller to the mid position
	address <= X"3000008C";
    write_data <= X"00000080";
    rnw <= '0';
    go <= '1';
    wait for AXI_ACLK_period;
    wait until done = '1';
    go <= '0';
    wait for AXI_ACLK_period;
    address <= X"00000000";
    wait for AXI_ACLK_period;
    
    wait for simulation_interval;


	-- Set the 1st servo's low endstop
	address <= X"30000100";
    write_data <= X"000CFFFF";
    rnw <= '0';
    go <= '1';
    wait for AXI_ACLK_period;
    wait until done = '1';
    go <= '0';
    wait for AXI_ACLK_period;
    address <= X"00000000";
    wait for AXI_ACLK_period;
    
    wait for simulation_interval;

	-- Set the 2nd servo's low endstop
	address <= X"30000104";
    write_data <= std_logic_vector(to_unsigned(600000, 32));
    rnw <= '0';
    go <= '1';
    wait for AXI_ACLK_period;
    wait until done = '1';
    go <= '0';
    wait for AXI_ACLK_period;
    address <= X"00000000";
    wait for AXI_ACLK_period;
    
    wait for simulation_interval;

	-- Set the 3rd servo's high endstop
	address <= X"30000188";
    write_data <= std_logic_vector(to_unsigned(2500000, 32));
    rnw <= '0';
    go <= '1';
    wait for AXI_ACLK_period;
    wait until done = '1';
    go <= '0';
    wait for AXI_ACLK_period;
    address <= X"00000000";
    wait for AXI_ACLK_period;
    
    wait for simulation_interval;

	-- Set the 4th servo's high endstop
	address <= X"3000018C";
    write_data <= std_logic_vector(to_unsigned(3000000, 32));
    rnw <= '0';
    go <= '1';
    wait for AXI_ACLK_period;
    wait until done = '1';
    go <= '0';
    wait for AXI_ACLK_period;
    address <= X"00000000";
    wait for AXI_ACLK_period;
    
    wait for simulation_interval;


	-- End of Stimuli.  Give some time to finish up.
	wait for simulation_interval * 5;

	sim_end <= true;
	wait;
end process stimulus;
 
 
UUT : axi_rc_servo_controller
	GENERIC MAP
		(
        C_S_AXI_ACLK_FREQ_HZ => C_S_AXI_ACLK_FREQ_HZ,
        C_S_AXI_DATA_WIDTH => C_S_AXI_DATA_WIDTH,
        C_S_AXI_ADDR_WIDTH => C_S_AXI_ADDR_WIDTH,
        -- Servo Parameters
        NUMBER_OF_SERVOS => NUMBER_OF_SERVOS
 		)
	PORT MAP
		(
		servo_control_output => servo_control_output,
        S_AXI_ACLK => AXI_ACLK,
        S_AXI_ARESETN => AXI_ARESETN,
        S_AXI_AWADDR => AXI_AWADDR(C_S_AXI_ADDR_WIDTH-1 downto 0),
        S_AXI_AWVALID => AXI_AWVALID,
        S_AXI_WDATA => AXI_WDATA,
        S_AXI_WSTRB => AXI_WSTRB,
        S_AXI_WVALID => AXI_WVALID,
        S_AXI_BREADY => AXI_BREADY,
        S_AXI_ARADDR => AXI_ARADDR(C_S_AXI_ADDR_WIDTH-1 downto 0),
        S_AXI_ARVALID => AXI_ARVALID,
        S_AXI_RREADY => AXI_RREADY,
        S_AXI_ARREADY => AXI_ARREADY,
        S_AXI_RDATA => AXI_RDATA,
        S_AXI_RRESP => AXI_RRESP,
        S_AXI_RVALID => AXI_RVALID,
        S_AXI_WREADY => AXI_WREADY,
        S_AXI_BRESP => AXI_BRESP,
        S_AXI_BVALID => AXI_BVALID,
        S_AXI_AWREADY => AXI_AWREADY
		);

AXI_MASTER_MODEL : AXI_lite_master_transaction_model
--	GENERIC MAP
--		(
-- 		)
	PORT MAP
		(
		go => go,
        busy => busy,
        done => done,
        rnw => rnw,
        address => address,
        write_data => write_data,
        read_data => read_data,
        m_axi_lite_aclk => AXI_ACLK,
        m_axi_lite_aresetn => AXI_ARESETN,
        m_axi_lite_arready => AXI_ARREADY,
        m_axi_lite_arvalid => AXI_ARVALID,
        m_axi_lite_araddr => AXI_ARADDR,
        m_axi_lite_rready => AXI_RREADY,
        m_axi_lite_rvalid => AXI_RVALID,
        m_axi_lite_rdata => AXI_RDATA,
        m_axi_lite_rresp => AXI_RRESP,
        m_axi_lite_awready => AXI_AWREADY,
        m_axi_lite_awvalid => AXI_AWVALID,
        m_axi_lite_awaddr => AXI_AWADDR,
        m_axi_lite_wready => AXI_WREADY,
        m_axi_lite_wvalid => AXI_WVALID,
        m_axi_lite_wdata => AXI_WDATA,
        m_axi_lite_wstrb => AXI_WSTRB,
        m_axi_lite_bready => AXI_BREADY,
        m_axi_lite_bvalid => AXI_BVALID,
        m_axi_lite_bresp => AXI_BRESP
		);

END;
