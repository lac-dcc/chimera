----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 06.08.2014 10:52:40
-- Design Name: 
-- Module Name: PCS_BLOCKs_FIFO - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.IEEE802_3_XL_PKG.all;

entity PCS_BLOCKs_FIFO is
	port(
		--System Control Inputs:
		RST_I          : in  STD_LOGIC;
		--WRITE PORT
		WR_CLK_I       : in  STD_LOGIC;
		BLOCKS_VALID_I : in  STD_LOGIC;
		PCS_BLOCKs_I   : in  BLOCK_ARRAY_t(3 downto 0);
		--READ PORT
		RD_CLK_I       : in  STD_LOGIC;
		RD_EN_I        : in  STD_LOGIC;
		BLOCKs_VALID_O : out std_logic;
		PCS_BLOCKs_O   : out BLOCK_ARRAY_t(3 downto 0);
		--STATUS SIGNALS
		FULL           : out STD_LOGIC;
		EMPTY          : out STD_LOGIC
	);
end PCS_BLOCKs_FIFO;

architecture Behavioral of PCS_BLOCKs_FIFO is
	component fifo_dual_clk is
		Port(
			rst    : in  STD_LOGIC;
			wr_clk : in  STD_LOGIC;
			rd_clk : in  STD_LOGIC;
			din    : in  STD_LOGIC_VECTOR(263 downto 0);
			wr_en  : in  STD_LOGIC;
			rd_en  : in  STD_LOGIC;
			dout   : out STD_LOGIC_VECTOR(263 downto 0);
			full   : out STD_LOGIC;
			empty  : out STD_LOGIC
		);
	end component fifo_dual_clk;

	signal wr_data : std_logic_vector(263 downto 0);
	signal rd_data : std_logic_vector(263 downto 0);

	signal fifo_empty : std_logic;
	signal fifo_full : std_logic;	
	signal fifo_dual_clk_wrreq : std_logic;
	signal fifo_dual_clk_rdreq : std_logic;
	
begin
	wr_data <= PCS_BLOCKs_I(3).P & PCS_BLOCKs_I(3).H & PCS_BLOCKs_I(2).P & PCS_BLOCKs_I(2).H & PCS_BLOCKs_I(1).P & PCS_BLOCKs_I(1).H & PCS_BLOCKs_I(0).P & PCS_BLOCKs_I(0).H;

	PCS_BLOCKs_O <= (
			0 => (H => rd_data(1 downto 0), P => rd_data(65 downto 2)),
			1 => (H => rd_data(67 downto 66), P => rd_data(131 downto 68)),
			2 => (H => rd_data(133 downto 132), P => rd_data(197 downto 134)),
			3 => (H => rd_data(199 downto 198), P => rd_data(263 downto 200))
		);

	FIFO_SYNC_inst : component fifo_dual_clk
		port map(
			rst    => RST_I,
			wr_clk => WR_CLK_I,
			rd_clk => RD_CLK_I,
			din    => wr_data,
			wr_en  => fifo_dual_clk_wrreq,
			rd_en  => fifo_dual_clk_rdreq,
			dout   => rd_data,
			full   => fifo_full,
			empty  => fifo_empty
		);
	
	--FIFO dual clock write control	
	fifo_dual_clk_wrreq <= BLOCKS_VALID_I and (not fifo_full) and (not RST_I);
	
	--FIFO dual clock read control	
	fifo_dual_clk_rdreq <= RD_EN_I and (not fifo_empty) and (not RST_I);
	   	

	EMPTY <= fifo_empty;
	FULL <= fifo_full;

	BLOCKS_VALID_O_PROC : process(RD_CLK_I) is
	begin
		if rising_edge(RD_CLK_I) then
			if RST_I = '1' then
				BLOCKs_VALID_O <= '0';
			else
				if (RD_EN_I = '1') then
					BLOCKs_VALID_O <= not fifo_empty;
				else
					BLOCKs_VALID_O <= '0';
				end if;
			end if;
		end if;
	end process BLOCKS_VALID_O_PROC;

end Behavioral;
