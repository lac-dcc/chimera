// Seed: 3589965054
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  uwire id_12;
  assign id_10 = id_6;
  assign module_1.id_4 = 0;
  wire id_13;
  uwire id_14, id_15, id_16 = id_3 !=? {1'h0, 1 >> 1};
  specify
    (id_17 *> id_18) = ((1), 1 !=? 1);
    (id_19 => id_20) = 1;
    if (id_16) (negedge id_21 => (id_22 +: 1'b0)) = (id_12, 1'b0);
  endspecify
endmodule
module module_1 (
    input  tri1 id_0
    , id_6,
    input  tri0 id_1,
    input  wand id_2,
    input  tri1 id_3,
    output wand id_4
);
  assign id_4 = (1) ? ~id_1 : id_3;
  wire id_7;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_7,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_7
  );
endmodule
