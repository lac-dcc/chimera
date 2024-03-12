module CRC_32_serial(clk,rst,load,d_finish,crc_in,crc_out); 
input clk; //
input rst; //
input load; //
input d_finish; //
input crc_in; //
output crc_out; // 
reg crc_out; //
reg [31:0] crc_reg; //
reg [1:0] state; //
reg [4:0] count; //
parameter idle = 2'b00; //
parameter compute = 2'b01; //
parameter finish = 2'b10; //
  always@ (posedge clk) //
begin // 
case (state) // 
 idle: begin // 
 if (load) //
 state <= compute; 
 else
 state <= idle; 
 end
 compute:begin //
 if(d_finish) 
 state <= finish; 
 else
 state <= compute; 
 end
 finish: begin // 
   if(count==32) 
 state <= idle; 
 else
 count <= count+1; 
 end
endcase
end 
always@ (posedge clk or negedge rst)//
 if(rst) 
 begin 
 count <= 5'b0_0000; 
 state <= idle; 
 end
 else
 case(state) 
 idle:begin
   crc_reg[31:0] <= 32'b0000_0000_0000_0000_0000_0000_0000_0000; 
 end
 compute:begin 
 //Produces a polynomial x^16+x^15+x^2+1 
   crc_reg[0] <= crc_reg[31] ^ crc_in; 
 crc_reg[1] <= crc_reg[0]; 
   crc_reg[2] <= crc_reg[1] ^ crc_reg[31] ^ crc_in; 
   crc_reg[30:3] <= crc_reg[29:2]; 
   crc_reg[31] <= crc_reg[30] ^ crc_reg[31] ^ crc_in; 
 crc_out <= crc_in; //
 end 
 finish:begin 
   crc_out <= crc_reg[31]; 
   crc_reg[31:0] <= {crc_reg[30:0],1'b0}; 
 end 
 endcase 
endmodule
