// Seed: 4173156880
module module_0;
  logic id_1, id_2;
  always_comb id_2 = id_1;
endmodule
module module_1 #(
    parameter id_6 = 32'd11
) (
    id_1[id_6-1 :-1],
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire _id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  xnor primCall (id_1, id_10, id_11, id_12, id_3, id_4, id_5, id_7, id_9);
  output wire id_2;
  output logic [7:0] id_1;
  struct packed {
    logic id_10;
    logic id_11;
  } id_12;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule
