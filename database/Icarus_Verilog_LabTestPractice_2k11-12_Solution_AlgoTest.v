// Stimulus Module for Algorithm

module AlgoTest;
    wire [255:0] cipherText, decipherText;
    reg  [247:0] plainText;
    reg  [63:0] key;
    
    Encrypt encrypt(cipherText, plainText, key);
    Decrypt decrypt (decipherText, cipherText, key);
    
    initial
       begin
            
         $display("Simulated output of encrption/decrption algorithm");
         $monitor("At time %0d PlainText = %b \n CipherText = %b DecipherText = %b",$time,plainText,cipherText,decipherText);
         
         #0 plainText = 20;
            key = 15;
            
         #60 $stop;
         
     end
     
 endmodule 