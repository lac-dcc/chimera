module premuat_16(
            enable,
		       inverse,
               i_0,
               i_1,
               i_2,
               i_3,
               i_4,
               i_5,
               i_6,
               i_7,
               i_8,
               i_9,
               i_10,
               i_11,
               i_12,
               i_13,
               i_14,
               i_15,
               
               o_0,
               o_1,
               o_2,
               o_3,
               o_4,
               o_5,
               o_6,
               o_7,
               o_8,
               o_9,
               o_10,
               o_11,
               o_12,
               o_13,
               o_14,
               o_15
               
);

// ********************************************
//                                             
//    INPUT / OUTPUT DECLARATION                                               
//                                                                             
// ********************************************
input                enable;
input               inverse;
input  signed  [27:0]   i_0;
input  signed  [27:0]   i_1;
input  signed  [27:0]   i_2;
input  signed  [27:0]   i_3;
input  signed  [27:0]   i_4;
input  signed  [27:0]   i_5;
input  signed  [27:0]   i_6;
input  signed  [27:0]   i_7;
input  signed  [27:0]   i_8;
input  signed  [27:0]   i_9;
input  signed  [27:0]   i_10;
input  signed  [27:0]   i_11;
input  signed  [27:0]   i_12;
input  signed  [27:0]   i_13;
input  signed  [27:0]   i_14;
input  signed  [27:0]   i_15;


output  signed [27:0]   o_0;
output  signed [27:0]   o_1;
output  signed [27:0]   o_2;
output  signed [27:0]   o_3;
output  signed [27:0]   o_4;
output  signed [27:0]   o_5;
output  signed [27:0]   o_6;
output  signed [27:0]   o_7;
output  signed [27:0]   o_8;
output  signed [27:0]   o_9;
output  signed [27:0]   o_10;
output  signed [27:0]   o_11;
output  signed [27:0]   o_12;
output  signed [27:0]   o_13;
output  signed [27:0]   o_14;
output  signed [27:0]   o_15;

// ********************************************
//                                             
//    REG DECLARATION                                               
//                                                                             
// ********************************************

reg  signed [27:0]   o1;
reg  signed [27:0]   o2;
reg  signed [27:0]   o3;
reg  signed [27:0]   o4;
reg  signed [27:0]   o5;
reg  signed [27:0]   o6;
reg  signed [27:0]   o7;
reg  signed [27:0]   o8;
reg  signed [27:0]   o9;
reg  signed [27:0]   o10;
reg  signed [27:0]   o11;
reg  signed [27:0]   o12;
reg  signed [27:0]   o13;
reg  signed [27:0]   o14;

// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************

always@(*)
if(inverse)
  begin
     o1 =i_2;
     o2 =i_4;
     o3 =i_6;
     o4 =i_8;
     o5 =i_10;
     o6 =i_12;
     o7 =i_14;
     o8 =i_1;
     o9 =i_3;
     o10=i_5;
     o11=i_7;
     o12=i_9;
	   o13=i_11;
     o14=i_13;
   end
 else
   begin
     o1 =i_8;
     o2 =i_1;
     o3 =i_9;
     o4 =i_2;
     o5 =i_10;
     o6 =i_3;
	 o7 =i_11;
     o8 =i_4;
     o9 =i_12;
     o10=i_5;
     o11=i_13;
     o12=i_6;
	 o13=i_14;
     o14=i_7;
   end


assign  o_0=i_0;
assign  o_1=enable?o1:i_1;
assign  o_2=enable?o2:i_2;
assign  o_3=enable?o3:i_3;
assign  o_4=enable?o4:i_4;
assign  o_5=enable?o5:i_5;
assign  o_6=enable?o6:i_6;
assign  o_7=enable?o7:i_7;
assign  o_8=enable?o8:i_8;
assign  o_9=enable?o9:i_9;
assign  o_10=enable?o10:i_10;
assign  o_11=enable?o11:i_11;
assign  o_12=enable?o12:i_12;
assign  o_13=enable?o13:i_13;
assign  o_14=enable?o14:i_14;
assign  o_15=i_15;

endmodule 

