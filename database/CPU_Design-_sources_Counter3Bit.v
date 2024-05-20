// This program was cloned from: https://github.com/mmohamedkhaled/CPU_Design-
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps



module CounterNBitMod #(parameter x = 3,  parameter n = 8)(
    input clk,     
    input reset,    // Asynchronous reset
    input enable,   // Synchronous enable
    output reg [x-1:0] count  
);
always @(posedge clk or posedge reset) begin
    if (reset == 1) begin
        count <= 0;   // Reset the counter
    end
    else if (enable == 1) begin
        if (count == n - 1) begin
            count <= 0;   // Reset the counter when it reaches n-1
        end
        else begin
            count <= count + 1;  
        end
    end
end

endmodule

