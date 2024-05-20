// This program was cloned from: https://github.com/skerr92/O2-Trainer
// License: MIT License


`include "src/cpu.v"
module top(input rst, 
           input instr_we, 
           output [1:0] cpu_out);

    wire clk;
    reg [31:0] counter;

    reg [7:0] cpu_fill;

    //10khz used for low power applications (or sleep mode)
    SB_HFOSC SB_HFOSC_inst(
        .CLKHFEN(1),
        .CLKHFPU(1),
        .CLKHF(clk)
    );

    cpu cpu_init(.clk(counter[22]),
                 .rst(rst),
                 .cpu_out(cpu_out),
                 .data_in(cpu_fill),
                 .instr_we(instr_we));

    initial begin 
        counter = 0;
    end

    always @(posedge clk) begin 
        if (rst) begin 
            counter <= 0;
        end
        if (instr_we)
            cpu_fill <= counter[31:24];
        counter <= counter + 1;
    end

endmodule