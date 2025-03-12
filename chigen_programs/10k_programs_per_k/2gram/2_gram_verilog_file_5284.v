// Seed: 3989675224
module module_0 (
    input tri1 id_0,
    input supply0 id_1,
    input uwire id_2,
    input tri0 id_3,
    input wor id_4
    , id_15,
    output tri0 id_5,
    input uwire id_6,
    input wire id_7,
    input wand id_8,
    input supply0 id_9,
    input supply1 id_10,
    output uwire id_11,
    input wand id_12,
    input wor id_13
);
  wire id_16;
  localparam id_17 = -1;
  wire id_18;
  assign id_5 = 1 - id_7;
  wire id_19;
  assign id_16 = id_18;
  wire [1 : 1] id_20;
  generate
    wire id_21;
  endgenerate
  parameter id_22 = id_17;
endmodule
module module_1 (
    output tri0 id_0,
    input wand id_1,
    input uwire id_2,
    input wand id_3,
    output supply1 id_4,
    input wor id_5,
    input uwire id_6,
    input wand id_7,
    input supply0 id_8,
    output wire id_9,
    output wand id_10,
    input tri1 id_11#(.id_30("")),
    input uwire id_12,
    input tri0 id_13,
    input uwire id_14,
    output supply0 id_15,
    input tri id_16,
    input supply0 id_17,
    input tri0 id_18,
    input tri1 id_19,
    input tri1 id_20,
    input wand id_21,
    output tri0 id_22,
    input wand id_23,
    input wire id_24,
    input uwire id_25,
    input wand id_26,
    output wand id_27,
    input tri1 id_28
);
  module_0 modCall_1 (
      id_6,
      id_23,
      id_2,
      id_11,
      id_3,
      id_9,
      id_16,
      id_19,
      id_17,
      id_24,
      id_14,
      id_9,
      id_28,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
