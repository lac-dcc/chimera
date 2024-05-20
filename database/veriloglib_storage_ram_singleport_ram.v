// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module singleport_ram
#(
    parameter WIDTH = 8,
    parameter DEPTH = 2**4
)
(
    input clk,
    input wr_en,
    input rd_en,
    input [$clog2(DEPTH)-1:0] addr,
    inout [WIDTH-1:0] dinout
);

    reg [WIDTH-1:0] mem [DEPTH];
    reg rd_en_int;
    reg [WIDTH-1:0] dout;

    always @(posedge clk)
        begin
            if(wr_en)
                mem[addr] <= dinout;
            dout <= mem[addr];
            rd_en_int <= rd_en;
        end

    assign dinout = rd_en_int ? dout : {WIDTH{1'bZ}};

endmodule