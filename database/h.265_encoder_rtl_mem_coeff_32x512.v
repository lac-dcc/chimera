module          coeff_32x512(
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
input        [511:0]       data_i;   
output	      [511:0]       data_o;   


// ********************************************
//                                             
//    Sub  module                   
//                                             
// ********************************************

ram_1p   #(.Word_Width(512),.Addr_Width(5))
           coeff_32x512(
                    .clk(clk),
                    .cen_i(cen_i),
                    .oen_i(oen_i),
                    .wen_i(wen_i),
                    .addr_i(addr_i),
                    .data_i(data_i),
                    .data_o(data_o)
   ); 
   
endmodule

