module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] out1, out2, out3;
    my_dff8 ins1(clk,d,out1);
    my_dff8 ins2(clk,out1,out2);
    my_dff8 ins3(clk,out2,out3);
    always @(*) begin
        case(sel)
            
2'b00:begin
    
q = d;
    
end
            2'b01:begin
                q[7:0] = out1[7:0];
            end
            2'b10:begin
                q[7:0] = out2[7:0];
            end
            2'b11:begin
                q[7:0] = out3[7:0];
            end
        endcase
    end
endmodule

