// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

module WaveformROM #(
    parameter ADDR_WIDTH = 8)(
    input clka,
    input [ADDR_WIDTH-1:0] addra,
    output reg [7:0] douta
);

(* ramstyle = "AUTO" *) reg [7:0] mem [(2**ADDR_WIDTH-1):0];

initial begin
    $readmemh("C:/Users/range/Desktop/CortexM0_SoC/Task4/source/sin_Xilinx.hex", mem);
end

always@(posedge clka) begin
    douta <= mem[addra];
end

endmodule