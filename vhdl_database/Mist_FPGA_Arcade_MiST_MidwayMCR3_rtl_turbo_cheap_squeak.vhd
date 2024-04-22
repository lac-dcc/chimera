-- Midway Turbo Cheap Squeak sound board

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity turbo_cheap_squeak is
port(
	clock_40     : in std_logic;
	reset        : in std_logic;
	input        : in std_logic_vector(7 downto 0);
	rom_addr     : out std_logic_vector(14 downto 0);
	rom_do       : in std_logic_vector(7 downto 0);
	audio_out    : out std_logic_vector(9 downto 0)
);
end turbo_cheap_squeak;

architecture rtl of turbo_cheap_squeak is

signal cpu_ce       : std_logic;
signal cpu_ce_count : std_logic_vector( 4 downto 0);
signal cpu_addr     : std_logic_vector(15 downto 0);
signal cpu_rw       : std_logic;
signal cpu_irq      : std_logic;
signal cpu_data_in  : std_logic_vector( 7 downto 0);
signal cpu_data_out : std_logic_vector( 7 downto 0);

signal pia_data_out : std_logic_vector( 7 downto 0);
signal pia_pa_in    : std_logic_vector( 7 downto 0);
signal pia_pa_out   : std_logic_vector( 7 downto 0);
signal pia_pa_oe    : std_logic_vector( 7 downto 0);
signal pia_pb_in    : std_logic_vector( 7 downto 0);
signal pia_pb_out   : std_logic_vector( 7 downto 0);
signal pia_pb_oe    : std_logic_vector( 7 downto 0);
signal pia_ca1_in   : std_logic;
signal pia_ca2_out  : std_logic;
signal pia_cb1_in   : std_logic;
signal pia_cb2_out  : std_logic;
signal pia_irqa     : std_logic;
signal pia_irqb     : std_logic;

signal cs_rom       : std_logic;
signal cs_ram       : std_logic;
signal cs_pia       : std_logic;

signal ram_we       : std_logic;
signal ram_data_out : std_logic_vector(7 downto 0);

begin

cpu09 : entity work.cpu09
port map (
	clk => clock_40,           -- clock input (falling edge)
	ce => cpu_ce,              -- 2 MHz clock enable
	rst => reset,              -- reset input (active high)
	vma => open,               -- valid memory address (active high)
	lic_out  => open,          -- last instruction cycle (active high)
	ifetch   => open,          -- instruction fetch cycle (active high)
	opfetch  => open,          -- opcode fetch (active high)
	ba => open,                -- bus available (high on sync wait or DMA grant)
	bs => open,                -- bus status (high on interrupt or reset vector fetch or DMA grant)
	addr => cpu_addr,          -- address bus output
	rw => cpu_rw,              -- read not write output
	data_out => cpu_data_out,  -- data bus output
	data_in  => cpu_data_in,   -- data bus input
	irq => cpu_irq,            -- interrupt request input (active high)
	firq => '0',               -- fast interrupt request input (active high)
	nmi => '0',                -- non maskable interrupt request input (active high)
	halt => '0'                -- halt input (active high) grants DMA
);

wram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 13)
port map(
	clk  => clock_40,
	we   => ram_we,
	addr => cpu_addr(12 downto 0),
	d    => cpu_data_out,
	q    => ram_data_out
);

pia6821 : entity work.pia6821
port map (
	clk => clock_40,
	rst => reset,
	cs  => cs_pia,
	rw  => cpu_rw,
	addr => cpu_addr(0)&cpu_addr(1), -- wired in reverse order
	data_in => cpu_data_out,
	data_out => pia_data_out,
	irqa => pia_irqa,
	irqb => pia_irqb,
	pa_i => pia_pa_in,
	pa_o => pia_pa_out,
	pa_oe => open,
	ca1 => pia_ca1_in,
	ca2_i => '0',
	ca2_o => open,
	ca2_oe => open,
	pb_i => pia_pb_in,
	pb_o => pia_pb_out,
	pb_oe => open,
	cb1 => pia_cb1_in,
	cb2_i => '0',
	cb2_o => open,
	cb2_oe => open
);

process (clock_40)
begin
	if rising_edge(clock_40) then
		cpu_ce <= '0';
		cpu_ce_count <= cpu_ce_count + 1;
		if cpu_ce_count = 19 then
			cpu_ce <= '1';
			cpu_ce_count <= (others => '0');
		end if;
	end if;
end process;

cs_rom <= '1' when cpu_addr(15) = '1' else '0';
cs_ram <= '1' when cpu_addr(15) = '0' and cpu_addr(14) = '0' else '0';
cs_pia <= '1' when cpu_addr(15) = '0' and cpu_addr(14) = '1' else '0';

ram_we <= '1' when cs_ram = '1' and cpu_rw = '0' else '0';

rom_addr <= cpu_addr(14 downto 0);

cpu_data_in <= rom_do when cs_rom = '1' else
               ram_data_out when cs_ram = '1' else
               pia_data_out when cs_pia = '1' else
               (others => '1');

cpu_irq <= pia_irqa or pia_irqb;

audio_out <= pia_pa_out(7 downto 0)&pia_pb_out(7 downto 6);
pia_pb_in(5 downto 0) <= "00"&input(4 downto 1); -- stat1-stat0, sr3-sr0
pia_ca1_in <= not input(0); -- sirq
pia_pa_in <= pia_pa_out;
pia_cb1_in <= '0'; -- spare

end rtl;
