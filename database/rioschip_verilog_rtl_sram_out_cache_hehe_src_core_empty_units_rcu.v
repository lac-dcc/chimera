// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

// `include "/work/stu/yzhang/workspace/hehecore/src/params.vh"
`include "../params.vh"
module rcu (
    //input
    input clk,
    input reset,
    input wfi_ctrl_in,
    input trapped,
    input mret_ctrl,
    //from decode
    input valid_in,
    input [3:0] ecause_in,
    input exception_in,
        // rs valid
    input uses_rs1,
    input uses_rs2,
    input uses_csr,
        // rd valid
    input uses_rd,
        //rob op
    input [PC_WIDTH-1:0] pc_in,
    input [PC_WIDTH-1:0] next_pc_in,
    input is_alu, //to choose which pipe of function unit
            //alu
    input [1:0] deco_alu_select_a_in,
    input [1:0] deco_alu_select_b_in,
    input [2:0] cmp_function_in,
    input [31:0] imm_data_in,
    input half,
    input is_fence,
  //input [63:0] csr_data_in,
    input [2:0] alu_function_in,
    input alu_function_modifier_in,
    input branch_in,
    input jump_in,
            //lsu
    input load_in,
    input store_in,
    input [1:0] load_store_size_in,
    input load_signed_in,
        // rs address
    input [4:0] rs1_address_in,
    input [4:0] rs2_address_in,
    input [4:0] rd_address_in,
        // from csr
    input [11:0] csr_address_in,
    input [63:0] csr_data_in,
    input csr_read_in,
    input csr_write_in,
    input csr_readable_in,
    input csr_writeable_in,
        //
    input wfi_in,
    input mret_in,
    //from FU
        //function unit finish signal
    input func_wrb_alu_done, 
    input func_wrb_lsu_done,
    input func_wrb_valid_alu, //may both alu and lsu finish their work and write back simultanously
    input func_wrb_valid_lsu, 
    input [63:0] func_wrb_rd_data_alu,
    input [63:0] func_wrb_rd_data_lsu,
    input [PHY_REG_ADDR_WIDTH-1:0] func_wrb_rd_address_lsu,
    input [PHY_REG_ADDR_WIDTH-1:0] func_wrb_rd_address_alu,
    input [ROB_SIZE_WIDTH-1:0] func_wrb_rob_line_alu,
    input [ROB_SIZE_WIDTH-1:0] func_wrb_rob_line_lsu,
    input func_wrb_rob_alu_exp,   //exception hanlder
    input func_wrb_rob_lsu_exp,
    input [3:0] func_wrb_rob_alu_ecause,
    input [3:0] func_wrb_rob_lsu_ecause,
        //issue judgement signal
    input func_load_store_ready,
    input func_alu_ready,
    //output
    //to decode for handshake
    output rob_ready_out,
    //when issue
    output [67:0] iss_rob_op_basic,
    output [4:0] iss_rob_op_lsu,
    output [44:0] iss_rob_op_alu,
    output [79:0] iss_rob_op_csr,
    output [3:0] iss_rob_op_bran_exp,
    output rob_iss_valid,
    output [ROB_SIZE_WIDTH - 1 : 0] iss_rob_line, 
        //to FU
    output [63:0] phyreg_rs1_data_out,
    output [63:0] phyreg_rs2_data_out,
    output [PHY_REG_SIZE_WIDTH-1:0] prd_address_out,
        //to excep_ctrl
    output rob_commit_valid,
    output rob_cm_exp,
    output rob_cm_mret,
    output rob_cm_wfi,
    output [3:0] rob_cm_ecause,
    output [31:0] rob_cm_exp_pc
);

integer i;
// genvar j;
//rob reg declaration
reg rob_used[ROB_SIZE-1:0];
reg rob_commited[ROB_SIZE-1:0];
reg [PHY_REG_SIZE_WIDTH-1:0] rob_prs1[ROB_SIZE-1:0];
reg [PHY_REG_SIZE_WIDTH-1:0] rob_prs2[ROB_SIZE-1:0];
wire rob_prs1_p;
wire rob_prs2_p;
reg [4:0] rob_rd[ROB_SIZE-1:0];
reg [PHY_REG_SIZE_WIDTH-1:0] rob_lprd[ROB_SIZE-1:0];
reg [PHY_REG_SIZE_WIDTH-1:0] rob_prd[ROB_SIZE-1:0];
reg rob_finish[ROB_SIZE-1:0];

//free list declaration
wire free_list_wr_en;
wire free_list_rd_en;
wire [FRLIST_DATA_WIDTH-1:0] free_list_wrdata;
wire [FRLIST_DATA_WIDTH-1:0] read_free_list;
wire free_list_full;
wire free_list_empty;
/* verilator lint_off UNUSED */
wire [FRLIST_DEPTH_WIDTH-1:0] free_list_num;
/* verilator lint_on UNUSED */
//physical reg
wire [PHY_REG_ADDR_WIDTH - 1:0] phyreg_rs1_address = rob_prs1[iss_rob_line];//should be issue address
wire [PHY_REG_ADDR_WIDTH - 1:0] phyreg_rs2_address = rob_prs2[iss_rob_line];
wire [PHY_REG_ADDR_WIDTH - 1:0] phyreg_rd_address_alu = func_wrb_rd_address_alu;
wire [PHY_REG_ADDR_WIDTH - 1:0] phyreg_rd_address_lsu = func_wrb_rd_address_lsu;
wire [63:0] phyreg_rd_data_alu = func_wrb_rd_data_alu;
wire [63:0] phyreg_rd_data_lsu = func_wrb_rd_data_lsu;
wire phy_rob_prs1_p;
wire phy_rob_prs2_p;

//rename table
reg [FRLIST_DEPTH_WIDTH-1:0] rename_reg [31:0];
reg [FRLIST_DEPTH_WIDTH-1:0] rename_reg_backup [31:0];
wire [4:0] rereg_exp_line;

//ROB declaration
//rob op
reg [67:0] rob_op_basic    [ROB_SIZE-1:0];
reg [4:0]  rob_op_lsu      [ROB_SIZE-1:0];
reg [44:0] rob_op_alu      [ROB_SIZE-1:0];
reg [79:0] rob_op_csr      [ROB_SIZE-1:0];
reg [3:0]  rob_op_bran_exp [ROB_SIZE-1:0];
reg rob_op_fence [ROB_SIZE-1:0];

//rob write signal
wire [ROB_SIZE_WIDTH-1:0] wr_rob_line;
wire rob_ready = !rob_used[wr_rob_line] & !free_list_empty;
wire rob_wr_ready = rob_ready & valid_in;
assign rob_ready_out = rob_ready;

//rob commit signal
wire [ROB_SIZE_WIDTH-1:0] cm_rob_line;

/* verilator lint_off UNOPTFLAT */
// wire [ROB_SIZE-1:0] cm_rob_ex;

wire rob_cm_valid = rob_used[cm_rob_line] & !rob_commited[cm_rob_line] & rob_finish[cm_rob_line] & !free_list_full & !wfi_ctrl_in;   //? MAYBE circular
/* verilator lint_on UNOPTFLAT */

assign rob_commit_valid = rob_cm_valid;
assign rob_cm_mret = rob_op_bran_exp[cm_rob_line][0];
assign rob_cm_wfi = rob_op_bran_exp[cm_rob_line][1];

//rob issue signal
// wire [ROB_SIZE_WIDTH-1:0] iss_rob_line;
// wire rob_iss_valid;
wire rob_iss_is;
wire rob_iss_line_switch;
assign prd_address_out = rob_prd[iss_rob_line];

//rob exception signal
reg rob_exp[ROB_SIZE-1:0];
reg [3:0] rob_ecause[ROB_SIZE-1:0];
// wire global_exception;
// wire [ROB_SIZE-1:0] global_exception_w;
assign rob_cm_exp_pc = rob_op_basic[cm_rob_line][67:36];

//rob finish
wire rob_iss_skip = rob_prs1_p & rob_prs2_p & rob_used[iss_rob_line] & 
                    (rob_exp[iss_rob_line] | 
                    rob_op_bran_exp[iss_rob_line][0] |
                    rob_op_fence[iss_rob_line]);

//rob counter
/*verilator lint_off UNUSED*/
wire wr_rob_line_end;
wire cm_rob_line_end;
wire iss_rob_line_end;
/*verilator lint_on UNUSED*/

//free list  √

fifo #(
    .FIFO_DATA_WIDTH(FRLIST_DATA_WIDTH),
    .FIFO_SIZE(FRLIST_DEPTH),
    .FIFO_SIZE_WIDTH(FRLIST_DEPTH_WIDTH)
) free_list(
    .clk(clk),
    .reset(reset),
    .wr_en(free_list_wr_en),
    .rd_en(free_list_rd_en),
    .wdata(free_list_wrdata),
    .rdata(read_free_list),
    .fifo_full(free_list_full),
    .fifo_empty(free_list_empty),
    .fifo_num(free_list_num)
);

assign free_list_wrdata = rob_lprd[cm_rob_line];
assign free_list_wr_en = rob_cm_valid & (rob_lprd[cm_rob_line] != 0);
assign free_list_rd_en = rob_wr_ready && (rd_address_in != 0);

//physical reg (P0 is always 0 and its finish bit is 1) √
physical_regfile # (
    .REG_SIZE(PHY_REG_SIZE),
    .REG_SIZE_WIDTH(PHY_REG_SIZE_WIDTH)
) phy_reg(
    .clk(clk),
    .reset(reset),
    .prs1_address(phyreg_rs1_address),
    .prs2_address(phyreg_rs2_address),
    .prs1_data(phyreg_rs1_data_out),
    .prs2_data(phyreg_rs2_data_out),
    .prd_address_alu(phyreg_rd_address_alu),
    .prd_address_lsu(phyreg_rd_address_lsu),
    .prd_data_alu(phyreg_rd_data_alu),
    .prd_data_lsu(phyreg_rd_data_lsu),
    .alu_valid(func_wrb_valid_alu),
    .lsu_valid(func_wrb_valid_lsu),
    .prs1_p_address(phyreg_rs1_address),
    .prs2_p_address(phyreg_rs2_address),
    .prs1_p(phy_rob_prs1_p),
    .prs2_p(phy_rob_prs2_p),
    //when commit then flush finish bit
    .lprd_address(rob_lprd[cm_rob_line]),
    .flush(rob_cm_valid)
);

assign rob_prs1_p = phy_rob_prs1_p;
assign rob_prs2_p = phy_rob_prs2_p;

//renaming table (add trap control)
always @(posedge clk) begin
    if (reset) begin
        for (i = 0; i < 32; i = i + 1) begin
            rename_reg[i] <= 0;
        end 
    end else if (trapped | mret_ctrl) begin
        for (i = 0; i <= ROB_SIZE; i = i + 1) begin //when trapped replace rename_reg by old one
            rename_reg[i] <= rename_reg_backup[i];
        end
    end else if (uses_rd) begin
            if (free_list_rd_en) begin
                rename_reg[rd_address_in] <= read_free_list;
            end
    end
end

// backup renaming table for exception
always @(posedge clk) begin
    if (reset) begin
        for (i = 0; i < 32; i = i + 1) begin
            rename_reg_backup[i] <= 0;
        end
    end if (rob_cm_valid) begin
        rename_reg_backup[rereg_exp_line] <= rob_prd[cm_rob_line];
    end
end

assign rereg_exp_line = rob_rd[cm_rob_line];

//ROB
//rob op write
always @(posedge clk) begin
    if (reset) begin
        for (i = 0; i < ROB_SIZE; i = i + 1) begin
            rob_op_basic[i]    <= 0;
            rob_op_lsu[i]      <= 0;
            rob_op_alu[i]      <= 0;
            rob_op_csr[i]      <= 0;
            rob_op_bran_exp[i] <= 0;
            rob_op_fence[i]    <= 0;
        end
    end else if (rob_wr_ready) begin
      //rob_op          //basic:     {67:36,    35:4,       3,        2,        1,        0}
        rob_op_basic[wr_rob_line] <= {pc_in, next_pc_in, uses_rs1, uses_rs2, uses_rd, uses_csr};
                        //lsu:       {4,          3,            2:1,                0}
        rob_op_lsu[wr_rob_line]   <= {load_in, store_in, load_store_size_in, load_signed_in};
                        //alu:       {44:13,        12,           11:10,                9:8,                 7:5
        rob_op_alu[wr_rob_line]   <= {imm_data_in, is_alu, deco_alu_select_a_in, deco_alu_select_b_in, cmp_function_in, 
                        //            4:2,                      1,                  0}
                                      alu_function_in, alu_function_modifier_in, half};
                        //csr        {79:16,            15:4,           3,          2,              1,                  0}
        rob_op_csr[wr_rob_line]   <= {csr_data_in, csr_address_in, csr_read_in, csr_write_in, csr_readable_in, csr_writeable_in};
                //branch and exp        {3,             2,      1,      0   }
        rob_op_bran_exp[wr_rob_line] <= {branch_in, jump_in, wfi_in, mret_in};
                                
        rob_op_fence[wr_rob_line] <= is_fence;
    end
end

assign iss_rob_op_basic = rob_op_basic[iss_rob_line];
assign iss_rob_op_lsu  = rob_op_lsu[iss_rob_line];
assign iss_rob_op_alu  = rob_op_alu[iss_rob_line];
assign iss_rob_op_csr  = rob_op_csr[iss_rob_line];
assign iss_rob_op_bran_exp  = rob_op_bran_exp[iss_rob_line];

//rob use bit (add trap control)
always @(posedge clk) begin 
    if (reset | trapped | mret_ctrl) begin //trapped = (sip || tip || eip || exception) as input
        for (i = 0; i < ROB_SIZE; i = i + 1) begin //when trapped and reset clean all rob
                rob_used[i] <= 0;
            end 
    end else begin
        if (rob_wr_ready) begin //use=1 when write
            rob_used[wr_rob_line] <= 1;
        end
        if (rob_cm_valid) begin //use=0 when commit
            rob_used[cm_rob_line] <= 0;
        end
    end
end

//rob issue bit 
wire iss_load_store = rob_op_lsu[iss_rob_line][4] | rob_op_lsu[iss_rob_line][3];
wire iss_store = rob_op_lsu[iss_rob_line][3]; //?
wire iss_csr = rob_op_csr[iss_rob_line][2] | rob_op_csr[iss_rob_line][3];
wire iss_alu = rob_op_alu[iss_rob_line][12];

assign rob_iss_is = rob_iss_valid & (iss_load_store & func_load_store_ready|
                                     iss_alu & func_alu_ready
                                    ); //confirm which function unit is ready

assign rob_iss_valid = rob_prs1_p & 
                       rob_prs2_p & 
                       rob_used[iss_rob_line] & 
                       ((iss_store & (cm_rob_line == iss_rob_line)) | !iss_store) & 
                       ((iss_csr & (cm_rob_line == iss_rob_line)) | !iss_csr) & 
                       !rob_exp[iss_rob_line] & 
                       !wfi_ctrl_in & 
                       !rob_op_fence[iss_rob_line];

//rob exception bit
always @(posedge clk) begin
    if (reset) begin
        for (i = 0; i < ROB_SIZE; i = i + 1) begin
            rob_exp[i] <= 0;
            rob_ecause[i] <= 0;
        end
    end 
    else begin
        if(rob_wr_ready) begin
            rob_exp[wr_rob_line] <= exception_in;
            rob_ecause[wr_rob_line] <= ecause_in;
        end
        if(func_wrb_rob_alu_exp) begin
            rob_exp[func_wrb_rob_line_alu] <= func_wrb_rob_alu_exp;
            rob_ecause[func_wrb_rob_line_alu] <= func_wrb_rob_alu_ecause;
        end
        if(func_wrb_rob_lsu_exp) begin
            rob_exp[func_wrb_rob_line_lsu] <= func_wrb_rob_lsu_exp;
            rob_ecause[func_wrb_rob_line_lsu] <= func_wrb_rob_lsu_ecause;
        end
    end
end

// generate
//     for (j = 0; j < ROB_SIZE; j = j + 1) begin
//         assign global_exception_w[j] = rob_exp[j];
//     end
// endgenerate


// assign global_exception = (|global_exception_w);
assign rob_cm_exp = rob_exp[cm_rob_line];
assign rob_cm_ecause = rob_ecause[cm_rob_line];

//rob commit bit √
always @(posedge clk) begin
    if (reset) begin
        for (i = 0; i < ROB_SIZE; i = i + 1) begin //when trapped and reset clean all rob
                rob_commited[i] <= 0;
        end 
    end else begin
        if (rob_wr_ready) begin //commit=1 when
            rob_commited[wr_rob_line] <= 0;
        end
        if (rob_cm_valid) begin 
            rob_commited[cm_rob_line] <= 1;
        end
    end
end

//rob prs1 write √
always @(posedge clk) begin
    if (reset) begin
        for (i = 0; i < ROB_SIZE; i = i + 1) begin
            rob_prs1[i] <= 0;
        end
    end else if (rob_wr_ready) begin
        if (uses_rs1) begin
            rob_prs1[wr_rob_line] <= rename_reg[rs1_address_in]; //if there is no phy_addr mapped to rs1_addr in rename table, it should raise a exception
        end else begin
            rob_prs1[wr_rob_line] <= 0;
        end
    end 
end

//rob prs2 write √
always @(posedge clk) begin
    if (reset) begin
        for (i = 0; i < ROB_SIZE; i = i + 1) begin
            rob_prs2[i] <= 0;
        end
    end else if (rob_wr_ready) begin
        if (uses_rs2) begin
            rob_prs2[wr_rob_line] <= rename_reg[rs2_address_in];
        end else begin
            rob_prs2[wr_rob_line] <= 0;  
        end
    end 
end

//rob prd write √
always @(posedge clk) begin
    if (reset) begin
        for (i = 0; i < ROB_SIZE; i = i + 1) begin
            rob_prd[i] <= 0;
        end
    end else if (rob_wr_ready) begin
        if (uses_rd & free_list_rd_en) begin
            rob_prd[wr_rob_line] <= read_free_list;
        end else begin
            rob_prd[wr_rob_line] <= 0;
        end
    end
end

//rob lprd write √
always @(posedge clk) begin
    if (reset) begin
        for (i = 0; i < ROB_SIZE; i = i + 1) begin
            rob_lprd[i] <= 0;
        end
    end else if (rob_wr_ready) begin
        if (uses_rd) begin
            rob_lprd[wr_rob_line] <= rename_reg[rd_address_in];
        end else begin
            rob_lprd[wr_rob_line] <= 0;
        end
    end
end

//rob rd write √
always @(posedge clk) begin
    if (reset) begin
        for (i = 0; i < ROB_SIZE; i = i + 1) begin
            rob_rd[i] <= 0;
        end
    end else if (rob_wr_ready) begin
        if (uses_rd) begin
            rob_rd[wr_rob_line] <= rd_address_in;
        end else begin
            rob_rd[wr_rob_line] <= 0;
        end
    end
end

//rob finish write (add trap control)
always @(posedge clk) begin
    if (reset | trapped | mret_ctrl) begin
        for (i = 0; i < ROB_SIZE; i = i + 1) begin
            rob_finish[i] <= 0;
        end
    end else begin
        if (func_wrb_alu_done) begin
            rob_finish[func_wrb_rob_line_alu] <= 1;
        end 
        if (func_wrb_lsu_done) begin
            rob_finish[func_wrb_rob_line_lsu] <= 1;
        end 
        if (rob_cm_valid) begin
            rob_finish[cm_rob_line] <= 0;
        end
        if (rob_iss_skip) begin
            rob_finish[iss_rob_line] <= 1;
        end
    end
end

//rob counter for write √
counter_rob  #(
    .CNT_SIZE(ROB_SIZE),
    .CNT_SIZE_WIDTH(ROB_SIZE_WIDTH)
)wr_rob_counter(
    .clk(clk),
    .reset(reset),
    .cnt_reset(0),
    .cnt_add_flag(rob_wr_ready),
    .cnt_vector(0),
    .cnt(wr_rob_line),
    .cnt_end(wr_rob_line_end)
);

//rob counter for commit √
counter_rob  #(
    .CNT_SIZE(ROB_SIZE),
    .CNT_SIZE_WIDTH(ROB_SIZE_WIDTH)
)cm_rob_counter(
    .clk(clk),
    .reset(reset),
    .cnt_reset(trapped | mret_ctrl),
    .cnt_add_flag(rob_cm_valid),
    .cnt_vector(wr_rob_line),
    .cnt(cm_rob_line),
    .cnt_end(cm_rob_line_end)
);

//rob counter for issue √
counter_rob  #(
    .CNT_SIZE(ROB_SIZE),
    .CNT_SIZE_WIDTH(ROB_SIZE_WIDTH)
)iss_rob_counter(
    .clk(clk),
    .reset(reset),
    .cnt_reset(trapped | mret_ctrl),
    .cnt_add_flag(rob_iss_line_switch),
    .cnt_vector(wr_rob_line),
    .cnt(iss_rob_line),
    .cnt_end(iss_rob_line_end)
);

assign rob_iss_line_switch = rob_iss_is | rob_iss_skip;

endmodule
