// Design module for Key Generation

module Keygen(key1,key2,key);
    output reg [63:0] key1,key2;
    input [63:0] key;
    
    wire [63:0] k1,k2;
    reg  [63:0] left,right;
    
    ALU64bit alu1(k1,left,right,1'b1);
    ALU64bit alu2(k2,left,right,1'b0);
    
    initial 
       begin
           #10 left  = {{32{key[63]}},key[63:32]}; 
               right = {{32{key[31]}},key[31:0]};
           
           //$display("before key generation");
           //$monitor("At time %0d left = %b right = %b",$time,plainText,left,right);    
           
           #5 key1 = k1;
               key2 = k2;
           $display("after key generation");    
           $monitor("At time %0d key1 = %b \n\tkey2 = %b",$time,key1,key2);
       end
     
 endmodule   
    
