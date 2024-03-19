module bin2gray
#(
  parameter WIDTH = 4
 )
 (
  input  [WIDTH - 1 : 0] bin,
  output [WIDTH - 1 : 0] gray  
 );

  assign gray = bin ^ (bin>>1);
  

endmodule // bin2gray

  
  
