-- ******************************************************************
-- ******************************************************************
-- ******************************************************************
-- This file is generated. Changing this file directly is probably
-- not what you want to do. Any changes will be overwritten next time
-- the generator is run.
-- ******************************************************************
-- ******************************************************************
-- ******************************************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.decode_pack.all;
use work.cpu2j0_components_pack.all;
use work.mult_pkg.all;
use work.cpu2j0_pack.all;
entity decode is
    port (
        clk : in std_logic;
        enter_debug : in std_logic;
        event_i : in cpu_event_i_t;
        ibit : in std_logic_vector(3 downto 0);
        if_dr : in std_logic_vector(15 downto 0);
        if_stall : in std_logic;
        illegal_delay_slot : in std_logic;
        illegal_instr : in std_logic;
        mac_busy : in std_logic;
        mask_int : in std_logic;
        rst : in std_logic;
        slot : in std_logic;
        t_bcc : in std_logic;
        buses : out buses_ctrl_t;
        copreg : out std_logic_vector(7 downto 0);
        coproc : out coproc_ctrl_t;
        debug : out std_logic;
        event_ack : out std_logic;
        func : out func_ctrl_t;
        instr : out instr_ctrl_t;
        mac : out mac_ctrl_t;
        mem : out mem_ctrl_t;
        pc : out pc_ctrl_t;
        reg : out reg_ctrl_t;
        slp : out std_logic;
        sr : out sr_ctrl_t
    );
end;
architecture arch of decode is
    signal debug_o : std_logic;
    signal delay_jump : std_logic;
    signal dispatch : std_logic;
    signal event_ack_0 : std_logic;
    signal ex : pipeline_ex_t;
    signal ex_stall : pipeline_ex_stall_t;
    signal id : pipeline_id_t;
    signal ilevel_cap : std_logic;
    signal mac_stall_sense : std_logic;
    signal maskint_next : std_logic;
    signal maskint_o : std_logic;
    signal next_id_stall : std_logic;
    signal op : operation_t;
    signal pipeline_c : pipeline_t;
    signal pipeline_r : pipeline_t;
    signal wb : pipeline_wb_t;
    signal wb_stall : pipeline_wb_stall_t;
    constant STAGE_EX_RESET : pipeline_ex_t := (imm_val => x"00000000", xbus_sel => SEL_IMM, ybus_sel => SEL_IMM, regnum_z => "00000", regnum_x => "00000", regnum_y => "00000", alumanip => SWAP_BYTE, aluinx_sel => SEL_XBUS, aluiny_sel => SEL_YBUS, arith_func => ADD, arith_ci_en => '0', arith_sr_func => ZERO, logic_func => LOGIC_NOT, logic_sr_func => ZERO, mac_busy => '0', ma_wr => '0', mem_lock => '0', mem_size => BYTE, coproc_cmd => NOP);
    constant STAGE_WB_RESET : pipeline_wb_t := (regnum_w => "00000", mac_busy => '0');
    constant STAGE_EX_STALL_RESET : pipeline_ex_stall_t := (wrpc_z => '0', wrsr_z => '0', ma_issue => '0', wrpr_pc => '0', zbus_sel => SEL_ARITH, sr_sel => SEL_PREV, t_sel => SEL_CLEAR, mem_addr_sel => SEL_XBUS, mem_wdata_sel => SEL_ZBUS, wrreg_z => '0', wrmach => '0', wrmacl => '0', shiftfunc => LOGIC, mulcom1 => '0', mulcom2 => NOP, macsel1 => SEL_XBUS, macsel2 => SEL_YBUS);
    constant STAGE_WB_STALL_RESET : pipeline_wb_stall_t := (mulcom1 => '0', wrmach => '0', wrmacl => '0', wrreg_w => '0', wrsr_w => '0', macsel1 => SEL_XBUS, macsel2 => SEL_YBUS, mulcom2 => NOP, cpu_data_mux => DBUS);
    constant PIPELINE_RESET : pipeline_t := (ex1 => STAGE_EX_RESET, ex1_stall => STAGE_EX_STALL_RESET, wb1 => STAGE_WB_RESET, wb2 => STAGE_WB_RESET, wb3 => STAGE_WB_RESET, wb1_stall => STAGE_WB_STALL_RESET, wb2_stall => STAGE_WB_STALL_RESET, wb3_stall => STAGE_WB_STALL_RESET);
