library IEEE;
use IEEE.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;


entity AXI_master is
    Generic
        (
        data_width : integer range 32 to 64 := 32
        );
    Port
        (
        -- User signals
        go                  : in  std_logic;
        error               : out std_logic;
        RNW                 : in  std_logic;
        busy                : out std_logic;
        done                : out std_logic;
        address             : in  std_logic_vector(31 downto 0);
        write_data          : in  std_logic_vector(data_width-1 downto 0);
        read_data           : out std_logic_vector(data_width-1 downto 0);
        burst_length        : in  std_logic_vector(7 downto 0); -- number of beats in a burst
        burst_size          : in  std_logic_vector(6 downto 0); -- number of byte lanes in each beat
        increment_burst     : in  std_logic;  -- 1 = incrementing addresses, 0 = mailbox / fifo style writes
        clear_data_fifos    : in  std_logic;
        write_fifo_en       : in  std_logic;
        write_fifo_empty    : out std_logic;
        write_fifo_full     : out std_logic;
        read_fifo_en        : in  std_logic;
        read_fifo_empty     : out std_logic;
        read_fifo_full      : out std_logic;
        
        --  AXI4 Signals
        --  AXI4 Clock / Reset
        m_axi_aclk              : in  std_logic;
        m_axi_aresetn           : in  std_logic;
        --  AXI4 Read Address Channel
        m_axi_arready           : in  std_logic;
        m_axi_arvalid           : out std_logic;
        m_axi_araddr            : out std_logic_vector(31 downto 0);
        m_axi_arid              : out std_logic_vector (3 downto 0);
        m_axi_arlen             : out std_logic_vector (7 downto 0);
        m_axi_arsize            : out std_logic_vector (2 downto 0);
        m_axi_arburst           : out std_logic_vector (1 downto 0);
        m_axi_arlock            : out std_logic;
        m_axi_arcache           : out std_logic_vector (3 downto 0);
        m_axi_arprot            : out std_logic_vector (2 downto 0);
        m_axi_arqos             : out std_logic_vector (3 downto 0);
        m_axi_arregion          : out std_logic_vector (3 downto 0);
        --  AXI4 Read Data Channel
        m_axi_rready            : out std_logic;
        m_axi_rvalid            : in  std_logic;
        m_axi_rdata             : in  std_logic_vector(data_width-1 downto 0);
        m_axi_rresp             : in  std_logic_vector(1 downto 0);
        m_axi_rid               : in  std_logic_vector (3 downto 0);
        m_axi_rlast             : in  std_logic;
        -- AXI4 Write Address Channel
        m_axi_awready           : in  std_logic;
        m_axi_awvalid           : out std_logic;
        m_axi_awaddr            : out std_logic_vector(31 downto 0);
        m_axi_awid              : out std_logic_vector (3 downto 0);
        m_axi_awlen             : out std_logic_vector (7 downto 0);
        m_axi_awsize            : out std_logic_vector (2 downto 0);
        m_axi_awburst           : out std_logic_vector (1 downto 0);
        m_axi_awlock            : out std_logic;
        m_axi_awcache           : out std_logic_vector (3 downto 0);
        m_axi_awprot            : out std_logic_vector (2 downto 0);
        m_axi_awqos             : out std_logic_vector (3 downto 0);
        m_axi_awregion          : out std_logic_vector (3 downto 0);
        -- AXI4 Write Data Channel
        m_axi_wready            : in  std_logic;
        m_axi_wvalid            : out std_logic;
        m_axi_wid			    : out std_logic_vector(3 downto 0);
        m_axi_wdata             : out std_logic_vector(data_width-1 downto 0);
        m_axi_wstrb             : out std_logic_vector((data_width/8)-1 downto 0);
        m_axi_wlast             : out std_logic;
        -- AXI4 Write Response Channel
        m_axi_bready            : out std_logic;
        m_axi_bvalid            : in  std_logic;
        m_axi_bresp             : in  std_logic_vector(1 downto 0);
        m_axi_bid               : in  std_logic_vector(3 downto 0)
        );
