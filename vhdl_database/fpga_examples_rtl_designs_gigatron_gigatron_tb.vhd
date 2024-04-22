library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity gigatron_tb is
end entity;

architecture rtl of gigatron_tb is
	signal clk : std_logic := '0';
	signal stop : std_logic := '0';
	signal reset : std_logic := '1';

	signal spi_req : std_logic;

	signal red : unsigned(4 downto 0);
	signal grn : unsigned(4 downto 0);
	signal blu : unsigned(4 downto 0);
	signal hsync : std_logic;
	signal vsync : std_logic;

	signal ram_data : unsigned(15 downto 0);
	signal ram_addr : unsigned(12 downto 0);
	signal ram_ba : unsigned(1 downto 0);
	signal ram_we : std_logic;
	signal ram_ras : std_logic;
	signal ram_cas : std_logic;
	signal ram_ldqm : std_logic;
	signal ram_udqm : std_logic;

	signal rom_a : unsigned(15 downto 0);
	signal rom_q : unsigned(15 downto 0);
begin
	clk <= (not stop) and (not clk) after 5 ns;

	gigatron_inst : entity work.gigatron_top
		generic map (
			clk_ticks_per_usec => 100,
			romload_size => 32
		)
		port map (
			clk => clk,
			reset => reset,

			flashslot => "11000",
			joystick => (others => '1'),

		-- SPI interface
			spi_cs_n => open,
			spi_req => spi_req,
			spi_ack => spi_req,
			spi_d => open,
			spi_q => X"00",

		-- SDRAM interface
			ram_data => ram_data,
			ram_addr => ram_addr,
			ram_ba => ram_ba,
			ram_we => ram_we,
			ram_ras => ram_ras,
			ram_cas => ram_cas,
			ram_ldqm => ram_ldqm,
			ram_udqm => ram_udqm,

		-- Video
			red => red,
			grn => grn,
			blu => blu,
			hsync => hsync,
			vsync => vsync
		);

	rom_inst : entity work.gigatron_tb_rom
		port map (
			a => rom_a,
			q => rom_q
		);

	sdram_emu_blk : block
		signal oe_reg : std_logic := '0';
		signal a_reg : unsigned(15 downto 0) := (others => '0');
	begin
		rom_a <= a_reg;
		ram_data <= rom_q when oe_reg = '1' else (others => '0');

		process(clk)
		begin
			if rising_edge(clk) then
				if ram_ras = '0' then
					a_reg(15 downto 9) <= ram_addr(6 downto 0);
					oe_reg <= '0';
				end if;
				if (ram_cas = '0') and (ram_we = '1') then
					a_reg(8 downto 0) <= ram_addr(8 downto 0);
					oe_reg <= '1';
				end if;
			end if;
		end process;
	end block;

	process
	begin
		reset <= '1';
		wait for 1 us;
		reset <= '0';
		wait for 1000000 us;
		stop <= '1';
		wait;
	end process;
end architecture;
