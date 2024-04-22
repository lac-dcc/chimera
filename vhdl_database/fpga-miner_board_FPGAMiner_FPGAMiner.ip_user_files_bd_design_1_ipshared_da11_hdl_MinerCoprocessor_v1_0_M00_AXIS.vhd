library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MinerCoprocessor_v1_0_M00_AXIS is
	generic (
		-- Users to add parameters here
        HASH_LENGTH             : integer   := 256;
		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- Width of S_AXIS address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		-- Start count is the number of clock cycles the master will wait before initiating/issuing any transaction.
		C_M_START_COUNT	        : integer	:= 32
	);
	port (
		-- Users to add ports here
        validData       : in std_logic;
        hash            : in std_logic_vector(HASH_LENGTH-1 downto 0);
        nonce           : in std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
        allWordsSent    : out std_logic;
        readEnable      : out std_logic;
		-- User ports ends
		-- Do not modify the ports beyond this line

		-- Global ports
		M_AXIS_ACLK	    : in std_logic;
		-- 
		M_AXIS_ARESETN	: in std_logic;
		-- Master Stream Ports. TVALID indicates that the master is driving a valid transfer, A transfer takes place when both TVALID and TREADY are asserted. 
		M_AXIS_TVALID	: out std_logic;
		-- TDATA is the primary payload that is used to provide the data that is passing across the interface from the master.
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		-- TSTRB is the byte qualifier that indicates whether the content of the associated byte of TDATA is processed as a data byte or a position byte.
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		-- TLAST indicates the boundary of a packet.
		M_AXIS_TLAST	: out std_logic;
		-- TREADY indicates that the slave can accept a transfer in the current cycle.
		M_AXIS_TREADY	: in std_logic
	);
end MinerCoprocessor_v1_0_M00_AXIS;

architecture Behavioral of MinerCoprocessor_v1_0_M00_AXIS is
	signal s_allSent : std_logic := '0';
	signal s_valid   : std_logic := '0';
    signal s_counter : integer   :=  0;
    signal s_dataOut : std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0) := (others => '0');
begin
    ------------------------------------------------
    -----         Output word builder         ------
    ------------------------------------------------
    process(M_AXIS_ACLK)
    begin
        if (rising_edge(M_AXIS_ACLK)) then
            s_allSent <= '0';
            if (validData = '1' and M_AXIS_TREADY = '1') then
                s_valid <= '1';
                if (s_counter = 9) then
                    s_counter <= 0;
                    s_dataOut <= (others => '0');
                    s_valid <= '0';
                    s_allSent <= '1';
                elsif (s_counter = 8) then
                    s_dataOut <= std_logic_vector(to_unsigned(to_integer(unsigned(nonce)) - 1, 32));
                    s_counter <= s_counter + 1;
                else 
                    s_dataOut <= hash((HASH_LENGTH - (s_counter * C_M_AXIS_TDATA_WIDTH) - 1)
                     downto (HASH_LENGTH - ((s_counter + 1) * C_M_AXIS_TDATA_WIDTH)));
                    s_counter <= s_counter + 1;
                end if;
            end if;
        end if;
    end process;
    
    M_AXIS_TVALID <= s_valid;
    M_AXIS_TLAST  <= '0';
    M_AXIS_TSTRB  <= (others => '1');
    M_AXIS_TDATA  <= s_dataOut;
    
    allWordsSent <= s_allSent;
    readEnable   <= validData and M_AXIS_TREADY;
end Behavioral;
