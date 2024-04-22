-------------------------------------------------------------------------------
--
-- Project     : Spartan-6 Integrated Block for PCI Express
-- File        : ramb_2nk.vhd
-- Description : Endpoint Memory: nKB BlockRAM banks.
--
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
-- use ieee.std_logic_unsigned.all;
-- use work.ebm0_pcie_a_pkg.ep_dp_ram;
use work.ebs_pkg.Nlog2;

entity ramb_2nk is

generic (
	DATA_DWIDTH : natural := 32;
  MEMORY_SIZE : natural := 1024
);

port (
  clk         : in std_logic;                                          -- system clock
  bram_we     : in std_logic;                                          -- BRAM write enable
  bram_ad     : in std_logic_vector(Nlog2(MEMORY_SIZE) - 1 downto 0);  -- BRAM address
  bram_da_wr  : in std_logic_vector(DATA_DWIDTH - 1 downto 0);         -- BRAM data in
  bram_da_rd  : out std_logic_vector(DATA_DWIDTH - 1 downto 0);        -- BRAM data out

  mem_addr_i  : in std_logic_vector(Nlog2(MEMORY_SIZE) - 1 downto 0);
  mem_dout_o  : out std_logic_vector(DATA_DWIDTH - 1 downto 0);

  bram_rd_wr  : in std_logic_vector(1 downto 0)                        -- Rd/Wr memory control
);
end ramb_2nk;

architecture rtl of ramb_2nk is

signal mem_addr  : std_logic_vector(Nlog2(MEMORY_SIZE) - 1 downto 0);
signal ramb_addr : std_logic_vector(Nlog2(MEMORY_SIZE) - 1 downto 0);
signal ramb_data : std_logic_vector(DATA_DWIDTH - 1 downto 0);
signal rd_en     : std_logic;

begin

rd_en <= '1';

-- ramb_i : ep_dp_ram
ramb_i : entity work.ep_dp_ram

generic map (
  ADDR_WR_SIZE => Nlog2(MEMORY_SIZE),
  WORD_WR_SIZE => DATA_DWIDTH,
  ADDR_RD_SIZE => Nlog2(MEMORY_SIZE),
  WORD_RD_SIZE => DATA_DWIDTH
)

port map (
  clka         => clk,
  wea          => bram_we,
  addra        => bram_ad,
  dina         => bram_da_wr,
  clkb         => clk,
  enb          => rd_en,
  addrb        => ramb_addr,
  doutb        => ramb_data
);

process begin
  wait until rising_edge(clk);
    mem_addr   <= mem_addr_i;
	  bram_da_rd <= ramb_data;
end process;

mem_dout_o <= ramb_data;

with bram_rd_wr select
  ramb_addr <= bram_ad  when "00",
               mem_addr when others;

end; -- ramb_2nk

