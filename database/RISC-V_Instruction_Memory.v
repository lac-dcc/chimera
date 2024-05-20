// This program was cloned from: https://github.com/MihVuongNguyen/RISC-V
// License: Apache License 2.0

module Inst_memory (
    input  [31:0] addres,
    output [31:0] inst_out
);

reg [31:0] inst_mem [255:0];

initial begin
    $readmemh("TEST.txt", inst_mem);
end 

assign inst_out = inst_mem[addres[31:2]];
 
endmodule
