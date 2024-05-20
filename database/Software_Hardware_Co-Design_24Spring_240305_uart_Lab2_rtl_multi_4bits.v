// This program was cloned from: https://github.com/huangxc6/Software_Hardware_Co-Design_24Spring
// License: MIT License

module multi_4bits(
    input               clk,
    input               rst_n,
    input               i_valid,
    input [3:0]         x,
    input [3:0]         y,
    output  reg [7:0]   cout,
    output              o_valid
);

    reg [3:0]x_reg, y_reg;
    reg [7:0]out_reg0;
    reg [7:0]out_reg1;
    reg [7:0]out_reg2;
    reg [7:0]out_reg3;
    
    reg [7:0]out_reg01;
    reg [7:0]out_reg23;

    always@(posedge clk, negedge rst_n) begin
        if(!rst_n)
        begin
            cout <= 8'b0;
        end
        else begin
            out_reg0 <= y[0] ? {4'b0,x}     :8'b0;
            out_reg1 <= y[1] ? {3'b0,x,1'b0}:8'b0;
            out_reg2 <= y[2] ? {2'b0,x,2'b0}:8'b0;
            out_reg3 <= y[3] ? {1'b0,x,3'b0}:8'b0;
            out_reg01 <= out_reg0+out_reg1;
            out_reg23 <= out_reg2+out_reg3;
            cout <= out_reg01+out_reg23;
        end
    end
    
    reg [2:0] o_valid_reg;
    always@(posedge clk, negedge rst_n) begin
        if(!rst_n)
        begin
            o_valid_reg <= 1'b0;
        end else begin
            o_valid_reg <= {i_valid, o_valid_reg[2:1]};
        end
    end
    
    assign o_valid = o_valid_reg[0];

endmodule