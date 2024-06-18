// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module T_ff (
    input wire T,
    input wire clk,
    output reg Q
);

    reg D;

    always @(posedge clk) begin
        if (T)
            D <= ~Q;
        else
            D <= Q;
    end

    always @(posedge clk) begin
        Q <= D;
    end

endmodule