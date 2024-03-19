module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
wire inside1,inside2,inside3,inside4;
    
assign inside1 = p1a&p1b&p1c;
    
assign inside2 = p1d&p1e&p1f;
    
assign inside3 = p2a&p2b;
    
assign inside4 = p2c&p2d;
    
assign p1y = inside1|inside2;
    
assign p2y = inside3|inside4;

endmodule

