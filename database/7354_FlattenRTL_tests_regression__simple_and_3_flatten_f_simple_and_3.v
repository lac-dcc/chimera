// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module simple_and_3 (
  input [5:0] in1,
  input [5:0] in2,
  output [0:5] out1) ; 
  
wire  inst1_a;
wire  inst1_b;
wire  inst1_z;
wire  inst2_a;
wire  inst2_b;
wire  inst2_z;
wire  inst3_a;
wire  inst3_b;
wire  inst3_z;
 
  
wire  inst1_inst1_i1;
wire  inst1_inst1_i2;
reg  inst1_inst1_o1;
wire  inst2_inst1_i1;
wire  inst2_inst1_i2;
reg  inst2_inst1_o1;
wire  inst3_inst1_i1;
wire  inst3_inst1_i2;
reg  inst3_inst1_o1;
wire  inst4_i1;
wire  inst4_i2;
reg  inst4_o1;
 
   wire inst1_inst1_w1 =1'b1; 
  always @(   inst1_inst1_i1   or  inst1_inst1_i2  )
        inst1_inst1_o1  = inst1_inst1_i1 ? inst1_inst1_i1 : inst1_inst1_i2 ;


 
  
 
  
 
   wire inst2_inst1_w1 =1'b1; 
  always @(   inst2_inst1_i1   or  inst2_inst1_i2  )
        inst2_inst1_o1  = inst2_inst1_i1 ? inst2_inst1_i1 : inst2_inst1_i2 ;


 
  
 
  
 
   wire inst3_inst1_w1 =1'b1; 
  always @(   inst3_inst1_i1   or  inst3_inst1_i2  )
        inst3_inst1_o1  = inst3_inst1_i1 ? inst3_inst1_i1 : inst3_inst1_i2 ;


assign inst1_a = in1[0];
assign inst1_b = in2[0];
assign out1[0] = inst1_z;
assign inst2_a = in1[1];
assign inst2_b = in2[1];
assign out1[1] = inst2_z;
assign inst3_a = in1[2];
assign inst3_b = in2[2];
assign out1[2] = inst3_z;
 
  
 
   wire inst4_w1 =1'b1; 
  always @(   inst4_i1   or  inst4_i2  )
        inst4_o1  = inst4_i1 ? inst4_i1 : inst4_i2 ;

assign inst1_inst1_i1 = inst1_a;
assign inst1_inst1_i2 = inst1_b;
assign inst1_z = inst1_inst1_o1;
assign inst2_inst1_i1 = inst2_a;
assign inst2_inst1_i2 = inst2_b;
assign inst2_z = inst2_inst1_o1;
assign inst3_inst1_i1 = inst3_a;
assign inst3_inst1_i2 = inst3_b;
assign inst3_z = inst3_inst1_o1;
assign inst4_i1 = in1[3];
assign inst4_i2 = in2[3];
assign out1[3] = inst4_o1;
 
  
wire [1:0] inst5_i1;
reg [0:1] inst5_o1;
 
  always @( posedge  inst5_i1 )
       begin 
          inst5_o1  = inst5_i1 ;
       end
 
assign inst5_i1 = in1[5:4];
assign out1[4:5] = inst5_o1;
 
endmodule
