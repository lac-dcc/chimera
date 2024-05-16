
//
// module: xc_sha3_ftb
//
//  Formal checker for the correctness of the packed add/subtract module.
//
module xc_sha3_ftb (

input clock,
input reset

);

reg  [31:0] rs1      = $anyseq; // Input source register 1
reg  [31:0] rs2      = $anyseq; // Input source register 2
reg  [ 1:0] shamt    = $anyseq; // Post-Shift Amount

// One hot function select wires
reg         f_xy     = $anyseq; // xc.sha3.xy instruction function
reg         f_x1     = $anyseq; // xc.sha3.x1 instruction function
reg         f_x2     = $anyseq; // xc.sha3.x2 instruction function
reg         f_x4     = $anyseq; // xc.sha3.x4 instruction function
reg         f_yx     = $anyseq; // xc.sha3.yx instruction function

reg [31:0] result       ; // DUT result
reg [31:0] expectation  ; // GRM result

wire [4:0] onehot = f_xy + f_x1 + f_x2 + f_x4 + f_yx;

always @(posedge clock) begin

    restrict(onehot <= 1);
    restrict(rs1[4:0] < 25);
    restrict(rs2[4:0] < 25);

    if(f_xy) begin

        assert(result == expectation);

    end else if (f_x1) begin
        
        assert(result == expectation);

    end else if (f_x2) begin
        
        assert(result == expectation);

    end else if (f_x4) begin
        
        assert(result == expectation);

    end else if (f_yx) begin
        
        assert(result == expectation);

    end


end


//
// DUT Instantiation
//
xc_sha3 i_sha3 (
.rs1   (rs1         ), // Input source register 1
.rs2   (rs2         ), // Input source register 2
.shamt (shamt       ), // Post-Shift Amount
.f_xy  (f_xy        ), // xc.sha3.xy instruction function
.f_x1  (f_x1        ), // xc.sha3.x1 instruction function
.f_x2  (f_x2        ), // xc.sha3.x2 instruction function
.f_x4  (f_x4        ), // xc.sha3.x4 instruction function
.f_yx  (f_yx        ), // xc.sha3.yx instruction function
.result(result      )  //
);


//
// Checker Instantiation
//
fml_xc_sha3_checker i_sha3_checker (
.rs1   (rs1         ), // Input source register 1
.rs2   (rs2         ), // Input source register 2
.shamt (shamt       ), // Post-Shift Amount
.f_xy  (f_xy        ), // xc.sha3.xy instruction function
.f_x1  (f_x1        ), // xc.sha3.x1 instruction function
.f_x2  (f_x2        ), // xc.sha3.x2 instruction function
.f_x4  (f_x4        ), // xc.sha3.x4 instruction function
.f_yx  (f_yx        ), // xc.sha3.yx instruction function
.result(expectation )  //
);


endmodule


//
// module: fml_sha3_checker
//
//  Checker module, which produces a reference output for the given
//  inputs against which an implementaiton of the sha3 function can
//  be checked.
//
module fml_xc_sha3_checker (

input  wire [31:0] rs1      , // Input source register 1
input  wire [31:0] rs2      , // Input source register 2
input  wire [ 1:0] shamt    , // Post-Shift Amount

// One hot function select wires
input  wire        f_xy     , // xc.sha3.xy instruction function
input  wire        f_x1     , // xc.sha3.x1 instruction function
input  wire        f_x2     , // xc.sha3.x2 instruction function
input  wire        f_x4     , // xc.sha3.x4 instruction function
input  wire        f_yx     , // xc.sha3.yx instruction function

output reg  [31:0] result     //

);

wire [2:0] x = rs1[2:0];
wire [2:0] y = rs2[2:0];


always @(*) begin

    result = 0;

    if(f_xy) begin

        result = (((x)%5) + 5*((y)%5)) << shamt;

    end else if (f_x1) begin
        
        result = (((x+1)%5) + 5*((y)%5)) << shamt;

    end else if (f_x2) begin
        
        result = (((x+2)%5) + 5*((y)%5)) << shamt;

    end else if (f_x4) begin
        
        result = (((x+4)%5) + 5*((y)%5)) << shamt;

    end else if (f_yx) begin
        
        result = (((y)%5) + 5*((2*x+3*y)%5)) << shamt;

    end

end


endmodule

