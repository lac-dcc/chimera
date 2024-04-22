----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.09.2014 14:02:56
-- Design Name: 
-- Module Name: xaui_to_gmii_translator - arch_xaui_to_gmii_translator
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Translates from XAUI interface to 1GBE GMII interface
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

entity xaui_to_gmii_translator is
	port(
		-- XAUI interface
        xaui_clk            : in std_logic;
        xaui_rst            : in std_logic;
        xgmii_txd           : in std_logic_vector(63 downto 0);
        xgmii_txc           : in std_logic_vector(7 downto 0);
        xaui_almost_full    : out std_logic;
        xaui_full           : out std_logic;
		
		-- 1GBE GMII interface
		gmii_clk             : in std_logic;
		gmii_clk_en          : in std_logic;  -- GT 04/06/2015 ADD SUPPORT FOR 10/100MBPS OPERATION
		gmii_rst             : in std_logic;
        gmii_txd             : out std_logic_vector(7 downto 0);
        gmii_tx_en           : out std_logic;
        gmii_tx_er           : out std_logic;
        gmii_link_up         : in std_logic);   
end xaui_to_gmii_translator;

--}} End of automatically maintained section

architecture arch_xaui_to_gmii_translator of xaui_to_gmii_translator is
	
	constant C_IDLE_CHARACTER : std_logic_vector(7 downto 0) := X"07";
	constant C_START_CHARACTER : std_logic_vector(7 downto 0) := X"FB";
	constant C_TERMINATE_CHARACTER : std_logic_vector(7 downto 0) := X"FD";
	
    component xaui_to_gmii_fifo
    port (
        rst       : in std_logic;
        wr_clk    : in std_logic;
        rd_clk    : in std_logic;
        din       : in std_logic_vector(71 downto 0);
        wr_en     : in std_logic;
        rd_en     : in std_logic;
        dout      : out std_logic_vector(8 downto 0);
        full      : out std_logic;
        empty     : out std_logic;
        prog_full : out std_logic);
    end component;
	
    signal xaui_fifo_din : std_logic_vector(71 downto 0);
    signal xaui_fifo_write : std_logic;
    signal xaui_fifo_wrreq : std_logic;
    signal xaui_fifo_rdreq : std_logic;
    signal xaui_fifo_rdreq_z : std_logic;
    signal xaui_fifo_dout : std_logic_vector(8 downto 0);
    signal xaui_fifo_full : std_logic;
    signal xaui_fifo_empty : std_logic;
	
	signal gmii_tx_en_i : std_logic;
	
	signal ifg_counter : std_logic_vector(3 downto 0);
	signal ifg_counter_reset : std_logic;
	
begin

    gmii_tx_en <= gmii_tx_en_i;

