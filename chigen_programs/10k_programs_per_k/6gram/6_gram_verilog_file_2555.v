// Seed: 24166886
`define pp_0 (  pp_1  ,  pp_2  )  0
`timescale 1 ps / 1 ps
module module_0;
  reg id_0;
  reg id_1;
  assign id_1 = 1'b0;
  always @(1 or posedge 1) begin
    if (1'b0) begin
      id_1 <= 1;
    end else begin
      if ((1)) begin
        id_1 <= 1;
      end
    end
  end
  assign id_1 = 1 ? id_0 : 1 ? 1 : id_0;
  assign id_1 = 1'b0;
  assign id_1 = id_0 == 1;
endmodule
