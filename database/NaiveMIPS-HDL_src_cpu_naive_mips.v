`include "defs.v"
`default_nettype none

module naive_mips(/*autoport*/
//output
      ibus_address,
      ibus_byteenable,
      ibus_read,
      ibus_write,
      ibus_wrdata,
      dbus_address,
      dbus_byteenable,
      dbus_read,
      dbus_write,
      dbus_uncached_read,
      dbus_uncached_write,
      dbus_wrdata,
      dbus_uncached,
      dbus_dcache_inv_wb,
      dbus_icache_inv,
//input
      rst_n,
      clk,
      ibus_rddata,
      ibus_stall,
      dbus_rddata,
      dbus_rddata_uncached,
      dbus_uncached_stall,
      dbus_stall,
      dbus_iv_stall,
      hardware_int_in);

parameter WITH_CACHE = 0;
parameter WITH_TLB = 0;
parameter BUS_READ_1CYCLE = 0;

input wire rst_n;
input wire clk;

output wire[31:0] ibus_address;
output wire[3:0] ibus_byteenable;
output wire ibus_read;
output wire ibus_write;
output wire[31:0] ibus_wrdata;
input wire[31:0] ibus_rddata;
input wire ibus_stall;

output wire[31:0] dbus_address;
output wire[3:0] dbus_byteenable;
output wire dbus_read;
output wire dbus_write;
output wire dbus_uncached_read;
output wire dbus_uncached_write;
output wire[31:0] dbus_wrdata;
input wire[31:0] dbus_rddata;
input wire[31:0] dbus_rddata_uncached;
input wire dbus_uncached_stall;
input wire dbus_stall;
input wire dbus_iv_stall;
output wire dbus_uncached;
output wire dbus_dcache_inv_wb;
output wire dbus_icache_inv;

input wire[4:0] hardware_int_in;

reg flush;
reg en_pc,en_ifid,en_idex,en_exmm,en_mmwb;
reg[31:0] exp_entry_addr;

wire [31:0]if_pc;
wire [31:0]if_iaddr_phy;
wire if_iaddr_exp_miss;
wire if_iaddr_exp_illegal;
wire if_iaddr_exp_invalid;
wire if_valid_iaddr;
wire [7:0]if_asid;
wire if_in_exl;
reg if_read_hold;
reg [31:0]if_iaddr_phy_hold;

wire [15:0]id_immediate;
wire [1:0]id_op_type;
wire [7:0]id_op;
reg [31:0]id_inst, id_ibus_rddata;
reg [31:0]id_inst_keep;
wire [4:0]id_reg_s;
wire [4:0]id_reg_d;
wire id_flag_unsigned;
wire [31:0]id_address;
wire [4:0]id_reg_t;
wire [31:0]id_branch_address;
wire id_is_branch;
wire id_branch_taken;
reg id_in_delayslot;
reg [31:0]id_pc_value;
reg id_real_inst;
reg id_valid_iaddr;
reg id_iaddr_exp_miss;
reg id_iaddr_exp_illegal;
reg id_iaddr_exp_invalid;
reg [7:0]id_iaddr_exp_asid;
reg id_iaddr_exp_exl;
reg id_update_flag,id_update_flag_last;

wire [31:0] id_reg_s_value_from_regs, id_reg_t_value_from_regs;
wire [31:0] id_reg_s_value, id_reg_t_value;
wire [63:0] hilo_value_from_reg;

reg [15:0]ex_immediate;
reg [1:0]ex_op_type;
reg [7:0]ex_op;
reg [4:0]ex_reg_s;
reg [4:0]ex_reg_d;
reg ex_flag_unsigned;
reg [31:0]ex_address;
reg [4:0]ex_reg_t;
reg [31:0]ex_reg_s_value;
reg [31:0]ex_reg_t_value;
wire [1:0]ex_mem_access_op;
wire [2:0]ex_mem_access_sz;
wire [31:0]ex_data_o;
wire [31:0]ex_mem_addr;
wire [4:0]ex_reg_addr;
wire [63:0]ex_reg_hilo_o;
wire [63:0]ex_reg_hilo_value;
wire ex_overflow;
wire ex_syscall;
wire ex_break;
wire ex_eret;
wire ex_we_hilo;
wire ex_stall;
wire ex_we_cp0;
wire [4:0]ex_cp0_wraddr;
wire [4:0]ex_cp0_rdaddr;
wire [2:0]ex_cp0_sel;
wire [31:0]ex_cp0_value;
reg ex_in_delayslot;
reg [31:0]ex_pc_value;
reg ex_real_inst;
reg ex_iaddr_exp_miss;
reg ex_iaddr_exp_illegal;
reg ex_iaddr_exp_invalid;
wire ex_we_tlb;
wire ex_is_priv_inst;
wire ex_probe_tlb;
reg [7:0]ex_iaddr_exp_asid;
reg ex_iaddr_exp_exl;
wire ex_inv_wb_dcache;
wire ex_inv_icache;
wire [63:0]ex_result_mult;
wire ex_sign_mult;
wire ex_we_hilo_mult;

reg [63:0]mm_result_mult;
reg mm_sign_mult;
reg mm_we_hilo_mult;
wire mm_mem_wr;
reg mm_in_delayslot;
reg mm_overflow;
reg mm_syscall;
reg mm_break;
reg mm_eret;
reg mm_invalid_inst;
wire [31:0]mm_mem_data_o;
reg [2:0]mm_mem_access_sz;
reg [4:0]mm_reg_addr_i;
wire [31:0]mm_mem_address;
wire [3:0]mm_mem_byte_en;
wire mm_mem_rd;
reg [1:0]mm_mem_access_op;
reg [31:0]mm_data_i;
wire [31:0]mm_data_o;
reg [31:0]mm_addr_i;
reg mm_we_hilo;
reg [63:0]mm_reg_hilo_from_ex;
wire [63:0]mm_reg_hilo;
reg mm_flag_unsigned;
reg mm_we_cp0;
reg [4:0]mm_cp0_wraddr;
reg [2:0]mm_cp0_wrsel;
reg [31:0]mm_pc_value;
reg mm_real_inst;
wire mm_daddr_exp_miss;
reg mm_iaddr_exp_miss;
reg mm_iaddr_exp_illegal;
reg mm_iaddr_exp_invalid;
wire mm_daddr_exp_illegal;
wire mm_daddr_dirty;
wire mm_daddr_exp_invalid;
wire mm_alignment_err;
reg mm_we_tlb;
wire mm_stall;
reg mm_is_priv_inst;
reg mm_probe_tlb;
wire[31:0] mm_probe_result;
reg [7:0]mm_iaddr_exp_asid;
reg mm_iaddr_exp_exl;
reg mm_inv_wb_dcache;
reg mm_inv_icache;
reg [7:0] mm_interrupt_flags;
wire mm_exception_detected;
wire[31:0] mm_exception_handler;
wire mm_dbus_uncached;


wire wb_reg_we;
reg wb_flag_unsigned;
reg [31:0]wb_addr_i;
reg [31:0]wb_data_i, wb_mem_data_i;
reg [31:0]wb_dbus_rddata, wb_dbus_rddata_uncached;
reg wb_dbus_uncached;
wire[31:0]wb_data_o;
reg [2:0]wb_mem_access_sz;
reg [1:0]wb_mem_access_op;
reg [4:0]wb_reg_addr_i;
reg [63:0]wb_reg_hilo;
reg wb_we_hilo;
reg wb_we_tlb;
reg wb_probe_tlb;
reg[31:0] wb_probe_result;
reg wb_exception_detected;

wire cp0_allow_int;
wire[1:0] cp0_software_int;
wire cp0_clean_exl;
wire cp0_exp_en;
wire cp0_exp_bd;
wire cp0_exp_asid_we;
wire cp0_badv_we;
wire[4:0] cp0_exp_code;
wire[7:0] cp0_exp_asid;
wire[31:0] cp0_exp_badv;
wire[31:0] cp0_exp_epc;
wire[19:0] cp0_ebase;
wire[31:0] cp0_epc;
wire[89:0] cp0_tlb_config;
wire cp0_user_mode;
wire timer_int;
reg[5:0] hardware_int;
reg[5:0] hardware_int_in_sync;
wire[7:0] cp0_interrupt_mask;
wire cp0_special_int_vec;
wire cp0_boot_exp_vec;
wire[7:0]cp0_asid;
wire cp0_in_exl;
wire cp0_kseg0_uncached;

