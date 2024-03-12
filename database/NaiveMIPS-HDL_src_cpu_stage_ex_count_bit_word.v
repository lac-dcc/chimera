module count_bit_word(/*autoport*/
//output
           cnt,
//input
           data,
           bit_i);
input wire[31:0] data;
input wire bit_i;
output reg[31:0] cnt;
wire[3:0] cnt1, cnt2, cnt3, cnt4;

count_bit_byte byte1(/*autoinst*/
           .cnt(cnt1),
           .data(data[31:24]),
           .bit_i(bit_i));

count_bit_byte byte2(/*autoinst*/
           .cnt(cnt2),
           .data(data[23:16]),
           .bit_i(bit_i));

count_bit_byte byte3(/*autoinst*/
           .cnt(cnt3),
           .data(data[15:8]),
           .bit_i(bit_i));

count_bit_byte byte4(/*autoinst*/
           .cnt(cnt4),
           .data(data[7:0]),
           .bit_i(bit_i));

always @(*) begin
    if (cnt1!=4'd8) begin
        cnt <= {28'b0, cnt1};
    end
    else if (cnt2!=4'd8) begin
        cnt <= {28'b0, cnt1} + {28'b0, cnt2};
    end
    else if (cnt3!=4'd8) begin
        cnt <= {28'b0, cnt1} + {28'b0, cnt2} + {28'b0, cnt3};
    end
    else begin
        cnt <= {28'b0, cnt1} + {28'b0, cnt2} + {28'b0, cnt3} + {28'b0, cnt4};
    end
end


endmodule