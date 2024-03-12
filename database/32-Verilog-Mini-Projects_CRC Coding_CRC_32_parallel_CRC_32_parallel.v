//
module CRC_32_parallel(clk,rst,load,d_finish,crc_in,crc_out); 
input clk; //
input rst; //
input load; //
input d_finish; //
input [7:0] crc_in; //
output [7:0] crc_out; // 
reg [7:0] crc_out; //
reg [31:0] crc_reg; //
reg [1:0] count; //
reg [1:0] state; //
wire [31:0] next_crc_reg; //
parameter idle = 2'b00; //
parameter compute = 2'b01; //
parameter finish = 2'b10; //
//
assign next_crc_reg[0] = crc_reg[24] ^ crc_reg[30] ^ crc_in[0] ^ 
crc_in[6]; 
assign next_crc_reg[1] = crc_reg[24] ^ crc_reg[25] ^ crc_reg[30] ^ 
crc_reg[31] ^ crc_in[0] ^ crc_in[1] ^ crc_in[6] ^ crc_in[7]; 
assign next_crc_reg[2] = crc_reg[24] ^ crc_reg[25] ^ crc_reg[26] ^ 
crc_reg[30] ^ crc_reg[31] ^ crc_in[0] ^ crc_in[1] ^ crc_in[2] ^ crc_in[6] 
^ crc_in[7]; 
assign next_crc_reg[3] = crc_reg[25] ^ crc_reg[26] ^ crc_reg[27] ^ 
crc_reg[31] ^ crc_in[1] ^ crc_in[2] ^ crc_in[3] ^ crc_in[7]; 
assign next_crc_reg[4] = crc_reg[24] ^ crc_reg[26] ^ crc_reg[27] ^ 
crc_reg[28] ^ crc_reg[30] ^ crc_in[0] ^ crc_in[2] ^ crc_in[3] ^ crc_in[4] 
^ crc_in[6]; 
assign next_crc_reg[5] = crc_reg[24] ^ crc_reg[25] ^ crc_reg[27] ^ 
crc_reg[28] ^ crc_reg[29] ^ crc_reg[30] ^ crc_reg[31] ^ crc_in[0] ^ 
crc_in[1] ^ crc_in[3] ^ crc_in[4] ^ crc_in[5] ^ crc_in[6] ^ crc_in[7]; 
assign next_crc_reg[6] = crc_reg[25] ^ crc_reg[26] ^ crc_reg[28] ^ 
crc_reg[29] ^ crc_reg[30] ^ crc_reg[31] ^ crc_in[1] ^ crc_in[2] ^ crc_in[4] 
^ crc_in[5] ^ crc_in[6] ^ crc_in[7]; 
assign next_crc_reg[7] = crc_reg[24] ^ crc_reg[26] ^ crc_reg[27] ^ 
crc_reg[29] ^ crc_reg[31] ^ crc_in[0] ^ crc_in[2] ^ crc_in[3] ^ crc_in[5] 
^ crc_in[7]; 
assign next_crc_reg[8] = crc_reg[0] ^ crc_reg[24] ^ crc_reg[25] ^ 
crc_reg[27] ^ crc_reg[28] ^ crc_in[0] ^ crc_in[1] ^ crc_in[3] ^ crc_in[4]; 
assign next_crc_reg[9] = crc_reg[1] ^ crc_reg[25] ^ crc_reg[26] ^ 
crc_reg[28] ^ crc_reg[29] ^ crc_in[1] ^ crc_in[2] ^ crc_in[4] ^ crc_in[5]; 
assign next_crc_reg[10] = crc_reg[2] ^ crc_reg[24] ^ crc_reg[26] ^ 
crc_reg[27] ^ crc_reg[29] ^ crc_in[0] ^ crc_in[2] ^ crc_in[3] ^ crc_in[5]; 
assign next_crc_reg[11] = crc_reg[3] ^ crc_reg[24] ^ crc_reg[25] ^ 
crc_reg[27] ^ crc_reg[28] ^ crc_in[0] ^ crc_in[1] ^ crc_in[3] ^ crc_in[4]; 
assign next_crc_reg[12] = crc_reg[4] ^ crc_reg[24] ^ crc_reg[25] ^ 
crc_reg[26] ^ crc_reg[28] ^ crc_reg[29] ^ crc_reg[30] ^ crc_in[0] ^ 
crc_in[1] ^ crc_in[2] ^ crc_in[4] ^ crc_in[5] ^ crc_in[6]; 
assign next_crc_reg[13] = crc_reg[5] ^ crc_reg[25] ^ crc_reg[26] ^ 
crc_reg[27] ^ crc_reg[29] ^ crc_reg[30] ^ crc_reg[31] ^ crc_in[1] ^ 
crc_in[2] ^ crc_in[3] ^ crc_in[5] ^ crc_in[6] ^ crc_in[7]; 
assign next_crc_reg[14] = crc_reg[6] ^ crc_reg[26] ^ crc_reg[27] ^ 
crc_reg[28] ^ crc_reg[30] ^ crc_reg[31] ^ crc_in[2] ^ crc_in[3] ^ crc_in[4] 
^ crc_in[6] ^ crc_in[7]; 
assign next_crc_reg[15] = crc_reg[7] ^ crc_reg[27] ^ crc_reg[28] ^ 
crc_reg[29] ^ crc_reg[31] ^ crc_in[3] ^ crc_in[4] ^ crc_in[5] ^ crc_in[7]; 
assign next_crc_reg[16] = crc_reg[8] ^ crc_reg[24] ^ crc_reg[28] ^ 
crc_reg[29] ^ crc_in[0] ^ crc_in[4] ^ crc_in[5]; 
assign next_crc_reg[17] = crc_reg[9] ^ crc_reg[25] ^ crc_reg[29] ^ 
crc_reg[30] ^ crc_in[1] ^ crc_in[5] ^ crc_in[6]; 
assign next_crc_reg[18] = crc_reg[10] ^ crc_reg[26] ^ crc_reg[30] ^ 
crc_reg[31] ^ crc_in[2] ^ crc_in[6] ^ crc_in[7]; 
assign next_crc_reg[19] = crc_reg[11] ^ crc_reg[27] ^ crc_reg[31] ^ 
crc_in[3] ^ crc_in[7]; 
assign next_crc_reg[20] = crc_reg[12] ^ crc_reg[28] ^ crc_in[4]; 
assign next_crc_reg[21] = crc_reg[13] ^ crc_reg[29] ^ crc_in[5]; 
assign next_crc_reg[22] = crc_reg[14] ^ crc_reg[24] ^ crc_in[0]; 
assign next_crc_reg[23] = crc_reg[15] ^ crc_reg[24] ^ crc_reg[25] ^ 
crc_reg[30] ^ crc_in[0] ^ crc_in[1] ^ crc_in[6]; 
assign next_crc_reg[24] = crc_reg[16] ^ crc_reg[25] ^ crc_reg[26] ^ 
crc_reg[31] ^ crc_in[1] ^ crc_in[2] ^ crc_in[7]; 
assign next_crc_reg[25] = crc_reg[17] ^ crc_reg[26] ^ crc_reg[27] ^ 
crc_in[2] ^ crc_in[3]; 
assign next_crc_reg[26] = crc_reg[18] ^ crc_reg[24] ^ crc_reg[27] ^ 
crc_reg[28] ^ crc_reg[30] ^ crc_in[0] ^ crc_in[3] ^ crc_in[4] ^ crc_in[6]; 
assign next_crc_reg[27] = crc_reg[19] ^ crc_reg[25] ^ crc_reg[28] ^ 
crc_reg[29] ^ crc_reg[31] ^ crc_in[1] ^ crc_in[4] ^ crc_in[5] ^ crc_in[7]; 
assign next_crc_reg[28] = crc_reg[20] ^ crc_reg[26] ^ crc_reg[29] ^ 
crc_reg[30] ^ crc_in[2] ^ crc_in[5] ^ crc_in[6]; 
assign next_crc_reg[29] = crc_reg[21] ^ crc_reg[27] ^ crc_reg[30] ^ 
crc_reg[31] ^ crc_in[3] ^ crc_in[6] ^ crc_in[7]; 
assign next_crc_reg[30] = crc_reg[22] ^ crc_reg[28] ^ crc_reg[31] ^ 
crc_in[4] ^ crc_in[7]; 
assign next_crc_reg[31] = crc_reg[23] ^ crc_reg[29] ^ crc_in[5]; 
//
always@(posedge clk) 
begin 
case(state) //
 idle:begin //
 if(load) //l
 state <= compute; 
 else 
 state <= idle; 
 end 
 compute:begin 
 if(d_finish) // 
 state <= finish; 
 else 
 state <= compute; 
 end 
 finish:begin 
 if(count==2) //
 state <= idle; 
 else 
 state <= finish; 
 end 
endcase 
end 
always@(posedge clk or negedge rst) // 
 if(rst) 
 begin 
 crc_reg[31:0] <= 32'b0000_0000_0000_0000_0000_0000_0000_0000; //

 state <= idle; 
 count <= 2'b00; 
 end 
 else 
 case(state) 
 idle:begin //
 crc_reg[31:0] <= 
32'b0000_0000_0000_0000_0000_0000_0000_0000; 
 end 
 compute:begin // 
 crc_reg[31:0]<= next_crc_reg[31:0]; 
 crc_out[7:0] <= crc_in[7:0]; 
 end 
 finish:begin //
 crc_reg[31:0] <= {crc_reg[23:0],8'b0000_0000}; 
 crc_out[7:0] <= crc_reg[31:24]; 
 end 
 endcase 
endmodule 
