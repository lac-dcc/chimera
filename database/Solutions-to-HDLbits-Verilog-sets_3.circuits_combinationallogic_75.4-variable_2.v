module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = a | (c & ~b);
endmodule