wire debugger_flush = 1'b0;
wire debugger_stall = 1'b0;
wire[31:0] debugger_reg_val;
wire[4:0] debugger_reg_addr = 5'h0;
wire[31:0] debugger_cp0_val;
wire[4:0] debugger_cp0_addr = 5'h0;
wire[63:0] debugger_hilo_val;
wire[31:0] debugger_new_pc = 32'h0;
wire debugger_pc_reset = 1'b0;

regs main_regs(/*autoinst*/
         .rdata1(id_reg_s_value_from_regs),
         .rdata2(id_reg_t_value_from_regs),
         .rdata3(debugger_reg_val),
         .clk(clk),
         .rst_n(rst_n),
         .we(wb_reg_we),
         .waddr(wb_reg_addr_i),
         .wdata(wb_data_o),
         .raddr1(id_reg_s),
         .raddr2(id_reg_t),
         .raddr3(debugger_reg_addr));

mmu_top #(.WITH_TLB(WITH_TLB)) mmu(/*autoinst*/
      .data_address_o(dbus_address),
      .inst_address_o(if_iaddr_phy),
      .data_uncached(mm_dbus_uncached),
      .inst_uncached(),
      .data_exp_miss(mm_daddr_exp_miss),
      .inst_exp_miss(if_iaddr_exp_miss),
      .data_exp_illegal(mm_daddr_exp_illegal),
      .inst_exp_illegal(if_iaddr_exp_illegal),
      .data_exp_dirty(mm_daddr_dirty),
      .inst_exp_invalid(if_iaddr_exp_invalid),
      .data_exp_invalid(mm_daddr_exp_invalid),
      .rst_n(rst_n),
      .clk(clk),
      .data_address_i(mm_mem_address),
      .inst_address_i(if_pc),
      .data_en(mm_mem_rd | mm_mem_wr | mm_inv_wb_dcache | mm_inv_icache),
      .inst_en(1'b1),
      .tlb_config(cp0_tlb_config),
      .tlbwi(wb_we_tlb & ~wb_exception_detected),
      .tlbp(mm_probe_tlb),
      .tlbp_result(mm_probe_result),
      .cp0_kseg0_uncached(cp0_kseg0_uncached),
      .asid(cp0_asid),
      .user_mode(cp0_user_mode));

assign ibus_address = if_read_hold ? if_iaddr_phy_hold : if_iaddr_phy;
assign ibus_byteenable = 4'b1111;
assign ibus_read = if_valid_iaddr|if_read_hold; //keep ibus read signal asserted while ibus stall
assign ibus_write = 1'b0;
assign ibus_wrdata = 32'b0;
assign if_valid_iaddr = ~(if_iaddr_exp_miss|if_iaddr_exp_illegal|if_iaddr_exp_invalid);
assign if_in_exl = cp0_in_exl;
assign if_asid = cp0_asid;

assign dbus_uncached = WITH_CACHE ? mm_dbus_uncached : 1'b0; //xxx_uncached unavailable if cache is not enabled
assign dbus_byteenable = mm_mem_byte_en;
assign dbus_read = mm_mem_rd & ~dbus_uncached & ~mm_exception_detected;
assign dbus_write = mm_mem_wr & ~dbus_uncached & ~mm_exception_detected;
assign dbus_uncached_read = mm_mem_rd & dbus_uncached & ~mm_exception_detected;
assign dbus_uncached_write = mm_mem_wr & dbus_uncached & ~mm_exception_detected;
assign dbus_dcache_inv_wb = mm_inv_wb_dcache & ~mm_exception_detected;
assign dbus_icache_inv = mm_inv_icache & ~mm_exception_detected;
assign dbus_wrdata= mm_mem_data_o;
assign mm_stall = dbus_stall | dbus_uncached_stall | (dbus_iv_stall & dbus_icache_inv);

assign ex_reg_hilo_value = mm_we_hilo ? mm_reg_hilo :
  (wb_we_hilo ? wb_reg_hilo : hilo_value_from_reg);

always @(posedge clk) begin : proc_hardware_int_in_sync
  hardware_int_in_sync <= {timer_int,hardware_int_in};
  hardware_int <= hardware_int_in_sync;
end

always @(posedge clk) begin
    if (!rst_n) begin
        flush <= 1'b0;
    end
    else begin
        if(mm_exception_detected) begin 
            exp_entry_addr <= mm_exception_handler;
            flush <= 1'b1;
        end
        else if(en_pc) begin //wait until ibus transaction finished
            flush <= 1'b0;
        end
    end
