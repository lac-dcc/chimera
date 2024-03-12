
//
// module: xc_aessub
//
//  Implements the lightweight AES SubBytes instructions.
//
module xc_aessub(

input  wire        clock ,
input  wire        reset ,

input  wire        flush , // Flush contents
input  wire [31:0] flush_data, // Data flushed into the design.

input  wire        valid , // Are the inputs valid?
input  wire [31:0] rs1   , // Input source register 1
input  wire [31:0] rs2   , // Input source register 2
input  wire        enc   , // Perform encrypt (set) or decrypt (clear).
input  wire        rot   , // Perform encrypt (set) or decrypt (clear).
output wire        ready , // Is the instruction complete?
output wire [31:0] result  // 

);

parameter FAST = 1'b1;

generate if(FAST) begin

//
// Single cycle implementation
// ------------------------------------------------------------

assign ready = valid;

wire [7:0] sb_in_0 = rs1[ 7: 0] & {8{valid}};
wire [7:0] sb_in_1 = rs2[15: 8] & {8{valid}};
wire [7:0] sb_in_2 = rs1[23:16] & {8{valid}};
wire [7:0] sb_in_3 = rs2[31:24] & {8{valid}};

wire [7:0] sb_out_0;
wire [7:0] sb_out_1;
wire [7:0] sb_out_2;
wire [7:0] sb_out_3;

assign result = rot ? {sb_out_2, sb_out_1, sb_out_0, sb_out_3} :
                      {sb_out_3, sb_out_2, sb_out_1, sb_out_0} ;

xc_aessub_sbox sbox_0(
.in  (sb_in_0 ), // Input byte
.inv (!enc    ), // Perform inverse (set) or forward lookup
.out (sb_out_0)  // Output byte
);

xc_aessub_sbox sbox_1(
.in  (sb_in_1 ), // Input byte
.inv (!enc    ), // Perform inverse (set) or forward lookup
.out (sb_out_1)  // Output byte
);

xc_aessub_sbox sbox_2(
.in  (sb_in_2 ), // Input byte
.inv (!enc    ), // Perform inverse (set) or forward lookup
.out (sb_out_2)  // Output byte
);

xc_aessub_sbox sbox_3(
.in  (sb_in_3 ), // Input byte
.inv (!enc    ), // Perform inverse (set) or forward lookup
.out (sb_out_3)  // Output byte
);

end else begin // (FAST == 0)

//
// Multi-cycle implementation
// ------------------------------------------------------------

reg  [1:0] fsm     ;
wire [1:0] n_fsm   = fsm + 1 ;

wire       fsm_0   = fsm == 0;
wire       fsm_1   = fsm == 1;
wire       fsm_2   = fsm == 2;
wire       fsm_3   = fsm == 3;

wire [7:0] sbox_in = 
    {8{valid && fsm_0}} & rs1[ 7: 0] |
    {8{valid && fsm_1}} & rs2[15: 8] |
    {8{valid && fsm_2}} & rs1[23:16] |
    {8{valid && fsm_3}} & rs2[31:24] ;

wire [7:0] sbox_out;

assign     ready   = fsm_3;

reg [7:0]  b_0;
reg [7:0]  b_1;
reg [7:0]  b_2;

assign     result  = rot ? {b_2, b_1, b_0, sbox_out} :
                           {sbox_out, b_2, b_1, b_0} ;

always @(posedge clock) begin
    if(reset || flush) begin
        b_0 <= flush_data[7:0];
    end else if(fsm_0 && valid) begin
        b_0 <= sbox_out;
    end
end

always @(posedge clock) begin
    if(reset) begin
        b_1 <= flush_data[15:8];
    end else if(fsm_1 && valid) begin
        b_1 <= sbox_out;
    end
end

always @(posedge clock) begin
    if(reset) begin
        b_2 <= flush_data[23:16];
    end else if(fsm_2 && valid) begin
        b_2 <= sbox_out;
    end
end

always @(posedge clock) begin
    if(reset || flush) begin
        fsm <= 0;
    end else if(valid || ready) begin
        fsm <= n_fsm;
    end
end

xc_aessub_sbox sbox_0(
.in  (sbox_in ), // Input byte
.inv (!enc    ), // Perform inverse (set) or forward lookup
.out (sbox_out)  // Output byte
);

end endgenerate

endmodule


