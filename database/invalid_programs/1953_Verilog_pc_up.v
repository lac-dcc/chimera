// This program was cloned from: https://github.com/DebashishMukherjee/Verilog
// License: Apache License 2.0

module pc_up (input    [31:0]    pc_in,
              output   [31:0]    pc_out);

    reg [31:0] pc_out;
    always @(pc_in)
        begin
            pc_out = pc+in + 4;
        end

endmodule
