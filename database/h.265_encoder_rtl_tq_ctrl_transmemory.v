module ctrl_transmemory(
                    clk,
                    rst,
                i_valid,
             i_transize,
             
                    wen,
                 enable,
                counter
);

// ********************************************
//                                             
//    INPUT / OUTPUT DECLARATION                                               
//                                                                             
// ********************************************  

input                   clk;
input                   rst;
input               i_valid;
input  [1:0]     i_transize;
                 
output   reg            wen;
output               enable;
output   reg  [4:0] counter;          

// ********************************************
//                                             
//    Reg DECLARATION                         
//                                             
// ********************************************     

wire                      enable_0;
wire                      enable_1;


// ********************************************
//                                             
//    Reg DECLARATION                         
//                                             
// ********************************************

reg                          wen_0;
reg                          wen_1;
reg                      i_valid_0;          
     
// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************

assign  enable_0=i_valid;                //ctrl signal 
assign  enable_1=wen||wen_0||wen_1;
assign  enable= enable_0||enable_1;

// ********************************************
//                                             
//    Sequential  Logic                        
//                                             
// ********************************************

always@(posedge clk or negedge rst)
if(!rst)
  wen_0<=1'b0;
else
  wen_0<=wen;
  
always@(posedge clk or negedge rst)
if(!rst)
  wen_1<=1'b0;
else
  wen_1<=wen_0;
  
always@(posedge clk or negedge rst)
if(!rst)
  i_valid_0<=1'b0;
else
  i_valid_0<=i_valid;
  
always@(posedge clk or negedge rst)
if(!rst)
  counter<=0;
else if((!wen_0)&&wen_1)
     counter<=5'd0;
else if(enable)
    case(i_transize)
      2'b00:
          counter<=5'd0;
      2'b01:
        if(counter==5'd1)
          counter<=5'd0;
        else
          counter<=counter+1;
      2'b10:
        if(counter==5'd7)
          counter<=5'd0;
        else
          counter<=counter+1;
      2'b11:
        if(counter==5'd31)
          counter<=5'd0;
        else
          counter<=counter+1;
   endcase

//always@(posedge clk or negedge rst)
//if(!rst)
//  counter<=5'd0;
//else
//  if((!wen_0)&&wen_1)
//     counter<=5'd0;
  
always@(posedge clk or negedge rst)
if(!rst)
    wen<=0;
  else
    case(i_transize)
    2'b00:
      wen<=1'b0;
    2'b01:
    if((counter==5'd1)&&i_valid)
      wen<=1;
    else
      if((counter==5'd1)&&(!i_valid))
        wen<=1'b0;
    2'b10:
    if((counter==5'd7)&&i_valid)
      wen<=1; 
    else
      if((counter==5'd7)&&(!i_valid))
        wen<=1'b0;  
    2'b11:
    if((counter==5'd31)&&i_valid)
      wen<=1;
    else
      if((counter==5'd31)&&(!i_valid))
        wen<=1'b0;
      endcase
      
    endmodule