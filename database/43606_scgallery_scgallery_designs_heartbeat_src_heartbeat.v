// This program was cloned from: https://github.com/siliconcompiler/scgallery
// License: Apache License 2.0

module heartbeat #(parameter N = 8)
   (
    //inputs
    input      clk, // clock
    input      nreset, //async active low reset
    //outputs
    output reg out //heartbeat
    );

   reg [N-1:0] counter_reg;

   always @ (posedge clk or negedge nreset)
     if(!nreset)
       begin
        counter_reg <= 'b0;
        out <= 1'b0;
       end
     else
       begin
        counter_reg[N-1:0] <= counter_reg[N-1:0] + 1'b1;
        out <= (counter_reg[N-1:0]=={(N){1'b1}});
       end

endmodule
