// Seed: 1382144502
`timescale 1 ps / 1ps
module module_0 (
    output id_0
    , id_3,
    output id_1,
    input  id_2
);
  always @(posedge 1) begin
    id_1 = 1;
  end
  reg id_4 = id_3;
  always @(posedge id_4 or posedge id_3) begin
    if (1)
      if (id_2[1]) begin
        #1 begin
          id_1 = id_3;
        end
      end else id_1 <= 1'd0 == id_4;
  end
endmodule
