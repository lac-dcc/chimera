library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

Library xpm;
use xpm.vcomponents.all;

entity common_clk_sdpram is
	generic(
		DATA_WIDTH		: integer	:= 8; --width of data in bytes
		DATA_DEPTH		: integer	:= 4096;
		ADDRESS_WIDTH	: integer	:= 12
	);
	port(
		clk				: in std_logic;
		
		wea				: in std_logic_vector(DATA_WIDTH-1 downto 0);
		addra			: in unsigned(ADDRESS_WIDTH-1 downto 0);
		dina			: in std_logic_vector(DATA_WIDTH*8 - 1 downto 0);
		ena				: in std_logic;
		
		enb				: in std_logic;
		addrb			: in unsigned(ADDRESS_WIDTH-1 downto 0);
		doutb			: out std_logic_vector(DATA_WIDTH*8-1 downto 0)
	);
end entity;

architecture rtl of common_clk_sdpram is

begin
	xpm_memory_sdpram0 : xpm_memory_sdpram
	generic map (
		ADDR_WIDTH_A => ADDRESS_WIDTH, -- DECIMAL
		ADDR_WIDTH_B => ADDRESS_WIDTH, -- DECIMAL
		AUTO_SLEEP_TIME => 0, -- DECIMAL
		BYTE_WRITE_WIDTH_A => 8, -- DECIMAL
		CLOCKING_MODE => "common_clock", -- String
		ECC_MODE => "no_ecc", -- String
		MEMORY_INIT_FILE => "none", -- String
		MEMORY_INIT_PARAM => "0", -- String
		MEMORY_OPTIMIZATION => "true", -- String
		MEMORY_PRIMITIVE => "ultra", -- String
		MEMORY_SIZE => (DATA_DEPTH * DATA_WIDTH * 8), -- DECIMAL
		MESSAGE_CONTROL => 0, -- DECIMAL
		READ_DATA_WIDTH_B => DATA_WIDTH*8, -- DECIMAL
		READ_LATENCY_B => 1, -- DECIMAL
		READ_RESET_VALUE_B => "0", -- String
		USE_EMBEDDED_CONSTRAINT => 0, -- DECIMAL
		USE_MEM_INIT => 0, -- DECIMAL
		WAKEUP_TIME => "disable_sleep", -- String
		WRITE_DATA_WIDTH_A => DATA_WIDTH*8, -- DECIMAL
		WRITE_MODE_B => "read_first" -- String
	)
	port map (
		dbiterrb 		=> open, -- 1-bit output: Status signal to indicate double bit error occurrence
		-- on the data output of port B.
		doutb 			=> doutb, -- READ_DATA_WIDTH_B-bit output: Data output for port B read operations.
		sbiterrb 		=> open, -- 1-bit output: Status signal to indicate single bit error occurrence
		-- on the data output of port B.
		addra 			=> std_logic_vector(addra), -- ADDR_WIDTH_A-bit input: Address for port A write operations.
		addrb 			=> std_logic_vector(addrb), -- ADDR_WIDTH_B-bit input: Address for port B read operations.
		clka 			=> clk, -- 1-bit input: Clock signal for port A. Also clocks port B when
		-- parameter CLOCKING_MODE is "common_clock".
		clkb 			=> clk, -- 1-bit input: Clock signal for port B when parameter CLOCKING_MODE is
		-- "independent_clock". Unused when parameter CLOCKING_MODE is
		-- "common_clock".
		dina 			=> dina, -- WRITE_DATA_WIDTH_A-bit input: Data input for port A write operations.
		ena 			=> ena, -- 1-bit input: Memory enable signal for port A. Must be high on clock
		-- cycles when write operations are initiated. Pipelined internally.
		enb 			=> enb, -- 1-bit input: Memory enable signal for port B. Must be high on clock
		-- cycles when read operations are initiated. Pipelined internally.
		injectdbiterra 	=> '0', -- 1-bit input: Controls double bit error injection on input data when
		-- ECC enabled (Error injection capability is not available in
		-- "decode_only" mode).
		injectsbiterra 	=> '0', -- 1-bit input: Controls single bit error injection on input data when
		-- ECC enabled (Error injection capability is not available in
		-- "decode_only" mode).
		regceb 			=> '0', -- 1-bit input: Clock Enable for the last register stage on the output
		-- data path.
		rstb 			=> '0', -- 1-bit input: Reset signal for the final port B output register
		-- stage. Synchronously resets output port doutb to the value specified
		-- by parameter READ_RESET_VALUE_B.
		sleep 			=> '0', -- 1-bit input: sleep signal to enable the dynamic power saving feature.
		wea 			=> wea -- WRITE_DATA_WIDTH_A-bit input: Write enable vector for port A input
		-- data port dina. 1 bit wide when word-wide writes are used. In
		-- byte-wide write configurations, each bit controls the writing one
		-- byte of dina to address addra. For example, to synchronously write
		-- only bits [15-8] of dina when WRITE_DATA_WIDTH_A is 32, wea would be
		-- 4'b0010.
	);
	
end architecture;
