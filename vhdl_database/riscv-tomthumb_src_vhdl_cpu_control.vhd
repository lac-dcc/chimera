library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.constants.all;

entity control is
	Port(
		I_clk: in std_logic;
		I_en: in std_logic;
		I_reset: in std_logic;
		I_busy: in boolean;
		I_interrupt: in std_logic; -- from outside world
		I_opcode: in std_logic_vector(4 downto 0);
		I_funct3: in std_logic_vector(2 downto 0);
		I_funct7: in std_logic_vector(6 downto 0);
		I_lt: in boolean := false;
		I_ltu: in boolean := false;
		I_eq: in boolean := false;
		-- enable signals for components
		O_aluen: out std_logic;
		O_busen: out std_logic;
		O_decen: out std_logic;
		O_pcuen: out std_logic;
		O_regen: out std_logic;
		-- op selection for devices
		O_aluop: out aluops_t;
		O_busop: out busops_t;
		O_pcuop: out pcuops_t;
		O_regop: out regops_t;
		-- muxer selection signals
		O_mux_alu_dat1_sel: out integer range 0 to MUX_ALU_DAT1_PORTS-1;
		O_mux_alu_dat2_sel: out integer range 0 to MUX_ALU_DAT2_PORTS-1;
		O_mux_bus_addr_sel: out integer range 0 to MUX_BUS_ADDR_PORTS-1;
		O_mux_reg_data_sel: out integer range 0 to MUX_REG_DATA_PORTS-1
	);
end control;

architecture Behavioral of control is
	type states_t is (RESET, FETCH, DECODE, REGREAD, CUSTOM0, JAL, JAL2, JALR, JALR2, LUI, AUIPC, OP, OPIMM, STORE, STORE2, LOAD, LOAD2, BRANCH, BRANCH2, TRAP, TRAP2, REGWRITEBUS, REGWRITEALU, PCNEXT, PCREGIMM, PCIMM, PCUPDATE_FETCH);
