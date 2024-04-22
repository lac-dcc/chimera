----------------------------------------------------------------------------------
--
-- Spi controller for 6502 systems
-- based on a design by A. Fachat
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity SpiController is
Port (
        data_in : in STD_LOGIC_VECTOR (7 downto 0);
        data_out : out STD_LOGIC_VECTOR (7 downto 0);
        is_read : in  STD_LOGIC;
        nreset : in  STD_LOGIC;
        addr : in  STD_LOGIC_VECTOR (1 downto 0);
        phi0 : in  STD_LOGIC;
        ndev_sel : in  STD_LOGIC;
        clk : in  STD_LOGIC;
        miso: in std_logic;
        mosi : out  STD_LOGIC;
        sclk : out  STD_LOGIC;
        nsel : out  STD_LOGIC;
        wp : in  STD_LOGIC;
        card : in  STD_LOGIC;
        pgm_en : out STD_LOGIC;
        led : out  STD_LOGIC
    );
end SpiController;

architecture Behavioral of SpiController is
    
    --------------------------
    -- internal state
    signal spidatain: std_logic_vector (7 downto 0);
    signal spidataout: std_logic_vector (7 downto 0);
    signal sdhc: std_logic;     -- is SDHC card
    signal inited: std_logic;   -- card initialized
    signal pgmen: std_logic;    -- enable EEPROM programming
    
    -- spi register flags
    signal tc: std_logic;       -- transmission complete; cleared on spi data read
    signal bsy: std_logic;      -- SPI busy
    signal frx: std_logic;      -- fast receive mode
    signal ece: std_logic;      -- external clock enable; 0=phi2, 1=external clock
    
    signal slavesel: std_logic := '1';     -- slave select output (0=selected)
    signal int_miso: std_logic;
    --------------------------
    -- helper signals

    -- shift engine
    signal start_shifting: std_logic := '0';   -- shifting data
    signal shifting2: std_logic := '0';    -- shifting data
    signal shiftdone: std_logic;    -- shifting data done
    signal shiftcnt: std_logic_vector(3 downto 0);          -- shift counter (5 bit)
    
    -- spi clock
    signal clksrc: std_logic;                                   -- clock source (phi2 or clk_7m)
    signal shiftclk : std_logic;
    
