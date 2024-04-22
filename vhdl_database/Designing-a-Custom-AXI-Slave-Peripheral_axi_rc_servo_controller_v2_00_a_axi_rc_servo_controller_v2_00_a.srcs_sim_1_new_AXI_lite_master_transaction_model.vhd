library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;


entity AXI_lite_master_transaction_model is
    Port
    (
    -- User signals
    go  : in std_logic;
    RNW : in std_logic;
    busy : out std_logic;
    done : out std_logic;
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
end AXI_lite_master_transaction_model;

architecture Behavioral of AXI_lite_master_transaction_model is

COMPONENT AXI_ADDRESS_CONTROL_CHANNEL_model is
	PORT
		(
		clk			: in  STD_LOGIC;
		resetn       : in STD_LOGIC;
		go          : in std_logic;
		done          : out std_logic;
	    address          : in std_logic_vector(31 downto 0);
		AxADDR		: out  STD_LOGIC_VECTOR(31 downto 0);
		AxVALID		: out  STD_LOGIC;
		AxREADY		: in   STD_LOGIC
		);
END COMPONENT;

COMPONENT AXI_READ_DATA_CHANNEL_model is
	PORT
		(
		clk			: in  STD_LOGIC;
		resetn       : in STD_LOGIC;
		data     : out STD_LOGIC_VECTOR(31 downto 0);
		RDATA			: in  STD_LOGIC_VECTOR(31 downto 0);
		RRESP			: in  STD_LOGIC_VECTOR(1 downto 0);
		RVALID		: in  STD_LOGIC;
		RREADY		: out  STD_LOGIC
		);
END COMPONENT;

COMPONENT AXI_WRITE_DATA_CHANNEL_model is
	PORT
		(
		clk			: in  STD_LOGIC;
		resetn       : in STD_LOGIC;
		go          : in std_logic;
        done        : out std_logic;
		data        : in STD_LOGIC_VECTOR(31 downto 0);
		WDATA			: out  STD_LOGIC_VECTOR(31 downto 0);
		WSTRB			: out  STD_LOGIC_VECTOR(3 downto 0);
		WVALID		: out  STD_LOGIC;
		WREADY		: in  STD_LOGIC
		);
END COMPONENT;

COMPONENT AXI_WRITE_DATA_RESPONSE_CHANNEL_model is
	PORT
		(
		clk			: in  STD_LOGIC;
		resetn       : in STD_LOGIC;
		BRESP	    : in  STD_LOGIC_VECTOR (1 downto 0);
        BVALID		: in  STD_LOGIC;
        BREADY		: out  STD_LOGIC
		);
END COMPONENT;


-- Type declarations
type main_fsm_type is (reset, idle, read_transaction, write_transaction, complete);

signal current_state, next_state : main_fsm_type;
signal read_channel_data : std_logic_vector(31 downto 0);
signal write_channel_data : std_logic_vector(31 downto 0);
signal transaction_address : std_logic_vector(31 downto 0);
signal start_read_transaction : std_logic;
signal start_write_transaction : std_logic;
signal read_transaction_finished : std_logic;
signal write_transaction_finished : std_logic;
signal send_write_data : std_logic;
signal write_data_sent : std_logic;
signal resetn : std_logic;

begin

    state_machine_update : process (m_axi_lite_aclk)
    begin
        if m_axi_lite_aclk'event and m_axi_lite_aclk = '1' then
            if m_axi_lite_aresetn = '0' then
                current_state <= reset;
            else
                current_state <= next_state;
            end if;
        end if;
    end process;

read_data <= read_channel_data;
resetn <= m_axi_lite_aresetn;

state_machine_decisions : process (current_state, read_transaction_finished, write_transaction_finished, go, RNW, address, write_data, read_channel_data)
begin
    write_channel_data <= write_data;
    transaction_address <= address;
    start_read_transaction <= '0';
    start_write_transaction <= '0';
    send_write_data <= '0';
    busy <= '1';
    done <= '0';
    

	case current_state is
		when reset =>
			next_state <= idle;

		when idle =>
			next_state <= idle;
            busy <= '0';
			if go = '1' then
                case RNW is
                    when '1' => next_state <= read_transaction;
                    when '0' => next_state <= write_transaction;
                    when others => NULL;
                end case;
            end if;
		
		when read_transaction =>
            next_state <= read_transaction;
            start_read_transaction <= '1';
            if read_transaction_finished = '1' then
                next_state <= complete;
            end if;
                
		when write_transaction =>
		next_state <= write_transaction;
        start_write_transaction <= '1';
        send_write_data <= '1';
        if write_transaction_finished = '1' and write_data_sent = '1' then
            next_state <= complete;
        end if;

		when complete => 
            next_state <= complete;
            done <= '1';
            if go = '0' then
                next_state <= idle;
            end if;
		
		when others =>
			next_state <= reset;
	end case;
end process;


    -- COMPONENT INSTANTIATIONS
	read_address_channel_model : AXI_ADDRESS_CONTROL_CHANNEL_model
		PORT MAP
			(
			clk => m_axi_lite_aclk,
			resetn => resetn,
			go => start_read_transaction,
            done => read_transaction_finished,
            address => transaction_address,
			AxADDR => m_axi_lite_araddr,
			AxVALID => m_axi_lite_arvalid,
			AxREADY => m_axi_lite_arready
			);
			
	write_address_channel_model : AXI_ADDRESS_CONTROL_CHANNEL_model
		PORT MAP
			(
			clk => m_axi_lite_aclk,
			resetn => resetn,
            go => start_write_transaction,
            done => write_transaction_finished,
            address => transaction_address,
			AxADDR => m_axi_lite_awaddr,
			AxVALID => m_axi_lite_awvalid,
			AxREADY => m_axi_lite_awready
			);

	read_data_channel_model : AXI_READ_DATA_CHANNEL_model
		PORT MAP
			(
			clk => m_axi_lite_aclk,
			resetn => resetn,
			data => read_channel_data,
			RDATA => m_axi_lite_rdata,
			RRESP => m_axi_lite_rresp,
			RVALID => m_axi_lite_rvalid,
			RREADY => m_axi_lite_rready 
			);

	write_data_channel_model : AXI_WRITE_DATA_CHANNEL_model
		PORT MAP
			(
			clk => m_axi_lite_aclk,
			resetn => resetn,
			go => send_write_data,
            done => write_data_sent,
			data => write_channel_data,
			WDATA => m_axi_lite_wdata,
			WSTRB => m_axi_lite_wstrb,
			WVALID => m_axi_lite_wvalid,
			WREADY => m_axi_lite_wready
			);

	write_data_response_channel_model : AXI_WRITE_DATA_RESPONSE_CHANNEL_model
		PORT MAP
			(
			clk => m_axi_lite_aclk,
			resetn => resetn,
			BRESP => m_axi_lite_bresp,
			BVALID => m_axi_lite_bvalid,
			BREADY => m_axi_lite_bready
			);

end Behavioral;
