// Seed: 1966957822
module module_0 (
    input supply0 id_0,
    output tri0 id_1,
    output uwire id_2
    , id_23,
    output tri0 id_3,
    output wor id_4,
    input supply1 id_5,
    output tri1 id_6,
    output wire id_7,
    input wire id_8,
    input wire id_9#(
        .id_24(1),
        .id_25(1),
        .id_26(1'd0 - id_25 | (1'd0 - id_9))
    ),
    input wire id_10,
    output tri0 id_11,
    input wor id_12,
    output tri0 id_13,
    input wand id_14,
    input supply1 id_15,
    input wor id_16,
    input wire id_17,
    input wor id_18,
    input supply0 id_19,
    input supply0 id_20
    , id_27,
    input supply1 id_21
);
  wire id_28;
  wire id_29;
  always id_27 = 1;
  wire id_30;
endmodule
macromodule module_1 (
    output wand id_0,
    input  wand id_1,
    input  wand id_2
);
  wire id_4 = 1 ? id_2 : id_1;
  assign id_0 = 1;
  module_0(
      id_2,
      id_0,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_2,
      id_2,
      id_1,
      id_0,
      id_1,
      id_4,
      id_4,
      id_2,
      id_4,
      id_2,
      id_2,
      id_4,
      id_4,
      id_4
  );
  assign id_0 = 1;
  wire id_5, id_6;
endmodule
