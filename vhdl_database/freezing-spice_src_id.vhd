library ieee;
use ieee.std_logic_1164.all;

use work.common.all;
use work.id_pkg.all;
use work.csr_pkg.all;

entity instruction_decoder is
    port (d : in  word;
          q : out decoded_t);           -- decoded data
end entity instruction_decoder;

architecture behavioral of instruction_decoder is
    -------------------------------------------------
    -- Types
    -------------------------------------------------
    
    type imm_type_t is (IMM_NONE, IMM_I, IMM_S, IMM_B, IMM_U, IMM_J, IMM_Z);

    -------------------------------------------------
    -- Signals
    -------------------------------------------------

    signal decoded : decoded_t := c_decoded_reset;
begin  -- architecture behavioral

    -------------------------------------------------
    -- Assign module outputs
    -------------------------------------------------
    q <= decoded;

    -------------------------------------------------
    -- Decode the RISCV instruction
    -------------------------------------------------
    decode_proc : process (d) is
        variable opcode   : std_logic_vector(6 downto 0);
        variable funct3   : std_logic_vector(2 downto 0);
        variable imm_type : imm_type_t := IMM_NONE;
        variable insn     : word;
        variable rd       : std_logic_vector(4 downto 0);
    begin  -- process decode_proc
        insn := d;
        rd   := insn(11 downto 7);

        -- defaults & "global" fields
        opcode              := insn(6 downto 0);
        funct3              := insn(14 downto 12);
        decoded.rs1         <= insn(19 downto 15);
        decoded.rs2         <= insn(24 downto 20);
        decoded.rd          <= rd;
        decoded.opcode      <= opcode;
        decoded.rs1_rd      <= '0';
        decoded.rs2_rd      <= '0';
        decoded.alu_func    <= ALU_NONE;
        decoded.op2_src     <= '0';
        decoded.insn_type   <= OP_ILLEGAL;
        decoded.load_type   <= LOAD_NONE;
        decoded.store_type  <= STORE_NONE;
        decoded.imm         <= (others => 'X');
        decoded.use_imm     <= '0';
        decoded.branch_type <= BRANCH_NONE;
        decoded.rf_we       <= '0';
        decoded.is_csr      <= '0';
        decoded.csr_addr    <= (others => 'X');

        case (opcode) is
            -- Load Upper Immediate
            when c_op_lui =>
                decoded.insn_type <= OP_LUI;
                imm_type          := IMM_U;
                if (rd /= "00000") then
                    decoded.rf_we <= '1';
                end if;

            -- Add Upper Immediate to PC
            when c_op_auipc =>
                decoded.insn_type <= OP_AUIPC;
                imm_type          := IMM_U;
                decoded.alu_func  <= ALU_ADD;
                if (rd /= "00000") then
                    decoded.rf_we <= '1';
                end if;

            -- Jump And Link
            when c_op_jal =>
                decoded.insn_type <= OP_JAL;
                decoded.alu_func  <= ALU_ADD;
                imm_type          := IMM_J;
                if (rd /= "00000") then
                    decoded.rf_we <= '1';
                end if;

            -- Jump And Link Register
            when c_op_jalr =>
                decoded.insn_type <= OP_JALR;
                decoded.alu_func  <= ALU_ADD;
                imm_type          := IMM_I;
                decoded.rs1_rd    <= '1';
                if (rd /= "00000") then
                    decoded.rf_we <= '1';
                end if;

            -- Branch to target address, if condition is met
            when c_op_branch =>
                decoded.insn_type <= OP_BRANCH;
                decoded.alu_func  <= ALU_ADD;
                imm_type          := IMM_B;
                decoded.rs1_rd    <= '1';
                decoded.rs2_rd    <= '1';

                case (funct3) is
                    when "000"  => decoded.branch_type <= BEQ;
                    when "001"  => decoded.branch_type <= BNE;
                    when "100"  => decoded.branch_type <= BLT;
                    when "101"  => decoded.branch_type <= BGE;
                    when "110"  => decoded.branch_type <= BLTU;
                    when "111"  => decoded.branch_type <= BGEU;
                    when others => null;
                end case;

            -- load data from memory
            when c_op_load =>
                decoded.insn_type <= OP_LOAD;
                imm_type          := IMM_I;
                decoded.rs1_rd    <= '1';
                decoded.alu_func  <= ALU_ADD;
                if (rd /= "00000") then
                    decoded.rf_we <= '1';
                end if;

                case (funct3) is
                    when "000"  => decoded.load_type <= LB;
                    when "001"  => decoded.load_type <= LH;
                    when "010"  => decoded.load_type <= LW;
                    when "100"  => decoded.load_type <= LBU;
                    when "101"  => decoded.load_type <= LHU;
                    when others => null;
                end case;

            -- store data to memory
            when c_op_store =>
                decoded.insn_type <= OP_STORE;
                imm_type          := IMM_S;
                decoded.alu_func  <= ALU_ADD;
                decoded.rs1_rd    <= '1';
                decoded.rs2_rd    <= '1';

                case (funct3) is
                    when "000"  => decoded.store_type <= SB;
                    when "001"  => decoded.store_type <= SH;
                    when "010"  => decoded.store_type <= SW;
                    when others => null;
                end case;

            -- perform computation with immediate value and a register
            when c_op_imm =>
                decoded.insn_type <= OP_ALU;
                decoded.op2_src   <= '1';
                imm_type          := IMM_I;
                decoded.rs1_rd    <= '1';
                decoded.use_imm   <= '1';
                if (rd /= "00000") then
                    decoded.rf_we <= '1';
                end if;

                case (funct3) is
                    when "000" => decoded.alu_func <= ALU_ADD;
                    when "001" => decoded.alu_func <= ALU_SLL;
                    when "010" => decoded.alu_func <= ALU_SLT;
                    when "011" => decoded.alu_func <= ALU_SLTU;
                    when "100" => decoded.alu_func <= ALU_XOR;
                    when "110" => decoded.alu_func <= ALU_OR;
                    when "111" => decoded.alu_func <= ALU_AND;
                    when "101" =>
                        if (insn(30) = '1') then
                            decoded.alu_func <= ALU_SRA;
                        else
                            decoded.alu_func <= ALU_SRL;
                        end if;

                    when others => null;
                end case;

            -- perform computation with two register values
            when c_op_reg =>
                decoded.insn_type <= OP_ALU;
                decoded.rs1_rd    <= '1';
                decoded.rs2_rd    <= '1';
                if (rd /= "00000") then
                    decoded.rf_we <= '1';
                end if;

                case (funct3) is
                    when "000" =>
                        if (insn(30) = '1') then
                            decoded.alu_func <= ALU_SUB;
                        else
                            decoded.alu_func <= ALU_ADD;
                        end if;
                    when "001" => decoded.alu_func <= ALU_SLL;
                    when "010" => decoded.alu_func <= ALU_SLT;
                    when "011" => decoded.alu_func <= ALU_SLTU;
                    when "100" => decoded.alu_func <= ALU_XOR;
                    when "101" =>
                        if (insn(30) = '1') then
                            decoded.alu_func <= ALU_SRA;
                        else
                            decoded.alu_func <= ALU_SRL;
                        end if;
                    when "110"  => decoded.alu_func <= ALU_OR;
                    when "111"  => decoded.alu_func <= ALU_AND;
                    when others => null;
                end case;

            -- system functions
            when c_op_system =>
                decoded.insn_type <= OP_SYSTEM;
                decoded.csr_addr  <= insn(31 downto 20);

                case (funct3) is
                    when "000" =>
                        if insn(20) = '0' then
                            decoded.system_type <= SYSTEM_ECALL;
                        else
                            decoded.system_type <= SYSTEM_EBREAK;
                        end if;
                    when "001" =>
                        decoded.system_type <= SYSTEM_CSRRW;
                        decoded.rf_we       <= '1';
                        decoded.rs1_rd      <= '1';
                    when "010" =>
                        decoded.system_type <= SYSTEM_CSRRS;
                        decoded.rf_we       <= '1';
                        decoded.rs1_rd      <= '1';
                    when "011" =>
                        decoded.system_type <= SYSTEM_CSRRC;
                        decoded.rf_we       <= '1';
                        decoded.rs1_rd      <= '1';
                    when "101" =>
                        decoded.system_type <= SYSTEM_CSRRWI;
                        decoded.rf_we       <= '1';
                        decoded.use_imm     <= '1';
                    when "110" =>
                        decoded.system_type <= SYSTEM_CSRRSI;
                        decoded.rf_we       <= '1';
                        decoded.use_imm     <= '1';
                    when "111" =>
                        decoded.system_type <= SYSTEM_CSRRC;
                        decoded.rf_we       <= '1';
                        decoded.use_imm     <= '1';
                    when others =>
                        decoded.insn_type <= OP_ILLEGAL;
                end case;

            when others =>
                decoded.insn_type <= OP_ILLEGAL;
        end case;

        -- @TODO other insnructions
        --when c_op_misc_mem =>
        --    insn_type <= OP_FENCE;

        -- decode and sign-extend the immediate value
        case imm_type is
            when IMM_I =>
                for i in 31 downto 12 loop
                    decoded.imm(i) <= insn(31);
                end loop;
                decoded.imm(11 downto 5) <= insn(31 downto 25);
                decoded.imm(4 downto 1)  <= insn(24 downto 21);
                decoded.imm(0)           <= insn(20);

            when IMM_S =>
                for i in 31 downto 11 loop
                    decoded.imm(i) <= insn(31);
                end loop;  -- i
                decoded.imm(10 downto 5) <= insn(30 downto 25);
                decoded.imm(4 downto 1)  <= insn(11 downto 8);
                decoded.imm(0)           <= insn(7);

            when IMM_B =>
                for i in 31 downto 13 loop
                    decoded.imm(i) <= insn(31);
                end loop;  -- i
                decoded.imm(12)          <= insn(31);
                decoded.imm(11)          <= insn(7);
                decoded.imm(10 downto 5) <= insn(30 downto 25);
                decoded.imm(4 downto 1)  <= insn(11 downto 8);
                decoded.imm(0)           <= '0';

            when IMM_U =>
                decoded.imm(31)           <= insn(31);
                decoded.imm(30 downto 20) <= insn(30 downto 20);
                decoded.imm(19 downto 12) <= insn(19 downto 12);
                decoded.imm(11 downto 0)  <= (others => '0');

            when IMM_J =>
                for i in 31 downto 20 loop
                    decoded.imm(i) <= insn(31);
                end loop;  -- i
                decoded.imm(19 downto 12) <= insn(19 downto 12);
                decoded.imm(11)           <= insn(20);
                decoded.imm(10 downto 5)  <= insn(30 downto 25);
                decoded.imm(4 downto 1)   <= insn(24 downto 21);
                decoded.imm(0)            <= '0';

            when IMM_Z =>
                for i in 31 downto 5 loop
                    decoded.imm(i) <= insn(4);
                end loop;  -- i
                decoded.imm(4 downto 0) <= insn(4 downto 0);
                
            when others => decoded.imm <= (others => 'X');
        end case;
        
    end process decode_proc;

end architecture behavioral;
