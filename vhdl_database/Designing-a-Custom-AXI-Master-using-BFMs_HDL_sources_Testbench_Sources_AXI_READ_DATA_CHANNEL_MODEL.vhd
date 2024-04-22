library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AXI_READ_DATA_CHANNEL_MODEL is
    GENERIC
        (
        data_width : integer range 32 to 64 := 32
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
end AXI_READ_DATA_CHANNEL_MODEL;



architecture Behavioral of AXI_READ_DATA_CHANNEL_MODEL is

signal RDATA_temp : STD_LOGIC_VECTOR(data_width-1 downto 0);

begin


stimulus : process
begin
    RDATA <= (others => '-');
    RID <= (others => '-');
    RRESP <= (others => '-');
    RLAST <= '0';
    RVALID <= '0';
    fifo_ready <= '0';

    -- Wait for a reset pulse
    wait until resetn = '1';
    wait until resetn = '0';
    wait until resetn = '1';

    -- Get the module warmed up and ready to fly
    fifo_ready <= '1';
    go <= '1';

    -- Generate a single beat transaction, 32 bit wide 
    wait until clk = '1';
    RVALID <= '1';
    RDATA <= X"DEADBEEF";
    RLAST <= '1';
    RID <= (others => '0');
    RRESP <= (others => '0');

    wait until RREADY = '1';
    wait until clk = '1';
    RVALID <= '0';
    RDATA <= (others => '-');
    RLAST <= '0';
    RID <= (others => '-');
    RRESP <= (others => '-');

    wait until done = '1';
    wait for 20 ns;
    go <= '0';
    wait for 20 ns;


    -- Generate an 8 beat burst transaction, 32 bit wide 
    RDATA_temp <= X"ABCD1000";
    
    for i in 0 to 7 loop 
        wait until clk = '1';
        RVALID <= '1';
        if i = 7 then
            RLAST <= '1';
        else
            RLAST <= '0';
        end if;
        RID <= (others => '0');
        RRESP <= (others => '0');
        RDATA <= RDATA_temp;
        
        wait until RREADY = '1';
        wait until clk = '1';
        RVALID <= '0';
        RDATA <= (others => '-');
        RLAST <= '0';
        RID <= (others => '-');
        RRESP <= (others => '-');
        
        RDATA_temp <= STD_LOGIC_VECTOR(unsigned(RDATA_temp) + 1);
    end loop;
    
    wait until done = '1';
    wait for 20 ns;
    go <= '0';
    wait for 50 ns;

    wait;
end process;



end Behavioral;

