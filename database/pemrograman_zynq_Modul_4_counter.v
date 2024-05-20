// This program was cloned from: https://github.com/yohanes-erwin/pemrograman_zynq
// License: MIT License

module counter(clock,rst,en,cout);

   input clock;
   input rst;
   input en;
   
   output [3:0] cout;
   
   reg [3:0] cout;
   
   always@(posedge clock)
   begin
        if(!rst)
            cout <= 4'd0;
        else if(en)
            cout <= cout + 4'd1;
        else
            cout <= cout;
   end
   
endmodule
