// combinational unstructured

module isqrt
(
    input      [31:0] x,
    output reg [15:0] y
);

    reg [31:0] m, tx, ty, b;

    always @*
    begin
        m  = 31'h4000_0000;
        tx = x;
        ty = 0;
    
        repeat (16)
        begin
            b  = ty |  m;
            ty = ty >> 1;
            
            if (tx >= b)
            begin
                tx = tx - b;
                ty = ty | m;
            end
            
            m = m >> 2;
        end

        y = ty [15:0];
    end

endmodule