end AXI_master;

architecture Behavioral of AXI_master is

COMPONENT data_fifo_32 IS
    PORT
        (
        clk : IN std_logic;
        rst : IN std_logic;
        din : IN std_logic_vector(31 DOWNTO 0);
        wr_en : IN std_logic;
        rd_en : IN std_logic;
        dout : OUT std_logic_vector(31 DOWNTO 0);
        full : OUT std_logic;
        empty : OUT std_logic
        );
END COMPONENT;

COMPONENT data_fifo_64 IS
    PORT
        (
        clk : IN std_logic;
        rst : IN std_logic;
        din : IN std_logic_vector(63 DOWNTO 0);
        wr_en : IN std_logic;
        rd_en : IN std_logic;
        dout : OUT std_logic_vector(63 DOWNTO 0);
        full : OUT std_logic;
        empty : OUT std_logic
        );
END COMPONENT;

COMPONENT fifo_manager is
    Generic
        (
        data_width : integer range 32 to 64 := 32
        );
    Port
        (
        -- User signals
        clk              : in  std_logic;
        resetn           : in  std_logic;
        data_used        : in  std_logic;
        data_valid       : out std_logic;
        fifo_read_enable : out std_logic;
        fifo_empty_flag  : in  std_logic;
        data_transferred : out std_logic
        );
END COMPONENT;

COMPONENT AXI_ADDRESS_CONTROL_CHANNEL is
	PORT
		(
		clk             : in  std_logic;
        resetn          : in  std_logic;
        go              : in  std_logic;
        done            : out std_logic;
        error           : out std_logic;
        address         : in  std_logic_vector(31 downto 0);
        burst_length    : in integer range 1 to 256;
        burst_size      : in integer range 1 to 128;
        increment_burst : in  std_logic;
        AxID            : out std_logic_vector (3 downto 0);
        AxADDR          : out std_logic_vector (31 downto 0);
        AxLEN           : out std_logic_vector (7 downto 0);
        AxSIZE          : out std_logic_vector (2 downto 0);
        AxBURST         : out std_logic_vector (1 downto 0);
        AxLOCK          : out std_logic;
        AxCACHE         : out std_logic_vector (3 downto 0);
        AxPROT          : out std_logic_vector (2 downto 0);
        AxVALID         : out std_logic;
        AxREADY         : in   std_logic;
        AxQOS           : out std_logic_vector (3 downto 0);
        AxREGION        : out std_logic_vector (3 downto 0)
		);
END COMPONENT;

COMPONENT AXI_READ_DATA_CHANNEL is
    GENERIC
        (
        data_width : integer range 32 to 64 := 32
        );
	PORT
		(
        clk             : in  std_logic;
        resetn          : in  std_logic;
        data            : out std_logic_vector(data_width-1 downto 0);
        data_valid      : out std_logic;
        fifo_ready      : in  std_logic;
        last_transfer   : out std_logic;
        go              : in  std_logic;
        done            : out std_logic;
        error           : out std_logic;
		transaction_ID  : out std_logic_vector (3 downto 0);
        RID             : in  std_logic_vector (3 downto 0);
        RDATA           : in  std_logic_vector (data_width-1 downto 0);
        RRESP           : in  std_logic_vector (1 downto 0);
        RLAST           : in  std_logic;
        RVALID          : in  std_logic;
        RREADY          : out std_logic
		);
END COMPONENT;

COMPONENT AXI_WRITE_DATA_CHANNEL is
    GENERIC
        (
        data_width : integer range 32 to 64 := 32
        );
    PORT
        (
        clk             : in  std_logic;
        resetn          : in  std_logic;
        data            : in  std_logic_vector(data_width-1 downto 0);
        data_valid      : in  std_logic;
        go              : in  std_logic;
        done            : out std_logic;
        last_transfer   : in  std_logic;
        data_sent       : out std_logic;
		transaction_ID  : in  std_logic_vector (3 downto 0);
        WID             : out std_logic_vector(3 downto 0);
        WDATA           : out std_logic_vector(data_width-1 downto 0);
        WSTRB           : out std_logic_vector((data_width/8)-1 downto 0);
        WLAST           : out std_logic;
        WVALID          : out std_logic;
        WREADY          : in  std_logic
        );
