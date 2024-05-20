// This program was cloned from: https://github.com/Lena-2023/15-05-2024
// License: MIT License

module form_wave (

input wire CLK,
input wire RESET,

input wire [31:0] DDS,               
output reg [31:0] DDSout, 

input wire [2:0] form,

input wire [6:0] pulse_width

);

always@(posedge CLK or posedge RESET)

// saw+
case(form)
3'b000:                    
 begin
 DDSout <= DDS;
 end

//reverse saw+
3'b001:                   
 begin
  DDSout <= -DDS;
 end

//triangle+
3'b010:                  

begin
      if (DDS<=32'b01111111111111111111111111111111)
        DDSout <= DDS;
     else
     DDSout <= -DDS;
end
 
//meander+
3'b011:                      
begin
 DDSout <= DDS [31];
end

//meander025
3'b100:                           
begin
  if(DDS [31:24] <= pulse_width) 
   DDSout <=1'b1;
  else 
   DDSout <=1'b0;
end

endcase   
endmodule
