library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library axi_rc_servo_controller;
use axi_rc_servo_controller.all;

entity axi_rc_servo_controller is
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
        servo_control_output           : out std_logic_vector(NUMBER_OF_SERVOS-1 downto 0);
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
end entity axi_rc_servo_controller;

------------------------------------------------------------------------------
-- Architecture section
------------------------------------------------------------------------------

architecture IMP of axi_rc_servo_controller is
  
COMPONENT clock_divider
    Generic
        (
        Slow_Clock_Period_PS : integer;
        ORIGINAL_CLK_PERIOD_PS : integer
        );
    port
        (
        clk : in std_logic;
        rst : in std_logic;
        slow_clk : out std_logic;
        slow_rst : out std_logic
        );
END COMPONENT;

COMPONENT servo_controller
    Generic
        (
        clock_period_ns : integer := 1024 -- The value passed to this generic must be a power of two
        );
    port
        (
        minimum_high_pulse_width_ns : in std_logic_vector(31 downto 0);
        maximum_high_pulse_width_ns : in std_logic_vector(31 downto 0);
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        servo_position_input : in std_logic_vector(7 downto 0);
        servo_control_out : out std_logic
        );
END COMPONENT;


-- Type declarations
type main_fsm_type is (reset, idle, read_transaction_in_progress, write_transaction_in_progress, complete);
type servo_position_register_array_type is array (NUMBER_OF_SERVOS-1 downto 0) of std_logic_vector(7 downto 0);
type endstop_register_array_type is array (NUMBER_OF_SERVOS-1 downto 0) of std_logic_vector(31 downto 0);

-- Timing Constants
constant Original_Clk_Period_NS : integer := 1000000000 / C_S_AXI_ACLK_FREQ_HZ;
constant Original_Clk_Period_PS : integer := Original_Clk_Period_NS * 1000;
constant Servo_Clock_Period_PS : integer := 128000;  -- 128 nS / 7.8125 MHz
constant Servo_Clock_Period_NS : integer := Servo_Clock_Period_PS / 1000;

-- Original endstop positions
constant ORIGINAL_MINIMUM_HIGH_PULSE_WIDTH_NS : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(MINIMUM_HIGH_PULSE_WIDTH_NS, 32));
constant ORIGINAL_MAXIMUM_HIGH_PULSE_WIDTH_NS : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(MAXIMUM_HIGH_PULSE_WIDTH_NS, 32));

-- Signal declarations
signal servo_controller_clk : std_logic;
signal servo_controller_rst : std_logic;
signal local_address : integer range 0 to 2**C_S_AXI_ADDR_WIDTH;
signal local_address_valid : std_logic;
signal manual_mode_control_register : std_logic_vector(31 downto 0);
signal manual_mode_data_register : std_logic_vector(31 downto 0);
signal servo_position_register_array : servo_position_register_array_type;
signal low_endstop_register_array : endstop_register_array_type := (others => ORIGINAL_MINIMUM_HIGH_PULSE_WIDTH_NS);
signal high_endstop_register_array : endstop_register_array_type := (others => ORIGINAL_MAXIMUM_HIGH_PULSE_WIDTH_NS);
signal manual_mode_control_register_address_valid : std_logic;
signal manual_mode_data_register_address_valid : std_logic;
signal servo_position_register_address_valid : std_logic_vector(NUMBER_OF_SERVOS-1 downto 0);
signal low_endstop_register_address_valid : std_logic_vector(NUMBER_OF_SERVOS-1 downto 0);
signal high_endstop_register_address_valid : std_logic_vector(NUMBER_OF_SERVOS-1 downto 0);
signal output_from_servo_controller : std_logic_vector(NUMBER_OF_SERVOS-1 downto 0);
signal combined_S_AXI_AWVALID_S_AXI_ARVALID : std_logic_vector(1 downto 0);
signal Local_Reset : std_logic;
signal current_state, next_state : main_fsm_type;
signal write_enable_registers : std_logic;
signal send_read_data_to_AXI : std_logic;


begin

Local_Reset <= not S_AXI_ARESETN;
combined_S_AXI_AWVALID_S_AXI_ARVALID <= S_AXI_AWVALID & S_AXI_ARVALID;


state_machine_update : process (S_AXI_ACLK)
begin
    if S_AXI_ACLK'event and S_AXI_ACLK = '1' then
        if Local_Reset = '1' then
            current_state <= reset;
        else
            current_state <= next_state;
        end if;
    end if;
