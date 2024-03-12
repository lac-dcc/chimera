module   dct_transpose_32x16(
                      clk    ,
		                  cen_i  ,
		                  oen_i  ,
		                  wen_i  ,
		                  addr_i ,
		                  data_i ,		
		                  data_o		        
);


// ********************************************
//                                             
//    Input/Output DECLARATION                    
//                                             
// ********************************************

input                        clk;      
input   		                 cen_i;    
input   		                 oen_i;    
input   		                 wen_i;    
input         [4:0]       addr_i;   
input        [15:0]       data_i;   
output	      [15:0]       data_o;   


// ********************************************
//                                             
//    Sub  module                   
//                                             
// ********************************************

ram_1p   #(.Word_Width(16),.Addr_Width(5))
    dct_transpose_32x16(
                    .clk(clk),
                    .cen_i(cen_i),
                    .oen_i(oen_i),
                    .wen_i(wen_i),
                    .addr_i(addr_i),
                    .data_i(data_i),
                    .data_o(data_o)
   ); 
   
endmodule