begin    
    led <= not (bsy or not slavesel);
    bsy <= start_shifting or shifting2;
    
    process(start_shifting, shiftdone, shiftclk)
    begin
        if (rising_edge(shiftclk)) then
            if (shiftdone = '1') then
                shifting2 <= '0';
            else
                shifting2 <= start_shifting;
            end if;
        end if; 
    end process;

    process(shiftcnt, nreset, shiftclk) 
    begin
        if (nreset = '0') then
            shiftdone <= '0';
        elsif (rising_edge(shiftclk)) then
            if (shiftcnt = "1111") then
                shiftdone <= '1';
            else
                shiftdone <= '0';
            end if;
        end if;
    end process;
    
    process(nreset, shifting2, shiftcnt, shiftclk)
    begin
        if (nreset = '0') then
            shiftcnt <= (others => '0');
        elsif (rising_edge(shiftclk)) then
            if (shifting2 = '1') then
                -- count phase
                shiftcnt <= shiftcnt + 1;               
            else
                shiftcnt <= (others => '0');
            end if;
        end if;
    end process;

    inproc: process(nreset, shifting2, shiftcnt, shiftclk, spidatain, miso)
    begin
        if (nreset = '0') then
            spidatain <= (others => '0');
        elsif (rising_edge(shiftclk)) then
            if (shifting2 = '1' and shiftcnt(0) = '1') then
                    -- shift in to input register
                    spidatain (7 downto 1) <= spidatain (6 downto 0);
                    spidatain (0) <= int_miso;
            end if;
        end if;
    end process;

    outproc: process(nreset, shifting2, spidataout, shiftcnt, shiftclk)
    begin
        if (nreset = '0') then
            mosi <= '1';
            sclk <= '1';
        else
            -- clock is sync'd
            if (rising_edge(shiftclk)) then
                if (shifting2='0' or shiftdone = '1') then
                    mosi <= '1';
                    sclk <= '1';
                else
                    -- output data directly from output register
                    case shiftcnt(3 downto 1) is
                        when "000" => mosi <= spidataout(7);
                        when "001" => mosi <= spidataout(6);
                        when "010" => mosi <= spidataout(5);
                        when "011" => mosi <= spidataout(4);
                        when "100" => mosi <= spidataout(3);
                        when "101" => mosi <= spidataout(2);
                        when "110" => mosi <= spidataout(1);
                        when "111" => mosi <= spidataout(0);
                        when others => mosi <= '1';
                    end case;
                    sclk <= shiftcnt(0);
                end if;
            end if;
        end if;
    end process;


    -- shift operation enable
    shiften: process(nreset, ndev_sel, is_read, addr, frx, shiftdone)
    begin
        -- start shifting
        if (nreset = '0' or shiftdone = '1') then
            start_shifting <= '0';
        elsif (rising_edge(ndev_sel) and addr="00" and (frx='1' or is_read='0')) then
            -- access to register 00, either write (is_read=0) or fast receive bit set (frx)
            -- then both types of access (write but also read)
            start_shifting <= '1';
        end if;
    end process;

    --------------------------
    -- spiclk - spi clock generation
    -- spiclk is still 2 times the freq. than sclk
    clksrc <= phi0 when (ece = '0') else clk;
    
    -- is a pulse signal to allow for divisor==0
    shiftclk <= clksrc when bsy = '1' else '0';
    
    --------------------------
    -- interface section
    -- inputs
    int_miso <= (miso and not slavesel);
        
    -- outputs
    nsel <= slavesel;
    pgm_en <= pgmen;

    tc_proc: process (ndev_sel, shiftdone) 
    begin
        if (shiftdone = '1') then
            tc <= '1';
        elsif (rising_edge(ndev_sel) and addr="00") then
            tc <= '0';
        end if;
    end process;
    
    --------------------------
    -- cpu register section
    -- cpu read
    cpu_read: process(addr, spidatain, tc, bsy, frx, pgmen,
            ece, slavesel, wp, card, sdhc, inited)
    begin
        case addr is
            when "00" =>        -- read SPI data in
                data_out <= spidatain;
            when "01" =>        -- read status register
                data_out(0) <= pgmen;
                data_out(1) <= '0';
                data_out(2) <= ece;
                data_out(3) <= '0';
                data_out(4) <= frx;
                data_out(5) <= bsy;
                data_out(6) <= '0';
                data_out(7) <= tc;
				-- no register 2
            when "11" =>        -- read slave select / slave interrupt state
                data_out(0) <= slavesel;
                data_out(3 downto 1) <= (others => '0');
                data_out(4) <= sdhc;
                data_out(5) <= wp;
                data_out(6) <= card;
                data_out(7) <= inited;
            when others => 
                data_out <= (others => '0');
        end case;
    end process;

    -- cpu write 
    cpu_write: process(nreset, ndev_sel, is_read, addr, data_in, card)
    begin
        if (nreset = '0') then
            ece <= '0';
            frx <= '0';
            slavesel <= '1';
            spidataout <= (others => '1');
            sdhc <= '0';
            inited <= '0';
            pgmen <= '0';
        elsif (card = '1') then
            sdhc <= '0';
            inited <= '0';
        elsif (rising_edge(ndev_sel) and is_read = '0') then
            case addr is
                when "00" =>        -- write SPI data out (see other process above)
                    spidataout <= data_in;
                when "01" =>        -- write status register
                    pgmen <= data_in(0);
                    ece <= data_in(2);
                    frx <= data_in(4);
                    -- no bit 5 - 7
					 -- no register 2
                when "11" =>        -- write slave select
                    slavesel <= data_in(0);
                    -- no bit 1 - 3
                    sdhc <= data_in(4);
                    -- no bit 5 - 6
                    inited <= data_in(7);
                when others =>
            end case;
        end if;
    end process;
    
end Behavioral;