begin


	
	process(I_clk, I_en, I_reset, I_busy, I_interrupt, I_opcode, I_funct3, I_funct7, I_lt, I_ltu, I_eq)
		variable nextstate,state: states_t := RESET;
		variable interrupt_enabled, in_interrupt, in_trap: boolean := false;
	begin
	
		-- run on falling edge to ensure that all control signals arrive in time
		-- for the controlled units, which run on the rising edge
		if falling_edge(I_clk) and I_en = '1' then
		
			O_aluen <= '0';
			O_busen <= '0';
			O_decen <= '0';
			O_pcuen <= '0';
			O_regen <= '0';

		
			O_aluop <= ALU_ADD;
			O_busop <= BUS_READB;
			O_pcuop <= PCU_SETPC;
			O_regop <= REGOP_READ;
			
			
			O_mux_alu_dat1_sel <= MUX_ALU_DAT1_PORT_S1;
			O_mux_alu_dat2_sel <= MUX_ALU_DAT2_PORT_S2;
			O_mux_bus_addr_sel <= MUX_BUS_ADDR_PORT_ALU; -- address by default from ALU
			O_mux_reg_data_sel <= MUX_REG_DATA_PORT_ALU; -- data by default from ALU
			
			-- only forward state machine if every component is finished
			if not I_busy then
				state := nextstate;
			end if;
			
		
			case state is
				when RESET =>
					nextstate := FETCH;
				
				when FETCH =>
					-- fetch next instruction, use the address the program counter unit (PCU) emits
					O_busen <= '1';
					O_busop <= BUS_READW;
					O_mux_bus_addr_sel <= MUX_BUS_ADDR_PORT_PC;
					nextstate := DECODE;
			
				when DECODE =>
					-- why check for interrupt here? It turns out that changing PC during bus cycles is a *bad*
					-- idea. In this state we're sure no bus cycles are in progress.
					if I_interrupt = '1' and interrupt_enabled and not in_interrupt and not in_trap then
						O_pcuen <= '1';
						O_pcuop <= PCU_ENTERINT;
						in_interrupt := true;
						nextstate := FETCH;
					else
						O_decen <= '1';
						nextstate := REGREAD;
					end if;

				when REGREAD =>
					O_regen <= '1';
					O_regop <= REGOP_READ;
					case I_opcode is
						when OP_OP => 			nextstate := OP;
						when OP_OPIMM => 		nextstate := OPIMM;
						when OP_LOAD =>		nextstate := LOAD;
						when OP_STORE =>		nextstate := STORE;
						when OP_JAL =>			nextstate := JAL;
						when OP_JALR => 		nextstate := JALR;
						when OP_BRANCH =>		nextstate := BRANCH;
						when OP_LUI =>			nextstate := LUI;
						when OP_AUIPC =>		nextstate := AUIPC;
						when OP_CUSTOM0 => 	nextstate := CUSTOM0;
						when OP_MISCMEM =>	nextstate := PCNEXT; -- NOP, fetch next instruction
						when others => 		nextstate := TRAP;	-- trap OP_SYSTEM or unknown opcodes
					end case;
				
				when OP =>
					O_aluen <= '1';
					O_mux_alu_dat1_sel <= MUX_ALU_DAT1_PORT_S1;
					O_mux_alu_dat2_sel <= MUX_ALU_DAT2_PORT_S2;
					case I_funct3 is
						when FUNC_ADD_SUB =>
							if I_funct7(5) = '0' then
								O_aluop <= ALU_ADD;
							else
								O_aluop <= ALU_SUB;
							end if;
						when FUNC_SLL => 			O_aluop <= ALU_SLL;
						when FUNC_SLT => 			O_aluop <= ALU_SLT;
						when FUNC_SLTU => 		O_aluop <= ALU_SLTU;
						when FUNC_XOR	=> 		O_aluop <= ALU_XOR;
						when FUNC_SRL_SRA =>
							if I_funct7(5) = '0' then
								O_aluop <= ALU_SRL;
							else
								O_aluop <= ALU_SRA;
							end if;
						when FUNC_OR => 			O_aluop <= ALU_OR;
						when FUNC_AND => 			O_aluop <= ALU_AND;
						when others => null;
					end case;
					nextstate := REGWRITEALU;
				
				when OPIMM =>
					O_aluen <= '1';
					O_mux_alu_dat1_sel <= MUX_ALU_DAT1_PORT_S1;
					O_mux_alu_dat2_sel <= MUX_ALU_DAT2_PORT_IMM;
					case I_funct3 is
						when FUNC_ADDI =>			O_aluop <= ALU_ADD;
						when FUNC_SLLI =>			O_aluop <= ALU_SLL;
						when FUNC_SLTI =>			O_aluop <= ALU_SLT;
						when FUNC_SLTIU =>		O_aluop <= ALU_SLTU;
						when FUNC_XORI =>			O_aluop <= ALU_XOR;
						when FUNC_SRLI_SRAI =>
							if I_funct7(5) = '0' then
								O_aluop <= ALU_SRL;
							else
								O_aluop <= ALU_SRA;
							end if;
						when FUNC_ORI =>			O_aluop <= ALU_OR;
						when FUNC_ANDI =>			O_aluop <= ALU_AND;
						when others => null;
					end case;
					nextstate := REGWRITEALU;
				
				when LOAD =>
					-- compute load address on ALU
					O_aluen <= '1';
					O_aluop <= ALU_ADD;
					O_mux_alu_dat1_sel <= MUX_ALU_DAT1_PORT_S1;
					O_mux_alu_dat2_sel <= MUX_ALU_DAT2_PORT_IMM;
					nextstate := LOAD2;
				
				when LOAD2 =>
					O_busen <= '1';
					O_mux_bus_addr_sel <= MUX_BUS_ADDR_PORT_ALU;
					case I_funct3 is
						when FUNC_LB =>		O_busop <= BUS_READB;
						when FUNC_LH =>		O_busop <= BUS_READH;
						when FUNC_LW =>		O_busop <= BUS_READW;
						when FUNC_LBU =>		O_busop <= BUS_READBU;
						when FUNC_LHU =>		O_busop <= BUS_READHU;
						when others => null;
					end case;
					nextstate := REGWRITEBUS;
					
				
				when STORE =>
					-- compute store address on ALU
					O_aluen <= '1';
					O_aluop <= ALU_ADD;
					O_mux_alu_dat1_sel <= MUX_ALU_DAT1_PORT_S1;
					O_mux_alu_dat2_sel <= MUX_ALU_DAT2_PORT_IMM;
					nextstate := STORE2;
				
				when STORE2 =>
					O_busen <= '1';
					O_mux_bus_addr_sel <= MUX_BUS_ADDR_PORT_ALU;
					case I_funct3 is
						when FUNC_SB =>		O_busop <= BUS_WRITEB;
						when FUNC_SH =>		O_busop <= BUS_WRITEH;
						when FUNC_SW =>		O_busop <= BUS_WRITEW;
						when others => null;
					end case;
					nextstate := PCNEXT;
				
				when JAL =>
					-- compute return address on ALU
					O_aluen <= '1';
					O_aluop <= ALU_ADD;
					O_mux_alu_dat1_sel <= MUX_ALU_DAT1_PORT_PC;
					O_mux_alu_dat2_sel <= MUX_ALU_DAT2_PORT_INSTLEN;
					nextstate := JAL2;
				
				when JAL2 =>
					-- write computed return address to register file
					O_regen <= '1';
					O_regop <= REGOP_WRITE;
					O_mux_reg_data_sel <= MUX_REG_DATA_PORT_ALU;
					nextstate := PCIMM;
				
				when JALR =>
					-- compute return address on ALU
					O_aluen <= '1';
					O_aluop <= ALU_ADD;
					O_mux_alu_dat1_sel <= MUX_ALU_DAT1_PORT_PC;
					O_mux_alu_dat2_sel <= MUX_ALU_DAT2_PORT_INSTLEN;
					nextstate := JALR2;
				
				when JALR2 =>
					-- write computed return address to register file
					O_regen <= '1';
					O_regop <= REGOP_WRITE;
					O_mux_reg_data_sel <= MUX_REG_DATA_PORT_ALU;
					nextstate := PCREGIMM;
				
				when BRANCH =>
					-- use ALU to compute flags
					O_aluen <= '1';
					O_aluop <= ALU_ADD; -- doesn't really matter for flag computation
					O_mux_alu_dat1_sel <= MUX_ALU_DAT1_PORT_S1;
					O_mux_alu_dat2_sel <= MUX_ALU_DAT2_PORT_S2;
					nextstate := BRANCH2;
					
				when BRANCH2 =>
					-- make branch decision by looking at flags
					nextstate := PCNEXT; -- by default, don't branch
					case I_funct3 is
						when FUNC_BEQ =>
							if I_eq then
								nextstate := PCIMM;
							end if;
						
						when FUNC_BNE =>
							if not I_eq then
								nextstate := PCIMM;
							end if;
							
						when FUNC_BLT =>
							if I_lt then
								nextstate := PCIMM;
							end if;
						
						when FUNC_BGE =>
							if not I_lt then
								nextstate := PCIMM;
							end if;

						when FUNC_BLTU =>
							if I_ltu then
								nextstate := PCIMM;
							end if;
						
						when FUNC_BGEU =>
							if not I_ltu then
								nextstate := PCIMM;
							end if;
						
						when others => null;
					end case;
				
				when LUI =>
					O_regen <= '1';
					O_regop <= REGOP_WRITE;
					O_mux_reg_data_sel <= MUX_REG_DATA_PORT_IMM;
					nextstate := PCNEXT;
				
				when AUIPC =>
					-- compute PC + IMM on ALU
					O_aluen <= '1';
					O_aluop <= ALU_ADD;
					O_mux_alu_dat1_sel <= MUX_ALU_DAT1_PORT_PC;
					O_mux_alu_dat2_sel <= MUX_ALU_DAT2_PORT_IMM;
					nextstate := REGWRITEALU;
					
				
				when CUSTOM0 =>
					
					case I_funct7 is
						when "0000000" =>		-- return from interrupt
							O_pcuen <= '1';
							O_pcuop <= PCU_RETINT;
							in_interrupt := false;
							nextstate := FETCH;
						when "0000001" =>		-- enable interrupts
							interrupt_enabled := true;
							nextstate := PCNEXT;
						when "0000010" =>		-- disable interrupts
							interrupt_enabled := false;
							nextstate := PCNEXT;
						when "0001000" =>		-- return from trap
							O_pcuen <= '1';
							O_pcuop <= PCU_RETTRAP;
							in_trap := false;
							nextstate := FETCH;
						when "0001001" =>		-- get trap return address
							O_regen <= '1';
							O_regop <= REGOP_WRITE;
							O_mux_reg_data_sel <= MUX_REG_DATA_PORT_TRAPRET;
							nextstate := PCNEXT;
						when others => null;
					
					end case;
					
					
				when TRAP =>
					-- compute trap return address
					O_aluen <= '1';
					O_aluop <= ALU_ADD;
					O_mux_alu_dat1_sel <= MUX_ALU_DAT1_PORT_PC;
					O_mux_alu_dat2_sel <= MUX_ALU_DAT2_PORT_INSTLEN;
					in_trap := true;
					nextstate := TRAP2;
					
				when TRAP2 =>
					-- save trap return address and emit trap vector
					O_pcuen <= '1';
					O_pcuop <= PCU_ENTERTRAP;
					nextstate := FETCH;
				
			
				when REGWRITEBUS =>
					O_regen <= '1';
					O_regop <= REGOP_WRITE;
					O_mux_reg_data_sel <= MUX_REG_DATA_PORT_BUS;
					nextstate := PCNEXT;
				
				when REGWRITEALU =>
					O_regen <= '1';
					O_regop <= REGOP_WRITE;
					O_mux_reg_data_sel <= MUX_REG_DATA_PORT_ALU;
					nextstate := PCNEXT;
				
				when PCNEXT =>
					-- compute new value for PC: PC + INST_LEN
					O_aluen <= '1';
					O_aluop <= ALU_ADD;
					O_mux_alu_dat1_sel <= MUX_ALU_DAT1_PORT_PC;
					O_mux_alu_dat2_sel <= MUX_ALU_DAT2_PORT_INSTLEN;
					nextstate := PCUPDATE_FETCH;
				
				when PCREGIMM =>
					-- compute new value for PC: S1 + IMM;
					O_aluen <= '1';
					O_aluop <= ALU_ADD;
					O_mux_alu_dat1_sel <= MUX_ALU_DAT1_PORT_S1;
					O_mux_alu_dat2_sel <= MUX_ALU_DAT2_PORT_IMM;
					nextstate := PCUPDATE_FETCH;
				
				when PCIMM =>
					-- compute new value for PC: PC + IMM;
					O_aluen <= '1';
					O_aluop <= ALU_ADD;
					O_mux_alu_dat1_sel <= MUX_ALU_DAT1_PORT_PC;
					O_mux_alu_dat2_sel <= MUX_ALU_DAT2_PORT_IMM;
					nextstate := PCUPDATE_FETCH;
				
				when PCUPDATE_FETCH =>
					-- load new PC value into program counter unit
					O_pcuen <= '1';
					O_pcuop <= PCU_SETPC;
					
					-- given that right now the ALU outputs the address for the next
					-- instruction, we can also start instruction fetch
					O_busen <= '1';
					O_busop <= BUS_READW;
					O_mux_bus_addr_sel <= MUX_BUS_ADDR_PORT_ALU;
					nextstate := DECODE;
					
			end case;
		
		
			if I_reset = '1' then
				state := RESET;
				nextstate := RESET;
				interrupt_enabled := false;
				in_interrupt := false;
				in_trap := false;
			end if;
		
		end if;
	end process;

	
end Behavioral;