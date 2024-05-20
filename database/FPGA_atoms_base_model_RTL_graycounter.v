// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

//
// 使用格雷码进行脉冲计数
//
module graycounter(
    input           clk,
    input           rst,
    input           pulse,
    // input           en_count,
    output  [3:0]   count
);

// reg [3:0] r_count;
reg [3:0]   data;
reg [3:0]   gray_data;
reg [1:0]   de_pulse;
wire        rise_edge;


// 脉冲边沿检测
always@(posedge clk) begin
    if(!rst) begin
        de_pulse <= 'b0;
    end
    else begin
        de_pulse <= {de_pulse,pulse};
    end
end
assign rise_edge = de_pulse[0] & ~de_pulse[1];

// 计数
always@(posedge clk) begin
    if(!rst) begin
        data <= 'b0;
    end
    else begin
        if(rise_edge==1'b1) begin
            data <= data+1;
        end
        else begin
            data <= data;
        end
    end
end

// 自然二进制转码
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

assign count = gray_data;

endmodule

