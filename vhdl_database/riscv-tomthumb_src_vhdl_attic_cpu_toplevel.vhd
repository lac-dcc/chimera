library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.constants.all;

entity cpu_toplevel is
	Port(
		I_clk: in std_logic;
		I_en: in std_logic;
		I_reset: in std_logic;

		I_memdata: in std_logic_vector(XLEN-1 downto 0);
		I_membusy: in std_logic;
		O_memdata: out std_logic_vector(XLEN-1 downto 0);
		O_memaddr: out std_logic_vector(XLEN-1 downto 0);
		O_memen: out std_logic := '0';
		O_memwrite: out std_logic := '0'
	);
end cpu_toplevel;


architecture Behavioral of cpu_toplevel is

	component alu
		Port(
			I_clk: in std_logic;
			I_en: in std_logic;
			I_fop: in std_logic_vector(7 downto 0);
			I_imm: in std_logic_vector(XLEN-1 downto 0);
			I_dataS1: in std_logic_vector(XLEN-1 downto 0);
			I_dataS2: in std_logic_vector(XLEN-1 downto 0);
			I_reset: in std_logic := '0';
			O_alumemop: out std_logic_vector(2 downto 0);
			O_busy: out std_logic;
			O_data: out std_logic_vector(XLEN-1 downto 0);
			O_PC: out std_logic_vector(XLEN-1 downto 0)
		);
	end component;

	component control
		Port(
			I_clk: in std_logic;
			I_en: in std_logic;
			I_reset: in std_logic;
			I_memop: in std_logic;
			I_regwrite: in std_logic;
			I_alubusy: in std_logic;
			I_membusy: in std_logic;
			I_alumemop: in std_logic_vector(2 downto 0); -- from ALU
			-- enable signals for components
			O_decen: out std_logic;
			O_aluen: out std_logic;
			O_memen: out std_logic;
			O_regen: out std_logic;
			-- op selection for devices
			O_regop: out std_logic_vector(1 downto 0);
			O_memop: out std_logic_vector(2 downto 0);
			O_mem_imem: out std_logic -- 1: operation on instruction memory, 0: on data memory
		);	
	end component;
	
	component decoder
		Port(
			I_clk: in std_logic;
			I_en: in std_logic;
			I_instr: in std_logic_vector(31 downto 0);
			O_rs1: out std_logic_vector(4 downto 0);
			O_rs2: out std_logic_vector(4 downto 0);
			O_rd: out std_logic_vector(4 downto 0);
			O_imm: out std_logic_vector(31 downto 0);
			O_fop: out std_logic_vector(7 downto 0);
			O_regwrite : out std_logic;
			O_memop: out std_logic
		);	
	end component;
	
	component mem
		Port(
			-- wired to CPU core
			I_clk: in std_logic;
			I_en: in std_logic;
			I_op: in std_logic_vector(2 downto 0); -- memory opcodes
			I_iaddr: in std_logic_vector(31 downto 0); -- instruction address, provided by PCU
			I_daddr: in std_logic_vector(31 downto 0); -- data address, provided by ALU
			I_data: in std_logic_vector(31 downto 0); -- data to be stored on write ops
			I_mem_imem: in std_logic := '0'; -- denotes if instruction memory is accessed (signal from control unit)
			O_data : out std_logic_vector(31 downto 0);
			O_busy: out std_logic;

			-- wired to outside world, RAM, devices etc.
			O_memen: out std_logic := '0';
			O_memaddr: out std_logic_vector(31 downto 0);
			O_memdata: out std_logic_vector(31 downto 0);
			I_memdata: in std_logic_vector(31 downto 0);
			O_memwrite: out std_logic := '0';
			I_membusy: in std_logic := '0'
		);	
	end component;
	
	
	component registers
		Port(
			I_clk: in std_logic;
			I_en: in std_logic;
			I_op: in std_logic_vector(1 downto 0);
			I_selS1: in std_logic_vector(4 downto 0);
			I_selS2: in std_logic_vector(4 downto 0);
			I_selD: in std_logic_vector(4 downto 0);
			I_dataAlu: in std_logic_vector(XLEN-1 downto 0);
			I_dataMem: in std_logic_vector(XLEN-1 downto 0);
			O_dataS1: out std_logic_vector(XLEN-1 downto 0);
			O_dataS2: out std_logic_vector(XLEN-1 downto 0)
		);
	end component;
	
	
	signal alu_out: std_logic_vector(XLEN-1 downto 0);
	signal alu_memop: std_logic_vector(2 downto 0) := MEMOP_READW;
	signal alu_busy: std_logic := '0';
	signal alu_pc: std_logic_vector(XLEN-1 downto 0);
	
	
	signal ctrl_pcuen: std_logic := '0';
	signal ctrl_decen: std_logic := '0';
	signal ctrl_aluen: std_logic := '0';
	signal ctrl_memen: std_logic := '0';
	signal ctrl_regen: std_logic := '0';
	signal ctrl_regop: std_logic_vector(1 downto 0) := REGOP_READ;
	signal ctrl_pcuop: std_logic := '0';
	signal ctrl_memop: std_logic_vector(2 downto 0) := MEMOP_READW;
	signal ctrl_mem_imem: std_logic := '0';
	signal ctrl_reset: std_logic := '0';

	signal dec_fop: std_logic_vector(7 downto 0);	
	signal dec_memop: std_logic := '0';
	signal dec_rs1: std_logic_vector(4 downto 0);
	signal dec_rs2: std_logic_vector(4 downto 0);
	signal dec_rd: std_logic_vector(4 downto 0);
	signal dec_regwrite: std_logic := '0';
	signal dec_imm: std_logic_vector(XLEN-1 downto 0);
	
	signal inv_clk: std_logic;
	
	signal mem_busy: std_logic := '0';
	signal mem_data: std_logic_vector(XLEN-1 downto 0);

	signal reg_dataS1: std_logic_vector(XLEN-1 downto 0);	
	signal reg_dataS2: std_logic_vector(XLEN-1 downto 0);

