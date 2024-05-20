// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

//
// 自然 2 进制转换为 4 位格雷码
//
module bin_to_Gray(
    input               clk,
    input               rst,
    input      [3:0]    data,
    output reg [3:0]    gray_data
);

always@(posedge clk) begin
    if(!rst) begin 
        gray_data <= 'b0;
    end
    else begin
        case(data)
            4'b0000: gray_data <= 4'b0000;
            4'b0001: gray_data <= 4'b0001;
            4'b0010: gray_data <= 4'b0011;
            4'b0011: gray_data <= 4'b0010;
            4'b0100: gray_data <= 4'b0110;
            4'b0101: gray_data <= 4'b0111;
            4'b0110: gray_data <= 4'b0101;
            4'b0111: gray_data <= 4'b0100;
            4'b1000: gray_data <= 4'b1100;
            4'b1001: gray_data <= 4'b1101;
            4'b1010: gray_data <= 4'b1111;
            4'b1011: gray_data <= 4'b1110;
            4'b1100: gray_data <= 4'b1010;
            4'b1101: gray_data <= 4'b1011;
            4'b1110: gray_data <= 4'b1001;
            4'b1111: gray_data <= 4'b1000;
            default: gray_data <= gray_data;
        endcase
    end
end

endmodule