library ieee;
use ieee.std_logic_1164.all;

entity ProgSRam is
	port
	(
		address		: in std_logic_vector(15 downto 0);
		n_write		: in std_logic; -- inverted write
		n_enable        : in std_logic; -- inverted enable for read or write
		data		: in std_logic_vector(7 downto 0); -- input to RAM (for write)
		q		: out std_logic_vector(7 downto 0); -- output from RAM (for read)
                -- external SRAM interface
                sram_lbl, sram_ubl, sram_wel: out std_logic; -- inverted logic signals
                sram_a          : out std_logic_vector(18 downto 0);
                sram_d          : inout std_logic_vector(15 downto 0)
	);
end ProgSRam;

architecture struct of ProgSRam is
begin
  -- this module will address lower 64K, set 3 high address bits to 0
  sram_a <= "000" & address;
  sram_ubl <= '1'; -- upper 8 bits disabled
  sram_lbl <= n_enable; -- lower 8 bits to enable signal 
  sram_wel <= n_write; -- write signal
  sram_d(15 downto 8) <= (others => 'Z'); -- upper bits high impedance
  sram_d(7 downto 0) <= data when n_write='0' else (others => 'Z');
  q <= sram_d(7 downto 0);
end struct;
