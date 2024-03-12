module premuat_8(
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
               
               o_0,
               o_1,
               o_2,
               o_3,
               o_4,
               o_5,
               o_6,
               o_7
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


output  signed [27:0]   o_0;
output  signed [27:0]   o_1;
output  signed [27:0]   o_2;
output  signed [27:0]   o_3;
output  signed [27:0]   o_4;
output  signed [27:0]   o_5;
output  signed [27:0]   o_6;
output  signed [27:0]   o_7;

// ********************************************
//                                             
//   REG DECLARATION                                               
//                                                                             
// ********************************************

reg   signed   [27:0]    o1;
reg   signed   [27:0]    o2;
reg   signed   [27:0]    o3;
reg   signed   [27:0]    o4;
reg   signed   [27:0]    o5;
reg   signed   [27:0]    o6;

// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************

always@(*)
if(inverse)
  begin
     o1=i_2;
     o2=i_4;
     o3=i_6;
     o4=i_1;
     o5=i_3;
     o6=i_5;
   end
 else
   begin
     o1=i_4;
     o2=i_1;
     o3=i_5;
     o4=i_2;
     o5=i_6;
     o6=i_3;
   end

assign  o_0=i_0;
assign  o_1=enable?o1:i_1;
assign  o_2=enable?o2:i_2;
assign  o_3=enable?o3:i_3;
assign  o_4=enable?o4:i_4;
assign  o_5=enable?o5:i_5;
assign  o_6=enable?o6:i_6;
assign  o_7=i_7;

endmodule 


