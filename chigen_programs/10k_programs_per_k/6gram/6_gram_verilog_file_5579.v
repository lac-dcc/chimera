// Seed: 3323677386
module module_0;
  wire id_1;
  wire id_2;
  always @(negedge 1) begin : LABEL_0
    disable id_3;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  supply1 id_5;
  assign id_4[1] = id_5;
  wire id_6;
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0;
  wire id_7;
  xnor primCall (id_2, id_3, id_5, id_6);
  assign id_3 = 1 ? id_5 : 1;
  tri0 id_8;
  assign id_8 = id_8 ? 1 : id_5;
  wire id_9 = id_1;
endmodule
