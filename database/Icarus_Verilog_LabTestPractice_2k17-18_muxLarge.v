`ifndef MUX_LARGE
`define MUX_LARGE
`include "muxSmall.v"

    module muxLarge(
        output outp,
        input [7:0] inp,
        input [2:0] sel
    );

    wire [3:0] layer1Outs;
    wire [1:0] layer2Outs;
    genvar i;

    generate for (i = 0; i<4; i = i+1) begin : layer1 
        muxSmall mux(.outp(layer1Outs[i]), .inp({inp[2*i+1],inp[2*i]}) , .sel(sel[0]));
    end
    endgenerate

    generate for (i = 0; i<2; i = i+1) begin : layer2 
        muxSmall mux(.outp(layer2Outs[i]), .inp({layer1Outs[2*i+1], layer1Outs[2*i]}) , .sel(sel[1]));
    end
    endgenerate

    generate for (i = 0; i<1; i= i+1) begin : layer3
        muxSmall mux(.outp(outp), .inp({layer2Outs[2*i+1], layer2Outs[2*i]}) , .sel(sel[2]));
    end
    endgenerate

    endmodule

`endif