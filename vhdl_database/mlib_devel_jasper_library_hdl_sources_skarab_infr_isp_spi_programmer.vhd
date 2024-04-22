----------------------------------------------------------------------------------
-- Company: Peralex Electronics
-- Engineer: Gavin Teague
-- 
-- Create Date: 05.09.2014 10:19:29
-- Design Name: 
-- Module Name: isp_spi_programmer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- In-system programming of Spartan 3AN via SPI. Controlled via register interface. 
--
-- Assumes clock frequency of 156.25MHz
--
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity isp_spi_programmer is
	port(
		clk : in std_logic;
		rst : in std_logic;
        
        -- ISP SPI REGISTER INTERFACE
        isp_address              : in std_logic_vector(22 downto 0);
        isp_num_bytes            : in std_logic_vector(8 downto 0);
        isp_write_data           : in std_logic_vector(7 downto 0);
        isp_write_data_strobe    : in std_logic;
        isp_read_data            : out std_logic_vector(7 downto 0);
        isp_read_data_strobe     : in std_logic;
        isp_command              : in std_logic_vector(2 downto 0);
        isp_start_transaction    : in std_logic;
        isp_transaction_complete : out std_logic;

        -- ISP SPI INTERFACE
        spi_clk    : out std_logic;
        spi_csb    : out std_logic;
        spi_mosi   : out std_logic;
        spi_miso   : in std_logic);
end isp_spi_programmer;

--}} End of automatically maintained section

architecture arch_isp_spi_programmer of isp_spi_programmer is

    type T_SPI_STATE is (
    IDLE,
    GEN_CS_LOW,
    GEN_COMMAND,
    GEN_ADDRESS_BYTE_0,
    GEN_ADDRESS_BYTE_1,
    GEN_ADDRESS_BYTE_2,
    GEN_DONT_CARE_BYTE,
    GEN_WRITE_DATA,
    CAPTURE_READ_DATA);

    constant C_FAST_READ_COMMAND : std_logic_vector(7 downto 0) := X"0B";
    constant C_BUFFER_WRITE_COMMAND : std_logic_vector(7 downto 0) := X"84";
    constant C_BUFFER_PROGRAM_COMMAND : std_logic_vector(7 downto 0) := X"88";
    constant C_SECTOR_ERASE_COMMAND : std_logic_vector(7 downto 0) := X"7C";
    constant C_STATUS_COMMAND : std_logic_vector(7 downto 0) := X"D7";

    component isp_spi_buffer
        port (
            clk   : in std_logic;
            din   : in std_logic_vector(7 downto 0);
            rd_en : in std_logic;
            rst   : in std_logic;
            wr_en : in std_logic;
            dout  : out std_logic_vector(7 downto 0);
            empty : out std_logic;
            full  : out std_logic);
    end component;

    component strobe_gen
        port(
            reset		    : in std_logic;
            signal_in	 : in std_logic;	
            clock_out	 : in std_logic;
            strobe_out	: out std_logic);
    end component;

    signal write_buffer_rdreq : std_logic;
    signal write_buffer_rden : std_logic;
    signal write_buffer_wrreq : std_logic;
    signal write_buffer_wren : std_logic;
    signal write_buffer_dout : std_logic_vector(7 downto 0);
    signal write_buffer_empty : std_logic;
    signal write_buffer_full : std_logic;

    signal read_buffer_rdreq : std_logic;
    signal read_buffer_rden : std_logic;
    signal read_buffer_wrreq : std_logic;
    signal read_buffer_wren : std_logic;
    signal read_buffer_din : std_logic_vector(7 downto 0);
    signal read_buffer_empty : std_logic;
    signal read_buffer_full : std_logic;

    signal current_data_out : std_logic_vector(7 downto 0);
    signal data_out : std_logic_vector(7 downto 0);
    signal load_data_out : std_logic;

    signal data_in : std_logic_vector(7 downto 0);

    signal spi_clk_count : std_logic_vector(3 downto 0);
    signal spi_csb_i : std_logic;
    signal spi_rising_edge : std_logic;
    signal spi_falling_edge : std_logic;

    signal current_command : std_logic_vector(7 downto 0);

    signal current_spi_state : T_SPI_STATE;
    signal start_transaction : std_logic;

    signal bit_count : std_logic_vector(2 downto 0);
    signal bit_count_reset : std_logic;

    signal byte_count : std_logic_vector(8 downto 0);
    signal byte_count_reset : std_logic;

begin

----------------------------------------------------------------------
-- GENERATE CLOCK OUTPUT
----------------------------------------------------------------------
    
    gen_spi_clk_count : process(rst, clk)
    begin
        if (rst = '1')then
            spi_clk_count <= "0000";
        elsif (rising_edge(clk))then
            if (spi_clk_count = "1111")then
                spi_clk_count <= "0000";
            else
                spi_clk_count <= spi_clk_count + "0001";
            end if;
        end if;
    end process;

    spi_clk <= spi_clk_count(3);

    spi_rising_edge <= '1' when (spi_clk_count = "0111") else '0';
    spi_falling_edge <= '1' when (spi_clk_count = "1111") else '0';

    -- spi_csb NEEDS TO CHANGE STATE WHILE spi_clk IS HIGH    
    gen_spi_csb : process(rst, clk)
    begin
        if (rst = '1')then
            spi_csb <= '1';
        elsif (rising_edge(clk))then
            spi_csb <= spi_csb_i;
        end if;
    end process;

