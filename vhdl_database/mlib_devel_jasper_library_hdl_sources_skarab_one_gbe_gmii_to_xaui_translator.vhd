----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.09.2014 14:02:56
-- Design Name: 
-- Module Name: gmii_to_xaui_translator - arch_gmii_to_xaui_translator
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Translates from 1GBE GMII interface to XAUI interface
-- (allows you to use existing 10GBE firmware with 1GBE GMII-SGMII)
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

entity gmii_to_xaui_translator is
	port(
		-- 1GBE GMII interface
		gmii_clk        : in std_logic;
        gmii_clk_en     : in std_logic;  -- GT 04/06/2015 ADD SUPPORT FOR 10/100MBPS OPERATION
		gmii_rst        : in std_logic;
        gmii_rxd        : in std_logic_vector(7 downto 0);
        gmii_rx_dv      : in std_logic;
        gmii_rx_er      : in std_logic;
		
		-- XAUI interface
        xaui_clk        : in std_logic;
        xaui_rst        : in std_logic;
        xgmii_rxd       : out std_logic_vector(63 downto 0);
        xgmii_rxc       : out std_logic_vector(7 downto 0));
end gmii_to_xaui_translator;

--}} End of automatically maintained section

architecture arch_gmii_to_xaui_translator of gmii_to_xaui_translator is

    type T_CONVERT_STATE is (
    IDLE,
    WAIT_FOR_PREAMBLE_FINISH,
    COPY_DATA,
    GEN_TERMINATE,
    GEN_PADDING);
    
    type T_GEN_STATE is (
    GEN_IDLES,
    READ_PACKET_SIZE,
    OUTPUT_PACKET);

	constant C_IDLE_CHARACTER : std_logic_vector(7 downto 0) := X"07";
	constant C_START_CHARACTER : std_logic_vector(7 downto 0) := X"FB";
	constant C_TERMINATE_CHARACTER : std_logic_vector(7 downto 0) := X"FD";
	constant C_IDLE_WORD : std_logic_vector(63 downto 0) := X"0707070707070707";
	constant C_START_WORD : std_logic_vector(63 downto 0) := X"D5555555555555FB";
	constant C_PREAMBLE_SFD : std_logic_vector(7 downto 0) := X"D5";

    component gmii_to_xaui_fifo
    port (
        wr_rst  : in std_logic;
        rd_rst  : in std_logic;
        wr_clk  : in std_logic;
        rd_clk  : in std_logic;
        din     : in std_logic_vector(71 downto 0);
        wr_en   : in std_logic;
        rd_en   : in std_logic;
        dout    : out std_logic_vector(71 downto 0);
        full    : out std_logic;
        empty   : out std_logic);
    end component;
	
    component packet_byte_count_fifo
    port (
        wr_rst  : in std_logic;
        rd_rst  : in std_logic;
        wr_clk  : in std_logic;
        rd_clk  : in std_logic;
        din     : in std_logic_vector(15 downto 0);
        wr_en   : in std_logic;
        rd_en   : in std_logic;
        dout    : out std_logic_vector(15 downto 0);
        full    : out std_logic;
        empty   : out std_logic);
    end component;
	
    signal gmii_rx_dv_z : std_logic;	
    signal gmii_to_xaui_fifo_din : std_logic_vector(71 downto 0);
    signal gmii_to_xaui_fifo_wr_en : std_logic;
    signal gmii_to_xaui_fifo_wrreq : std_logic;
    signal gmii_to_xaui_fifo_rdreq : std_logic;
    signal gmii_to_xaui_fifo_rdreq_z : std_logic;
    signal gmii_to_xaui_fifo_dout : std_logic_vector(71 downto 0);
    signal gmii_to_xaui_fifo_full : std_logic;
    signal gmii_to_xaui_fifo_empty	: std_logic;
    
    signal current_convert_state : T_CONVERT_STATE;
	
    signal byte_count : std_logic_vector(15 downto 0);
    signal reset_byte_count : std_logic;
    signal next_gbe_byte : std_logic_vector(7 downto 0);
    signal next_gbe_control : std_logic;
	
    signal packet_byte_count_din : std_logic_vector(15 downto 0);
    signal packet_byte_count_wrreq : std_logic;
    signal packet_byte_count_wr_en : std_logic;
    signal packet_byte_count_rdreq : std_logic;
    signal packet_byte_count_dout : std_logic_vector(15 downto 0);
    signal packet_byte_count_full : std_logic;
    signal packet_byte_count_empty : std_logic;
	
    signal current_gen_state : T_GEN_STATE;
    signal xaui_output_count : std_logic_vector(15 downto 0);
    signal reset_output_count : std_logic;
	
    signal gmii_rxd_z : std_logic_vector(7 downto 0);
	
