// Seed: 2877210056
module module_0 (
    output wire id_0,
    input tri1 id_1,
    input supply1 id_2,
    input supply1 id_3,
    input tri id_4,
    input tri id_5,
    output supply0 id_6,
    input uwire id_7,
    input wire id_8,
    output tri1 id_9,
    input tri id_10,
    input wand id_11,
    input supply0 id_12,
    input wand id_13,
    input wor id_14
    , id_23,
    input wire id_15,
    input wire id_16,
    input tri0 id_17,
    input uwire id_18,
    output uwire id_19,
    output wor id_20,
    output wor id_21
);
  logic [1 : 1 'b0] id_24;
endmodule
module module_1 #(
    parameter id_19 = 32'd75
) (
    input tri0 id_0,
    input tri1 id_1,
    output tri id_2,
    input tri0 id_3,
    input supply1 id_4,
    input tri0 id_5,
    input uwire id_6,
    output tri1 id_7,
    input tri0 id_8,
    input wire id_9,
    input wire id_10,
    input wand id_11,
    output tri0 id_12,
    input supply0 id_13,
    input tri1 id_14,
    output wor id_15,
    output logic id_16,
    output supply0 id_17,
    input supply1 id_18,
    input wor _id_19,
    input tri1 id_20,
    input supply1 id_21,
    output wand id_22
    , id_27,
    input tri1 id_23,
    input supply0 id_24,
    output wire id_25
);
  assign id_2 = 1;
  wire [-1 : 1 'b0] id_28, id_29;
  wire id_30;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_21,
      id_14,
      id_20,
      id_25,
      id_6,
      id_23,
      id_2,
      id_5,
      id_13,
      id_5,
      id_5,
      id_5,
      id_4,
      id_10,
      id_21,
      id_21,
      id_2,
      id_25,
      id_22
  );
  always #1 id_16 <= id_27[id_19];
endmodule
