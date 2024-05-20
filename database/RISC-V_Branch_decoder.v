// This program was cloned from: https://github.com/MihVuongNguyen/RISC-V
// License: Apache License 2.0

module branch_decoder (
    input branchOP, jump,
    input [2:0] func,
    input BrEQ, BrLT,
    output reg PCsel
);
    
always @(*) begin
    if (jump)
        PCsel = 1;
    else if (branchOP)
        case (func)
            3'b000 : PCsel = (BrEQ)? 1 : 0;
            3'b001 : PCsel = (BrEQ)? 0 : 1;
            3'b100 : PCsel = (BrLT)? 1 : 0;
            3'b101 : PCsel = (BrLT)? 0 : 1;   
            default: PCsel = 0;
        endcase
    else
       PCsel = 0;

end

endmodule