END COMPONENT;

COMPONENT AXI_WRITE_DATA_RESPONSE_CHANNEL is
	PORT
		(
		clk			    : in  std_logic;
		resetn          : in  std_logic;
        go              : in  std_logic;
        done            : out std_logic;
        error           : out std_logic;
		transaction_ID  : out std_logic_vector (3 downto 0);
		BRESP	        : in  std_logic_vector (1 downto 0);
        BVALID		    : in  std_logic;
        BREADY		    : out std_logic;
        BID             : in  std_logic_vector (3 downto 0)
		);
END COMPONENT;

-- Implement a function in VHDL to generate an intentional failure if the user chooses a data width other than 32 or 64 bits
function generate_data_width_error (WIDTH : integer) return boolean is
    variable ReturnBool: boolean;
    variable DATA_WIDTH_TEMP: integer;
    begin
        DATA_WIDTH_TEMP := WIDTH;
        case DATA_WIDTH_TEMP is
                when 32|64 =>
                    ReturnBool := TRUE;
                when others =>
                    assert 0 = DATA_WIDTH_TEMP
                    report "** Invalid Generic value for 'data_width' (Can only be 32 or 64) **"
                    severity FAILURE;
                    ReturnBool := FALSE;
            end case;
        return ReturnBool;
    end generate_data_width_error;


-- Type declarations
type main_fsm_type is (reset, idle, prepare, read_transaction, write_transaction, error_detected, complete);

signal width_check_OK : boolean;

-- State Machine
signal current_state, next_state : main_fsm_type;

-- Internal signals
signal transaction_address : std_logic_vector(31 downto 0);
signal start_read_address_transaction : std_logic;
signal start_read_data_transaction : std_logic;
signal start_write_address_transaction : std_logic;
signal start_write_data_transaction : std_logic;
signal start_write_response_transaction : std_logic;
signal read_address_transaction_finished : std_logic;
signal read_data_transaction_finished : std_logic;
signal write_address_transaction_finished : std_logic;
signal write_data_transaction_finished : std_logic;
signal write_response_transaction_finished : std_logic;
signal read_transaction_error : std_logic;
signal write_transaction_error : std_logic;
signal send_write_data : std_logic;
signal read_data_fifo_enable : std_logic;       
signal write_data_fifo_ready : std_logic;
signal write_data_fifo_enable : std_logic;       
signal data_transferred : std_logic;
signal beat_counter : integer range 0 to 256;
signal load_beat_counter : std_logic;
signal enable_beat_counter : std_logic;
signal write_data_last_transfer : std_logic;
signal write_data_sent : std_logic;
signal write_data_valid : std_logic;
signal write_response_error : std_logic;
signal read_data_last_transfer : std_logic;
signal reset_fifos : std_logic;
signal read_data_channel_error : std_logic;
signal captured_burst_length : integer range 0 to 256;
signal captured_burst_size : integer range 0 to 128;
signal captured_increment_burst : std_logic;
signal capture_control_signals : std_logic;
signal captured_transaction_address : std_logic_vector(31 downto 0);
signal captured_RNW : std_logic;
signal read_data_transaction_id : std_logic_vector(3 downto 0);
signal write_data_transaction_id : std_logic_vector(3 downto 0);
signal write_data_response_transaction_id : std_logic_vector(3 downto 0);

-- Data FIFOs
signal read_data_fifo_input : std_logic_vector(data_width-1 downto 0); 
signal read_data_fifo_wen : std_logic;
signal read_data_fifo_en : std_logic;
signal read_data_fifo_output : std_logic_vector(data_width-1 downto 0);
signal read_data_fifo_full : std_logic;
signal read_data_fifo_empty : std_logic;
signal write_data_fifo_input : std_logic_vector(data_width-1 downto 0); 
signal write_data_fifo_wen : std_logic;
signal write_data_fifo_en : std_logic;
signal write_data_fifo_output : std_logic_vector(data_width-1 downto 0);
signal write_data_fifo_full : std_logic;
signal write_data_fifo_empty : std_logic;
signal write_data_fifo_not_empty : std_logic;
signal read_data_fifo_full_inv : std_logic;

