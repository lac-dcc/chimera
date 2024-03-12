module dct_ctrl(
            clk,
            rst,
        i_valid,
     i_transize,
     
       i_valid_4,
    i_transize_1,
    i_transize_2,
    i_transize_3,
    i_transize_4
);

// ********************************************
//                                             
//    INPUT / OUTPUT DECLARATION               
//                                             
// ********************************************
input                  clk;
input                  rst;
input              i_valid;
input  [1:0]    i_transize;

output reg           i_valid_4;
output reg [1:0]  i_transize_1;
output reg [1:0]  i_transize_2;
output reg [1:0]  i_transize_3;
output reg [1:0]  i_transize_4;

// ********************************************
//                                             
//    REG DECLARATION                                               
//                                                                             
// ********************************************

reg               i_valid_1;
reg               i_valid_2;
reg               i_valid_3;

// ********************************************
//                                             
//    Sequential  Logic                        
//                                             
// ******************************************** 

always@(posedge clk or negedge rst)
   if(!rst)
    i_transize_1<=2'b00;
  else
    i_transize_1<=i_transize;
    
 always@(posedge clk or negedge rst)
   if(!rst)
    i_transize_2<=2'b00;
  else
    i_transize_2<=i_transize_1;
       
  always@(posedge clk or negedge rst)
   if(!rst)
    i_transize_3<=2'b00;
  else
    i_transize_3<=i_transize_2;
  
  
  always@(posedge clk or negedge rst)
   if(!rst)
    i_transize_4<=2'b00;
  else
    i_transize_4<=i_transize_3;
   
   always@(posedge clk or negedge rst)
   if(!rst)
    i_valid_1<=1'b0;
  else 
    i_valid_1<=i_valid;
    
always@(posedge clk or negedge rst)
   if(!rst)
    i_valid_2<=1'b0;
  else 
    i_valid_2<=i_valid_1;

always@(posedge clk or negedge rst)
   if(!rst)
    i_valid_3<=1'b0;
  else 
    i_valid_3<=i_valid_2; 
	
always@(posedge clk or negedge rst)
   if(!rst)
    i_valid_4<=1'b0;
  else 
    i_valid_4<=i_valid_3; 
	
endmodule
    