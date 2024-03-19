

module AMUX2_3V (
   input I0,
   input I1,
   output out,
   input select
);
   wire VDD,VSS;
   wire I0, I1;
   wire out;
   wire select;
   wire NaN;

   initial begin
      NaN = 0.0 / 0.0;
   end

   assign out = (select == 1'b1) ? I1:
		 (select == 1'b0) ? I0 :
		 NaN;

endmodule