signal burst_length_internal : integer range 0 to 256;
signal burst_size_internal : integer range 0 to 128;


begin
-- Automated data width checking
width_check_OK <= generate_data_width_error(data_width);

-- Concurrent assignments
read_data <= read_data_fifo_output;
write_data_fifo_input <= write_data;
reset_fifos <= clear_data_fifos OR not m_axi_aresetn;
write_data_fifo_wen <= write_fifo_en;    
write_fifo_empty <= write_data_fifo_empty; 
write_fifo_full <= write_data_fifo_full;  
read_data <= read_data_fifo_output;        
read_data_fifo_en <= read_fifo_en;     
read_fifo_empty <= read_data_fifo_empty;  
read_fifo_full <= read_data_fifo_full;   
read_data_fifo_full_inv <= not read_data_fifo_full;
write_data_fifo_not_empty <= not write_data_fifo_empty;
write_data_transaction_id <= (others => '0');

-- Type Conversions
burst_length_internal <= to_integer(unsigned(burst_length)) + 1;
burst_size_internal <= to_integer(unsigned(burst_size));



-- State machine update process
state_machine_update : process (m_axi_aclk)
begin
    if m_axi_aclk'event and m_axi_aclk = '1' then
        if m_axi_aresetn = '0' then
            current_state <= reset;
        else
            current_state <= next_state;
        end if;
    end if;
end process;

-- Beat Counter implementation
beat_counter_process : process (m_axi_aclk)
begin
    if m_axi_aclk'event and m_axi_aclk = '1' then
        if m_axi_aresetn = '0' then
            beat_counter <= 0;
        elsif load_beat_counter = '1' then
            beat_counter <= burst_length_internal - 1;
        elsif enable_beat_counter = '1' then
            if beat_counter > 0 then
                beat_counter <= beat_counter - 1;
            end if;
        end if;
    end if;
end process;

-- Control signals capture logic
capture_control_signals_process : process (m_axi_aclk)
begin
    if m_axi_aclk'event and m_axi_aclk = '1' then
        if m_axi_aresetn = '0' then
            captured_burst_length <= 0;
            captured_burst_size <= 0;
            captured_increment_burst <= '0';
            captured_transaction_address <= (others => '0');
            captured_RNW <= '0';
        elsif capture_control_signals = '1' then
            captured_burst_length <= burst_length_internal;
            captured_burst_size <= burst_size_internal;
            captured_increment_burst <=  increment_burst;
            captured_transaction_address <= transaction_address;
            captured_RNW <= RNW;
        end if;
    end if;
end process;



-- Finite State Machine implementation
state_machine_decisions : process ( width_check_OK, current_state, read_address_transaction_finished, read_data_transaction_finished, write_address_transaction_finished, write_data_transaction_finished,
                                    write_response_transaction_finished, read_data_fifo_full, go, captured_RNW, address, write_data, write_data_sent, write_response_error, beat_counter, data_transferred,
                                    write_data_valid
                                  )

