-- ******************************************************************
-- ******************************************************************
-- ******************************************************************
-- This file is generated. Changing this file directly is probably
-- not what you want to do. Any changes will be overwritten next time
-- the generator is run.
-- ******************************************************************
-- ******************************************************************
-- ******************************************************************
architecture simple_logic of decode_table is
    signal imm_enum : immval_t;
    signal mac_busy : mac_busy_t;
    signal imms_12_1 : std_logic_vector(31 downto 0);
    signal imms_8_0 : std_logic_vector(31 downto 0);
    signal imms_8_1 : std_logic_vector(31 downto 0);
begin
    -- Immediate value mux
    with imm_enum select
        ex.imm_val <=
            x"fffffff0" when IMM_N16,
            x"fffffff8" when IMM_N8,
            x"fffffffe" when IMM_N2,
            x"ffffffff" when IMM_N1,
            x"00000000" when IMM_ZERO,
            x"00000001" when IMM_P1,
            x"00000002" when IMM_P2,
            x"00000004" when IMM_P4,
            x"00000008" when IMM_P8,
            x"00000010" when IMM_P16,
            imms_8_0 when IMM_S_8_0,
            imms_8_1 when IMM_S_8_1,
            imms_12_1 when IMM_S_12_1,
            x"0000000" & op.code(3 downto 0) when IMM_U_4_0,
            "000000000000000000000000000" & op.code(3 downto 0) & "0" when IMM_U_4_1,
            "00000000000000000000000000" & op.code(3 downto 0) & "00" when IMM_U_4_2,
            x"000000" & op.code(7 downto 0) when IMM_U_8_0,
            "00000000000000000000000" & op.code(7 downto 0) & "0" when IMM_U_8_1,
            "0000000000000000000000" & op.code(7 downto 0) & "00" when IMM_U_8_2;
    -- Sign extend parts of opcode
    process(op)
    begin
        -- Sign extend 8 right-most bits
        for i in 8 to 31 loop
            imms_8_0(i) <= op.code(7);
        end loop;
        imms_8_0(7 downto 0) <= op.code(7 downto 0);
        -- Sign extend 8 right-most bits shifted by 1
        for i in 9 to 31 loop
            imms_8_1(i) <= op.code(7);
        end loop;
        imms_8_1(8 downto 1) <= op.code(7 downto 0);
        imms_8_1(0) <= '0';
        -- Sign extend 12 right-most bits shifted by 1
        for i in 13 to 31 loop
            imms_12_1(i) <= op.code(11);
        end loop;
        imms_12_1(12 downto 1) <= op.code(11 downto 0);
        imms_12_1(0) <= '0';
    end process;
    -- Mac busy muxes
    with mac_busy select
        ex.mac_busy <=
            '0' when NOT_BUSY,
            not next_id_stall when EX_NOT_STALL,
            '0' when WB_NOT_STALL,
            '1' when EX_BUSY,
            '0' when WB_BUSY;
    with mac_busy select
        wb.mac_busy <=
            '0' when NOT_BUSY,
            '0' when EX_NOT_STALL,
            not next_id_stall when WB_NOT_STALL,
            '0' when EX_BUSY,
            '1' when WB_BUSY;
    process(t_bcc, op)
        variable cond : std_logic_vector(16 downto 0);
    begin
        cond := std_logic_vector(TO_UNSIGNED(instruction_plane_t'pos(op.plane), 1)) & op.code;
        -- zero outputs by default
        ilevel_cap <= '0';
        mac_stall_sense <= '0';
        dispatch <= '0';
        event_ack_0 <= '0';
        slp <= '0';
        mac_s_latch <= '0';
        ex_stall <= ('0', '0', '0', '0', SEL_ARITH, SEL_PREV, SEL_CLEAR, SEL_XBUS, SEL_ZBUS, '0', '0', '0', LOGIC, '0', NOP, SEL_XBUS, SEL_YBUS);
        debug <= '0';
        wb_stall <= ('0', '0', '0', '0', '0', SEL_XBUS, SEL_YBUS, NOP, DBUS);
        delay_jump <= '0';
        id <= ('0', '0', '0');
        maskint_next <= '0';
        ex.arith_func <= ADD;
        ex.aluinx_sel <= SEL_XBUS;
        ex.alumanip <= SWAP_BYTE;
        ex.aluiny_sel <= SEL_YBUS;
        ex.coproc_cmd <= NOP;
        ex.arith_ci_en <= '0';
        ex.xbus_sel <= SEL_IMM;
        wb.regnum_w <= "00000";
        ex.regnum_x <= "00000";
        ex.mem_size <= BYTE;
        ex.regnum_y <= "00000";
        ex.regnum_z <= "00000";
        ex.ma_wr <= '0';
        ex.logic_sr_func <= ZERO;
        ex.logic_func <= LOGIC_NOT;
        ex.ybus_sel <= SEL_IMM;
        ex.mem_lock <= '0';
        ex.arith_sr_func <= ZERO;
        imm_enum <= IMM_ZERO;
        mac_busy <= NOT_BUSY;
        -- set control signals for each opcode
        if std_match(cond, "00000000000001000") then
            -- CLRT [0008]
            -- 0 -> T
            case op.addr(3 downto 0) is
                when x"0" =>
                    ex_stall.sr_sel <= SEL_SET_T;
                    ex_stall.t_sel <= SEL_CLEAR;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00000000000101000") then
            -- CLRMAC [0028]
            -- 0 -> MACH, MACL
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = TEMP1
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10100";
                    -- Y = TEMP1
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "10100";
                    -- Z = X xor Y
                    ex_stall.zbus_sel <= SEL_LOGIC;
                    ex.logic_func <= LOGIC_XOR;
                    ex_stall.macsel1 <= SEL_ZBUS;
                    ex_stall.macsel2 <= SEL_ZBUS;
                    ex_stall.wrmacl <= '1';
                    ex_stall.wrmach <= '1';
                    mac_stall_sense <= '1';
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00000000000011001") then
            -- DIV0U [0019]
            -- 0 -> M/Q/T
            case op.addr(3 downto 0) is
                when x"0" =>
                    ex_stall.sr_sel <= SEL_DIV0U;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00000000000001001") then
            -- NOP [0009]
            -- no operation
            case op.addr(3 downto 0) is
                when x"0" =>
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00000000000101011") then
            -- RTE [002B]
            -- Delayed branch, stack -> PC/SR
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = R15
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "01111";
                    -- Z = X + 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_P4;
                    -- W = MEM[X] long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_XBUS;
                    ex.mem_size <= LONG;
                    -- R15 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "01111";
                    id.incpc <= '1';

                when x"1" =>
                    -- X = R15
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "01111";
                    -- Z = X + 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    wb_stall.wrsr_w <= '1';
                    imm_enum <= IMM_P4;
                    -- W = MEM[X] long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_XBUS;
                    ex.mem_size <= LONG;
                    -- R15 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "01111";

                when x"2" =>
                    ex_stall.zbus_sel <= SEL_WBUS;
                    -- PC = Z
                    ex_stall.wrpc_z <= '1';

                when x"3" =>
                    id.ifadsel <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';
                    delay_jump <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00000000000001011") then
            -- RTS [000B]
            -- Delayed branch, PR -> PC
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = PR
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "10010";
                    ex_stall.zbus_sel <= SEL_YBUS;
                    -- PC = Z
                    ex_stall.wrpc_z <= '1';

                when x"1" =>
                    id.ifadsel <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';
                    delay_jump <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00000000000011000") then
            -- SETT [0018]
            -- 1 -> T
            case op.addr(3 downto 0) is
                when x"0" =>
                    ex_stall.sr_sel <= SEL_SET_T;
                    ex_stall.t_sel <= SEL_SET;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00000000000011011") then
            -- SLEEP [001B]
            -- Sleep
            case op.addr(3 downto 0) is
                when x"0" =>

                when x"1" =>
                    slp <= '1';

                when x"2" =>

                when x"3" =>
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00000000000111011") then
            -- BGND [003B]
            -- Sleep
            case op.addr(3 downto 0) is
                when x"0" =>
                    id.incpc <= '1';
                    dispatch <= '1';
                    debug <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00010101") then
            -- CMP/PL Rn [4n15]
            -- Rn > 0, 1 -> T
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = 0
                    ex.ybus_sel <= SEL_IMM;
                    ex.arith_sr_func <= SGRTER;
                    ex.arith_func <= SUB;
                    ex_stall.sr_sel <= SEL_ARITH;
                    imm_enum <= IMM_ZERO;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00010001") then
            -- CMP/PZ Rn [4n11]
            -- Rn >= 0, 1->T
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = 0
                    ex.ybus_sel <= SEL_IMM;
                    ex.arith_sr_func <= SGRTER_EQ;
                    ex.arith_func <= SUB;
                    ex_stall.sr_sel <= SEL_ARITH;
                    imm_enum <= IMM_ZERO;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00010000") then
            -- DT Rn [4n10]
            -- Rn-1 ->Rn; If Rn is 0, 1 -> T, if Rn is nonzero, 0 -> T
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = 1
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X - Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_sr_func <= ZERO;
                    ex.arith_func <= SUB;
                    ex_stall.sr_sel <= SEL_ARITH;
                    imm_enum <= IMM_P1;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00000----00101001") then
            -- MOVT Rn [0n29]
            -- T->Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = 1
                    ex.xbus_sel <= SEL_IMM;
                    -- Y = SR
                    ex.ybus_sel <= SEL_SR;
                    -- Z = X and Y
                    ex_stall.zbus_sel <= SEL_LOGIC;
                    ex.logic_func <= LOGIC_AND;
                    imm_enum <= IMM_P1;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00000100") then
            -- ROTL Rn [4n04]
            -- T<-Rn<-MSB
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = 1
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X shift rotate Y
                    ex_stall.zbus_sel <= SEL_SHIFT;
                    ex_stall.shiftfunc <= ROTATE;
                    ex_stall.sr_sel <= SEL_SET_T;
                    ex_stall.t_sel <= SEL_SHIFT;
                    imm_enum <= IMM_P1;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00000101") then
            -- ROTR Rn [4n05]
            -- LSB->Rn->T
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = -1
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X shift rotate Y
                    ex_stall.zbus_sel <= SEL_SHIFT;
                    ex_stall.shiftfunc <= ROTATE;
                    ex_stall.sr_sel <= SEL_SET_T;
                    ex_stall.t_sel <= SEL_SHIFT;
                    imm_enum <= IMM_N1;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00100100") then
            -- ROTCL Rn [4n24]
            -- T<-Rn<-T
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = 1
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X shift rotatec Y
                    ex_stall.zbus_sel <= SEL_SHIFT;
                    ex_stall.shiftfunc <= ROTC;
                    ex_stall.sr_sel <= SEL_SET_T;
                    ex_stall.t_sel <= SEL_SHIFT;
                    imm_enum <= IMM_P1;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00100101") then
            -- ROTCR Rn [4n25]
            -- T->Rn->T
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = -1
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X shift rotatec Y
                    ex_stall.zbus_sel <= SEL_SHIFT;
                    ex_stall.shiftfunc <= ROTC;
                    ex_stall.sr_sel <= SEL_SET_T;
                    ex_stall.t_sel <= SEL_SHIFT;
                    imm_enum <= IMM_N1;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00100000") then
            -- SHAL Rn [4n20]
            -- T<-Rn<-0
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = 1
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X shift logic Y
                    ex_stall.zbus_sel <= SEL_SHIFT;
                    ex_stall.shiftfunc <= LOGIC;
                    ex_stall.sr_sel <= SEL_SET_T;
                    ex_stall.t_sel <= SEL_SHIFT;
                    imm_enum <= IMM_P1;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00100001") then
            -- SHAR Rn [4n21]
            -- MSB->Rn->T
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = -1
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X shift arith Y
                    ex_stall.zbus_sel <= SEL_SHIFT;
                    ex_stall.shiftfunc <= ARITH;
                    ex_stall.sr_sel <= SEL_SET_T;
                    ex_stall.t_sel <= SEL_SHIFT;
                    imm_enum <= IMM_N1;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00000000") then
            -- SHLL Rn [4n00]
            -- T<-Rn<-0
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = 1
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X shift logic Y
                    ex_stall.zbus_sel <= SEL_SHIFT;
                    ex_stall.shiftfunc <= LOGIC;
                    ex_stall.sr_sel <= SEL_SET_T;
                    ex_stall.t_sel <= SEL_SHIFT;
                    imm_enum <= IMM_P1;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00000001") then
            -- SHLR Rn [4n01]
            -- 0->Rn->T
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = -1
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X shift logic Y
                    ex_stall.zbus_sel <= SEL_SHIFT;
                    ex_stall.shiftfunc <= LOGIC;
                    ex_stall.sr_sel <= SEL_SET_T;
                    ex_stall.t_sel <= SEL_SHIFT;
                    imm_enum <= IMM_N1;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00001000") then
            -- SHLL2 Rn [4n08]
            -- Rn<<2 -> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = 2
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X shift logic Y
                    ex_stall.zbus_sel <= SEL_SHIFT;
                    ex_stall.shiftfunc <= LOGIC;
                    imm_enum <= IMM_P2;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00001001") then
            -- SHLR2 Rn [4n09]
            -- Rn>>2 -> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = -2
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X shift logic Y
                    ex_stall.zbus_sel <= SEL_SHIFT;
                    ex_stall.shiftfunc <= LOGIC;
                    imm_enum <= IMM_N2;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00011000") then
            -- SHLL8 Rn [4n18]
            -- Rn<<8 -> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = 8
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X shift logic Y
                    ex_stall.zbus_sel <= SEL_SHIFT;
                    ex_stall.shiftfunc <= LOGIC;
                    imm_enum <= IMM_P8;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00011001") then
            -- SHLR8 Rn [4n19]
            -- Rn>>8 -> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = -8
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X shift logic Y
                    ex_stall.zbus_sel <= SEL_SHIFT;
                    ex_stall.shiftfunc <= LOGIC;
                    imm_enum <= IMM_N8;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00101000") then
            -- SHLL16 Rn [4n28]
            -- Rn<<16 -> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = 16
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X shift logic Y
                    ex_stall.zbus_sel <= SEL_SHIFT;
                    ex_stall.shiftfunc <= LOGIC;
                    imm_enum <= IMM_P16;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00101001") then
            -- SHLR16 Rn [4n29]
            -- Rn>>16 -> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = -16
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X shift logic Y
                    ex_stall.zbus_sel <= SEL_SHIFT;
                    ex_stall.shiftfunc <= LOGIC;
                    imm_enum <= IMM_N16;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00000----00000010") then
            -- STC SR, Rn [0n02]
            -- SR->Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = SR
                    ex.ybus_sel <= SEL_SR;
                    ex_stall.zbus_sel <= SEL_YBUS;
                    maskint_next <= '1';
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00000----00010010") then
            -- STC GBR, Rn [0n12]
            -- GBR->Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = GBR
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "10000";
                    ex_stall.zbus_sel <= SEL_YBUS;
                    maskint_next <= '1';
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00000----00100010") then
            -- STC VBR, Rn [0n22]
            -- VBR->Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = VBR
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "10001";
                    ex_stall.zbus_sel <= SEL_YBUS;
                    maskint_next <= '1';
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00000----00001010") then
            -- STS MACH, Rn [0n0A]
            -- MACH->Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = MACH
                    ex.ybus_sel <= SEL_MACH;
                    ex_stall.zbus_sel <= SEL_YBUS;
                    mac_stall_sense <= '1';
                    maskint_next <= '1';
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00000----00011010") then
            -- STS MACL, Rn [0n1A]
            -- MACL->Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = MACL
                    ex.ybus_sel <= SEL_MACL;
                    ex_stall.zbus_sel <= SEL_YBUS;
                    mac_stall_sense <= '1';
                    maskint_next <= '1';
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00000----00101010") then
            -- STS PR, Rn [0n2A]
            -- PR->Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = PR
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "10010";
                    ex_stall.zbus_sel <= SEL_YBUS;
                    maskint_next <= '1';
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00011011") then
            -- TAS.B @Rn [4n1B]
            -- When (Rn) is 0, 1 -> T, 1 -> MSB of (Rn)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- W = MEM[X] byte
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_XBUS;
                    ex.mem_size <= BYTE;
                    ex.mem_lock <= '1';
                    -- TEMP0 = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= "10011";

                when x"1" =>
                    ex.mem_lock <= '1';

                when x"2" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = TEMP0
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "10011";
                    -- Z = 0 :bit7 Y
                    ex.aluinx_sel <= SEL_ZERO;
                    ex_stall.zbus_sel <= SEL_MANIP;
                    ex.alumanip <= SET_BIT_7;
                    ex.arith_sr_func <= ZERO;
                    ex.arith_func <= ADD;
                    ex_stall.sr_sel <= SEL_ARITH;
                    -- MEM[X] = Z byte
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_XBUS;
                    ex_stall.mem_wdata_sel <= SEL_ZBUS;
                    ex.mem_size <= BYTE;
                    ex.mem_lock <= '1';

                when x"3" =>
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00000011") then
            -- STC.L SR, @-Rn [4n03]
            -- Rn-4 ->Rn,SR ->(Rn)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = SR
                    ex.ybus_sel <= SEL_SR;
                    -- Z = X - 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P4;
                    -- MEM[Z] = Y long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= LONG;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);

                when x"1" =>
                    maskint_next <= '1';
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00010011") then
            -- STC.L GBR, @-Rn [4n13]
            -- Rn-4 ->Rn,GBR ->(Rn)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = GBR
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "10000";
                    -- Z = X - 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P4;
                    -- MEM[Z] = Y long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= LONG;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);

                when x"1" =>
                    maskint_next <= '1';
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00100011") then
            -- STC.L VBR, @-Rn [4n23]
            -- Rn - 4 -> Rn, VBR -> (Rn)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = VBR
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "10001";
                    -- Z = X - 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P4;
                    -- MEM[Z] = Y long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= LONG;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);

                when x"1" =>
                    maskint_next <= '1';
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00000010") then
            -- STS.L MACH, @-Rn [4n02]
            -- Rn - 4 -> Rn, MACH -> (Rn)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = MACH
                    ex.ybus_sel <= SEL_MACH;
                    -- Z = X - 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P4;
                    mac_stall_sense <= '1';
                    maskint_next <= '1';
                    -- MEM[Z] = Y long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= LONG;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00010010") then
            -- STS.L MACL, @-Rn [4n12]
            -- Rn-4->Rn,MACL->(Rn)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = MACL
                    ex.ybus_sel <= SEL_MACL;
                    -- Z = X - 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P4;
                    mac_stall_sense <= '1';
                    maskint_next <= '1';
                    -- MEM[Z] = Y long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= LONG;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00100010") then
            -- STS.L PR, @-Rn [4n22]
            -- Rn-4->Rn,PR->(Rn)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = PR
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "10010";
                    -- Z = X - 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P4;
                    maskint_next <= '1';
                    -- MEM[Z] = Y long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= LONG;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----11001000") then
            -- STS CP0_COM, Rn [4nC8]
            -- Rn-4->Rn,PR->(Rn)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Rn = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';
                    wb_stall.cpu_data_mux <= COPROC;
                    ex.coproc_cmd <= STS;

                when others =>

            end case;
        elsif std_match(cond, "00100----11001001") then
            -- CSTS CP0_COM, CP0_Rn [4nC9]
            -- Rn-4->Rn,PR->(Rn)
            case op.addr(3 downto 0) is
                when x"0" =>
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';
                    ex.coproc_cmd <= STS;

                when others =>

            end case;
        elsif std_match(cond, "00000----01011010") then
            -- STS CPI_COM, Rn [0n5A]
            -- Rn-4->Rn,PR->(Rn)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Rn = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';
                    wb_stall.cpu_data_mux <= COPROC;
                    ex.coproc_cmd <= STS;

                when others =>

            end case;
        elsif std_match(cond, "01111----00001101") then
            -- CSTS CPI_COM, CPI_Rn [Fn0D]
            -- Rn-4->Rn,PR->(Rn)
            case op.addr(3 downto 0) is
                when x"0" =>
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';
                    ex.coproc_cmd <= STS;

                when others =>

            end case;
        elsif std_match(cond, "00100----00001110") then
            -- LDC Rm, SR [4m0E]
            -- Rm -> SR
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(11 downto 8);
                    ex_stall.zbus_sel <= SEL_YBUS;
                    ex_stall.sr_sel <= SEL_ZBUS;
                    maskint_next <= '1';
                    -- SR = Z
                    ex_stall.wrsr_z <= '1';
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00011110") then
            -- LDC, Rm, GBR [4m1E]
            -- Rm -> GBR
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(11 downto 8);
                    ex_stall.zbus_sel <= SEL_YBUS;
                    maskint_next <= '1';
                    -- GBR = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "10000";
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00101110") then
            -- LDC Rm, VBR [4m2E]
            -- Rm -> VBR
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(11 downto 8);
                    ex_stall.zbus_sel <= SEL_YBUS;
                    maskint_next <= '1';
                    -- VBR = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "10001";
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00001010") then
            -- LDS Rm, MACH [4m0A]
            -- Rm-> MACH
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(11 downto 8);
                    ex_stall.zbus_sel <= SEL_YBUS;
                    ex_stall.macsel1 <= SEL_ZBUS;
                    ex_stall.wrmach <= '1';
                    mac_stall_sense <= '1';
                    maskint_next <= '1';
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00011010") then
            -- LDS Rm, MACL [4m1A]
            -- Rm -> MACL
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(11 downto 8);
                    ex_stall.zbus_sel <= SEL_YBUS;
                    ex_stall.macsel2 <= SEL_ZBUS;
                    ex_stall.wrmacl <= '1';
                    mac_stall_sense <= '1';
                    maskint_next <= '1';
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00101010") then
            -- LDS Rm, PR [4m2A]
            -- Rm -> PR
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(11 downto 8);
                    ex_stall.zbus_sel <= SEL_YBUS;
                    maskint_next <= '1';
                    -- PR = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "10010";
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00101011") then
            -- JMP @Rm [4m2B]
            -- Rm -> PC
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Z = X + 0
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_ZERO;
                    -- PC = Z
                    ex_stall.wrpc_z <= '1';
                    id.incpc <= '1';

                when x"1" =>
                    id.ifadsel <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';
                    delay_jump <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00001011") then
            -- JSR @Rm [4m0B]
            -- PC -> PR, Rm -> PC
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Z = X + 0
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_ZERO;
                    -- PC = Z
                    ex_stall.wrpc_z <= '1';
                    -- PR = PC
                    ex_stall.wrpr_pc <= '1';
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "10010";
                    id.incpc <= '1';

                when x"1" =>
                    id.ifadsel <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';
                    delay_jump <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00000111") then
            -- LDC.L @Rm+, SR [4m07]
            -- (Rm)->SR,Rm+4->Rm
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    wb_stall.wrsr_w <= '1';
                    -- W = MEM[X] long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_XBUS;
                    ex.mem_size <= LONG;

                when x"1" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Z = X + 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_P4;
                    -- Rm = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);

                when x"2" =>
                    maskint_next <= '1';
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00010111") then
            -- LDC.L @Rm+, GBR [4m17]
            -- (Rm)->GBR,Rm+4->Rm
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- W = MEM[X] long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_XBUS;
                    ex.mem_size <= LONG;
                    -- GBR = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= "10000";

                when x"1" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Z = X + 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_P4;
                    -- Rm = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);

                when x"2" =>
                    maskint_next <= '1';
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00100111") then
            -- LDC.L @Rm+, VBR [4m27]
            -- (Rm)->VBR,Rm+4->Rm
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- W = MEM[X] long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_XBUS;
                    ex.mem_size <= LONG;
                    -- VBR = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= "10001";

                when x"1" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Z = X + 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_P4;
                    -- Rm = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);

                when x"2" =>
                    maskint_next <= '1';
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00000110") then
            -- LDS.L @Rm+, MACH [4m06]
            -- (Rm)->MACH,Rm+4->Rm
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Z = X + 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_P4;
                    wb_stall.macsel1 <= SEL_WBUS;
                    wb_stall.wrmach <= '1';
                    mac_busy <= WB_NOT_STALL;
                    mac_stall_sense <= '1';
                    maskint_next <= '1';
                    -- W = MEM[X] long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_XBUS;
                    ex.mem_size <= LONG;
                    -- Rm = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00010110") then
            -- LDS.L @Rm+, MACL [4m16]
            -- (Rm)->MACL,Rm+4->Rm
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Z = X + 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_P4;
                    wb_stall.macsel2 <= SEL_WBUS;
                    wb_stall.wrmacl <= '1';
                    mac_busy <= WB_NOT_STALL;
                    mac_stall_sense <= '1';
                    maskint_next <= '1';
                    -- W = MEM[X] long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_XBUS;
                    ex.mem_size <= LONG;
                    -- Rm = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----00100110") then
            -- LDS.L @Rm+, PR [4m26]
            -- (Rm)->PR,Rm+4->Rm
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    maskint_next <= '1';
                    -- W = MEM[X] long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_XBUS;
                    ex.mem_size <= LONG;
                    -- PR = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= "10010";

                when x"1" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Z = X + 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_P4;
                    maskint_next <= '1';
                    -- Rm = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100----10001000") then
            -- LDS Rm, CP0_COM [4m88]
            -- (Rm)->PR,Rm+4->Rm
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(11 downto 8);
                    ex_stall.zbus_sel <= SEL_YBUS;
                    maskint_next <= '1';
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';
                    ex.coproc_cmd <= LDS;

                when others =>

            end case;
        elsif std_match(cond, "00100----10001001") then
            -- CLDS CP0_Rm, CP0_COM [4m89]
            -- (Rm)->PR,Rm+4->Rm
            case op.addr(3 downto 0) is
                when x"0" =>
                    maskint_next <= '1';
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';
                    ex.coproc_cmd <= CLDS;

                when others =>

            end case;
        elsif std_match(cond, "00100----01011010") then
            -- LDS Rm, CPI_COM [4m5A]
            -- (Rm)->PR,Rm+4->Rm
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(11 downto 8);
                    ex_stall.zbus_sel <= SEL_YBUS;
                    maskint_next <= '1';
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';
                    ex.coproc_cmd <= LDS;

                when others =>

            end case;
        elsif std_match(cond, "01111----00011101") then
            -- CLDS CPI_Rm, CPI_COM [Fm1D]
            -- (Rm)->PR,Rm+4->Rm
            case op.addr(3 downto 0) is
                when x"0" =>
                    maskint_next <= '1';
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';
                    ex.coproc_cmd <= CLDS;

                when others =>

            end case;
        elsif std_match(cond, "00000----00100011") then
            -- BRAF Rm [0m23]
            -- Delayed branch, Rm + PC -> PC
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = PC
                    ex.xbus_sel <= SEL_PC;
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(11 downto 8);
                    -- Z = X + Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    -- PC = Z
                    ex_stall.wrpc_z <= '1';
                    id.incpc <= '1';

                when x"1" =>
                    id.ifadsel <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';
                    delay_jump <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00000----00000011") then
            -- BSRF Rm [0m03]
            -- Delayed branch, PC -> PR, Rm + PC -> PC
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = PC
                    ex.xbus_sel <= SEL_PC;
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(11 downto 8);
                    -- Z = X + Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    -- PC = Z
                    ex_stall.wrpc_z <= '1';
                    -- PR = PC
                    ex_stall.wrpr_pc <= '1';
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "10010";
                    id.incpc <= '1';

                when x"1" =>
                    id.ifadsel <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';
                    delay_jump <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00011--------1100") then
            -- ADD Rm, Rn [3nmC]
            -- Rn+Rm->Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X + Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00011--------1110") then
            -- ADDC Rm, Rn [3nmE]
            -- Rn + Rm + T -> Rn, carry ->T
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X + Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    ex.arith_ci_en <= '1';
                    ex_stall.sr_sel <= SEL_SET_T;
                    ex_stall.t_sel <= SEL_CARRY;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00011--------1111") then
            -- ADDV Rm, Rn [3nmF]
            -- Rn + Rm -> Rn, overflow ->T
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X + Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_sr_func <= OVERUNDERFLOW;
                    ex.arith_func <= ADD;
                    ex_stall.sr_sel <= SEL_ARITH;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00010--------1001") then
            -- AND Rm, Rn [2nm9]
            -- Rn&Rm->Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X and Y
                    ex_stall.zbus_sel <= SEL_LOGIC;
                    ex.logic_func <= LOGIC_AND;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00011--------0000") then
            -- CMP /EQ Rm, Rn [3nm0]
            -- When Rn=Rm,1->T
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    ex.logic_sr_func <= ZERO;
                    ex.logic_func <= LOGIC_XOR;
                    ex_stall.sr_sel <= SEL_LOGIC;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00011--------0010") then
            -- CMP /HS Rm, Rn [3nm2]
            -- When unsigned and Rn >= Rm,1->T
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    ex.arith_sr_func <= UGRTER_EQ;
                    ex.arith_func <= SUB;
                    ex_stall.sr_sel <= SEL_ARITH;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00011--------0011") then
            -- CMP /GE Rm, Rn [3nm3]
            -- When signed and Rn >= Rm,1->T
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    ex.arith_sr_func <= SGRTER_EQ;
                    ex.arith_func <= SUB;
                    ex_stall.sr_sel <= SEL_ARITH;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00011--------0110") then
            -- CMP /HI Rm, Rn [3nm6]
            -- When unsigned and Rn > Rm,1->T
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    ex.arith_sr_func <= UGRTER;
                    ex.arith_func <= SUB;
                    ex_stall.sr_sel <= SEL_ARITH;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00011--------0111") then
            -- CMP /GT Rm, Rn [3nm7]
            -- When signed and Rn > Rm,1->T
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    ex.arith_sr_func <= SGRTER;
                    ex.arith_func <= SUB;
                    ex_stall.sr_sel <= SEL_ARITH;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00010--------1100") then
            -- CMP /STR Rm, Rn [2nmC]
            -- When a byte in Rn equals a byte in Rm, 1-> T
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    ex.logic_sr_func <= BYTE_EQ;
                    ex.logic_func <= LOGIC_XOR;
                    ex_stall.sr_sel <= SEL_LOGIC;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00010--------0011") then
            -- CAS.L Rm, Rn, @R0 [2nm3]
            -- When a byte in Rn equals a byte in Rm, 1-> T
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = Rn
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(11 downto 8);
                    ex_stall.zbus_sel <= SEL_YBUS;
                    -- TEMP0 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "10011";

                when x"1" =>
                    -- X = R0
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "00000";
                    -- W = MEM[X] long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_XBUS;
                    ex.mem_size <= LONG;
                    ex.mem_lock <= '1';
                    -- Rn = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= '0' & op.code(11 downto 8);

                when x"2" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    ex.logic_sr_func <= ZERO;
                    ex.logic_func <= LOGIC_XOR;
                    ex_stall.sr_sel <= SEL_LOGIC;
                    ex.mem_lock <= '1';

                when x"3" =>
                    -- X = R0
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "00000";
                    -- Y = TEMP0
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "10011";
                    -- MEM[X] = Y long
                    ex_stall.ma_issue <= t_bcc;
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_XBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= LONG;
                    ex.mem_lock <= '1';
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00011--------0100") then
            -- DIV1 Rm, Rn [3nm4]
            -- 1-step division (Rn ÷ Rm)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = (2*X + T) + Y
                    ex.aluinx_sel <= SEL_ROTCL;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_sr_func <= DIV1;
                    ex.arith_func <= ADD;
                    ex_stall.sr_sel <= SEL_ARITH;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00010--------0111") then
            -- DIV0S Rm, Rn [2nm7]
            -- MSB of Rn-> Q, MSB of Rm->M,M^Q->T
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    ex.arith_sr_func <= DIV0S;
                    ex.arith_func <= ADD;
                    ex_stall.sr_sel <= SEL_ARITH;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00011--------1101") then
            -- DMULS.L Rm, Rn [3nmD]
            -- Signed, Rn x Rm, MACH, MACL
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    ex_stall.macsel1 <= SEL_XBUS;
                    ex_stall.mulcom1 <= '1';
                    ex_stall.macsel2 <= SEL_YBUS;
                    ex_stall.mulcom2 <= DMULSL;
                    mac_busy <= EX_NOT_STALL;
                    mac_stall_sense <= '1';
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00011--------0101") then
            -- DMULU.L Rm, Rn [3nm5]
            -- Unsigned, Rn x Rm, MACH, MACL
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    ex_stall.macsel1 <= SEL_XBUS;
                    ex_stall.mulcom1 <= '1';
                    ex_stall.macsel2 <= SEL_YBUS;
                    ex_stall.mulcom2 <= DMULUL;
                    mac_busy <= EX_NOT_STALL;
                    mac_stall_sense <= '1';
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00110--------1110") then
            -- EXTS.B Rm, Rn [6nmE]
            -- Sign-extends Rm from byte -> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = (int8) Y
                    ex_stall.zbus_sel <= SEL_MANIP;
                    ex.alumanip <= EXTEND_SBYTE;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00110--------1111") then
            -- EXTS.W Rm, Rn [6nmF]
            -- Sign-extends Rm from word -> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = (int16) Y
                    ex_stall.zbus_sel <= SEL_MANIP;
                    ex.alumanip <= EXTEND_SWORD;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00110--------1100") then
            -- EXTU.B Rm, Rn [6nmC]
            -- Zero-extends Rm from byte -> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = (uint8) Y
                    ex_stall.zbus_sel <= SEL_MANIP;
                    ex.alumanip <= EXTEND_UBYTE;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00110--------1101") then
            -- EXTU.W Rm, Rn [6nmD]
            -- Zero-extends Rm from word -> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = (uint16) Y
                    ex_stall.zbus_sel <= SEL_MANIP;
                    ex.alumanip <= EXTEND_UWORD;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00110--------0011") then
            -- MOV Rm, Rn [6nm3]
            -- Rm->Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    ex_stall.zbus_sel <= SEL_YBUS;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00000--------0111") then
            -- MUL.L Rm, Rn [0nm7]
            -- RnxRm->MACL
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    ex_stall.macsel1 <= SEL_XBUS;
                    ex_stall.mulcom1 <= '1';
                    ex_stall.macsel2 <= SEL_YBUS;
                    ex_stall.mulcom2 <= MULL;
                    mac_busy <= EX_NOT_STALL;
                    mac_stall_sense <= '1';
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00010--------1111") then
            -- MULS.W Rm, Rn [2nmF]
            -- Signed, Rn x Rm -> MAC
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    ex_stall.macsel1 <= SEL_XBUS;
                    ex_stall.mulcom1 <= '1';
                    ex_stall.macsel2 <= SEL_YBUS;
                    ex_stall.mulcom2 <= MULSW;
                    mac_busy <= EX_NOT_STALL;
                    mac_stall_sense <= '1';
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00010--------1110") then
            -- MULU.W Rm, Rn [2nmE]
            -- Unsigned, Rn x Rm -> MAC
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    ex_stall.macsel1 <= SEL_XBUS;
                    ex_stall.mulcom1 <= '1';
                    ex_stall.macsel2 <= SEL_YBUS;
                    ex_stall.mulcom2 <= MULUW;
                    mac_busy <= EX_NOT_STALL;
                    mac_stall_sense <= '1';
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00110--------1011") then
            -- NEG Rm, Rn [6nmB]
            -- 0-Rm->Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = 0
                    ex.xbus_sel <= SEL_IMM;
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X - Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_ZERO;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00110--------1010") then
            -- NEGC Rm, Rn [6nmA]
            -- 0-Rm-T -> Rn, borrow ->T
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = 0
                    ex.xbus_sel <= SEL_IMM;
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X - Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    ex.arith_ci_en <= '1';
                    ex_stall.sr_sel <= SEL_SET_T;
                    ex_stall.t_sel <= SEL_CARRY;
                    imm_enum <= IMM_ZERO;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00110--------0111") then
            -- NOT Rm, Rn [6nm7]
            -- ~Rm->Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = 0
                    ex.xbus_sel <= SEL_IMM;
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X not Y
                    ex_stall.zbus_sel <= SEL_LOGIC;
                    ex.logic_func <= LOGIC_NOT;
                    imm_enum <= IMM_ZERO;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00010--------1011") then
            -- OR Rm, Rn [2nmB]
            -- Rn | Rm-> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X or Y
                    ex_stall.zbus_sel <= SEL_LOGIC;
                    ex.logic_func <= LOGIC_OR;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00011--------1000") then
            -- SUB Rm, Rn [3nm8]
            -- Rn - Rm ->Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X - Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00011--------1010") then
            -- SUBC Rm, Rn [3nmA]
            -- Rn - Rm-T ->Rn, borrow -> T
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X - Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    ex.arith_ci_en <= '1';
                    ex_stall.sr_sel <= SEL_SET_T;
                    ex_stall.t_sel <= SEL_CARRY;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00011--------1011") then
            -- SUBV Rm, Rn [3nmB]
            -- Rn - Rm -> Rn, underflow ->T
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X - Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_sr_func <= OVERUNDERFLOW;
                    ex.arith_func <= SUB;
                    ex_stall.sr_sel <= SEL_ARITH;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00110--------1000") then
            -- SWAP.B Rm, Rn [6nm8]
            -- Rm -> Swap upper and lower halves of lower 2 bytes -> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X [:swap :b] Y
                    ex_stall.zbus_sel <= SEL_MANIP;
                    ex.alumanip <= SWAP_BYTE;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00110--------1001") then
            -- SWAP.W Rm, Rn [6nm9]
            -- Rm -> Swap upper and lower word -> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X [:swap :w] Y
                    ex_stall.zbus_sel <= SEL_MANIP;
                    ex.alumanip <= SWAP_WORD;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00010--------1000") then
            -- TST Rm, Rn [2nm8]
            -- Rn & Rm, when result is 0, 1 -> T
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    ex.logic_sr_func <= ZERO;
                    ex.logic_func <= LOGIC_AND;
                    ex_stall.sr_sel <= SEL_LOGIC;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00010--------1010") then
            -- XOR Rm, Rn [2nmA]
            -- Rn ^ Rm-> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X xor Y
                    ex_stall.zbus_sel <= SEL_LOGIC;
                    ex.logic_func <= LOGIC_XOR;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00010--------1101") then
            -- XTRACT Rm, Rn [2nmD]
            -- Centre 32 bits of Rm and Rn -> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X :xtract Y
                    ex_stall.zbus_sel <= SEL_MANIP;
                    ex.alumanip <= EXTRACT;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100--------1100") then
            -- SHAD Rm, Rn [4nmC]
            -- 
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X shift arith Y
                    ex_stall.zbus_sel <= SEL_SHIFT;
                    ex_stall.shiftfunc <= ARITH;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100--------1101") then
            -- SHLD Rm, Rn [4nmD]
            -- 
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X shift logic Y
                    ex_stall.zbus_sel <= SEL_SHIFT;
                    ex_stall.shiftfunc <= LOGIC;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00010--------0000") then
            -- MOV.B Rm, @Rn [2nm0]
            -- Rm -> (Rn)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X + 0
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_ZERO;
                    -- MEM[Z] = Y byte
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= BYTE;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00010--------0001") then
            -- MOV.W Rm, @Rn [2nm1]
            -- Rm -> (Rn)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X + 0
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_ZERO;
                    -- MEM[Z] = Y word
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= WORD;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00010--------0010") then
            -- MOV.L Rm, @Rn [2nm2]
            -- Rm -> (Rn)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X + 0
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_ZERO;
                    -- MEM[Z] = Y long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= LONG;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00110--------0000") then
            -- MOV.B @Rm, Rn [6nm0]
            -- (Rm) -> sign extension -> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    ex_stall.zbus_sel <= SEL_YBUS;
                    -- W = MEM[Z] byte
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= BYTE;
                    -- Rn = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00110--------0001") then
            -- MOV.W @Rm, Rn [6nm1]
            -- (Rm) -> sign extension -> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    ex_stall.zbus_sel <= SEL_YBUS;
                    -- W = MEM[Z] word
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= WORD;
                    -- Rn = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00110--------0010") then
            -- MOV.L @Rm, Rn [6nm2]
            -- (Rm)-> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    ex_stall.zbus_sel <= SEL_YBUS;
                    -- W = MEM[Z] long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= LONG;
                    -- Rn = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00000--------1111") then
            -- MAC.L @Rm+, @Rn+ [0nmF]
            -- Signed, (Rn) x (Rm) + MAC -> MAC
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Z = X + 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_P4;
                    wb_stall.macsel1 <= SEL_WBUS;
                    wb_stall.mulcom1 <= '1';
                    -- W = MEM[X] long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_XBUS;
                    ex.mem_size <= LONG;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);

                when x"1" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(7 downto 4);
                    -- Z = X + 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_P4;
                    wb_stall.macsel2 <= SEL_WBUS;
                    wb_stall.mulcom2 <= MACL;
                    mac_busy <= WB_BUSY;
                    mac_s_latch <= '1';
                    -- W = MEM[X] long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_XBUS;
                    ex.mem_size <= LONG;
                    -- Rm = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(7 downto 4);

                when x"2" =>
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00100--------1111") then
            -- MAC.W @Rm+, @Rn+ [4nmF]
            -- Signed, (Rn) x (Rm) + MAC -> MAC
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Z = X + 2
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_P2;
                    wb_stall.macsel1 <= SEL_WBUS;
                    wb_stall.mulcom1 <= '1';
                    -- W = MEM[X] word
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_XBUS;
                    ex.mem_size <= WORD;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);

                when x"1" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(7 downto 4);
                    -- Z = X + 2
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_P2;
                    wb_stall.macsel2 <= SEL_WBUS;
                    wb_stall.mulcom2 <= MACW;
                    mac_busy <= WB_BUSY;
                    mac_s_latch <= '1';
                    -- W = MEM[X] word
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_XBUS;
                    ex.mem_size <= WORD;
                    -- Rm = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(7 downto 4);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00110--------0100") then
            -- MOV.B @Rm+, Rn [6nm4]
            -- (Rm) -> sign extension -> Rn, Rm +1 ->Rm
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(7 downto 4);
                    -- Z = X + 1
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_P1;
                    -- Rm = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(7 downto 4);

                when x"1" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(7 downto 4);
                    -- Z = X - 1
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P1;
                    -- W = MEM[Z] byte
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= BYTE;
                    -- Rn = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00110--------0101") then
            -- MOV.W @Rm+, Rn [6nm5]
            -- (Rm) -> sign extension -> Rn, Rm +2 ->Rm
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(7 downto 4);
                    -- Z = X + 2
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_P2;
                    -- Rm = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(7 downto 4);

                when x"1" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(7 downto 4);
                    -- Z = X - 2
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P2;
                    -- W = MEM[Z] word
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= WORD;
                    -- Rn = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00110--------0110") then
            -- MOV.L @Rm+, Rn [6nm6]
            -- (Rm) -> Rn, Rm + 4 -> Rm
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(7 downto 4);
                    -- Z = X + 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_P4;
                    -- Rm = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(7 downto 4);

                when x"1" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(7 downto 4);
                    -- Z = X - 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P4;
                    -- W = MEM[Z] long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= LONG;
                    -- Rn = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00010--------0100") then
            -- MOV.B Rm,@-Rn [2nm4]
            -- Rn - 1 -> Rn, Rm -> (Rn)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X - 1
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P1;
                    -- MEM[Z] = Y byte
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= BYTE;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00010--------0101") then
            -- MOV.W Rm,@-Rn [2nm5]
            -- Rn - 2 -> Rn, Rm -> (Rn)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X - 2
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P2;
                    -- MEM[Z] = Y word
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= WORD;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00010--------0110") then
            -- MOV.L Rm,@-Rn [2nm6]
            -- Rn - 4 -> Rn, Rm -> (Rn)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X - 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P4;
                    -- MEM[Z] = Y long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= LONG;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00000--------0100") then
            -- MOV.B Rm, @(R0, Rn) [0nm4]
            -- Rm->(R0 +Rn)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X + R0
                    ex.aluiny_sel <= SEL_R0;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    -- MEM[Z] = Y byte
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= BYTE;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00000--------0101") then
            -- MOV.W Rm, @(R0, Rn) [0nm5]
            -- Rm->(R0 +Rn)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X + R0
                    ex.aluiny_sel <= SEL_R0;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    -- MEM[Z] = Y word
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= WORD;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00000--------0110") then
            -- MOV.L Rm, @(R0, Rn) [0nm6]
            -- Rm->(R0 +Rn)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X + R0
                    ex.aluiny_sel <= SEL_R0;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    -- MEM[Z] = Y long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= LONG;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00000--------1100") then
            -- MOV.B @(R0, Rm), Rn [0nmC]
            -- (R0 +Rm)->sign extension -> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(7 downto 4);
                    -- Z = X + R0
                    ex.aluiny_sel <= SEL_R0;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    -- W = MEM[Z] byte
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= BYTE;
                    -- Rn = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00000--------1101") then
            -- MOV.W @(R0, Rm), Rn [0nmD]
            -- (R0 +Rm)->sign extension -> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(7 downto 4);
                    -- Z = X + R0
                    ex.aluiny_sel <= SEL_R0;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    -- W = MEM[Z] word
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= WORD;
                    -- Rn = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00000--------1110") then
            -- MOV.L @(R0, Rm), Rn [0nmE]
            -- (R0 +Rm)-> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(7 downto 4);
                    -- Z = X + R0
                    ex.aluiny_sel <= SEL_R0;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    -- W = MEM[Z] long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= LONG;
                    -- Rn = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "010000100--------") then
            -- MOV.B @(disp, Rm), R0 [84md]
            -- (disp + Rm) -> sign extension -> R0
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(7 downto 4);
                    -- Z = X + [:u 4 0]
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_U_4_0;
                    -- W = MEM[Z] byte
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= BYTE;
                    -- R0 = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= "00000";
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "010000101--------") then
            -- MOV.W @(disp, Rm), R0 [85md]
            -- (disp x2 +Rm)-> sign extension -> R0
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(7 downto 4);
                    -- Z = X + [:u 4 1]
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_U_4_1;
                    -- W = MEM[Z] word
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= WORD;
                    -- R0 = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= "00000";
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "010000000--------") then
            -- MOV.B R0, @(disp, Rn) [80nd]
            -- R0 -> (disp + Rn)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(7 downto 4);
                    -- Y = R0
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "00000";
                    -- Z = X + [:u 4 0]
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_U_4_0;
                    -- MEM[Z] = Y byte
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= BYTE;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "010000001--------") then
            -- MOV.W R0, @(disp, Rn) [81nd]
            -- R0 -> (disp x 2+ Rn)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(7 downto 4);
                    -- Y = R0
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "00000";
                    -- Z = X + [:u 4 1]
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_U_4_1;
                    -- MEM[Z] = Y word
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= WORD;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00001------------") then
            -- MOV.L Rm, @(disp, Rn) [1nmd]
            -- Rm -> (disp x 4 + Rn)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = Rm
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= '0' & op.code(7 downto 4);
                    -- Z = X + [:u 4 2]
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_U_4_2;
                    -- MEM[Z] = Y long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= LONG;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00101------------") then
            -- MOV.L @(disp, Rm), Rn [5nmd]
            -- (disp x 4+ Rm) -> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rm
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(7 downto 4);
                    -- Z = X + [:u 4 2]
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_U_4_2;
                    -- W = MEM[Z] long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= LONG;
                    -- Rn = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "011000000--------") then
            -- MOV.B R0, @(disp, GBR) [C0dd]
            -- R0-> (disp + GBR)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = GBR
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10000";
                    -- Y = R0
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "00000";
                    -- Z = X + [:u 8 0]
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_U_8_0;
                    -- MEM[Z] = Y byte
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= BYTE;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "011000001--------") then
            -- MOV.W R0, @(disp, GBR) [C1dd]
            -- R0-> (disp x2 + GBR)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = GBR
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10000";
                    -- Y = R0
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "00000";
                    -- Z = X + [:u 8 1]
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_U_8_1;
                    -- MEM[Z] = Y word
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= WORD;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "011000010--------") then
            -- MOV.L R0, @(disp, GBR) [C2dd]
            -- R0-> (disp x4 + GBR)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = GBR
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10000";
                    -- Y = R0
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "00000";
                    -- Z = X + [:u 8 2]
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_U_8_2;
                    -- MEM[Z] = Y long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= LONG;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "011000100--------") then
            -- MOV.B @(disp, GBR), R0 [C4dd]
            -- (disp + GBR) -> sign extension -> R0
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = GBR
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10000";
                    -- Z = X + [:u 8 0]
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_U_8_0;
                    -- W = MEM[Z] byte
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= BYTE;
                    -- R0 = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= "00000";
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "011000101--------") then
            -- MOV.W @(disp, GBR), R0 [C5dd]
            -- (disp x2 + GBR) -> sign extension -> R0
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = GBR
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10000";
                    -- Z = X + [:u 8 1]
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_U_8_1;
                    -- W = MEM[Z] word
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= WORD;
                    -- R0 = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= "00000";
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "011000110--------") then
            -- MOV.L @(disp, GBR), R0 [C6dd]
            -- (disp  x4+ GBR) -> sign extension -> R0
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = GBR
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10000";
                    -- Z = X + [:u 8 2]
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_U_8_2;
                    -- W = MEM[Z] long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= LONG;
                    -- R0 = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= "00000";
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "011000111--------") then
            -- MOVA @(disp, PC), R0 [C7dd]
            -- disp x 4 + PC -> R0
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = PC
                    ex.xbus_sel <= SEL_PC;
                    -- Y = UCONST * 4
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = (X & FC) + Y
                    ex.aluinx_sel <= SEL_FC;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_U_8_2;
                    -- R0 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "00000";
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "010001011--------") then
            -- BF label [8Bdd]
            -- When T=0, disp x2+PC-> PC; When T = 1, nop
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = PC
                    ex.xbus_sel <= SEL_PC;
                    -- Y = CONST * 2
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X + Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_S_8_1;
                    -- if (not T) PC = Z
                    ex_stall.wrpc_z <= not t_bcc;
                    id.incpc <= '1';
                    dispatch <= t_bcc;
                    id.if_issue <= '1';

                when x"1" =>
                    id.ifadsel <= '1';
                    id.if_issue <= '1';

                when x"2" =>
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "010001111--------") then
            -- BF /S label [8Fdd]
            -- When T=0, disp x2+PC-> PC; When T = 1, nop
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = PC
                    ex.xbus_sel <= SEL_PC;
                    -- Y = CONST * 2
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X + Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_S_8_1;
                    -- if (not T) PC = Z
                    ex_stall.wrpc_z <= not t_bcc;
                    id.incpc <= '1';
                    dispatch <= t_bcc;
                    id.if_issue <= t_bcc;

                when x"1" =>
                    id.ifadsel <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';
                    delay_jump <= '1';

                when others =>

            end case;
        elsif std_match(cond, "010001001--------") then
            -- BT label [89dd]
            -- When T=1, disp x2+PC-> PC; When T = 0, nop
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = PC
                    ex.xbus_sel <= SEL_PC;
                    -- Y = CONST * 2
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X + Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_S_8_1;
                    -- if (T) PC = Z
                    ex_stall.wrpc_z <= t_bcc;
                    id.incpc <= '1';
                    dispatch <= not t_bcc;
                    id.if_issue <= '1';

                when x"1" =>
                    id.ifadsel <= '1';
                    id.if_issue <= '1';

                when x"2" =>
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "010001101--------") then
            -- BT /S label [8Ddd]
            -- When T=1, disp x2+PC-> PC; When T = 0, nop
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = PC
                    ex.xbus_sel <= SEL_PC;
                    -- Y = CONST * 2
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X + Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_S_8_1;
                    -- if (T) PC = Z
                    ex_stall.wrpc_z <= t_bcc;
                    id.incpc <= '1';
                    dispatch <= not t_bcc;
                    id.if_issue <= not t_bcc;

                when x"1" =>
                    id.ifadsel <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';
                    delay_jump <= '1';

                when others =>

            end case;
        elsif std_match(cond, "01010------------") then
            -- BRA label [Addd]
            -- Delayed branch, disp x 2+ PC -> PC
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = PC
                    ex.xbus_sel <= SEL_PC;
                    -- Y = CONST * 2
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X + Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_S_12_1;
                    -- PC = Z
                    ex_stall.wrpc_z <= '1';
                    id.incpc <= '1';

                when x"1" =>
                    id.ifadsel <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';
                    delay_jump <= '1';

                when others =>

            end case;
        elsif std_match(cond, "01011------------") then
            -- BSR label [Bddd]
            -- Delayed branching, PC -> PR, disp x 2 + PC -> PC
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = PC
                    ex.xbus_sel <= SEL_PC;
                    -- Y = CONST * 2
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X + Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_S_12_1;
                    -- PC = Z
                    ex_stall.wrpc_z <= '1';
                    -- PR = PC
                    ex_stall.wrpr_pc <= '1';
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "10010";
                    id.incpc <= '1';

                when x"1" =>
                    id.ifadsel <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';
                    delay_jump <= '1';

                when others =>

            end case;
        elsif std_match(cond, "01001------------") then
            -- MOV.W @(disp, PC), Rn [9ndd]
            -- (disp x 2 + PC) -> sign extension -> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = PC
                    ex.xbus_sel <= SEL_PC;
                    -- Y = UCONST * 2
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X + Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_U_8_1;
                    -- W = MEM[Z] word
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= WORD;
                    -- Rn = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "01101------------") then
            -- MOV.L @(disp, PC), Rn [Dndd]
            -- (disp x 4 + PC) -> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = PC
                    ex.xbus_sel <= SEL_PC;
                    -- Y = UCONST * 4
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = (X & FC) + Y
                    ex.aluinx_sel <= SEL_FC;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_U_8_2;
                    -- W = MEM[Z] long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= LONG;
                    -- Rn = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "011001101--------") then
            -- AND.B #imm, @(R0, GBR) [CDii]
            -- (R0 + GBR) & imm -> (R0 + GBR)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = GBR
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10000";
                    -- Y = R0
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "00000";
                    -- Z = X + Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    -- W = MEM[Z] byte
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= BYTE;
                    -- TEMP1 = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= "10100";

                when x"1" =>
                    -- X = GBR
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10000";
                    -- Y = R0
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "00000";
                    -- Z = X + Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    -- TEMP0 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "10011";

                when x"2" =>
                    -- X = TEMP1
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10100";
                    -- Y = TEMP0
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "10011";
                    -- Z = X and [:u 8 0]
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_LOGIC;
                    ex.logic_func <= LOGIC_AND;
                    imm_enum <= IMM_U_8_0;
                    -- MEM[Y] = Z byte
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_YBUS;
                    ex_stall.mem_wdata_sel <= SEL_ZBUS;
                    ex.mem_size <= BYTE;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "011001111--------") then
            -- OR.B #imm, @(R0, GBR) [CFii]
            -- (R0 + GBR) | imm -> (R0 + GBR)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = GBR
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10000";
                    -- Y = R0
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "00000";
                    -- Z = X + Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    -- W = MEM[Z] byte
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= BYTE;
                    -- TEMP1 = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= "10100";

                when x"1" =>
                    -- X = GBR
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10000";
                    -- Y = R0
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "00000";
                    -- Z = X + Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    -- TEMP0 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "10011";

                when x"2" =>
                    -- X = TEMP1
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10100";
                    -- Y = TEMP0
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "10011";
                    -- Z = X or [:u 8 0]
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_LOGIC;
                    ex.logic_func <= LOGIC_OR;
                    imm_enum <= IMM_U_8_0;
                    -- MEM[Y] = Z byte
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_YBUS;
                    ex_stall.mem_wdata_sel <= SEL_ZBUS;
                    ex.mem_size <= BYTE;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "011001100--------") then
            -- TST.B #imm, @(R0, GBR) [CCii]
            -- (R0 + GBR) & imm, when result is 0, 1 -> T
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = GBR
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10000";
                    -- Y = R0
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "00000";
                    -- Z = X + Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    -- W = MEM[Z] byte
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= BYTE;
                    -- TEMP1 = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= "10100";

                when x"1" =>

                when x"2" =>
                    -- X = TEMP1
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10100";
                    ex.aluiny_sel <= SEL_IMM;
                    ex.logic_sr_func <= ZERO;
                    ex.logic_func <= LOGIC_AND;
                    ex_stall.sr_sel <= SEL_LOGIC;
                    imm_enum <= IMM_U_8_0;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "011001110--------") then
            -- XOR.B #imm, @(R0, GBR) [CEii]
            -- (R0 + GBR) ^ imm -> (R0 + GBR)
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = GBR
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10000";
                    -- Y = R0
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "00000";
                    -- Z = X + Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    -- W = MEM[Z] byte
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= BYTE;
                    -- TEMP1 = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= "10100";

                when x"1" =>
                    -- X = GBR
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10000";
                    -- Y = R0
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "00000";
                    -- Z = X + Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    -- TEMP0 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "10011";

                when x"2" =>
                    -- X = TEMP1
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10100";
                    -- Y = TEMP0
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "10011";
                    -- Z = X xor [:u 8 0]
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_LOGIC;
                    ex.logic_func <= LOGIC_XOR;
                    imm_enum <= IMM_U_8_0;
                    -- MEM[Y] = Z byte
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_YBUS;
                    ex_stall.mem_wdata_sel <= SEL_ZBUS;
                    ex.mem_size <= BYTE;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "011001001--------") then
            -- AND #imm, R0 [C9ii]
            -- R0 & imm->R0
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = R0
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "00000";
                    -- Y = UCONST
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X and Y
                    ex_stall.zbus_sel <= SEL_LOGIC;
                    ex.logic_func <= LOGIC_AND;
                    imm_enum <= IMM_U_8_0;
                    -- R0 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "00000";
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "010001000--------") then
            -- CMP /EQ #imm, R0 [88ii]
            -- When R0=imm,1->T
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = R0
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "00000";
                    -- Y = CONST
                    ex.ybus_sel <= SEL_IMM;
                    ex.logic_sr_func <= ZERO;
                    ex.logic_func <= LOGIC_XOR;
                    ex_stall.sr_sel <= SEL_LOGIC;
                    imm_enum <= IMM_S_8_0;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "011001011--------") then
            -- OR #imm, R0 [CBii]
            -- R0 | imm->R0
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = R0
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "00000";
                    -- Y = UCONST
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X or Y
                    ex_stall.zbus_sel <= SEL_LOGIC;
                    ex.logic_func <= LOGIC_OR;
                    imm_enum <= IMM_U_8_0;
                    -- R0 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "00000";
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "011001000--------") then
            -- TST #imm, R0 [C8ii]
            -- R0 & imm, when result is 0, 1 -> T
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = R0
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "00000";
                    -- Y = UCONST
                    ex.ybus_sel <= SEL_IMM;
                    ex.logic_sr_func <= ZERO;
                    ex.logic_func <= LOGIC_AND;
                    ex_stall.sr_sel <= SEL_LOGIC;
                    imm_enum <= IMM_U_8_0;
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "011001010--------") then
            -- XOR #imm, R0 [CAii]
            -- R0 ^ imm->R0
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = R0
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "00000";
                    -- Y = UCONST
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X xor Y
                    ex_stall.zbus_sel <= SEL_LOGIC;
                    ex.logic_func <= LOGIC_XOR;
                    imm_enum <= IMM_U_8_0;
                    -- R0 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "00000";
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "011000011--------") then
            -- TRAPA #imm [C3ii]
            -- PC/SR -> Stack area, (imm x 4 + VBR) -> PC
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = R15
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "01111";
                    -- Y = SR
                    ex.ybus_sel <= SEL_SR;
                    -- Z = X - 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P4;
                    -- MEM[Z] = Y long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= LONG;
                    -- R15 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "01111";

                when x"1" =>
                    -- X = R15
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "01111";
                    -- Y = PC
                    ex.ybus_sel <= SEL_PC;
                    -- Z = X - 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P4;
                    -- MEM[Z] = Y long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= LONG;
                    -- R15 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "01111";

                when x"2" =>
                    -- X = UCONST * 4
                    ex.xbus_sel <= SEL_IMM;
                    -- Y = VBR
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "10001";
                    -- Z = X + Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_U_8_2;
                    -- W = MEM[Z] long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= LONG;

                when x"3" =>

                when x"4" =>
                    ex_stall.zbus_sel <= SEL_WBUS;
                    -- PC = Z
                    ex_stall.wrpc_z <= '1';

                when x"5" =>
                    id.ifadsel <= '1';
                    id.if_issue <= '1';

                when x"6" =>
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "00111------------") then
            -- ADD #imm, Rn [7nii]
            -- Rn + imm -> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = Rn
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= '0' & op.code(11 downto 8);
                    -- Y = CONST
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X + Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_S_8_0;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "01110------------") then
            -- MOV #imm, Rn [Enii]
            -- imm -> sign extension -> Rn
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- Y = CONST
                    ex.ybus_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_YBUS;
                    imm_enum <= IMM_S_8_0;
                    -- Rn = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= '0' & op.code(11 downto 8);
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "1-----111--------") then
            -- General Illegal [-(-111)dd]
            -- 
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = PC
                    ex.xbus_sel <= SEL_PC;
                    -- Z = X - 2
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P2;
                    -- PC = Z
                    ex_stall.wrpc_z <= '1';

                when x"1" =>
                    -- X = R15
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "01111";
                    -- Y = SR
                    ex.ybus_sel <= SEL_SR;
                    -- Z = X - 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P4;
                    -- MEM[Z] = Y long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= LONG;
                    -- R15 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "01111";

                when x"2" =>
                    -- X = R15
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "01111";
                    -- Y = PC
                    ex.ybus_sel <= SEL_PC;
                    -- Z = X - 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P4;
                    -- MEM[Z] = Y long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= LONG;
                    -- R15 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "01111";

                when x"3" =>
                    -- X = UCONST * 4
                    ex.xbus_sel <= SEL_IMM;
                    -- Y = VBR
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "10001";
                    -- Z = X + Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_U_8_2;
                    -- W = MEM[Z] long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= LONG;

                when x"4" =>

                when x"5" =>
                    ex_stall.zbus_sel <= SEL_WBUS;
                    -- PC = Z
                    ex_stall.wrpc_z <= '1';

                when x"6" =>
                    id.ifadsel <= '1';
                    id.if_issue <= '1';

                when x"7" =>
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "1-----110--------") then
            -- Slot Illegal [-(-110)dd]
            -- 
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = PC
                    ex.xbus_sel <= SEL_PC;
                    -- Z = X + 0
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_ZERO;
                    -- PC = Z
                    ex_stall.wrpc_z <= '1';

                when x"1" =>
                    -- X = R15
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "01111";
                    -- Y = SR
                    ex.ybus_sel <= SEL_SR;
                    -- Z = X - 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P4;
                    -- MEM[Z] = Y long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= LONG;
                    -- R15 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "01111";

                when x"2" =>
                    -- X = R15
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "01111";
                    -- Y = PC
                    ex.ybus_sel <= SEL_PC;
                    -- Z = X - 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P4;
                    -- MEM[Z] = Y long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= LONG;
                    -- R15 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "01111";

                when x"3" =>
                    -- X = UCONST * 4
                    ex.xbus_sel <= SEL_IMM;
                    -- Y = VBR
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "10001";
                    -- Z = X + Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_U_8_2;
                    -- W = MEM[Z] long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= LONG;

                when x"4" =>

                when x"5" =>
                    ex_stall.zbus_sel <= SEL_WBUS;
                    -- PC = Z
                    ex_stall.wrpc_z <= '1';

                when x"6" =>
                    id.ifadsel <= '1';
                    id.if_issue <= '1';

                when x"7" =>
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "1-----011--------") then
            -- Reset CPU [-(-011)dd]
            -- 
            case op.addr(3 downto 0) is
                when x"0" =>

                when x"1" =>
                    event_ack_0 <= '1';

                when x"2" =>
                    -- Y = UCONST * 4
                    ex.ybus_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_YBUS;
                    imm_enum <= IMM_U_8_2;
                    -- W = MEM[Z] long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= LONG;
                    -- TEMP0 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "10011";

                when x"3" =>
                    -- X = TEMP0
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10011";
                    -- Z = X + 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_P4;
                    -- W = MEM[Z] long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= LONG;
                    -- R15 = W
                    wb_stall.wrreg_w <= '1';
                    wb.regnum_w <= "01111";

                when x"4" =>
                    ex_stall.zbus_sel <= SEL_WBUS;
                    -- PC = Z
                    ex_stall.wrpc_z <= '1';

                when x"5" =>
                    -- X = TEMP1
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10100";
                    -- Y = TEMP1
                    ex.ybus_sel <= SEL_REG;
                    ex.regnum_y <= "10100";
                    -- Z = X xor Y
                    ex_stall.zbus_sel <= SEL_LOGIC;
                    ex.logic_func <= LOGIC_XOR;
                    -- VBR = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "10001";
                    id.ifadsel <= '1';
                    id.if_issue <= '1';

                when x"6" =>
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "1-----000--------") then
            -- Interrupt [-(-000)dd]
            -- 
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = PC
                    ex.xbus_sel <= SEL_PC;
                    -- Z = X - 2
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P2;
                    event_ack_0 <= '1';
                    ilevel_cap <= '1';
                    -- PC = Z
                    ex_stall.wrpc_z <= '1';

                when x"1" =>
                    -- X = R15
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "01111";
                    -- Z = (X & FC) + 0
                    ex.aluinx_sel <= SEL_FC;
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_ZERO;
                    -- TEMP0 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "10011";

                when x"2" =>
                    -- X = TEMP0
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10011";
                    -- Y = SR
                    ex.ybus_sel <= SEL_SR;
                    -- Z = X - 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P4;
                    -- MEM[Z] = Y long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= LONG;
                    -- TEMP0 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "10011";

                when x"3" =>
                    -- X = TEMP0
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10011";
                    -- Y = PC
                    ex.ybus_sel <= SEL_PC;
                    -- Z = X - 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P4;
                    -- MEM[Z] = Y long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= LONG;
                    -- TEMP0 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "10011";

                when x"4" =>
                    -- X = VBR
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10001";
                    -- Y = UCONST * 4
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X + Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_U_8_2;
                    -- W = MEM[Z] long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= LONG;

                when x"5" =>
                    -- X = R15
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "01111";
                    -- Z = X - 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    ex_stall.sr_sel <= SEL_INT_MASK;
                    imm_enum <= IMM_P4;
                    -- R15 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "01111";

                when x"6" =>
                    ex_stall.zbus_sel <= SEL_WBUS;
                    -- PC = Z
                    ex_stall.wrpc_z <= '1';

                when x"7" =>
                    -- X = R15
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "01111";
                    -- Z = X - 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P4;
                    -- R15 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "01111";
                    id.ifadsel <= '1';
                    id.if_issue <= '1';

                when x"8" =>
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "1-----001--------") then
            -- Error [-(-001)dd]
            -- 
            case op.addr(3 downto 0) is
                when x"0" =>
                    -- X = PC
                    ex.xbus_sel <= SEL_PC;
                    -- Z = X - 2
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P2;
                    event_ack_0 <= '1';
                    ilevel_cap <= '1';
                    -- PC = Z
                    ex_stall.wrpc_z <= '1';

                when x"1" =>
                    -- X = R15
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "01111";
                    -- Z = (X & FC) + 0
                    ex.aluinx_sel <= SEL_FC;
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_ZERO;
                    -- TEMP0 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "10011";

                when x"2" =>
                    -- X = TEMP0
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10011";
                    -- Y = SR
                    ex.ybus_sel <= SEL_SR;
                    -- Z = X - 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P4;
                    -- MEM[Z] = Y long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= LONG;
                    -- TEMP0 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "10011";

                when x"3" =>
                    -- X = TEMP0
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10011";
                    -- Y = PC
                    ex.ybus_sel <= SEL_PC;
                    -- Z = X - 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P4;
                    -- MEM[Z] = Y long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '1';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex_stall.mem_wdata_sel <= SEL_YBUS;
                    ex.mem_size <= LONG;
                    -- TEMP0 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "10011";

                when x"4" =>
                    -- X = VBR
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "10001";
                    -- Y = UCONST * 4
                    ex.ybus_sel <= SEL_IMM;
                    -- Z = X + Y
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= ADD;
                    imm_enum <= IMM_U_8_2;
                    -- W = MEM[Z] long
                    ex_stall.ma_issue <= '1';
                    ex.ma_wr <= '0';
                    ex_stall.mem_addr_sel <= SEL_ZBUS;
                    ex.mem_size <= LONG;

                when x"5" =>
                    -- X = R15
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "01111";
                    -- Z = X - 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P4;
                    -- R15 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "01111";

                when x"6" =>
                    ex_stall.zbus_sel <= SEL_WBUS;
                    -- PC = Z
                    ex_stall.wrpc_z <= '1';

                when x"7" =>
                    -- X = R15
                    ex.xbus_sel <= SEL_REG;
                    ex.regnum_x <= "01111";
                    -- Z = X - 4
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P4;
                    -- R15 = Z
                    ex_stall.wrreg_z <= '1';
                    ex.regnum_z <= "01111";
                    id.ifadsel <= '1';
                    id.if_issue <= '1';

                when x"8" =>
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        elsif std_match(cond, "1-----010--------") then
            -- Break [-(-010)dd]
            -- 
            case op.addr(3 downto 0) is
                when x"0" =>

                when x"1" =>
                    -- X = PC
                    ex.xbus_sel <= SEL_PC;
                    -- Z = X - 2
                    ex.aluiny_sel <= SEL_IMM;
                    ex_stall.zbus_sel <= SEL_ARITH;
                    ex.arith_func <= SUB;
                    imm_enum <= IMM_P2;
                    -- PC = Z
                    ex_stall.wrpc_z <= '1';
                    debug <= '1';

                when x"2" =>
                    id.ifadsel <= '1';
                    id.if_issue <= '1';

                when x"3" =>
                    id.incpc <= '1';
                    dispatch <= '1';
                    id.if_issue <= '1';

                when others =>

            end case;
        end if;
    end process;
end;