end process;

state_machine_decisions : process (	current_state, combined_S_AXI_AWVALID_S_AXI_ARVALID, S_AXI_ARVALID, S_AXI_RREADY, S_AXI_AWVALID, S_AXI_WVALID, S_AXI_BREADY, local_address, local_address_valid)
begin
    S_AXI_ARREADY <= '0';
    S_AXI_RRESP <= "--";
    S_AXI_RVALID <= '0';
    S_AXI_WREADY <= '0';
    S_AXI_BRESP <= "--";
    S_AXI_BVALID <= '0';
    S_AXI_WREADY <= '0';
    S_AXI_AWREADY <= '0';
    write_enable_registers <= '0';
    send_read_data_to_AXI <= '0';
   
	case current_state is
		when reset =>
			next_state <= idle;

		when idle =>
			next_state <= idle;
			case combined_S_AXI_AWVALID_S_AXI_ARVALID is
				when "01" => next_state <= read_transaction_in_progress;
				when "10" => next_state <= write_transaction_in_progress;
				when others => NULL;
			end case;
		
		when read_transaction_in_progress =>
            next_state <= read_transaction_in_progress;
            S_AXI_ARREADY <= S_AXI_ARVALID;
            S_AXI_RVALID <= '1';
            S_AXI_RRESP <= "00";
            send_read_data_to_AXI <= '1';
            if S_AXI_RREADY = '1' then
                next_state <= complete;
            end if;


		when write_transaction_in_progress =>
            next_state <= write_transaction_in_progress;
			write_enable_registers <= '1';
            S_AXI_AWREADY <= S_AXI_AWVALID;
            S_AXI_WREADY <= S_AXI_WVALID;
            S_AXI_BRESP <= "00";
            S_AXI_BVALID <= '1';
			if S_AXI_BREADY = '1' then
			    next_state <= complete;
            end if;

		when complete => 
			case combined_S_AXI_AWVALID_S_AXI_ARVALID is
				when "00" => next_state <= idle;
				when others => next_state <= complete;
			end case;
		
		when others =>
			next_state <= reset;
	end case;
end process;


send_data_to_AXI_RDATA : process (send_read_data_to_AXI, local_address, servo_position_register_array, manual_mode_control_register, manual_mode_data_register, low_endstop_register_array, high_endstop_register_array)
begin
    S_AXI_RDATA <= (others => '-');
    if (local_address_valid = '1' and send_read_data_to_AXI = '1') then
        case (local_address) is
            when 0 => 
                S_AXI_RDATA <= manual_mode_control_register;
            when 4 =>
                S_AXI_RDATA <= manual_mode_data_register;
            when 128 to 252 =>
                S_AXI_RDATA <= X"000000" & servo_position_register_array((local_address-128)/4);                
            when 256 to 380 =>
                S_AXI_RDATA <= low_endstop_register_array((local_address-256)/4);                
            when 384 to 508 =>
                S_AXI_RDATA <= high_endstop_register_array((local_address-384)/4);                
            when others => NULL;
        end case;
    end if;
end process;

