// Design Module for Encryption


module Encrypt(cipherText, plainText , key);
   output reg [255:0] cipherText;
   input      [247:0] plainText ;
   input      [63:0] key;
   
   wire [255:0] paddedText;
   wire [63:0]  key1,key2;
   reg  [255:0] temp;
    
   Padd pd(paddedText, plainText);
   Keygen keygen(key1, key2, key);
    
   always @(paddedText , key)
   begin 
      // First Round
      #25
          temp[63:1]          = paddedText [62:0];
          temp[0]             = paddedText [63];
          cipherText[63:0]    = temp[63:0];
 
          temp[63:1]          = paddedText [126:64];
          temp[0]             = paddedText [127];
          cipherText[127:64]  = temp[63:0];
 
          temp[63:1]          = paddedText [190:128];
          temp[0]             = paddedText [191];
          cipherText[191:128] = temp[63:0];
  
          temp[63:1]          = paddedText [254:192];
          temp[0]             = paddedText [255];
          cipherText[255:192] = temp[63:0];
   
      // Round Two
          temp[127:64]        = cipherText[63:0];
          temp[191:128]       = cipherText[127:64];
          temp[255:192]       = cipherText[191:128];
          temp[63:0]          = cipherText[255:192] ^ key1[63:0];
   
   
      // Round Three
          cipherText[63:0]    = temp[63:0]    ^ key2[63:0];
          cipherText[127:64]  = temp[127:64]  ^ key2[63:0];
          cipherText[191:128] = temp[191:128] ^ key2[63:0];
          cipherText[255:192] = temp[255:192] ^ key2[63:0];
          
        $display("after encryption");
        $display("at time %0d cipher Text = %d\n",$time, cipherText);
   end
   
endmodule
