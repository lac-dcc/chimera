library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.sha256_functions.all;

entity MinerCoprocessor_v1_0_S00_AXIS is
	generic (
		-- Users to add parameters here
        BLOCKCHAIN_BLOCK_HEADER_LENGTH : integer   := 640;
        HASH_BLOCK_LENGTH              : integer   := 512;
        MASK_MAX_BITS                  : integer   := 32;
        NONCE_LENGTH                   : integer   := 32;
        HASH_LENGTH                    : integer   := 256;
		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- AXI4Stream sink: Data Width
		C_S_AXIS_TDATA_WIDTH	       : integer   := 32
	);
	port (
		-- Users to add ports here
        readEnable      : in std_logic;
        allWordsSent    : in std_logic;
		validData       : out std_logic;
        hash_output     : out std_logic_vector(HASH_LENGTH-1 downto 0);
        nonce           : out std_logic_vector(NONCE_LENGTH-1 downto 0);
		-- User ports ends
		-- Do not modify the ports beyond this line

		-- AXI4Stream sink: Clock
		S_AXIS_ACLK	    : in std_logic;
		-- AXI4Stream sink: Reset
		S_AXIS_ARESETN	: in std_logic;
		-- Ready to accept data in
		S_AXIS_TREADY	: out std_logic;
		-- Data in
		S_AXIS_TDATA	: in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
		-- Byte qualifier
		S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		-- Indicates boundary of last packet
		S_AXIS_TLAST	: in std_logic;
		-- Data is in valid
		S_AXIS_TVALID	: in std_logic
	);
end MinerCoprocessor_v1_0_S00_AXIS;

architecture Behavioral of MinerCoprocessor_v1_0_S00_AXIS is
    -- Input and output word builder
    signal s_counter               : integer;
    signal s_zerosMask             : std_logic_vector(MASK_MAX_BITS-1 downto 0); 
    signal s_hashOriginalInputWord : std_logic_vector(BLOCKCHAIN_BLOCK_HEADER_LENGTH-1 downto 0);
    signal s_dataOut               : std_logic_vector(HASH_LENGTH-1 downto 0); 

    -- Miner signals
    signal s_nonce                : integer   := 0;
    signal s_ready                : std_logic := '0';
    signal s_reset                : std_logic := '0';
    signal s_POWready             : std_logic := '0';
    signal s_enable               : std_logic := '0';
    signal s_update               : std_logic := '0';
    signal s_hash                 : std_logic_vector(HASH_LENGTH-1 downto 0); 
begin    

    validData     <= s_POWready;
    hash_output   <= s_dataOut;
    nonce         <= std_logic_vector(to_unsigned(s_nonce, NONCE_LENGTH));
    S_AXIS_TREADY <= not s_enable;
    
    ------------------------------------------------------
    -----  Input word builder and miner management  ------
    ------------------------------------------------------
    
    process(S_AXIS_ACLK)
    begin
        if (rising_edge(S_AXIS_ACLK)) then
            if (S_AXIS_ARESETN = '0') then
                s_POWready <= '0';
                s_enable <= '0';
                s_update <= '1';
                s_counter <= 0;
                s_hashOriginalInputWord <= (others => '0');
                s_dataOut <= (others => '0');
            -- Input word builder 
            elsif (S_AXIS_TVALID = '1') then
                if (s_enable = '0') then
                    if (s_counter = 20) then
                        s_zerosMask <= S_AXIS_TDATA;
                        s_counter <= 0;
                        s_nonce <= 0;
                        s_enable <= '1';
                    else
                        s_hashOriginalInputWord((BLOCKCHAIN_BLOCK_HEADER_LENGTH - (s_counter * C_S_AXIS_TDATA_WIDTH) - 1)
                            downto (BLOCKCHAIN_BLOCK_HEADER_LENGTH - ((s_counter + 1) * C_S_AXIS_TDATA_WIDTH))) <= S_AXIS_TDATA;
                        s_counter <= s_counter + 1;
                    end if;
                end if;
            end if;
            
            -- Miner management
            s_update <= '0';
            if (s_ready = '1') then
                if ((s_hash(HASH_LENGTH-1 downto HASH_LENGTH - MASK_MAX_BITS) and s_zerosMask) = X"00000000") then
                    s_POWready <= '1';
                    s_dataOut <= s_hash;
                    s_enable <= '0';
                else
                    s_nonce <= s_nonce + 1;
                    s_hashOriginalInputWord(31 downto 0) <= std_logic_vector(to_unsigned(s_nonce, NONCE_LENGTH));
                    s_POWready <= '0';
                    s_update <= '1';
                end if;
            end if;
            -- Output hash builder
            if (s_POWready = '1' and allWordsSent = '1') then
                s_POWready <= '0';
                s_hashOriginalInputWord <= (others => '0');
                s_update <= '1';
            end if;
        end if;
    end process;
    
    ------------------------------------------------------
    -----     Sha256 pipeline instantiation         ------
    ------------------------------------------------------
    s_reset <= s_update or (not S_AXIS_ARESETN);
    
    sha25_pipeline: entity work.SHA256(Behavioral)
        generic map(
            INPUT_MESSAGE_LENGTH  => BLOCKCHAIN_BLOCK_HEADER_LENGTH
        )
        port map(
            clk             => S_AXIS_ACLK,
            reset           => s_reset,
            enable          => s_enable,
            input_word      => s_hashOriginalInputWord,
            done            => s_ready,
            digest          => s_hash
        );
        
end Behavioral;