begin
    transaction_address <= address;
    start_read_address_transaction <= '0';
    start_read_data_transaction <= '0';
    start_write_address_transaction <= '0';
    start_write_data_transaction <= '0';
    start_write_response_transaction <= '0';
    busy <= '1';
    done <= '0';
    error <= '0';
    load_beat_counter <= '0';
    send_write_data <= '0';
    capture_control_signals <= '0';
    write_data_last_transfer <= '0';
    enable_beat_counter <= '0';
    
    
	case current_state is
		when reset =>
			next_state <= idle;

		when idle =>
			next_state <= idle;
            busy <= '0';
			if go = '1' then
                case width_check_OK is
                    when TRUE =>
                        capture_control_signals <= '1';
                        next_state <= prepare;
                    when others =>
                        next_state <= error_detected;
                end case;
            end if;
		
		when prepare =>
            load_beat_counter <= '1';
            busy <= '0';
            case captured_RNW is
                when '1' =>
                    if read_data_fifo_full = '1' then
                        next_state <= error_detected;
                    else
                        next_state <= read_transaction;
                    end if;    
                when '0' =>
                    if write_data_valid = '0' then
                        next_state <= error_detected;
                    else
                        next_state <= write_transaction;
                    end if;    
                when others =>
                    next_state <= error_detected;
            end case;

		when read_transaction =>
            next_state <= read_transaction;
            start_read_address_transaction <= '1';
            enable_beat_counter <= data_transferred; 
            if read_address_transaction_finished = '1' then
                start_read_data_transaction <= '1';
            end if;
            if read_data_transaction_finished = '1' then
                next_state <= complete;
            end if;
                
		when write_transaction =>
            next_state <= write_transaction;
            start_write_address_transaction <= '1';
            enable_beat_counter <= data_transferred; 
            if write_address_transaction_finished = '1' then
                start_write_data_transaction <= '1';
            end if;
            if write_data_transaction_finished = '1' then
                start_write_response_transaction <= '1';
            end if;
            if beat_counter < 1 then
                write_data_last_transfer <= '1';
            else
                write_data_last_transfer <= '0';
            end if;
            if write_address_transaction_finished = '1' and write_data_transaction_finished = '1' and write_response_transaction_finished = '1' then
                if write_response_error = '1' then
                    next_state <= error_detected;
                else
                    next_state <= complete;
                end if;
            end if;

		when error_detected => 
            next_state <= error_detected;
            done <= '1';
            error <= '1';
            if go = '0' then
                next_state <= idle;
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
read_address_channel : AXI_ADDRESS_CONTROL_CHANNEL
    PORT MAP
        (
        clk => m_axi_aclk,
        resetn => m_axi_aresetn,
        go => start_read_address_transaction,
        done => read_address_transaction_finished,
        error => read_transaction_error,
        address => captured_transaction_address,
        burst_length => captured_burst_length,
        burst_size => captured_burst_size,
        increment_burst => captured_increment_burst,
        AxADDR => m_axi_araddr,
        AxVALID => m_axi_arvalid,
        AxREADY => m_axi_arready,
        AxID => m_axi_arid,
        AxLEN => m_axi_arlen,
        AxSIZE => m_axi_arsize,
        AxBURST => m_axi_arburst,
        AxLOCK => m_axi_arlock,
        AxCACHE => m_axi_arcache,
        AxPROT => m_axi_arprot,
        AxQOS => m_axi_arqos,
        AxREGION => m_axi_arregion
        );
        
write_address_channel : AXI_ADDRESS_CONTROL_CHANNEL
    PORT MAP
        (
        clk => m_axi_aclk,
        resetn => m_axi_aresetn,
        go => start_write_address_transaction,
        done => write_address_transaction_finished,
        error => write_transaction_error,
        address => captured_transaction_address,
        burst_length => captured_burst_length,
        burst_size => captured_burst_size,
        increment_burst => captured_increment_burst,
        AxADDR => m_axi_awaddr,
        AxVALID => m_axi_awvalid,
        AxREADY => m_axi_awready,
        AxID => m_axi_awid,
        AxLEN => m_axi_awlen,
        AxSIZE => m_axi_awsize,
        AxBURST => m_axi_awburst,
        AxLOCK => m_axi_awlock,
        AxCACHE => m_axi_awcache,
        AxPROT => m_axi_awprot,
        AxQOS => m_axi_awqos,
        AxREGION => m_axi_awregion
        );

