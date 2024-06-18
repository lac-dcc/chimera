// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns/1ns 
module readmem ; 
integer i ; 
reg [7:0] mem[255:0] ;   //定义深度为256，宽度为8的存储器mem 
 
initial 
begin 
  $readmemb("top.mif", mem) ;  //读取top.mif到mem存储器 
  i = 0 ; 
  repeat(256)                  //重复256次 
    begin       
      $display("i = %d and read data is %d", i,mem[i]) ;    //显示mem的数据 
      i = i+1 ; 
      #20 ; 
    end 
end 
 
endmodule 