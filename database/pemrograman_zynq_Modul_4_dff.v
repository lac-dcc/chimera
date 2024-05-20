// This program was cloned from: https://github.com/yohanes-erwin/pemrograman_zynq
// License: MIT License

module dff(clock,rst,en,data_in,data);

  input clock;
  input rst;
  input en;
  input data_in;
  
  output data;
  
  reg data;
  
  always@(posedge clock)
  begin
       if(!rst)
           data <= 1'b0;
       else if(en)
           data <= data_in;
       else
           data <= data;
  end
  
endmodule