------------------------------------------------------------------------
-- STORE XAUI IN FIFO WHILE PROCESS IT
------------------------------------------------------------------------

    -- ENDIAN SWAP BECAUSE OF THE WAY THAT XILINX DO WIDTH CHANGE
    gen_xaui_fifo_din : process(xaui_rst, xaui_clk)
    begin
        if (xaui_rst = '1')then
            xaui_fifo_write <= '0';
            xaui_fifo_din <= (others => '0');
        elsif (rising_edge(xaui_clk))then
            if ((xgmii_txc = X"FF")and
            (xgmii_txd(7 downto 0) = C_IDLE_CHARACTER)and
            (xgmii_txd(15 downto 8) = C_IDLE_CHARACTER)and
            (xgmii_txd(23 downto 16) = C_IDLE_CHARACTER)and
            (xgmii_txd(31 downto 24) = C_IDLE_CHARACTER)and
            (xgmii_txd(39 downto 32) = C_IDLE_CHARACTER)and
            (xgmii_txd(47 downto 40) = C_IDLE_CHARACTER)and
            (xgmii_txd(55 downto 48) = C_IDLE_CHARACTER)and
            (xgmii_txd(63 downto 56) = C_IDLE_CHARACTER))then
                xaui_fifo_write <= '0';
                xaui_fifo_din <= (others => '0');
            elsif ((xgmii_txc = X"01")and
            (xgmii_txd(7 downto 0) = C_START_CHARACTER)and
            (xgmii_txd(15 downto 8) = X"55")and
            (xgmii_txd(23 downto 16) = X"55")and
            (xgmii_txd(31 downto 24) = X"55")and
            (xgmii_txd(39 downto 32) = X"55")and
            (xgmii_txd(47 downto 40) = X"55")and
            (xgmii_txd(55 downto 48) = X"55")and
            (xgmii_txd(63 downto 56) = X"D5"))then
                xaui_fifo_write <= '1';
                xaui_fifo_din(7 downto 0) <= X"D5";
                xaui_fifo_din(8) <= '0';
                xaui_fifo_din(16 downto 9) <= X"55";
                xaui_fifo_din(17) <= '0';
                xaui_fifo_din(25 downto 18) <= X"55";
                xaui_fifo_din(26) <= '0';
                xaui_fifo_din(34 downto 27) <= X"55";
                xaui_fifo_din(35) <= '0';
                xaui_fifo_din(43 downto 36) <= X"55";
                xaui_fifo_din(44) <= '0';
                xaui_fifo_din(52 downto 45) <= X"55";
                xaui_fifo_din(53) <= '0';
                xaui_fifo_din(61 downto 54) <= X"55";
                xaui_fifo_din(62) <= '0';
                xaui_fifo_din(70 downto 63) <= X"55";
                xaui_fifo_din(71) <= '0';
            else
                xaui_fifo_write <= '1';
                xaui_fifo_din(7 downto 0) <= xgmii_txd(63 downto 56);
                xaui_fifo_din(8) <= xgmii_txc(7);
                xaui_fifo_din(16 downto 9) <= xgmii_txd(55 downto 48);
                xaui_fifo_din(17) <= xgmii_txc(6);
                xaui_fifo_din(25 downto 18) <= xgmii_txd(47 downto 40);
                xaui_fifo_din(26) <= xgmii_txc(5);
                xaui_fifo_din(34 downto 27) <= xgmii_txd(39 downto 32);
                xaui_fifo_din(35) <= xgmii_txc(4);
                xaui_fifo_din(43 downto 36) <= xgmii_txd(31 downto 24);
                xaui_fifo_din(44) <= xgmii_txc(3);
                xaui_fifo_din(52 downto 45) <= xgmii_txd(23 downto 16);
                xaui_fifo_din(53) <= xgmii_txc(2);
                xaui_fifo_din(61 downto 54) <= xgmii_txd(15 downto 8);
                xaui_fifo_din(62) <= xgmii_txc(1);
                xaui_fifo_din(70 downto 63) <= xgmii_txd(7 downto 0);
                xaui_fifo_din(71) <= xgmii_txc(0);
            end if;
        end if;
    end process;

    xaui_full <= xaui_fifo_full;
    xaui_fifo_wrreq <= xaui_fifo_write when (xaui_fifo_full = '0' and xaui_rst = '0') else '0';

    xaui_to_gmii_fifo_0 : xaui_to_gmii_fifo
    port map(
        rst       => xaui_rst,
        wr_clk    => xaui_clk,
        rd_clk    => gmii_clk,
        din       => xaui_fifo_din,
        wr_en     => xaui_fifo_wrreq,
        rd_en     => xaui_fifo_rdreq,
        dout      => xaui_fifo_dout,
        full      => xaui_fifo_full,
        empty     => xaui_fifo_empty,
        prog_full => xaui_almost_full);


------------------------------------------------------------------------
-- READ OUT FIFO AND CONVERT TO GMII
------------------------------------------------------------------------

    -- ONLY READ OUT IF LINK IS UP
    xaui_fifo_rdreq <= '1' when
    ((xaui_fifo_empty = '0')and(gmii_link_up = '1')and(ifg_counter = "1111")and(ifg_counter_reset = '0')and(gmii_clk_en = '1')and(gmii_rst = '0'))else '0';
 	
    gen_xaui_fifo_rdreq_z : process(gmii_rst, gmii_clk)
    begin
        if (gmii_rst = '1')then
            xaui_fifo_rdreq_z <= '0';
        elsif (rising_edge(gmii_clk))then
            xaui_fifo_rdreq_z <= xaui_fifo_rdreq;
        end if;
    end process;
 	
	gen_gmii_tx_en_i : process(gmii_rst, gmii_clk)
	begin
        if (gmii_rst = '1')then
            gmii_tx_en_i <= '0';
            ifg_counter_reset <= '0';
        elsif (rising_edge(gmii_clk))then
            if (gmii_clk_en = '1')then
                gmii_tx_en_i <= '0';
                ifg_counter_reset <= '0';
            end if;
    
            if (xaui_fifo_rdreq_z = '1')then	
                gmii_tx_en_i <= not xaui_fifo_dout(8);
                   
                if ((xaui_fifo_dout(8) = '1')and(xaui_fifo_dout(7 downto 0) = C_TERMINATE_CHARACTER))then
                    ifg_counter_reset <= '1';
                end if;
            end if;
        end if;	   
	end process;
	
	gen_gmii_txd : process(gmii_rst, gmii_clk)
	begin
        if (gmii_rst = '1')then
            gmii_txd <= (others => '0');
        elsif (rising_edge(gmii_clk))then            	   
            gmii_txd <= xaui_fifo_dout(7 downto 0);
        end if;	   
	end process;

    gmii_tx_er <= '0';
    	
    gen_ifg_counter : process(gmii_rst, gmii_clk)
    begin
        if (gmii_rst = '1')then
            ifg_counter <= (others => '1');
        elsif (rising_edge(gmii_clk))then
            if (gmii_clk_en = '1')then
                if (ifg_counter_reset = '1')then
                    ifg_counter <= (others => '0');
                else
                    if (ifg_counter /= "1111")then
                        ifg_counter <= ifg_counter + "0001";
                    end if;
                end if;
            end if;
        end if;
    end process;
    	
end arch_xaui_to_gmii_translator;
