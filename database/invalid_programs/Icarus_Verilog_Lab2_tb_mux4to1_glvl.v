`include "mux4to1_glvl.v"
module tb_mux4to1_glvl();

    wire outp;
    reg [3:0] inp;
    reg [1:0] sel;

    mux4to1_glvl mux(.outp(outp), .inp(inp), .sel(sel));

    initial begin
        $dumpfile("tb_mux4to1_glvl.vcd");
        $dumpvars;
    end

    initial begin
            inp = 4'b0101; sel = 2'b00;
        #5  sel = 2'b01;
        #5  sel = 2'b10;
        #5  sel = 2'b11;
    end

endmodule