read_data_channel : AXI_READ_DATA_CHANNEL
    GENERIC MAP
        (
        data_width => data_width
        )
    PORT MAP
        (
        clk => m_axi_aclk,
        resetn => m_axi_aresetn,
        go => start_read_data_transaction,
        done => read_data_transaction_finished,
        error => read_data_channel_error,
        data => read_data_fifo_input,
        data_valid => read_data_fifo_wen,
        fifo_ready => read_data_fifo_full_inv,
        last_transfer => read_data_last_transfer,
        transaction_ID => read_data_transaction_id,
        RDATA => m_axi_rdata,
        RRESP => m_axi_rresp,
        RVALID => m_axi_rvalid,
        RREADY => m_axi_rready, 
        RID => m_axi_rid,
        RLAST => m_axi_rlast
        );

write_data_channel : AXI_WRITE_DATA_CHANNEL
    GENERIC MAP
        (
        data_width => data_width
        )
    PORT MAP
        (
        clk => m_axi_aclk,
        resetn => m_axi_aresetn,
        go => start_write_data_transaction,
        done => write_data_transaction_finished,
        data => write_data_fifo_output,
        data_valid => write_data_valid,
        last_transfer => write_data_last_transfer,
        data_sent => write_data_sent,
        transaction_ID => write_data_transaction_id,
        WID => m_axi_wid,
        WDATA => m_axi_wdata,
        WSTRB => m_axi_wstrb,
        WVALID => m_axi_wvalid,
        WREADY => m_axi_wready,
        WLAST => m_axi_wlast
        );

write_data_response_channel : AXI_WRITE_DATA_RESPONSE_CHANNEL
    PORT MAP
        (
        clk => m_axi_aclk,
        resetn => m_axi_aresetn,
        go => start_write_response_transaction,
        error => write_response_error,
        done => write_response_transaction_finished,
        transaction_ID => write_data_response_transaction_id,
        BRESP => m_axi_bresp,
        BVALID => m_axi_bvalid,
        BREADY => m_axi_bready,
        BID => m_axi_bid
        );

write_data_fifo_management : fifo_manager
    GENERIC MAP
        (
        data_width => data_width
        )
    PORT MAP
        (
        clk => m_axi_aclk,
        resetn => m_axi_aresetn,
        data_used => write_data_sent,
        data_valid => write_data_valid,
        fifo_read_enable => write_data_fifo_en,
        fifo_empty_flag => write_data_fifo_empty,
        data_transferred => data_transferred
        );

-- Generate the appropriate FIFO, based on the chosen data width
generate_32b_data_fifo : 
    if data_width = 32 GENERATE
        read_data_fifo_inst : data_fifo_32
            PORT MAP
                (
                clk => m_axi_aclk,
                rst => reset_fifos,
                din => read_data_fifo_input, 
                wr_en => read_data_fifo_wen,
                rd_en => read_data_fifo_en,
                dout => read_data_fifo_output,
                full => read_data_fifo_full,
                empty => read_data_fifo_empty
                );
        write_data_fifo_inst : data_fifo_32
            PORT MAP
                (
                clk => m_axi_aclk,
                rst => reset_fifos,
                din => write_data_fifo_input, 
                wr_en => write_data_fifo_wen,
                rd_en => write_data_fifo_en,
                dout => write_data_fifo_output,
                full => write_data_fifo_full,
                empty => write_data_fifo_empty
                );
end GENERATE;

generate_64b_data_fifo : 
    if data_width = 64 GENERATE
        read_data_fifo_inst : data_fifo_64
        PORT MAP
            (
            clk => m_axi_aclk,
            rst => reset_fifos,
            din => read_data_fifo_input, 
            wr_en => read_data_fifo_wen,
            rd_en => read_data_fifo_en,
            dout => read_data_fifo_output,
            full => read_data_fifo_full,
            empty => read_data_fifo_empty
            );
    write_data_fifo_inst : data_fifo_64
        PORT MAP
            (
            clk => m_axi_aclk,
            rst => reset_fifos,
            din => write_data_fifo_input, 
            wr_en => write_data_fifo_wen,
            rd_en => write_data_fifo_en,
            dout => write_data_fifo_output,
            full => write_data_fifo_full,
            empty => write_data_fifo_empty
            );
end GENERATE;

end Behavioral;
