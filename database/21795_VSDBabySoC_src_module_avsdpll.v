// This program was cloned from: https://github.com/manili/VSDBabySoC
// License: Apache License 2.0

module avsdpll (
   output reg  CLK,
   input  wire VCO_IN,
   input  wire ENb_CP,
   input  wire ENb_VCO,
   input  wire REF
);
   real period, lastedge, refpd;

   initial begin
      lastedge = 0.0;
      period = 25.0; // 25ns period = 40MHz
      CLK <= 0;
   end

  // Toggle clock at rate determined by period
   always @(CLK or ENb_VCO) begin
      if (ENb_VCO == 1'b1) begin
         #(period / 2.0);
         CLK <= (CLK === 1'b0);
      end
      else if (ENb_VCO == 1'b0) begin
         CLK <= 1'b0;
      end 
      else begin
         CLK <= 1'bx;
      end
   end
   
   // Update period on every reference rising edge
   always @(posedge REF) begin
      if (lastedge > 0.0) begin
         refpd = $realtime - lastedge;
         // Adjust period towards 1/8 the reference period
         //period = (0.99 * period) + (0.01 * (refpd / 8.0));
         period =  (refpd / 8.0) ;
      end
      lastedge = $realtime;
   end
endmodule
