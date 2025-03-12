// Seed: 4172936847
module module_0 (
    input tri id_0,
    input wor id_1,
    input wand id_2,
    input tri0 id_3,
    input tri id_4,
    input wand id_5,
    output tri id_6,
    output tri0 id_7,
    input supply1 id_8,
    input supply1 id_9,
    input wire id_10,
    input wor id_11,
    input supply1 id_12,
    input wand id_13,
    output wire id_14,
    output uwire id_15,
    input tri0 id_16,
    input tri0 id_17,
    input tri1 id_18,
    input wor id_19,
    input tri id_20,
    output tri0 id_21,
    output tri id_22,
    input wire id_23,
    input tri id_24,
    output wire id_25,
    input tri0 id_26,
    output supply0 id_27,
    input wire id_28
);
  assign id_6 = id_4 + -1;
  assign module_1._id_3 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd79,
    parameter id_1 = 32'd21,
    parameter id_3 = 32'd70,
    parameter id_5 = 32'd84
) (
    input wire _id_0,
    input supply1 _id_1,
    output supply0 id_2,
    input tri _id_3,
    input tri1 id_4,
    input supply1 _id_5,
    output wand id_6,
    input tri id_7
    , id_10,
    input tri0 id_8
);
  assign id_10[id_5 : 1] = id_0 + 1 + id_10[-1'd0];
  uwire [(  1  ) : 1] id_11;
  assign #id_12 id_11 = 1;
  module_0 modCall_1 (
      id_8,
      id_7,
      id_4,
      id_8,
      id_7,
      id_4,
      id_6,
      id_6,
      id_7,
      id_7,
      id_4,
      id_8,
      id_7,
      id_8,
      id_2,
      id_6,
      id_8,
      id_8,
      id_8,
      id_7,
      id_4,
      id_2,
      id_2,
      id_4,
      id_8,
      id_2,
      id_4,
      id_6,
      id_7
  );
  assign id_12 = id_12;
  struct packed {
    logic [id_3 : -1] id_13;
    logic id_14;
    logic [!  id_0 : id_3][1 : -1  -  1] id_15;
  } [id_5 : id_1] id_16 = 1;
endmodule
