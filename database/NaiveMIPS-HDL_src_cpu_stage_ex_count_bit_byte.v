module count_bit_byte(/*autoport*/
//output
           cnt,
//input
           data,
           bit_i);
input wire[7:0] data;
input wire bit_i;
output reg[3:0] cnt;
always @(*) begin
    if(bit_i) begin
        casez(data)                                
            8'b0???????: cnt<=4'd0;             
            8'b10??????: cnt<=4'd1;  
            8'b110?????: cnt<=4'd2;  
            8'b1110????: cnt<=4'd3;  
            8'b11110???: cnt<=4'd4;  
            8'b111110??: cnt<=4'd5;  
            8'b1111110?: cnt<=4'd6;  
            8'b11111110: cnt<=4'd7;
            8'b11111111: cnt<=4'd8;
        endcase
    end else begin
        casez(data)                                
            8'b1???????: cnt<=4'd0;             
            8'b01??????: cnt<=4'd1;  
            8'b001?????: cnt<=4'd2;  
            8'b0001????: cnt<=4'd3;  
            8'b00001???: cnt<=4'd4;  
            8'b000001??: cnt<=4'd5;  
            8'b0000001?: cnt<=4'd6;  
            8'b00000001: cnt<=4'd7;
            8'b00000000: cnt<=4'd8;
        endcase
    end
end
endmodule