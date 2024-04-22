library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.constants.all;

entity vga_wb8_tb is
end vga_wb8_tb;

architecture Behavior of vga_wb8_tb is

	component vga_wb8
		Port(
			-- naming according to Wishbone B4 spec
			ADR_I: in std_logic_vector(31 downto 0);
			CLK_I: in std_logic;
			DAT_I: in std_logic_vector(7 downto 0);
			STB_I: in std_logic;
			WE_I: in std_logic;
			ACK_O: out std_logic;
			DAT_O: out std_logic_vector(7 downto 0);

			I_vga_clk: in std_logic := '0';
			O_vga_vsync, O_vga_hsync, O_vga_r, O_vga_g, O_vga_b: out std_logic := '0'
		);
	end component;


	constant I_clk_period : time := 10 ns;
	signal I_clk : std_logic := '0';
	
	signal vga_ack, vga_vsync, vga_hsync, vga_r, vga_g, vga_b: std_logic := '0';
	signal vga_dat: std_logic_vector(7 downto 0);

begin

	-- instantiate unit under test
	uut: vga_wb8 port map(
		ADR_I => X"00000000",
		CLK_I => I_clk,
		DAT_I => X"00",
		STB_I => '0',
		WE_I => '0',
		ACK_O => vga_ack,
		DAT_O => vga_dat,

		I_vga_clk => I_clk,
		O_vga_vsync => vga_vsync,
		O_vga_hsync => vga_hsync,
		O_vga_r => vga_r,
		O_vga_g => vga_g,
		O_vga_b => vga_b
	);

	proc_clock: process
	begin
		I_clk <= '0';
		wait for I_clk_period/2;
		I_clk <= '1';
		wait for I_clk_period/2;
	end process;
	
	proc_stimuli: process
	begin
	

		
		wait for 10000 * I_clk_period;		
		assert false report "end of simulation" severity failure;
	
	end process;
	

end architecture;