begin
	
	-- inverted clock for control unit to ensure that all control
	-- signals arive in time for the controlled units. Effectively
	-- makes control unit work on falling edge, all other units on
	-- rising edge
	inv_clk <= not I_clk;

	alu_instance: alu port map(
		I_clk => I_clk,
		I_en => ctrl_aluen,
		I_fop => dec_fop,
		I_imm => dec_imm,
		I_reset => I_reset,
		I_dataS1 => reg_dataS1,
		I_dataS2 => reg_dataS2,
		O_alumemop => alu_memop,
		O_busy => alu_busy,
		O_data => alu_out,
		O_PC => alu_pc
	);

	ctrl_instance: control port map(
		I_clk => inv_clk,	-- control runs on inverted clock!
		I_en => I_en,
		I_reset => I_reset,
		I_memop => dec_memop,
		I_regwrite => dec_regwrite,
		I_alubusy => alu_busy,
		I_membusy => mem_busy,
		I_alumemop => alu_memop,
		O_decen => ctrl_decen,
		O_aluen => ctrl_aluen,
		O_memen => ctrl_memen,
		O_regen => ctrl_regen,
		O_regop => ctrl_regop,
		O_memop => ctrl_memop,
		O_mem_imem => ctrl_mem_imem
	);
	
	dec_instance: decoder port map(
		I_clk => I_clk,
		I_en => ctrl_decen,
		I_instr => mem_data,
		O_rs1 => dec_rs1,
		O_rs2 => dec_rs2,
		O_rd => dec_rd,
		O_imm => dec_imm,
		O_fop => dec_fop,
		O_regwrite => dec_regwrite,
		O_memop => dec_memop
	);
	
	mem_instance: mem port map(
		I_clk => I_clk,
		I_en => ctrl_memen,
		I_op => ctrl_memop,
		I_iaddr => alu_pc,
		I_daddr => alu_out,
		I_data => reg_dataS2,
		I_mem_imem => ctrl_mem_imem,
		O_data => mem_data,
		O_busy => mem_busy,
		-- wired to outside world, RAM, devices etc.
		O_memen => O_memen,
		O_memaddr => O_memaddr,
		O_memdata => O_memdata,
		I_memdata => I_memdata,
		O_memwrite => O_memwrite,
		I_membusy => I_membusy
	);
	
	
	reg_instance: registers port map(
		I_clk => I_clk,
		I_en => ctrl_regen,
		I_op => ctrl_regop,
		I_selS1 => dec_rs1,
		I_selS2 => dec_rs2,
		I_selD => dec_rd,
		I_dataAlu => alu_out,
		I_dataMem => mem_data,
		O_dataS1 => reg_dataS1,
		O_dataS2 => reg_dataS2
	);
	
	

	process(I_clk)
	begin
	end process;
end Behavioral;