begin
    maskint_o <= (mask_int or maskint_next);
    debug <= debug_o;
    core : decode_core
        port map (
            clk => clk,
            debug => debug_o,
            delay_jump => delay_jump,
            dispatch => dispatch,
            enter_debug => enter_debug,
            event_ack_0 => event_ack_0,
            event_i => event_i,
            ex => ex,
            ex_stall => ex_stall,
            ibit => ibit,
            id => id,
            if_dr => if_dr,
            if_stall => if_stall,
            ilevel_cap => ilevel_cap,
            illegal_delay_slot => illegal_delay_slot,
            illegal_instr => illegal_instr,
            mac_busy => mac_busy,
            mac_stall_sense => mac_stall_sense,
            maskint_next => maskint_o,
            p => pipeline_r,
            rst => rst,
            slot => slot,
            t_bcc => t_bcc,
            event_ack => event_ack,
            if_issue => instr.issue,
            ifadsel => instr.addr_sel,
            ilevel => sr.ilevel,
            incpc => pc.inc,
            next_id_stall => next_id_stall,
            op => op
        );
    table : decode_table
        port map (
            clk => clk,
            next_id_stall => next_id_stall,
            op => op,
            t_bcc => t_bcc,
            debug => debug_o,
            delay_jump => delay_jump,
            dispatch => dispatch,
            event_ack_0 => event_ack_0,
            ex => ex,
            ex_stall => ex_stall,
            id => id,
            ilevel_cap => ilevel_cap,
            mac_s_latch => mac.s_latch,
            mac_stall_sense => mac_stall_sense,
            maskint_next => maskint_next,
            slp => slp,
            wb => wb,
            wb_stall => wb_stall
        );
    -- pipeline controls signals
    process(ex, ex_stall, wb, wb_stall, next_id_stall, pipeline_r, slot)
        variable pipe : pipeline_t;
    begin
        pipe := pipeline_r;
        if slot = '1' then
            pipe.wb3 := pipe.wb2;
            pipe.wb2 := pipe.wb1;
            pipe.wb1 := wb;
            pipe.ex1 := ex;
            pipe.wb3_stall := pipe.wb2_stall;
            pipe.wb2_stall := pipe.wb1_stall;
            if next_id_stall = '1' then
                pipe.ex1_stall := STAGE_EX_STALL_RESET;
                pipe.wb1_stall := STAGE_WB_STALL_RESET;
            else
                pipe.ex1_stall := ex_stall;
                pipe.wb1_stall := wb_stall;
            end if;
        end if;
        pipeline_c <= pipe;
    end process;
    process(clk, rst)
    begin
        if rst = '1' then
            pipeline_r <= PIPELINE_RESET;
        elsif (clk = '1' and clk'event) then
            pipeline_r <= pipeline_c;
        end if;
    end process;
    -- assign outputs
    func.alu.inx_sel <= pipeline_r.ex1.aluinx_sel;
    func.alu.iny_sel <= pipeline_r.ex1.aluiny_sel;
    func.alu.manip <= pipeline_r.ex1.alumanip;
    func.arith.ci_en <= pipeline_r.ex1.arith_ci_en;
    func.arith.func <= pipeline_r.ex1.arith_func;
    func.arith.sr <= pipeline_r.ex1.arith_sr_func;
    buses.imm_val <= pipeline_r.ex1.imm_val;
    func.logic_func <= pipeline_r.ex1.logic_func;
    func.logic_sr <= pipeline_r.ex1.logic_sr_func;
    mem.wr <= pipeline_r.ex1.ma_wr;
    mem.lock <= pipeline_r.ex1.mem_lock;
    mem.size <= pipeline_r.ex1.mem_size;
    reg.num_w <= pipeline_r.wb3.regnum_w;
    reg.num_x <= pipeline_r.ex1.regnum_x;
    reg.num_y <= pipeline_r.ex1.regnum_y;
    reg.num_z <= pipeline_r.ex1.regnum_z;
    buses.x_sel <= pipeline_r.ex1.xbus_sel;
    buses.y_sel <= pipeline_r.ex1.ybus_sel;
    mem.issue <= pipeline_r.ex1_stall.ma_issue;
    mem.addr_sel <= pipeline_r.ex1_stall.mem_addr_sel;
    mem.wdata_sel <= pipeline_r.ex1_stall.mem_wdata_sel;
    func.shift <= pipeline_r.ex1_stall.shiftfunc;
    sr.t <= pipeline_r.ex1_stall.t_sel;
    pc.wr_z <= pipeline_r.ex1_stall.wrpc_z;
    pc.wrpr <= pipeline_r.ex1_stall.wrpr_pc;
    reg.wr_z <= pipeline_r.ex1_stall.wrreg_z;
    buses.z_sel <= pipeline_r.ex1_stall.zbus_sel;
    coproc.cpu_data_mux <= pipeline_r.wb2_stall.cpu_data_mux;
    reg.wr_w <= pipeline_r.wb3_stall.wrreg_w;
    -- assign combined outputs
    mac.com1 <= (pipeline_r.ex1_stall.mulcom1 or pipeline_r.wb3_stall.mulcom1);
    mac.wrmach <= (pipeline_r.ex1_stall.wrmach or pipeline_r.wb3_stall.wrmach);
    mac.wrmacl <= (pipeline_r.ex1_stall.wrmacl or pipeline_r.wb3_stall.wrmacl);
    mac.sel1 <= pipeline_r.ex1_stall.macsel1 when (pipeline_r.ex1_stall.mulcom1 or pipeline_r.ex1_stall.wrmach) = '1' else pipeline_r.wb3_stall.macsel1;
    mac.sel2 <= pipeline_r.ex1_stall.macsel2 when (pipeline_r.ex1_stall.mulcom2 /= NOP or pipeline_r.ex1_stall.wrmacl = '1') else pipeline_r.wb3_stall.macsel2;
    mac.com2 <= pipeline_r.ex1_stall.mulcom2 when pipeline_r.ex1_stall.mulcom2 /= NOP else pipeline_r.wb3_stall.mulcom2;
    sr.sel <= SEL_WBUS when pipeline_r.wb3_stall.wrsr_w = '1' else pipeline_r.ex1_stall.sr_sel;
    coproc.coproc_cmd <= CSTS when (pipeline_r.ex1.coproc_cmd = STS and pipeline_r.wb1_stall.cpu_data_mux = DBUS) else pipeline_r.ex1.coproc_cmd;
    copreg <= op.code(11 downto 4);
end;
