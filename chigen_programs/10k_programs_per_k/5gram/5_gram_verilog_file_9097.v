// Seed: 3861991633
module module_0;
  reg id_1;
  assign id_1 = -1;
  always_comb @(negedge id_1) begin : LABEL_0
    if (-1) begin : LABEL_1
      id_1 = "";
    end else id_1 = !id_1;
  end
endmodule
module module_1 (
    input  tri0 id_0,
    input  wire id_1,
    input  wor  id_2,
    input  tri1 id_3,
    output tri0 id_4,
    input  tri1 id_5,
    output wand id_6
);
  final $unsigned(81);
  ;
  assign id_6 = 1'b0 - id_2 ? id_0 == "" : id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
