// Desing Module for Decryption

module Decrypt(decipherText,cipherText,key);
   output reg [255:0] decipherText;
   input      [255:0] cipherText ;
   input      [63:0] key;
   
   wire [63:0]  key1,key2;
   reg  [255:0] temp,cipher;
    
   Keygen keygen(key1, key2, key);

   always @(cipherText,key)
   begin
       #55
         cipher          = cipherText;
         
         // First Round
         cipher[63:0]    = cipher[63:0]    ^ key2[63:0];
         cipher[127:64]  = cipher[127:64]  ^ key2[63:0];
         cipher[191:128] = cipher[191:128] ^ key2[63:0];
         cipher[255:192] = cipher[255:192] ^ key2[63:0];
   
         // Second Round
         temp[255:192]  = cipher[63:0] ^ key1[63:0];
         temp[63:0]     = cipher[127:64];
         temp[127:64]   = cipher[191:128];
         temp[191:128]  =cipher[255:192];
   
         // Third Round
         decipherText[62:0]=temp[63:1];
         decipherText[63]=temp[0];
   
         decipherText[126:64]=temp[127:65];
         decipherText[127]=temp[64];
   
         decipherText[190:128]=temp[191:129];
         decipherText[191]=temp[128];
   
         decipherText[254:192]=temp[255:193];
         decipherText[255]=temp[192];
   
         $display("after decryption");
         $display("at time %0d decipher Text = %d\n",$time, decipherText);
         $display("plaintext = %0d", decipherText[247:0]);
         
   end
   
   
endmodule