begin

----------------------------------------------------------------------------
-- STATE MACHINE TO CONVERT TO XAUI
----------------------------------------------------------------------------

    gen_gmii_rx_dv_z : process(gmii_rst, gmii_clk)
    begin
        if (gmii_rst = '1')then
            gmii_rx_dv_z <= '0';
        elsif (rising_edge(gmii_clk))then
            if (gmii_clk_en = '1')then
                gmii_rx_dv_z <= gmii_rx_dv;
            end if;
        end if;
    end process;

    gen_current_convert_state : process(gmii_rst, gmii_clk)
    begin
        if (gmii_rst = '1')then
            packet_byte_count_wr_en <= '0';
            current_convert_state <= IDLE;
        elsif (rising_edge(gmii_clk))then
            packet_byte_count_wr_en <= '0';
            
            if (gmii_clk_en = '1')then
            
                case current_convert_state is
                    when IDLE =>
                    current_convert_state <= IDLE;
                
                    -- ONLY START COPYING DATA ONCE PREAMBLE FINISHED, WILL CREATE A FULL
                    -- PREAMBLE ON OUTPUT
                    if ((gmii_rx_dv = '1')and(gmii_rx_dv_z = '0'))then            
                        current_convert_state <= WAIT_FOR_PREAMBLE_FINISH;
                    end if;
                    
                    when WAIT_FOR_PREAMBLE_FINISH =>
                    current_convert_state <= WAIT_FOR_PREAMBLE_FINISH;
                    
                    if ((gmii_rx_dv = '1')and(gmii_rxd_z = C_PREAMBLE_SFD))then
                        current_convert_state <= COPY_DATA;
                    end if;
                    
                    when COPY_DATA =>
                    current_convert_state <= COPY_DATA;
                    
                    if (gmii_rx_dv = '0')then
                        current_convert_state <= GEN_TERMINATE;
                    end if;
                    
                    -- RELIES ON IPG TO GENERATE REQUIRED PADDING ELSE COULD RESULT
                    -- IN DATA LOSS
                    when GEN_TERMINATE =>
                    if (byte_count(2 downto 0) = "111")then
                        current_convert_state <= IDLE;
                        packet_byte_count_wr_en <= '1';
                    else
                        current_convert_state <= GEN_PADDING;
                    end if;
                    
                    when GEN_PADDING =>
                    current_convert_state <= GEN_PADDING;
                    
                    if (byte_count(2 downto 0) = "111")then
                        current_convert_state <= IDLE;
                        packet_byte_count_wr_en <= '1';
                    end if;                
                    
                end case;
            
            end if;
        end if;
    end process;

    gen_gmii_rxd_z : process(gmii_rst, gmii_clk)
    begin
        if (gmii_rst = '1')then
            gmii_rxd_z <= (others => '0');
        elsif (rising_edge(gmii_clk))then
            if (gmii_clk_en = '1')then
                gmii_rxd_z <= gmii_rxd;
            end if;
        end if;
    end process;

    next_gbe_byte <=
    C_TERMINATE_CHARACTER when (current_convert_state = GEN_TERMINATE) else
    C_IDLE_CHARACTER when (current_convert_state = GEN_PADDING) else
    gmii_rxd_z;

    next_gbe_control <= 
    '1' when ((current_convert_state = GEN_TERMINATE)or(current_convert_state = GEN_PADDING)) else
    '0';

    reset_byte_count <= '1' when (current_convert_state = IDLE) else '0';

    gen_byte_count : process(gmii_rst, gmii_clk)
    begin
        if (gmii_rst = '1')then
            byte_count <= X"0000";
        elsif (rising_edge(gmii_clk))then
            if (gmii_clk_en = '1')then
                if (reset_byte_count = '1')then
                    byte_count <= X"0000";
                else    
                    if ((current_convert_state = COPY_DATA)
                    or(current_convert_state = GEN_TERMINATE)
                    or(current_convert_state = GEN_PADDING))then
                        byte_count <= byte_count + X"0001";
                    end if;
                end if;
            end if;
        end if;
    end process;

    gen_gmii_to_xaui_fifo_din : process(gmii_rst, gmii_clk)
    begin
        if (gmii_rst = '1')then
            gmii_to_xaui_fifo_din(63 downto 0) <= C_IDLE_WORD;
            gmii_to_xaui_fifo_din(71 downto 64) <= X"FF";
            gmii_to_xaui_fifo_wr_en <= '0';
        elsif (rising_edge(gmii_clk))then
            gmii_to_xaui_fifo_wr_en <= '0';
            if (gmii_clk_en = '1')then
                if ((current_convert_state = COPY_DATA)
                or(current_convert_state = GEN_TERMINATE)
                or(current_convert_state = GEN_PADDING))then
                    if (byte_count(2 downto 0) = "000")then
                        gmii_to_xaui_fifo_din(7 downto 0) <= next_gbe_byte;
                        gmii_to_xaui_fifo_din(64) <= next_gbe_control;
                    elsif (byte_count(2 downto 0) = "001")then
                        gmii_to_xaui_fifo_din(15 downto 8) <= next_gbe_byte;
                        gmii_to_xaui_fifo_din(65) <= next_gbe_control;
                    elsif (byte_count(2 downto 0) = "010")then
                        gmii_to_xaui_fifo_din(23 downto 16) <= next_gbe_byte;
                        gmii_to_xaui_fifo_din(66) <= next_gbe_control;
                    elsif (byte_count(2 downto 0) = "011")then
                        gmii_to_xaui_fifo_din(31 downto 24) <= next_gbe_byte;
                        gmii_to_xaui_fifo_din(67) <= next_gbe_control;
                    elsif (byte_count(2 downto 0) = "100")then
                        gmii_to_xaui_fifo_din(39 downto 32) <= next_gbe_byte;
                        gmii_to_xaui_fifo_din(68) <= next_gbe_control;
                    elsif (byte_count(2 downto 0) = "101")then
                        gmii_to_xaui_fifo_din(47 downto 40) <= next_gbe_byte;
                        gmii_to_xaui_fifo_din(69) <= next_gbe_control;
                    elsif (byte_count(2 downto 0) = "110")then
                        gmii_to_xaui_fifo_din(55 downto 48) <= next_gbe_byte;
                        gmii_to_xaui_fifo_din(70) <= next_gbe_control;
                    else
                        gmii_to_xaui_fifo_din(63 downto 56) <= next_gbe_byte;
                        gmii_to_xaui_fifo_din(71) <= next_gbe_control;
                        gmii_to_xaui_fifo_wr_en <= '1';
                    end if;
                end if;
            end if;
        end if;
    end process;    
    
    gmii_to_xaui_fifo_wrreq <= gmii_to_xaui_fifo_wr_en and (not gmii_to_xaui_fifo_full) and (not gmii_rst) ;

    gmii_to_xaui_fifo_0 : gmii_to_xaui_fifo
    port map(
        wr_rst  => gmii_rst,
        rd_rst  => xaui_rst,
        wr_clk  => gmii_clk,
        rd_clk  => xaui_clk,
        din     => gmii_to_xaui_fifo_din,
        wr_en   => gmii_to_xaui_fifo_wrreq,
        rd_en   => gmii_to_xaui_fifo_rdreq,
        dout    => gmii_to_xaui_fifo_dout,
        full    => gmii_to_xaui_fifo_full,
        empty   => gmii_to_xaui_fifo_empty);