----------------------------------------------------------------------
-- BUFFER TO STORE DATA TO SPI
----------------------------------------------------------------------

    strobe_gen_0 : strobe_gen
    port map(
        reset		    => rst,
        signal_in	 => isp_write_data_strobe,	
        clock_out	 => clk,
        strobe_out	=> write_buffer_wrreq);

    write_buffer_wren <= write_buffer_wrreq and (not write_buffer_full) and (not rst);    

    isp_spi_buffer_0 : isp_spi_buffer
    port map(
        clk   => clk,
        din   => isp_write_data,
        rd_en => write_buffer_rden,
        rst   => rst,
        wr_en => write_buffer_wren,
        dout  => write_buffer_dout,
        empty => write_buffer_empty,
        full  => write_buffer_full);

    write_buffer_rden <= write_buffer_rdreq and (not write_buffer_empty) and (not rst);

----------------------------------------------------------------------
-- BUFFER TO STORE DATA FROM SPI
----------------------------------------------------------------------

    read_buffer_wren <= read_buffer_wrreq and (not read_buffer_full) and (not rst);    

    isp_spi_buffer_1 : isp_spi_buffer
    port map(
        clk   => clk,
        din   => read_buffer_din,
        rd_en => read_buffer_rden,
        rst   => rst,
        wr_en => read_buffer_wren,
        dout  => isp_read_data,
        empty => read_buffer_empty,
        full  => read_buffer_full);

    read_buffer_rden <= read_buffer_rdreq and (not read_buffer_empty) and (not rst);

    strobe_gen_1 : strobe_gen
    port map(
        reset		    => rst,
        signal_in	 => isp_read_data_strobe,	
        clock_out	 => clk,
       strobe_out	 => read_buffer_rdreq);

----------------------------------------------------------------------
-- CONVERT 3-BIT COMMAND TO ACTUAL COMMAND BYTE
----------------------------------------------------------------------

    gen_current_command : process(isp_command)
    begin
        case isp_command is
            when "000" =>
            current_command <= C_FAST_READ_COMMAND;

            when "001" =>
            current_command <= C_BUFFER_WRITE_COMMAND;

            when "010" =>
            current_command <= C_BUFFER_PROGRAM_COMMAND;

            when "011" =>
            current_command <= C_SECTOR_ERASE_COMMAND;

            when others =>
            current_command <= C_STATUS_COMMAND;

        end case;
    end process;

