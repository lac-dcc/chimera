// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module register_file 
#(
    parameter REGNUM = 32,
    parameter WIDTH = 64
)
(
    input clk,
    input reset,
    input enable,
    input rd1,
    input rd2,
    input wr,
    input [$clog2(REGNUM)-1:0] add_wr,
    input [$clog2(REGNUM)-1:0] add_rd1,
    input [$clog2(REGNUM)-1:0] add_rd2,
    input [WIDTH-1:0] datain,
    output reg [WIDTH-1:0] out1,
    output reg [WIDTH-1:0] out2
);

reg [WIDTH-1:0] registers [0:REGNUM-1];

always @(posedge clk) begin: read_process
    if (enable) begin
        if (rd1) begin
            if ((add_rd1 == add_wr) && (wr == 1))
                out1 <= datain; // write-before-read logic i.e. forward write data to output port
            else
                out1 <= registers[add_rd1];
        end else begin
            out1 <= 'z;
        end
        if (rd2) begin
            if ((add_rd2 == add_wr) && (wr == 1))
                out2 <= datain; // write-before-read logic i.e. forward write data to output port
            else
                out2 <= registers[add_rd2];
        end else begin
            out2 <= 'z;
        end
    end else begin
        out1 <= 'z;
        out2 <= 'z;
    end
end

always @(posedge clk) begin: write_process
    if (reset) begin
        for (int i = 0; i < REGNUM; i++) begin
            registers[i] <= '0;
        end
    end else if (enable) begin
        if (wr) begin
            registers[add_wr] <= datain;
        end
    end
end

endmodule