----------------------------------------------------------------------------
-- RECORD TOTAL NUMBER OF BYTES WRITTEN (DIVIDED BY 8)
----------------------------------------------------------------------------

    packet_byte_count_wrreq <= packet_byte_count_wr_en and (not packet_byte_count_full) and (not gmii_rst);

    packet_byte_count_din <= "000" & byte_count(15 downto 3);

    packet_byte_count_fifo_0 : packet_byte_count_fifo
    port map(
        wr_rst  => gmii_rst,
        rd_rst  => xaui_rst,
        wr_clk  => gmii_clk,
        rd_clk  => xaui_clk,
        din     => packet_byte_count_din,
        wr_en   => packet_byte_count_wrreq,
        rd_en   => packet_byte_count_rdreq,
        dout    => packet_byte_count_dout,
        full    => packet_byte_count_full,
        empty   => packet_byte_count_empty);

----------------------------------------------------------------------------
-- SIMPLY OUTPUT PACKETS WHEN AVAILABLE, ELSE IDLES
----------------------------------------------------------------------------

    gen_current_gen_state : process(xaui_rst, xaui_clk)
    begin
        if (xaui_rst = '1')then
            current_gen_state <= GEN_IDLES;
        elsif (rising_edge(xaui_clk))then
            case current_gen_state is    
                when GEN_IDLES =>
                current_gen_state <= GEN_IDLES;
                
                if (packet_byte_count_empty = '0')then
                    current_gen_state <= READ_PACKET_SIZE;
                end if;
                
                when READ_PACKET_SIZE =>
                current_gen_state <= OUTPUT_PACKET;
                
                when OUTPUT_PACKET =>
                current_gen_state <= OUTPUT_PACKET;
                
                if (xaui_output_count = packet_byte_count_dout)then
                    current_gen_state <= GEN_IDLES;
                end if;                
                
            end case;
        end if;
    end process;

    packet_byte_count_rdreq <= '1' when ((current_gen_state = READ_PACKET_SIZE) and (xaui_rst = '0') and (packet_byte_count_empty = '0')) else '0';

    gmii_to_xaui_fifo_rdreq <= '1' when ((current_gen_state = OUTPUT_PACKET) and (xaui_rst = '0') and (gmii_to_xaui_fifo_empty = '0')) else '0';

    reset_output_count <= '0' when (current_gen_state = OUTPUT_PACKET) else '1';

    gen_gmii_to_xaui_fifo_rdreq_z : process(xaui_rst, xaui_clk)
    begin
        if (xaui_rst = '1')then
            gmii_to_xaui_fifo_rdreq_z <= '0';
        elsif (rising_edge(xaui_clk))then
            gmii_to_xaui_fifo_rdreq_z <= gmii_to_xaui_fifo_rdreq;
        end if;
    end process;

    gen_xgmii_rxd_rxc : process(xaui_rst, xaui_clk)
    begin
        if (xaui_rst = '1')then
            xgmii_rxd <= C_IDLE_WORD;
            xgmii_rxc <= X"FF";
        elsif (rising_edge(xaui_clk))then
            if ((gmii_to_xaui_fifo_rdreq = '1')and
            (gmii_to_xaui_fifo_rdreq_z = '0'))then
                xgmii_rxd <= C_START_WORD;
                xgmii_rxc <= X"01";
            elsif (gmii_to_xaui_fifo_rdreq_z = '1')then
                xgmii_rxd <= gmii_to_xaui_fifo_dout(63 downto 0);
                xgmii_rxc <= gmii_to_xaui_fifo_dout(71 downto 64);
            else
                xgmii_rxd <= C_IDLE_WORD;
                xgmii_rxc <= X"FF";
            end if;
        end if;
    end process;

    gen_xaui_output_count : process(xaui_rst, xaui_clk)
    begin
        if (xaui_rst = '1')then
            xaui_output_count <= X"0001";
        elsif (rising_edge(xaui_clk))then
            if (reset_output_count = '1')then
                xaui_output_count <= X"0001";
            else
                xaui_output_count <= xaui_output_count + X"0001";
            end if;    
        end if;
    end process;

end arch_gmii_to_xaui_translator;
