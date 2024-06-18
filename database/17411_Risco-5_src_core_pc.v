// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module PC #(
    parameter BOOT_ADDRESS=32'h00000000
)(
    input wire clk,
    input wire load,
    input wire reset,
    input wire [31:0] Input,
    output reg [31:0] Output
);

initial begin
    Output = BOOT_ADDRESS;
end

always @(posedge clk) begin
    if(reset == 1'b1) begin
        Output <= BOOT_ADDRESS;
    end else begin
        if(load == 1'b1) begin
            Output <= Input;
        end
    end 
end

endmodule