end

always @(*) begin
    if(mm_stall || debugger_stall) begin
        {en_pc,en_ifid,en_idex,en_exmm,en_mmwb} <= 5'b00000;
    end else if(ex_stall || (ex_op==`OP_MFC0 && mm_we_cp0)) begin
        {en_pc,en_ifid,en_idex,en_exmm,en_mmwb} <= 5'b00001;
    end else if(ex_mem_access_op == `ACCESS_OP_M2R &&
      (ex_reg_addr == id_reg_s || ex_reg_addr == id_reg_t)) begin
        {en_pc,en_ifid,en_idex,en_exmm,en_mmwb} <= 5'b00011;
    end else if(mm_mem_access_op == `ACCESS_OP_M2R &&
      (mm_reg_addr_i == id_reg_s || mm_reg_addr_i == id_reg_t)) begin
        {en_pc,en_ifid,en_idex,en_exmm,en_mmwb} <= 5'b00011;
    end else if(ibus_stall) begin
        {en_pc,en_ifid,en_idex,en_exmm,en_mmwb} <= 5'b00011;
    end else begin
        {en_pc,en_ifid,en_idex,en_exmm,en_mmwb} <= 5'b11111;
    end
end

pc pc_instance(/*autoinst*/
         .pc_reg(if_pc),
         .rst_n(rst_n),
         .clk(clk),
         .enable(en_pc),
         .is_exception(flush),
         .exception_new_pc(exp_entry_addr),
         .is_debug    (debugger_flush),
         .debug_reset (debugger_pc_reset),
         .debug_new_pc(debugger_new_pc),
         .is_branch(id_branch_taken),
         .branch_address(id_branch_address));

always @(posedge clk) begin : proc_if_read_hold
    if(~rst_n) begin
        if_read_hold <= 1'b0;
    end else begin
        if_read_hold <= ibus_read & ibus_stall;
        if(!if_read_hold && ibus_read) //first cycle of ibus read transaction
            if_iaddr_phy_hold <= if_iaddr_phy;
    end
end

cp0 cp0_instance(/*autoinst*/
     .data_o(ex_cp0_value),
     .clk(clk),
     .rst_n(rst_n),
     .debugger_rd_addr(debugger_cp0_addr),
     .debugger_rd_sel(3'b0),
     .debugger_data_o(debugger_cp0_val),
     .rd_addr(ex_cp0_rdaddr),
     .rd_sel(ex_cp0_sel),
     .we(mm_we_cp0 & ~mm_exception_detected),
     .wr_addr(mm_cp0_wraddr),
     .wr_sel(mm_cp0_wrsel),
     .data_i(mm_data_i),
     .user_mode(cp0_user_mode),
     .ebase(cp0_ebase),
     .epc(cp0_epc),
     .tlb_config(cp0_tlb_config),
     .timer_int(timer_int),
     .hardware_int(hardware_int),
     .software_int_o(cp0_software_int),
     .allow_int(cp0_allow_int),
     .special_int_vec(cp0_special_int_vec),
     .boot_exp_vec   (cp0_boot_exp_vec),
     .asid           (cp0_asid),
     .in_exl         (cp0_in_exl),
     .kseg0_uncached (cp0_kseg0_uncached),
     .interrupt_mask (cp0_interrupt_mask),
     .en_exp_i(cp0_exp_en),
     .clean_exl(cp0_clean_exl),
     .we_probe       (wb_probe_tlb & ~wb_exception_detected),
     .probe_result(wb_probe_result),
     .exp_bd(cp0_exp_bd),
     .exp_epc(cp0_exp_epc),
     .exp_code(cp0_exp_code),
     .exp_asid(cp0_exp_asid),
     .exp_asid_we(cp0_exp_asid_we),
     .exp_badv_we(cp0_badv_we),
     .exp_bad_vaddr(cp0_exp_badv)
);

always @(posedge clk) begin
    if (!rst_n || (!en_ifid && en_idex) || flush) begin
        id_pc_value <= 32'b0;
        id_ibus_rddata <= 32'h0;
        id_real_inst <= 1'b0;
        id_valid_iaddr <= 1'b0;
        id_in_delayslot <= 1'b0;
        id_iaddr_exp_miss <= 1'b0;
        id_iaddr_exp_illegal <= 1'b0;
        id_iaddr_exp_invalid <= 1'b0;
        id_iaddr_exp_asid <= 8'b0;
        id_iaddr_exp_exl <= 1'b0;
        id_update_flag <= 1'b0;
    end
    else if(en_ifid) begin
        id_pc_value <= if_pc;
        id_ibus_rddata <= ibus_rddata;
        id_real_inst <= 1'b1;
        id_valid_iaddr <= if_valid_iaddr;
        id_in_delayslot <= id_is_branch;
        id_iaddr_exp_miss <= if_iaddr_exp_miss;
        id_iaddr_exp_illegal <= if_iaddr_exp_illegal;
        id_iaddr_exp_invalid <= if_iaddr_exp_invalid;
        id_iaddr_exp_asid <= if_asid;
        id_iaddr_exp_exl <= if_in_exl;
        id_update_flag <= ~id_update_flag;
    end
end

always @(posedge clk) begin
    id_update_flag_last <= id_update_flag;
    if(id_update_flag != id_update_flag_last)
      id_inst_keep <= id_inst;
end


always @(*) begin
    if(BUS_READ_1CYCLE) begin 
        id_inst = (id_valid_iaddr ? (id_update_flag!=id_update_flag_last ? ibus_rddata : id_inst_keep) : 32'h0);
    end else begin 
        id_inst = id_valid_iaddr ? id_ibus_rddata : 32'h0;
    end
end

id #(.WITH_TLB(WITH_TLB),.WITH_CACHE(WITH_CACHE)) stage_id(/*autoinst*/
            .op(id_op),
            .op_type(id_op_type),
            .reg_s(id_reg_s),
            .reg_t(id_reg_t),
            .reg_d(id_reg_d),
            .immediate(id_immediate),
            .flag_unsigned(id_flag_unsigned),
            .inst(id_inst),
            .pc_value(id_pc_value));

reg_val_mux reg_val_mux_s(/*autoinst*/
          .value_o(id_reg_s_value),
          .reg_addr(id_reg_s),
          .value_from_regs(id_reg_s_value_from_regs),
          .addr_from_ex(ex_reg_addr),
          .value_from_ex(ex_data_o),
          .access_op_from_ex(ex_mem_access_op),
          .addr_from_mm(mm_reg_addr_i),
          .value_from_mm(mm_data_i),
          .access_op_from_mm(mm_mem_access_op),
          .addr_from_wb(wb_reg_addr_i),
          .value_from_wb(wb_data_o),
          .write_enable_from_wb(wb_reg_we));

reg_val_mux reg_val_mux_t(/*autoinst*/
          .value_o(id_reg_t_value),
          .reg_addr(id_reg_t),
          .value_from_regs(id_reg_t_value_from_regs),
          .addr_from_ex(ex_reg_addr),
          .value_from_ex(ex_data_o),
          .access_op_from_ex(ex_mem_access_op),
          .addr_from_mm(mm_reg_addr_i),
          .value_from_mm(mm_data_i),
          .access_op_from_mm(mm_mem_access_op),
          .addr_from_wb(wb_reg_addr_i),
          .value_from_wb(wb_data_o),
          .write_enable_from_wb(wb_reg_we));

branch branch_detect(/*autoinst*/
         .is_branch(id_is_branch),
         .branch_taken  (id_branch_taken),
         .branch_address(id_branch_address),
         .return_address(id_address),
         .inst(id_inst),
         .pc_value(id_pc_value),
         .reg_s_value(id_reg_s_value),
         .reg_t_value(id_reg_t_value));

always @(posedge clk) begin
    if (!rst_n || (!en_idex && en_exmm) || flush) begin
        ex_op <= `OP_SLL;
        ex_op_type <= `OPTYPE_R;
        ex_reg_s <= 5'b0;
        ex_reg_t <= 5'b0;
        ex_reg_d <= 5'b0;
        ex_flag_unsigned <= 1'b0;
        ex_reg_s_value <= 32'b0;
        ex_reg_t_value <= 32'b0;
        ex_immediate <= 16'b0;
        ex_address <= 32'b0;
        ex_in_delayslot <= 1'b0;
        ex_pc_value <= 32'b0;
        ex_real_inst <= 1'b0;
        ex_iaddr_exp_miss <= 1'b0;
        ex_iaddr_exp_illegal <= 1'b0;
        ex_iaddr_exp_invalid <= 1'b0;
        ex_iaddr_exp_asid <= 8'b0;
        ex_iaddr_exp_exl <= 1'b0;
    end
    else if(en_idex) begin
        ex_immediate <= id_immediate;
        ex_op_type <= id_op_type;
        ex_op <= id_op;
        ex_reg_s <= id_reg_s;
        ex_reg_t <= id_reg_t;
        ex_reg_d <= id_reg_d;
        ex_flag_unsigned <= id_flag_unsigned;
        ex_address <= id_address;
        ex_reg_s_value <= id_reg_s_value;
        ex_reg_t_value <= id_reg_t_value;
        ex_in_delayslot <= id_in_delayslot;
        ex_pc_value <= id_pc_value;
        ex_real_inst <= id_real_inst;
        ex_iaddr_exp_miss <= id_iaddr_exp_miss;
        ex_iaddr_exp_illegal <= id_iaddr_exp_illegal;
        ex_iaddr_exp_invalid <= id_iaddr_exp_invalid;
        ex_iaddr_exp_asid <= id_iaddr_exp_asid;
        ex_iaddr_exp_exl <= id_iaddr_exp_exl;
    end
end

ex stage_ex(/*autoinst*/
            .mem_access_op(ex_mem_access_op),
            .mem_access_sz(ex_mem_access_sz),
            .data_o(ex_data_o),
            .reg_addr(ex_reg_addr),
            .mem_addr(ex_mem_addr),
            .op(ex_op),
            .op_type(ex_op_type),
            .address(ex_address),
            .reg_s(ex_reg_s),
            .reg_t(ex_reg_t),
            .reg_d(ex_reg_d),
            .reg_s_value(ex_reg_s_value),
            .reg_t_value(ex_reg_t_value),
            .immediate(ex_immediate),
            .flag_unsigned(ex_flag_unsigned),
            .overflow(ex_overflow),
            .syscall(ex_syscall),
            .break_inst(ex_break),
            .eret(ex_eret),
            .reg_hilo_o(ex_reg_hilo_o),
            .we_hilo(ex_we_hilo),
            .reg_hilo_value(ex_reg_hilo_value),
            .result_mult    (ex_result_mult),
            .sign_mult      (ex_sign_mult),
            .we_hilo_mult   (ex_we_hilo_mult),
            .we_tlb(ex_we_tlb),
            .clk(clk),
            .rst_n(rst_n),
            .exception_flush(flush),
            .stall(ex_stall),
            .we_cp0(ex_we_cp0),
            .probe_tlb(ex_probe_tlb),
            .is_priv_inst(ex_is_priv_inst),
            .inv_wb_dcache(ex_inv_wb_dcache),
            .inv_icache(ex_inv_icache),
            .cp0_wr_addr(ex_cp0_wraddr),
            .cp0_rd_addr(ex_cp0_rdaddr),
            .cp0_sel(ex_cp0_sel),
            .reg_cp0_value(ex_cp0_value));

hilo_reg hilo(/*autoinst*/
      .rdata(hilo_value_from_reg),
      .clk(clk),
      .rst_n(rst_n),
      .we(wb_we_hilo & ~wb_exception_detected),
      .wdata(wb_reg_hilo));

always @(posedge clk) begin
    // add `mm_exception_detected` signal here to disable possible exception 
    // caused by following instruction or interrupt
    if (!rst_n || (!en_exmm && en_mmwb) || flush || mm_exception_detected) begin
        mm_mem_access_op <= `ACCESS_OP_D2R;
        mm_mem_access_sz <= `ACCESS_SZ_WORD;
        mm_data_i <= 32'b0;
        mm_reg_addr_i <= 5'b0;
        mm_addr_i <= 32'b0;
        // mm_reg_hilo_from_ex <= 64'b0;
        mm_we_hilo <= 1'b0;
        mm_flag_unsigned <= 1'b0;
        mm_we_cp0 <= 1'b0;
        mm_cp0_wraddr <= 5'b0;
        mm_overflow <= 1'b0;
        mm_in_delayslot <= 1'b0;
        mm_pc_value <= 32'b0;
        mm_real_inst <= 1'b0;
        mm_eret <= 1'b0;
        mm_syscall <= 1'b0;
        mm_break <= 1'b0;
        mm_invalid_inst <= 1'b0;
        mm_iaddr_exp_miss <= 1'b0;
        mm_iaddr_exp_illegal <= 1'b0;
        mm_iaddr_exp_invalid <= 1'b0;
        mm_we_tlb <= 1'b0;
        mm_is_priv_inst <= 1'b0;
        mm_cp0_wrsel <= 3'b0;
        mm_probe_tlb <= 1'b0;
        mm_iaddr_exp_asid <= 8'b0;
        mm_iaddr_exp_exl <= 1'b0;
        mm_inv_icache <= 1'b0;
        mm_inv_wb_dcache <= 1'b0;
        mm_interrupt_flags <= 8'h0;
        // mm_sign_mult <= 1'b0;
        // mm_result_mult <= 32'h0;
        mm_we_hilo_mult <= 1'b0;
    end
    else if(en_exmm) begin
        // $display("mm_pc_value<=%x", ex_pc_value);
        mm_mem_access_op <= ex_mem_access_op;
        mm_mem_access_sz <= ex_mem_access_sz;
        mm_data_i <= ex_data_o;
        mm_reg_addr_i <= ex_reg_addr;
        mm_addr_i <= ex_mem_addr;
        mm_reg_hilo_from_ex <= ex_reg_hilo_o;
        mm_we_hilo <= ex_we_hilo;
        mm_flag_unsigned <= ex_flag_unsigned;
        mm_we_cp0 <= ex_we_cp0;
        mm_cp0_wraddr <= ex_cp0_wraddr;
        mm_overflow <= ex_overflow;
        mm_in_delayslot <= ex_in_delayslot;
        mm_pc_value <= ex_pc_value;
        mm_real_inst <= ex_real_inst;
        mm_eret <= ex_eret;
        mm_syscall <= ex_syscall;
        mm_break <= ex_break;
        mm_invalid_inst <= ex_op == `OP_INVAILD;
        mm_iaddr_exp_miss <= ex_iaddr_exp_miss;
        mm_iaddr_exp_illegal <= ex_iaddr_exp_illegal;
        mm_iaddr_exp_invalid <= ex_iaddr_exp_invalid;
        mm_we_tlb <= ex_we_tlb;
        mm_is_priv_inst <= ex_is_priv_inst;
        mm_cp0_wrsel <= ex_cp0_sel;
        mm_probe_tlb <= ex_probe_tlb;
        mm_iaddr_exp_asid <= ex_iaddr_exp_asid;
        mm_iaddr_exp_exl <= ex_iaddr_exp_exl;
        mm_inv_icache <= ex_inv_icache;
        mm_inv_wb_dcache <= ex_inv_wb_dcache;
        mm_interrupt_flags <= {hardware_int,cp0_software_int} & cp0_interrupt_mask;
        mm_sign_mult <= ex_sign_mult;
        mm_result_mult <= ex_result_mult;
        mm_we_hilo_mult <= ex_we_hilo_mult;
    end
end

assign mm_reg_hilo = mm_we_hilo_mult ? 
                    (mm_sign_mult ? mm_result_mult : -mm_result_mult) :
                    mm_reg_hilo_from_ex;

mm stage_mm(/*autoinst*/
            .data_o(mm_data_o),
            .mem_address(mm_mem_address),
            .mem_data_o(mm_mem_data_o),
            .mem_rd(mm_mem_rd),
            .mem_wr(mm_mem_wr),
            .mem_byte_en(mm_mem_byte_en),
            .mem_access_op(mm_mem_access_op),
            .mem_access_sz(mm_mem_access_sz),
            .alignment_err(mm_alignment_err),
            .data_i(mm_data_i),
            .reg_addr_i(mm_reg_addr_i),
            .addr_i(mm_addr_i),
            .exception_flush(flush),
            .flag_unsigned(mm_flag_unsigned));

exception exception_detect(/*autoinst*/
     .flush(mm_exception_detected),
     .exception_new_pc(mm_exception_handler),
     .ebase_in(cp0_ebase),
     .epc_in(cp0_epc),
     .cp0_wr_exp(cp0_exp_en),
     .cp0_badv_we(cp0_badv_we),
     .cp0_exp_asid_we(cp0_exp_asid_we),
     .cp0_clean_exl(cp0_clean_exl),
     .allow_int(cp0_allow_int),
     .exp_epc(cp0_exp_epc),
     .exp_code(cp0_exp_code),
     .exp_asid(cp0_exp_asid),
     .exp_bad_vaddr(cp0_exp_badv),
     .iaddr_exp_miss(mm_iaddr_exp_miss),
     .daddr_exp_miss(mm_daddr_exp_miss),
     .daddr_exp_dirty(mm_mem_wr & ~mm_daddr_dirty),
     .iaddr_exp_illegal(mm_iaddr_exp_illegal || (mm_pc_value[1:0]!=2'b00)),
     .daddr_exp_illegal(mm_daddr_exp_illegal || mm_alignment_err),
     .iaddr_exp_invalid(mm_iaddr_exp_invalid),
     .daddr_exp_invalid(mm_daddr_exp_invalid),
     .data_we(mm_mem_wr),
     .invalid_inst(mm_invalid_inst),
     .syscall(mm_syscall),
     .break_inst(mm_break),
     .eret(mm_eret),
     .restrict_priv_inst(mm_is_priv_inst && cp0_user_mode),
     .pc_value(mm_pc_value),
     .is_real_inst(mm_real_inst),
     .if_asid(mm_iaddr_exp_asid),
     .mm_asid(cp0_asid),
     .if_exl(mm_iaddr_exp_exl),
     .mm_exl(cp0_in_exl),
     .mem_access_vaddr(mm_mem_address),
     .in_delayslot(mm_in_delayslot),
     .overflow(mm_overflow),
     .special_int_vec(cp0_special_int_vec),
     .boot_exp_vec(cp0_boot_exp_vec),
     .interrupt_flags(mm_interrupt_flags));
assign cp0_exp_bd = mm_in_delayslot;

always @(posedge clk) begin
    if (!rst_n || flush || !en_mmwb) begin
        wb_mem_access_op <= `ACCESS_OP_D2R;
        wb_mem_access_sz <= `ACCESS_SZ_WORD;
        wb_flag_unsigned <= 1'b0;
        wb_addr_i <= 32'b0;
        wb_data_i <= 32'b0;
        wb_reg_addr_i <= 5'b0;
        wb_reg_hilo <= 64'b0;
        wb_we_hilo <= 1'b0;
        wb_we_tlb <= 1'b0;
        wb_probe_tlb <= 1'b0;
        wb_probe_result <= 32'b0;
        wb_exception_detected <= 1'b0;
        wb_dbus_uncached <= 1'b0;
        wb_dbus_rddata_uncached <= 32'h0;
        wb_dbus_rddata <= 32'h0;
    end
    else begin
        wb_mem_access_op <= mm_mem_access_op;
        wb_mem_access_sz <= mm_mem_access_sz;
        wb_flag_unsigned <= mm_flag_unsigned;
        wb_addr_i <= mm_addr_i;
        wb_data_i <= mm_data_o;
        wb_reg_addr_i <= mm_reg_addr_i;
        wb_reg_hilo <= mm_reg_hilo;
        wb_we_hilo <= mm_we_hilo;
        wb_we_tlb <= mm_we_tlb;
        wb_probe_tlb <= mm_probe_tlb;
        wb_probe_result <= mm_probe_result;
        wb_exception_detected <= mm_exception_detected;
        wb_dbus_uncached <= dbus_uncached;
        wb_dbus_rddata_uncached <= dbus_rddata_uncached;
        wb_dbus_rddata <= dbus_rddata;
    end
end

always @(*) begin
    if(BUS_READ_1CYCLE)
        wb_mem_data_i = wb_dbus_uncached ? dbus_rddata_uncached : dbus_rddata;
    else
        wb_mem_data_i = wb_dbus_uncached ? wb_dbus_rddata_uncached : wb_dbus_rddata;
end

wb stage_wb(/*autoinst*/
            .mem_access_sz(wb_mem_access_sz),
            .mem_data_i   (wb_mem_data_i),
            .addr_i       (wb_addr_i),
            .flag_unsigned(wb_flag_unsigned),
            .data_o       (wb_data_o),
            .reg_we(wb_reg_we),
            .mem_access_op(wb_mem_access_op),
            .data_i(wb_data_i),
            .exception_det(wb_exception_detected),
            .reg_addr_i(wb_reg_addr_i));

endmodule

`default_nettype wire