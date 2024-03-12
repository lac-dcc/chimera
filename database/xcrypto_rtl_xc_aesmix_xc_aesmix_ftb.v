
module xc_aesmix_ftb (

input clock,
input reset

);

wire        flush = valid && dut_ready; // Flush internal state
reg         valid = $anyseq; // Are the inputs valid?
reg [31:0]  rs1   = $anyseq; // Input source register 1
reg [31:0]  rs2   = $anyseq; // Input source register 2
reg         enc   = $anyseq; // Perform encrypt (set) or decrypt (clear).
reg         dut_sel=$anyconst;
reg [31:0] flush_data = $anyseq;

initial     assume(reset == 1'b1);
initial     assume(valid == 1'b0);

always @(posedge clock) begin
    if($past(valid) && !$past(dut_ready)) begin
        assume($stable(valid));
        assume($stable(rs1));
        assume($stable(rs2));
        assume($stable(enc));
        assume($stable(enc));
    end
end

wire        dut_0_ready ; //
wire [31:0] dut_0_result; // 
wire        dut_1_ready ; //
wire [31:0] dut_1_result; // 

wire        dut_ready   = dut_sel ? dut_1_ready  : dut_0_ready ;
wire [31:0] dut_result  = dut_sel ? dut_1_result : dut_0_result;

wire        grm_ready   ; // Is the instruction complete?
wire [31:0] grm_result  ; // 

//
// Correctness assertions.
always @(posedge clock) begin
    // Assume that the GRM computes the result immediately. Hence, if
    // the DUT is ready, the GRM is also ready.
    if(!reset && valid && dut_ready &&  dut_sel) begin
        assert(grm_result == dut_result);
        cover (grm_result == dut_result);
    end
    
    if(!reset && valid && dut_ready && !dut_sel) begin
        assert(grm_result == dut_result);
        cover (grm_result == dut_result);
    end
end

//
// Stability / fairness restrictions.
always @(posedge clock) begin
    if(!reset && $past(valid) && valid && !$past(grm_ready)) begin
        // Inputs must be stable while output not ready.
        assume($stable(valid));
        assume($stable(rs2));
        assume($stable(rs1));
        assume($stable(enc));
    end
end


//
// Golden reference model instance
xc_aesmix_checker i_grm(
.clock (clock     ),
.reset (reset     ),
.valid (valid     ), // Are the inputs valid?
.rs1   (rs1       ), // Input source register 1
.rs2   (rs2       ), // Input source register 2
.enc   (enc       ), // Perform encrypt (set) or decrypt (clear).
.ready (grm_ready ), // Is the instruction complete?
.result(grm_result)  // 
);

//
// DUT model instance - FAST
xc_aesmix #(
.FAST(1'b1)
) i_dut_0(
.clock (clock     ),
.reset (reset     ),
.flush (flush     ), //
.flush_data(flush_data),
.valid (valid     ), // Are the inputs valid?
.rs1   (rs1       ), // Input source register 1
.rs2   (rs2       ), // Input source register 2
.enc   (enc       ), // Perform encrypt (set) or decrypt (clear).
.ready (dut_1_ready ), // Is the instruction complete?
.result(dut_1_result)  // 
);

//
// DUT model instance - Area optimised
xc_aesmix #(
.FAST(1'b0)
) i_dut_1(
.clock (clock     ),
.reset (reset     ),
.flush (flush     ), //
.flush_data(flush_data),
.valid (valid     ), // Are the inputs valid?
.rs1   (rs1       ), // Input source register 1
.rs2   (rs2       ), // Input source register 2
.enc   (enc       ), // Perform encrypt (set) or decrypt (clear).
.ready (dut_0_ready ), // Is the instruction complete?
.result(dut_0_result)  // 
);

endmodule

//
// Golden reference checker module.
module xc_aesmix_checker(

input  wire        clock ,
input  wire        reset ,

input  wire        valid , // Are the inputs valid?
input  wire [31:0] rs1   , // Input source register 1
input  wire [31:0] rs2   , // Input source register 2
input  wire        enc   , // Perform encrypt (set) or decrypt (clear).
output wire        ready , // Is the instruction complete?
output wire [31:0] result  // 

);

assign ready = valid;


wire [7:0] t0 = rs1[ 7: 0];
wire [7:0] t1 = rs1[15: 8];
wire [7:0] t2 = rs2[23:16];
wire [7:0] t3 = rs2[31:24];

function [7:0] xt2;
    input[7:0] a;
    xt2 = a[7] ? (a << 1) ^ 8'h1b : (a<<1);
endfunction

function [7:0] xt3;
    input[7:0] a;
    xt3 = a ^ xt2(a);
endfunction

reg [7:0] e_exp0;
reg [7:0] e_exp1;
reg [7:0] e_exp2;
reg [7:0] e_exp3;

wire [31:0] mixenc_expected = {e_exp3,e_exp2,e_exp1,e_exp0};

always @(*) begin
    e_exp0 = xt2(t0) ^ xt3(t1) ^     t2  ^     t3  ;
    e_exp1 =     t0  ^ xt2(t1) ^ xt3(t2) ^     t3  ;
    e_exp2 =     t0  ^     t1  ^ xt2(t2) ^ xt3(t3) ;
    e_exp3 = xt3(t0) ^     t1  ^     t2  ^ xt2(t3) ;
end

function [7:0] xtX;
    input[7:0] a;
    input[3:0] b;
    xtX = 
        (b[0] ?             a   : 0) ^
        (b[1] ? xt2(        a)  : 0) ^
        (b[2] ? xt2(xt2(    a)) : 0) ^
        (b[3] ? xt2(xt2(xt2(a))): 0) ;
endfunction

reg [7:0] d_exp0;
reg [7:0] d_exp1;
reg [7:0] d_exp2;
reg [7:0] d_exp3;

wire [31:0] mixdec_expected = {d_exp3,d_exp2,d_exp1,d_exp0};

always @(*) begin
    d_exp3 = xtX(t0,4'hb) ^ xtX(t1,4'hd) ^ xtX(t2,4'h9) ^ xtX(t3,4'he) ;
    d_exp2 = xtX(t0,4'hd) ^ xtX(t1,4'h9) ^ xtX(t2,4'he) ^ xtX(t3,4'hb) ;
    d_exp1 = xtX(t0,4'h9) ^ xtX(t1,4'he) ^ xtX(t2,4'hb) ^ xtX(t3,4'hd) ;
    d_exp0 = xtX(t0,4'he) ^ xtX(t1,4'hb) ^ xtX(t2,4'hd) ^ xtX(t3,4'h9) ;
end

assign result = enc ? mixenc_expected : mixdec_expected;

endmodule
