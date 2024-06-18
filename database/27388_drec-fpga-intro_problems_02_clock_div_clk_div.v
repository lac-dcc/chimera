// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

module clk_div#(parameter X = 12)(input wire clk, output wire clk_reduced);
   reg [$clog2(X):0] counter = 0;

   assign clk_reduced = counter == X;

   always @(posedge clk)
     begin
        counter <= counter + 1;
     end

   always @(negedge clk)
     begin
        if (clk_reduced)
          counter <= 0;
     end
endmodule
