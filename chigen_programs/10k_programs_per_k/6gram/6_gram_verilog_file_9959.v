// Seed: 881276567
module module_0 ();
  tri id_1;
  assign id_1 = -1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output reg id_5;
  inout logic [7:0] id_4;
  input wire id_3;
  output wire id_2;
  module_0 modCall_1 ();
  output wire id_1;
  always @(posedge -1) begin : LABEL_0
    id_5 <= id_3;
    fork
      id_6(1, 1, 1, id_4, (-1'b0 & !id_3), id_3, 1'b0 | -1, id_6, id_4[1'd0 : 1'b0], -1);
    join
    id_5 <= #1 1;
  end
endmodule
