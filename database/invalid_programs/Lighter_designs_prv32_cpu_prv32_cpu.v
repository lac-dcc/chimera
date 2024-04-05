/*
 	Copyright 2020 Mohamed Shalan
	
	Licensed under the Apache License, Version 2.0 (the "License"); 
	you may not use this file except in compliance with the License. 
	You may obtain a copy of the License at:

	http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software 
	distributed under the License is distributed on an "AS IS" BASIS, 
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
	See the License for the specific language governing permissions and 
	limitations under the License.
*/
/*
    A minimal RV32I piplined CPU Core 
    
    The objective is to synthesize it into < 1500 ASIC cells using OpenLane. 
    The target frequency is 100MHz. The core has a 3-stage pipeline:
        - Stage 0 : Instruction Fecth
        - Stage 1 : Register Read and ALU Operation
        - Stage 2 : Memory R/W and Register Write Back
    
    The core has 2 split-transaction buses for instructions and data. The bus implements
    a protocol similar to that of AHB-lite. Data and Address schedule for these 2 buses is
    given below:
                DB  IB
        Address S1  S2
        Data    S2  S0

    Progress:
    Implemented: 
        - I, R, Branch, pipeline flushing, a/b forwarding, JAL, JALR, AUIPC, and LUI (1375 cells)
        - lw and sw; other loads have bugs and sb & sh are not tested (1392 cells)
        - All loads and stores are implemented and tested (1350 cells)
        - Load forwarding (1325 cells)
        - ibus and dbus wait cycles! (1873 cells)
        - 
    To do: 
        - ibus and dbus wait cycles Testing!
        - apply automatic clock gating
        - ecall and ebreak
        - IRQ and NMI
        - CSRs
*/

`ifndef SIM
`include "arith.v"
`endif
/*
    Macros used by all modules
*/
`define     SYNC_BEGIN(CLK, RST, R, V0)  always @ (posedge CLK or negedge RST) if(!RST) R <= V0; else
//`define     SYNC_BEGIN_TCLK(r, v)  always @ (posedge TCLK or negedge HRESETn) if(!HRESETn) r <= v; else begin	
//`define     SYNC_END          end

`define     IR_rs1          19:15
`define     IR_rs2          24:20
`define     IR_rd           11:7
`define     IR_opcode       6:2
`define     IR_funct3       14:12
`define     IR_cond       	14:12
`define     IR_funct7       31:25
`define     IR_shamt        24:20
`define     IR_csr          31:20

`define     OPCODE_B        5'b11_000
`define     OPCODE_L        5'b00_000
`define     OPCODE_S        5'b01_000
`define     OPCODE_JALR     5'b11_001
`define     OPCODE_JAL      5'b11_011
`define     OPCODE_A_I      5'b00_100
`define     OPCODE_A_R      5'b01_100
`define     OPCODE_AUIPC    5'b00_101
`define     OPCODE_LUI      5'b01_101
`define     OPCODE_SYSTEM   5'b11_100
`define     OPCODE_Custom   5'b10_001

`define     F3_ADD          3'b000
`define     F3_SLL          3'b001
`define     F3_SLT          3'b010
`define     F3_SLTU         3'b011
`define     F3_XOR          3'b100
`define     F3_SRL          3'b101
`define     F3_OR           3'b110
`define     F3_AND          3'b111

`define     BR_BEQ          3'b000
`define     BR_BNE          3'b001
`define     BR_BLT          3'b100
`define     BR_BGE          3'b101
`define     BR_BLTU         3'b110
`define     BR_BGEU         3'b111

//`define     OPCODE          IR[`IR_opcode]

`define     ALU_ADD         4'b00_00
`define     ALU_SUB         4'b00_01
`define     ALU_PASS        4'b00_11
`define     ALU_OR          4'b01_00
`define     ALU_AND         4'b01_01
`define     ALU_XOR         4'b01_11
`define     ALU_SRL         4'b10_00
`define     ALU_SRA         4'b10_10
`define     ALU_SLL         4'b10_01
`define     ALU_SLT         4'b11_01
`define     ALU_SLTU        4'b11_11

`define     SYS_EC_EB       3'b000
`define     SYS_CSRRW       3'b001
`define     SYS_CSRRS       3'b010
`define     SYS_CSRRC       3'b011
`define     SYS_CSRRWI      3'b101
`define     SYS_CSRRSI      3'b110
`define     SYS_CSRRCI      3'b111


