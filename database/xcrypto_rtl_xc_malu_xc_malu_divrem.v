
//
// Handles instructions:
//  - div
//  - divu
//  - rem
//  - remu
//
module xc_malu_divrem (

input  wire         clock           ,
input  wire         resetn          ,

input  wire [31:0]  rs1             ,
input  wire [31:0]  rs2             ,

input  wire         valid           ,
input  wire         op_signed       ,
input  wire         flush           ,

input  wire [ 5:0]  count           ,
input  wire [63:0]  acc             , // Divisor
input  wire [31:0]  arg_0           , // Dividend
input  wire [31:0]  arg_1           , // Quotient

output wire [63:0]  n_acc           ,
output wire [31:0]  n_arg_0         ,
output wire [31:0]  n_arg_1         ,
output wire         ready           

);

reg         div_run     ;

wire        div_finished= (div_run && count == 32);
assign      ready       = div_finished;

wire        signed_lhs  = (op_signed) && rs1[31];
wire        signed_rhs  = (op_signed) && rs2[31];

wire        div_start   = valid     && !div_run;

wire [31:0] qmask       = (32'b1<<31  ) >> count  ;

wire        div_less    = acc <= {32'b0,arg_0};

wire [31:0] sub_result = arg_0 - acc[31:0];
        

wire [63:0] divisor_start = 
    {(signed_rhs ? -{rs2[31],rs2} : {1'b0,rs2}), 31'b0};


assign      n_acc       = div_start    ? divisor_start  :
                                         acc >> 1       ;

assign      n_arg_0     = div_start ? (signed_lhs ? -rs1 : rs1) :
                          div_less  ? sub_result                :
                                      arg_0                     ;

assign      n_arg_1     = div_start           ? 0               :
                          div_run && div_less ? arg_1 | qmask   :
                                                arg_1           ;

always @(posedge clock) begin
    if(!resetn   || flush) begin
        
        div_run  <= 1'b0;

    end else if(div_start) begin
        
        div_run  <= 1'b1;

    end else if(div_run) begin

        if(div_finished) begin

            div_run  <= 1'b0;

        end

    end
end

endmodule
