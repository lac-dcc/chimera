library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.constants.all;

entity bus_ram_toplevel is
	Port(
		I_clk: in std_logic;
		I_reset: in std_logic;
		I_en: in std_logic;
		I_op: in std_logic_vector(2 downto 0); -- memory opcodes
		I_iaddr: in std_logic_vector(31 downto 0); -- instruction address, provided by PCU
		I_daddr: in std_logic_vector(31 downto 0); -- data address, provided by ALU
		I_data: in std_logic_vector(31 downto 0); -- data to be stored on write ops
		I_mem_imem: in std_logic := '0'; -- denotes if instruction memory is accessed (signal from control unit)
		O_data : out std_logic_vector(31 downto 0);
		O_busy: out std_logic := '0';
		O_clk: out std_logic := '0';
		O_reset: out std_logic := '0'
	);
end bus_ram_toplevel;


architecture Behavioral of bus_ram_toplevel is

	component bus_wb8
		Port(
			I_en: in std_logic;
			I_op: in std_logic_vector(2 downto 0); -- memory opcodes
			I_iaddr: in std_logic_vector(31 downto 0); -- instruction address, provided by PCU
			I_daddr: in std_logic_vector(31 downto 0); -- data address, provided by ALU
			I_data: in std_logic_vector(31 downto 0); -- data to be stored on write ops
			I_mem_imem: in std_logic := '0'; -- denotes if instruction memory is accessed (signal from control unit)
			O_data : out std_logic_vector(31 downto 0);
			O_busy: out std_logic := '0';

			-- wired to outside world, RAM, devices etc.
			-- naming of signals taken from Wishbone B4 spec
			CLK_I: in std_logic := '0';
			ACK_I: in std_logic := '0';
			DAT_I: in std_logic_vector(7 downto 0);
			RST_I: in std_logic := '0';
			ADR_O: out std_logic_vector(31 downto 0);
			DAT_O: out std_logic_vector(7 downto 0);
			CYC_O: out std_logic := '0';
			STB_O: out std_logic := '0';
			WE_O: out std_logic := '0'		
		);
	end component;
	
	component ram_wb8
		-- signal naming according to Wishbone B4 spec
		Port(
			CLK_I: in std_logic;
			STB_I: in std_logic;
			WE_I: in std_logic;
			ADR_I: in std_logic_vector(XLEN-1 downto 0);
			DAT_I: in std_logic_vector(7 downto 0);
			DAT_O: out std_logic_vector(7 downto 0);
			ACK_O: out std_logic
		);
	end component;
	
	signal ram_ACK_O, bus_CYC_O, bus_STB_O, bus_WE_O: std_logic;
	signal ram_DAT_O, bus_DAT_O: std_logic_vector(7 downto 0);
	signal bus_ADR_O: std_logic_vector(31 downto 0);

begin

	bus_uut: bus_wb8 port map(
		I_en => I_en,
		I_op => I_op,
		I_iaddr => I_iaddr,
		I_daddr => I_daddr,
		I_data => I_data,
		I_mem_imem => I_mem_imem,
		O_data => O_data,
		O_busy => O_busy,

		CLK_I => I_clk,
		ACK_I => ram_ACK_O,
		DAT_I => ram_DAT_O,
		RST_I => I_reset,
		ADR_O => bus_ADR_O,
		DAT_O => bus_DAT_O,
		CYC_O => bus_CYC_O,
		STB_O => bus_STB_O,
		WE_O => bus_WE_O
	);
	
	ram_uut: ram_wb8 port map(
		CLK_I => I_clk,
		STB_I => bus_STB_O,
		WE_I => bus_WE_O,
		ADR_I => bus_ADR_O,
		DAT_I => bus_DAT_O,
		DAT_O => ram_DAT_O,
		ACK_O => ram_ACK_O
	);

end architecture;