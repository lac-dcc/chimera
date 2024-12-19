// Seed: 3734802766
macromodule module_0;
  wire id_2, id_3, id_4;
  initial @(posedge 1) id_1 <= 1;
  wire id_5;
  wire id_6, id_7;
  wire id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  supply0 id_11;
  wire id_12;
  module_0 modCall_1 ();
  wand id_13, id_14;
  assign id_5#(
      .id_13(id_13),
      .id_5 (id_14),
      .id_14(id_11),
      .id_5 ("" & 1'h0)
  ) = 1;
  assign id_11 = id_13;
endmodule