local_address_capture_register : process (S_AXI_ACLK)
begin
   if (S_AXI_ACLK'event and S_AXI_ACLK = '1') then
        if Local_Reset = '1' then
            local_address <= 0;
        else
            if local_address_valid = '1' then
                case (combined_S_AXI_AWVALID_S_AXI_ARVALID) is
                    when "10" => local_address <= to_integer(unsigned(S_AXI_AWADDR(C_S_AXI_ADDR_WIDTH-1 downto 0)));
                    when "01" => local_address <= to_integer(unsigned(S_AXI_ARADDR(C_S_AXI_ADDR_WIDTH-1 downto 0)));
                    when others => local_address <= local_address;
                end case;
            end if;
        end if;
   end if;
end process;


manual_mode_control_register_process : process (S_AXI_ACLK)
begin
   if (S_AXI_ACLK'event and S_AXI_ACLK = '1') then
		if Local_Reset = '1' then
			manual_mode_control_register <= (others => '0');
		else
			if (manual_mode_control_register_address_valid = '1') then
				manual_mode_control_register <= S_AXI_WDATA;
			end if;
		end if;
   end if;
end process;


manual_mode_data_register_process : process (S_AXI_ACLK)
begin
   if (S_AXI_ACLK'event and S_AXI_ACLK = '1') then
		if Local_Reset = '1' then
			manual_mode_data_register <= (others => '0');
		else
			if (manual_mode_data_register_address_valid = '1') then
				manual_mode_data_register <= S_AXI_WDATA;
			end if;
		end if;
   end if;
end process;


servo_position_register_process : process (S_AXI_ACLK)
begin
	for i in 0 to NUMBER_OF_SERVOS-1 loop
		if (S_AXI_ACLK'event and S_AXI_ACLK = '1') then
			if Local_Reset = '1' then
				servo_position_register_array(i) <= X"80";
			else
				if (servo_position_register_address_valid(i) = '1') then
					servo_position_register_array(i) <= S_AXI_WDATA(7 downto 0);
				end if;
			end if;
		end if;
	end loop;
end process;

low_endstop_register_process : process (S_AXI_ACLK)
begin
	for i in 0 to NUMBER_OF_SERVOS-1 loop
		if (S_AXI_ACLK'event and S_AXI_ACLK = '1') then
			if Local_Reset = '1' then
				low_endstop_register_array(i) <= ORIGINAL_MINIMUM_HIGH_PULSE_WIDTH_NS;
			else
				if (low_endstop_register_address_valid(i) = '1') then
					low_endstop_register_array(i) <= S_AXI_WDATA;
				end if;
			end if;
		end if;
	end loop;
end process;

high_endstop_register_process : process (S_AXI_ACLK)
begin
	for i in 0 to NUMBER_OF_SERVOS-1 loop
		if (S_AXI_ACLK'event and S_AXI_ACLK = '1') then
			if Local_Reset = '1' then
				high_endstop_register_array(i) <= ORIGINAL_MAXIMUM_HIGH_PULSE_WIDTH_NS;
			else
				if (high_endstop_register_address_valid(i) = '1') then
					high_endstop_register_array(i) <= S_AXI_WDATA;
				end if;
			end if;
		end if;
	end loop;
end process;

address_range_analysis : process (local_address, write_enable_registers)
begin
	manual_mode_control_register_address_valid <= '0';
	manual_mode_data_register_address_valid <= '0';
	servo_position_register_address_valid <= (others => '0');
    low_endstop_register_address_valid <= (others => '0');
    high_endstop_register_address_valid <= (others => '0');
    local_address_valid <= '1';
    
    if write_enable_registers = '1' then
        case (local_address) is
            when 0 => manual_mode_control_register_address_valid <= '1';
            when 4 => manual_mode_data_register_address_valid <= '1';
            when 128 to 252 =>
                servo_position_register_address_valid((local_address-128)/4) <= '1';
            when 256 to 380 =>
                low_endstop_register_address_valid((local_address-256)/4) <= '1';
            when 384 to 508 =>
                high_endstop_register_address_valid((local_address-384)/4) <= '1';
            when others =>
                local_address_valid <= '0';
        end case;
    end if;
end process;


manual_mode_multiplexers : process (output_from_servo_controller, manual_mode_control_register, manual_mode_data_register)
begin
	for i in 0 to output_from_servo_controller'length-1 loop
		if (manual_mode_control_register(i) = '1') then
			servo_control_output(i) <= manual_mode_data_register(i);
		else
			servo_control_output(i) <= output_from_servo_controller(i);
		end if;
	end loop;
end process;


clock_divider_instance : clock_divider
	GENERIC MAP
		(
		Slow_Clock_Period_PS => Servo_Clock_Period_PS,
		ORIGINAL_CLK_PERIOD_PS => Original_Clk_Period_PS
		)
	PORT MAP
		(
		clk => S_AXI_ACLK,
		rst => Local_Reset,
		slow_clk => servo_controller_clk,
		slow_rst => servo_controller_rst
		);


generate_servo_controllers : for i in 0 to NUMBER_OF_SERVOS-1 GENERATE
	servo_controller_instance : servo_controller
		GENERIC MAP
			(
			clock_period_ns => Servo_Clock_Period_NS
			)
		PORT MAP
			(
			minimum_high_pulse_width_ns => low_endstop_register_array(i),
            maximum_high_pulse_width_ns => high_endstop_register_array(i),
			clk => servo_controller_clk,
			rst => servo_controller_rst,
			servo_position_input => servo_position_register_array(i),
			servo_control_out => output_from_servo_controller(i)
			);
end GENERATE;


end IMP;
