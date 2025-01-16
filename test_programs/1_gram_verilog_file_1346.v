// Seed: 3812186896
module module_0;
  assign id_1 = 1;
endmodule
program module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_10;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3#(
        .id_4 (id_5),
        .id_6 (1),
        .id_7 (-1),
        .id_8 (-1'h0),
        .id_9 (id_6),
        .id_10(id_7 == id_1)
    ),
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_16;
  xor primCall (id_2, id_3, id_6, id_7, id_8, id_9);
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