----------------------------------------------------------------------
-- STATE MACHINE TO CONTROL COMMAND GENERATION
----------------------------------------------------------------------

    strobe_gen_2 : strobe_gen
    port map(
        reset		    => rst,
        signal_in	 => isp_start_transaction,	
        clock_out	 => clk,
        strobe_out	=> start_transaction);

    gen_current_spi_state : process(rst, clk)
    begin
        if (rst = '1')then
            spi_csb_i <= '1';
            write_buffer_rdreq <= '0';
            current_spi_state <= IDLE;
        elsif (rising_edge(clk))then
            write_buffer_rdreq <= '0';

            case current_spi_state is
                when IDLE =>
                spi_csb_i <= '1';
                current_spi_state <= IDLE;

                if (start_transaction = '1')then
                    current_spi_state <= GEN_CS_LOW;
                end if;

                when GEN_CS_LOW =>
                current_spi_state <= GEN_CS_LOW;

                if (spi_rising_edge = '1')then
                    spi_csb_i <= '0';
                    current_spi_state <= GEN_COMMAND;
                end if;

                when GEN_COMMAND =>
                current_spi_state <= GEN_COMMAND;

                if ((spi_rising_edge = '1')and(bit_count = "111"))then
                    if (current_command = C_STATUS_COMMAND)then
                        current_spi_state <= CAPTURE_READ_DATA;
                    else
                        current_spi_state <= GEN_ADDRESS_BYTE_0;
                    end if;
                end if;                        
    
                when GEN_ADDRESS_BYTE_0 =>
                current_spi_state <= GEN_ADDRESS_BYTE_0;

                if ((spi_rising_edge = '1')and(bit_count = "111"))then
                    current_spi_state <= GEN_ADDRESS_BYTE_1;
                end if;                        

                when GEN_ADDRESS_BYTE_1 =>
                current_spi_state <= GEN_ADDRESS_BYTE_1;

                if ((spi_rising_edge = '1')and(bit_count = "111"))then
                    current_spi_state <= GEN_ADDRESS_BYTE_2;
                end if;                        

                when GEN_ADDRESS_BYTE_2 =>
                current_spi_state <= GEN_ADDRESS_BYTE_2;

                if ((spi_rising_edge = '1')and(bit_count = "111"))then
                    if (current_command = C_FAST_READ_COMMAND)then
                        current_spi_state <= GEN_DONT_CARE_BYTE;
                    elsif ((current_command = C_SECTOR_ERASE_COMMAND)or
                    (current_command = C_BUFFER_PROGRAM_COMMAND))then
                        current_spi_state <= IDLE;
                    else
                        write_buffer_rdreq <= '1';
                        current_spi_state <= GEN_WRITE_DATA;
                    end if;
                end if;                        

                when GEN_DONT_CARE_BYTE =>
                current_spi_state <= GEN_DONT_CARE_BYTE;

                if ((spi_rising_edge = '1')and(bit_count = "111"))then
                    current_spi_state <= CAPTURE_READ_DATA;
                end if;                        

                when GEN_WRITE_DATA =>
                current_spi_state <= GEN_WRITE_DATA;

                if((spi_rising_edge = '1')and(bit_count = "111"))then
                    if (byte_count = isp_num_bytes)then
                        current_spi_state <= IDLE;
                    else
                        write_buffer_rdreq <= '1';
                    end if;
                end if;


                when CAPTURE_READ_DATA =>
                current_spi_state <= CAPTURE_READ_DATA;

                if((spi_rising_edge = '1')and(bit_count = "111")and(byte_count = isp_num_bytes))then
                    current_spi_state <= IDLE;
                end if;

            end case;
        end if;
    end process;

    isp_transaction_complete <= '1' when (current_spi_state = IDLE) else '0';    
    bit_count_reset <= '1' when ((current_spi_state = IDLE)or(current_spi_state = GEN_CS_LOW)) else '0';
    byte_count_reset <= '0' when ((current_spi_state = CAPTURE_READ_DATA)or(current_spi_state = GEN_WRITE_DATA)) else '1';

    gen_bit_count : process(rst, clk)
    begin
        if (rst = '1')then
            bit_count <= "000";
        elsif (rising_edge(clk))then
            if (spi_rising_edge = '1')then
                if (bit_count_reset = '1')then
                    bit_count <= "000";
                else
                    if (bit_count = "111")then
                        bit_count <= "000";
                    else
                        bit_count <= bit_count + "001";
                    end if;
                end if;
            end if;
        end if;
    end process;

    gen_byte_count : process(rst, clk)
    begin
        if (rst = '1')then
            byte_count <= "000000001";
        elsif (rising_edge(clk))then
            if (spi_rising_edge = '1')then
                if (byte_count_reset = '1')then
                    byte_count <= "000000001";
                else    
                    if (bit_count = "111")then
                        byte_count <= byte_count + "000000001";
                    end if;
                end if;
            end if;
        end if;
    end process;


    load_data_out <= '1' when ((bit_count = "000")and(spi_rising_edge = '0')) else '0';

    current_data_out <=
    current_command when (current_spi_state = GEN_COMMAND) else
    ('0' & isp_address(22 downto 16)) when (current_spi_state = GEN_ADDRESS_BYTE_0) else
    isp_address(15 downto 8) when (current_spi_state = GEN_ADDRESS_BYTE_1) else
    isp_address(7 downto 0) when (current_spi_state = GEN_ADDRESS_BYTE_2) else
    write_buffer_dout;



----------------------------------------------------------------------
-- SHIFT REGISTER TO OUTPUT MOSI
----------------------------------------------------------------------

    gen_data_out : process(rst, clk)
    begin
        if (rst = '1')then
            data_out <= (others => '0');
        elsif (rising_edge(clk))then
            if (spi_falling_edge = '1')then    -- OUTPUT DATA ON FALLING EDGE
                if (load_data_out = '1')then
                    data_out <= current_data_out;
                else
                    data_out <= data_out(6 downto 0) & '0';
                end if;
            end if;
        end if;
    end process;

    spi_mosi <= data_out(7);

----------------------------------------------------------------------
-- SHIFT REGISTER TO CAPTURE MISO
----------------------------------------------------------------------

    gen_data_in : process(rst, clk)
    begin
        if (rst = '1')then
            data_in <= (others => '0');
        elsif (rising_edge(clk))then
            if (spi_rising_edge = '1')then    -- CAPTURE DATA ON RISING EDGE
                data_in <= data_in(6 downto 0) & spi_miso;
            end if;
        end if;
    end process;

    read_buffer_din <= data_in;

    gen_read_buffer_wrreq : process(rst, clk)
    begin
        if (rst = '1')then
            read_buffer_wrreq <= '0';
        elsif (rising_edge(clk))then
            if ((spi_rising_edge = '1')
            and(current_spi_state = CAPTURE_READ_DATA)
            and(bit_count = "111"))then
                read_buffer_wrreq <= '1';
            else
                read_buffer_wrreq <= '0';
            end if;
        end if;
    end process;

end arch_isp_spi_programmer;
