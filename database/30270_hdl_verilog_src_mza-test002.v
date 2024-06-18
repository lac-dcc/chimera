// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// borrowed/stolen from rot.v example project

`define icestick

module top(input CLK, output LED1, output LED2, output LED3, output LED4, output LED5);
   reg ready = 0;
   reg [23:0]     divider;
   reg [3:0]      rot;
   always @(posedge CLK) begin
      if (ready) 
        begin
           if (divider == 12000000) 
             begin
                divider <= 0;
                rot <= {rot[2:0], rot[3]};
             end
           else 
             divider <= divider + 1;
        end
      else 
        begin
           ready <= 1;
           rot <= 4'b0011;
           divider <= 0;
        end
   end
   assign LED1 = rot[0];
   assign LED2 = rot[1];
   assign LED3 = rot[2];
   assign LED4 = rot[3];
   assign LED5 = 1;
endmodule // top

