// This program was cloned from: https://github.com/skerr92/O2-Trainer
// License: MIT License

`default_nettype none

module mem(input wire clk,
           input wire we, 
           input wire [3:0] addr, 
           input wire [1:0] d_in, 
           output reg [1:0] d_out);

    reg [1:0] mem [15:0];

    always @(posedge clk) begin 

        if (we) begin 
            mem[addr] <= d_in;
        end
        d_out <= mem[addr];
    end

endmodule