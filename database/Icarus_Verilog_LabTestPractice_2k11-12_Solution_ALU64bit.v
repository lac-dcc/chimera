// Design module for ALU64bit

module ALU64bit(key,left,right,select);
    output reg [63:0] key;
    input [63:0] left, right;
    input select;
    
    always @(left,right,select)
       begin
           if(select)            // Key 1 : add
              key = left + right;
           else                  // Key 2 : subtract
              key = left - right;
       end  
              
endmodule          