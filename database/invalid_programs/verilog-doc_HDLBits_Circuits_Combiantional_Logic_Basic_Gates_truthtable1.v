module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
    always @(*) begin
        if(x1 == 0 && x2 == 1 && x3 == 0) begin
            f = 1'b1;
        end
        else if(x1 == 1) begin
            if((x2|x3) == 1) begin
                f = 1'b1;
            end
            else begin
                f = 1'b0;
            end
        end
        else begin 
            f = 1'b0;
        end
    end
endmodule

