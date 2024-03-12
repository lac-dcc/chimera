module sign_extend
        #(parameter INWIDTH = 16,OUTWIDTH=32)
        (in,out);
    input  [ INWIDTH-1:0] in;
    output [OUTWIDTH-1:0] out;
    assign out = {{OUTWIDTH-INWIDTH{in[INWIDTH-1]}}, in};
endmodule

module zero_extend
        #(parameter INWIDTH = 16,OUTWIDTH=32)
        (in,out);
    input  [ INWIDTH-1:0] in;
    output [OUTWIDTH-1:0] out;
    assign out = {{OUTWIDTH-INWIDTH{1'b0}}, in};
endmodule

module EXT
        #(parameter IN = 16,OUT=32)
        (Op,in,out);
    
    /* *
     * 0 for zero_extend
     * 1 for sign_extend
     */
    
    input  wire   Op; 
    input  [ IN-1:0] in;
    output [OUT-1:0] out;
    
    wire [OUT-1:0] sign_in;
    wire [OUT-1:0] zero_in;

    sign_extend #(IN,OUT) sign_extend(in,sign_in);
    zero_extend #(IN,OUT) zero_extend(in,zero_in);
    
    MUX #(OUT) EXTMUX(
        .in_0(zero_in),
        .in_1(sign_in),
        .A(Op),
        .Q(out)
    ); 
endmodule