/*
    Immediate Generator
*/
module imm_gen (
    input  wire [31:0]  instr,
    output reg  [31:0]  imm
);
    always @(*) begin
        case (instr[`IR_opcode])
            `OPCODE_A_I     :   imm = { {21{instr[31]}}, instr[30:25], instr[24:21], instr[20] };
            `OPCODE_S       :   imm = { {21{instr[31]}}, instr[30:25], instr[11:8], instr[7] };
            `OPCODE_LUI     :   imm = { instr[31], instr[30:20], instr[19:12], 12'b0 };
            `OPCODE_AUIPC   :   imm = { instr[31], instr[30:20], instr[19:12], 12'b0 };
            `OPCODE_JAL     :   imm = { {12{instr[31]}}, instr[19:12], instr[20], instr[30:25], instr[24:21], 1'b0 };
            `OPCODE_JALR    :   imm = { {21{instr[31]}}, instr[30:25], instr[24:21], instr[20] };
            `OPCODE_B       :   imm = { {20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};
            default         :   imm = { {21{instr[31]}}, instr[30:25], instr[24:21], instr[20] }; 
        endcase
    end

endmodule

// Instruction decoders 
module instr_dec_s1 (
    input   wire [31:0]     instr,
    //input   wire            br_taken,
    output	reg  [ 3:0]     alu_fn,
    output  wire            b_src,
    output  wire            pc_src,
    output  wire [1:0]      result_src,
    output  wire            db_trans,
    output  wire            db_write
    //output  wire            rf_wb
);
    wire [2:0]  func3       =   instr[`IR_funct3];
    wire [6:0]  func7       =   instr[`IR_funct7];
    wire [11:0] csr         =   instr[`IR_csr];
    wire [4:0]  opcode      =   instr[`IR_opcode];
    wire        W32         =   1;
    wire        I           =   W32 & (opcode == `OPCODE_A_I);
	wire        R           =   W32 & (opcode == `OPCODE_A_R);
	wire        IorR        =   I | R;
	wire        instr_logic = 	((IorR==1'b1) && ((func3==`F3_XOR) || (func3==`F3_AND) || (func3==`F3_OR)));
	wire        instr_shift = 	((IorR==1'b1) && ((func3==`F3_SLL) || (func3==`F3_SRL) ));

    wire        instr_slt   = 	((IorR==1'b1) && (func3==`F3_SLT));
	wire        instr_sltu  = 	((IorR==1'b1) && (func3==`F3_SLTU));
	wire        instr_store = 	W32 & (opcode == `OPCODE_S);
	wire        instr_load  = 	W32 & (opcode == `OPCODE_L);
	wire        instr_add   = 	R & (func3 == `F3_ADD) & (~func7[5]);
	wire        instr_sub   = 	R & (func3 == `F3_ADD) & (func7[5]);
	wire        instr_addi  = 	I & (func3 == `F3_ADD);
	wire        instr_lui   = 	W32 & (opcode == `OPCODE_LUI);
	wire        instr_auipc = 	W32 & (opcode == `OPCODE_AUIPC);
	wire        instr_branch= 	W32 & (opcode == `OPCODE_B);
	wire        instr_jalr  = 	W32 & (instr[`IR_opcode] == `OPCODE_JALR);
	wire        instr_jal   = 	W32 & (instr[`IR_opcode] == `OPCODE_JAL);
	wire        instr_sll   = 	((IorR==1'b1) && (func3 == `F3_SLL) && (func7 == 7'b0));
	wire        instr_srl   = 	((IorR==1'b1) && (func3 == `F3_SRL) && (func7 == 7'b0));
	wire        instr_sra   = 	((IorR==1'b1) && (func3 == `F3_SRL) && (func7 != 7'b0));
	wire        instr_and   = 	((IorR==1'b1) && (func3 == `F3_AND));
	wire        instr_or    = 	((IorR==1'b1) && (func3 == `F3_OR));
	wire        instr_xor   = 	((IorR==1'b1) && (func3 == `F3_XOR));

    reg [1:0]   result_src_reg;

    assign      b_src       =   ~( I | instr_lui | instr_load | instr_store );

    assign      result_src  =   result_src_reg;

    assign      pc_src      =   ~instr_jalr; //(instr_branch & br_taken) | instr_jal ;
  
    //assign      pc_src[1] =     instr_jalr;

    assign      db_trans    =   instr_load | instr_store;

    assign      db_write    =   instr_store;

    //assign      rf_wb       =   ( IorR | instr_jalr | instr_jal | instr_auipc | instr_load | instr_lui );

    always @ * begin
        case (1'b1)
            IorR        :   result_src_reg = 0;
            instr_lui   :   result_src_reg = 0;
            
            instr_jalr  :   result_src_reg = 1;
            instr_jal   :   result_src_reg = 1;

            instr_auipc :   result_src_reg = 2;

            default     :   result_src_reg = 3;
        endcase
    end


    always @ * begin
        case (1'b1)
            instr_load  :   alu_fn = `ALU_ADD;
            instr_addi  :   alu_fn = `ALU_ADD;
            instr_store :   alu_fn = `ALU_ADD;
            instr_add   :   alu_fn = `ALU_ADD;
            instr_jalr  :   alu_fn = `ALU_ADD;

            instr_lui   :   alu_fn = `ALU_PASS;

            instr_sll   :   alu_fn = `ALU_SLL;
            instr_srl   :   alu_fn = `ALU_SRL;
            instr_sra   :   alu_fn = `ALU_SRA;

            instr_slt   :   alu_fn = `ALU_SLT;
            instr_sltu  :   alu_fn = `ALU_SLTU;

            instr_and   :   alu_fn = `ALU_AND;
            instr_or    :   alu_fn = `ALU_OR;
            instr_xor   :   alu_fn = `ALU_XOR;

            default     :   alu_fn = `ALU_SUB;
        endcase
    end
endmodule

module instr_dec_s2 (
    input   wire [31:0]     instr,
    input   wire            flush,
    input   wire            br_taken,
    output	wire            wb_src,
    output  wire            pc_src,
    output  wire            rf_we
);
    wire [2:0]  func3       =   instr[`IR_funct3];
    wire [6:0]  func7       =   instr[`IR_funct7];
    wire [11:0] csr         =   instr[`IR_csr];
    wire [4:0]  opcode      =   instr[`IR_opcode];
    wire        W32         =   1;
    wire        I           =   W32 & (opcode == `OPCODE_A_I);
	wire        R           =   W32 & (opcode == `OPCODE_A_R);
	wire        IorR        =   I | R;
	wire        instr_logic = 	((IorR==1'b1) && ((func3==`F3_XOR) || (func3==`F3_AND) || (func3==`F3_OR)));
	wire        instr_shift = 	((IorR==1'b1) && ((func3==`F3_SLL) || (func3==`F3_SRL) ));

    wire        instr_slt   = 	((IorR==1'b1) && (func3==`F3_SLT));
	wire        instr_sltu  = 	((IorR==1'b1) && (func3==`F3_SLTU));
	wire        instr_store = 	W32 & (opcode == `OPCODE_S);
	wire        instr_load  = 	W32 & (opcode == `OPCODE_L);
	wire        instr_add   = 	R & (func3 == `F3_ADD) & (~func7[5]);
	wire        instr_sub   = 	R & (func3 == `F3_ADD) & (func7[5]);
	wire        instr_addi  = 	I & (func3 == `F3_ADD);
	wire        instr_lui   = 	W32 & (opcode == `OPCODE_LUI);
	wire        instr_auipc = 	W32 & (opcode == `OPCODE_AUIPC);
	wire        instr_branch= 	W32 & (opcode == `OPCODE_B);
	wire        instr_jalr  = 	W32 & (instr[`IR_opcode] == `OPCODE_JALR);
	wire        instr_jal   = 	W32 & (instr[`IR_opcode] == `OPCODE_JAL);
	wire        instr_sll   = 	((IorR==1'b1) && (func3 == `F3_SLL) && (func7 == 7'b0));
	wire        instr_srl   = 	((IorR==1'b1) && (func3 == `F3_SRL) && (func7 == 7'b0));
	wire        instr_sra   = 	((IorR==1'b1) && (func3 == `F3_SRL) && (func7 != 7'b0));
	wire        instr_and   = 	((IorR==1'b1) && (func3 == `F3_AND));
	wire        instr_or    = 	((IorR==1'b1) && (func3 == `F3_OR));
	wire        instr_xor   = 	((IorR==1'b1) && (func3 == `F3_XOR));

    assign wb_src   =   instr_load;
    assign rf_we    =   ~flush & ( IorR | instr_jalr | instr_jal | instr_auipc | instr_load | instr_lui);
    assign pc_src   =   (instr_branch & br_taken) | instr_jal | instr_jalr;

endmodule


module branch (
		input   wire [2:0] 	cond,
		input   wire        cf, zf, vf, sf,
		output  wire 	    taken
);
	
	reg 		taken_reg;

	assign      taken = taken_reg;

	always @ * begin
      (* full_case *)
      case(cond)
          `BR_BEQ: 	taken_reg = zf;          	// BEQ
          `BR_BNE: 	taken_reg = ~zf;         	// BNE
          `BR_BLT: 	taken_reg = (sf != vf);  	// BLT
          `BR_BGE: 	taken_reg = (sf == vf);  	// BGE
          `BR_BLTU: taken_reg = (~cf);      	// BLTU
          `BR_BGEU: taken_reg = (cf);       	// BGEU
          default: 	taken_reg = 1'b0;
      endcase
	end
endmodule



// Data Memory Read Aligner
module mrdata_align(
    input  wire [31:0]  di,
    output wire [31:0]  do,
    input  wire [1:0]   size,
    input  wire [1:0]   A,
    input  wire         sign
);

    wire [31:0] s_ext, u_ext;
    wire [7:0] b;
    wire [15:0] hword;

    assign b = 	(A==2'd0) ? di[7:0] :
                (A==2'd1) ? di[15:8] :
                (A==2'd2) ? di[23:16] : di[31:24];

    assign hword = 	(A[1]==0) ? di[15:0] : di[31:16];

    assign u_ext =  (size==2'd0)  ? {24'd0,b}  :
                    (size==2'd1)  ? {16'd0,hword} : di;

    assign s_ext =  (size==2'd0)  ? {{24{b[7]}},b}   :
                    (size==2'd1)  ? {{24{hword[15]}},hword} : di;

    assign do = sign ? u_ext : s_ext;

endmodule

// Data Memory Write Aligner
module mwdata_align(
    input   wire [31: 0]    di,
    output  wire [31: 0]    do,
    input   wire [ 1: 0]    size,
    input   wire [ 1: 0]    A
);

    wire [7:0] b = di[7:0];
    wire [15:0] hword = di[15:0];

    wire [31:0] byte_word, hw_word;

    assign  byte_word = (A==2'd0) ? di :
                        (A==2'd1) ? {16'd0, b, 8'd0} :
                        (A==2'd2) ? {8'd0, b, 16'd0} : {b, 24'd0} ;
    assign  hw_word   = (~A[1])  ? di : {hword, 16'd0};

    assign do = (size==2'd0) ? byte_word :
                (size==2'd1) ? hw_word : di;

endmodule

/*
    The CPU Core
*/
module prv32_cpu(
    input   wire            clk,
    input   wire            rst_n,

    input   wire [31: 0]    db_datai,
    output  wire [31: 0]    db_datao,
    output  wire [31: 0]    db_addr,
    output  wire [ 1: 0]    db_size,
    output  wire            db_write,
    output  wire            db_trans,
    input   wire            db_ack,

    input   wire [31: 0]    ib_datai,
    output  wire [31: 0]    ib_addr,
    output  wire            ib_trans,
    input   wire            ib_ack,

    output  wire [ 4: 0]    rf_sel_r1,
    output  wire [ 4: 0]    rf_sel_r2,
    output  wire [ 4: 0]    rf_sel_rd,
    output  wire            rf_we,
    output  wire [31: 0]    rf_rd,
    input   wire [31: 0]    rf_r1,
    input   wire [31: 0]    rf_r2,

    input   wire            irq,
    input   wire            nmi
);


    // Pipeline Registers
    reg [31: 0]     pc_0, pc_1, pc_2;
    reg [31: 0]     ir_1, ir_2;
    reg [31: 0]     result;
    reg             flush_0, flush_1, flush_2;
    reg [ 3: 0]     flags;
    reg [31: 0]     rf_r2_2;
    reg [ 1: 0]     db_addr_2;

    // Wires
    wire [31: 0]    imm;
    wire [31: 0]    a_mux;
    wire [31: 0]    b_mux;
    wire [31: 0]    alu_r;
    wire [ 4: 0]    alu_shamt;
    wire [ 3: 0]    alu_fn;
    wire            cf, zf, vf, sf;
    wire            a_bypass, b_bypass;
    wire            result_bypass;
    wire            b_src;
    //wire [31: 0]    rf_r1, rf_r2;
    //wire [31: 0]    rf_rd;  
    wire [31: 0]    result_next;
    wire [ 1: 0]    result_src;
    wire [31: 0]    pc_0_next, pc_2_next;
    wire [31: 0]    pc_1_4, pc_1_i, pc_0_4;
    wire            pc_0_src, pc_2_src;
    wire [31: 0]    wb_mux;
    wire            wb_src;
    wire [31: 0]    csr;
    wire            br_taken;
    wire [31: 0]    db_datai_aligned;
    wire            flush;
    wire            rf_wb_1;
    wire            stall;
    wire            rf_we_2;

    
        
    // RF Interface
    assign  rf_sel_r1   =   ir_1[`IR_rs1];
    assign  rf_sel_r2   =   ir_1[`IR_rs2];
    assign  rf_sel_rd   =   ir_2[`IR_rd];
    assign  rf_rd       =   wb_mux;
    assign  rf_we       =   rf_we_2 & ~stall;

    // ibus Interface
    assign  ib_addr     =   pc_0_next;
    assign  ib_trans    =   1;

    // dbus Interface
    assign  db_addr     =   alu_r;
    //assign  db_datao    =   rf_r2_2;
    assign  db_size     =   ir_1[13:12];
   
    assign  a_bypass    =   (ir_1[`IR_rs1] == ir_2[`IR_rd]) & ~flush_2 & rf_we;

    assign  b_bypass    =   (ir_1[`IR_rs2] == ir_2[`IR_rd]) & ~flush_2 & rf_we;

    assign  stall       =   ~ib_ack | ~db_ack;

    //
    // Stage 0 : Instruction Fetch
    //
    `SYNC_BEGIN(clk, rst_n, ir_1, 32'h0) begin
        if(ib_ack)
            ir_1 <= ib_datai;
    end

    `SYNC_BEGIN(clk, rst_n, pc_1, 32'h0) begin
        if(~stall) pc_1 <= pc_0;
    end

    // flush 1
    `SYNC_BEGIN(clk, rst_n, flush_1, 1'h0) begin
        if(~stall) flush_1 <= flush ;//? 1'b1 : flush_0;
    end


    //
    // Stage 1 : Register Read 
    //
    instr_dec_s1 idec_s1(
        .instr(ir_1),
        //.br_taken(br_taken),
        .alu_fn(alu_fn),
        .b_src(b_src),
        .pc_src(pc_2_src),
        .result_src(result_src),
        .db_trans(db_trans),
        .db_write(db_write)
        //.rf_wb(rf_wb_1)
    );

    imm_gen ig (.instr(ir_1), .imm(imm));

    //assign a_mux =  a_bypass    ?   result      :   rf_r1 ;
    assign a_mux =  a_bypass    ?   wb_mux      :   rf_r1 ;
    
    //assign b_mux =  b_bypass    ?   result      :   
    //                b_src       ?   rf_r2       :   imm ;
    wire [1:0] b_mux_sel = {b_bypass, b_src};
    //mux_4 bmux[31:0] ( .x(b_mux), .a(imm), .b(rf_r2), .c(result), .d(result), .s(b_mux_sel) );
    mux_4 bmux[31:0] ( .x(b_mux), .a(imm), .b(rf_r2), .c(wb_mux), .d(wb_mux), .s(b_mux_sel) );

    rv32i_alu #(.ADDER_TYPE(1)) alu (
	    .a(a_mux), .b(b_mux),
	    .shamt(alu_shamt),
	    .r(alu_r),
	    .cf(cf), .zf(zf), .vf(vf), .sf(sf),
	    .alufn(alu_fn)
    );

    /*
    assign  result_next =   (result_src==2'b00) ?   alu_r   :
                            (result_src==2'b01) ?   pc_1_4  :
                            (result_src==2'b10) ?   pc_1_i  :   csr;   
    */
    mux_4 result_mux[31:0] ( .x(result_next), .a(alu_r), .b(pc_1_4), .c(pc_1_i), .d(csr), .s(result_src) );

    adder_32 #(.ADDER_TYPE(3)) pc14_adder ( 
        .a(32'd4), .b(pc_1),
        .ci(1'b0),
        .s(pc_1_4),
        .co()
    );
    
    adder_32 #(.ADDER_TYPE(3)) pc1i_adder ( 
        .a(imm), .b(pc_1),
        .ci(1'b0),
        .s(pc_1_i),
        .co()
    );
    
    assign  pc_2_next   =   pc_2_src    ?   pc_1_i  :   alu_r;

    // The pc_2 register
    `SYNC_BEGIN(clk, rst_n, pc_2, 32'h0) begin
        if(~stall) pc_2 <= pc_2_next;
    end

    // The result register
    `SYNC_BEGIN(clk, rst_n, result, 32'h0) begin
        if(~stall) result <= result_next;
    end

    // IR 2
    `SYNC_BEGIN(clk, rst_n, ir_2, 32'h0) begin
        if(~stall) ir_2 <= ir_1;
    end

    // flush 2
    `SYNC_BEGIN(clk, rst_n, flush_2, 1'h0) begin
        //flush_2 <= flush_1;
        if(~stall) flush_2 <= flush ? 1'b1 : flush_1;
    end

    // flags
    `SYNC_BEGIN(clk, rst_n, flags, 1'h0) begin
        flags <= {vf, sf, cf, zf};
    end
    
    //rf_r2_2
    `SYNC_BEGIN(clk, rst_n, rf_r2_2, 32'h0) begin
        if(~stall) rf_r2_2 <= rf_r2;
    end
    
    // db_addr_2
    `SYNC_BEGIN(clk, rst_n, db_addr_2, 32'h0) begin
        if(~stall) db_addr_2 <= db_addr[1:0];
    end
    

    //
    // Stage 2 : Memory and Write Back
    //
    branch br (
		.cond(ir_2[`IR_cond]),
		.cf(flags[1]), .sf(flags[2]), .zf(flags[0]), .vf(flags[3]),
		.taken(br_taken)
    );

    instr_dec_s2 idec_s2(
        .instr(ir_2),
        .flush(flush_2),
        .br_taken(br_taken),
        .wb_src(wb_src),
        .pc_src(pc_0_src),
        .rf_we(rf_we_2)
    );

    mwdata_align db_wdata_aligner (
        .di(rf_r2_2),
        .do(db_datao),
        .size(ir_2[13:12]),
        .A(db_addr_2[1:0])
    );

    mrdata_align db_rdata_aligner (
        .di(db_datai),
        .do(db_datai_aligned),
        .size(ir_2[13:12]),
        .A(db_addr_2[1:0]),
        .sign(ir_2[14])
    );

    adder_32 #(.ADDER_TYPE(3)) pc04_adder ( 
        .a(32'd4), .b(pc_0),
        .ci(1'b0),
        .s(pc_0_4),
        .co()
    );

    assign flush = (pc_0_src != 0);

    assign  wb_mux  =   wb_src  ?   db_datai_aligned    :   result;
    
    assign  pc_0_next    =   pc_0_src    ?   pc_2    :   pc_0_4;
    
    `SYNC_BEGIN(clk, rst_n, pc_0, -32'd4) begin
        if(~stall) pc_0 <= pc_0_next;
    end

    // flush 0
    //`SYNC_BEGIN(clk, rst_n, flush_0, 1'h0) begin
    //    flush_0 <= flush;
    //end


endmodule