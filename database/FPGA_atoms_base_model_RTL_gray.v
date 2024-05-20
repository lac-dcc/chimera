// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

//
// 二进制转格雷码，用每位相互异或的方法
//
module gray #(
    parameter MSB = 4                   // 指定位宽
)
(
    input                   clk,
    input                   rst,
    input                   i_en,
    input      [MSB-1:0]    i_data,
    output reg              o_valid,
    output reg [MSB-1:0]    o_data
);

always@(posedge clk) begin
    if(!rst) begin
        o_valid <= 0;
    end
    else begin
        o_valid <= i_en;
    end
end

always@(posedge clk) begin
    if(!rst) begin
        o_data <= 'b0;
    end
    else begin
        if(i_en) begin
            o_data[MSB-1] <= i_data[MSB-1];
        end
        else begin
            o_data[MSB-1] <= o_data[MSB-1];
        end
    end
end

genvar i;
generate
    for(i=MSB-2; i>=0; i=i-1) begin
        always@(posedge clk) begin
            if(i_en) begin
                o_data[i] <= i_data[i] ^ i_data[i+1];
            end
            else begin
                o_data[i] <= o_data[i];
            end
        end
    end
endgenerate

endmodule