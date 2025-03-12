// Seed: 1236341882
module module_0 (
    output wire id_0,
    input wand id_1,
    input wand id_2,
    input tri id_3,
    input tri0 id_4,
    input tri1 id_5,
    input tri1 id_6,
    input tri0 id_7,
    output tri id_8,
    input wand id_9,
    input supply0 id_10,
    output supply1 id_11,
    input wand id_12,
    input wand id_13,
    input tri id_14,
    input tri id_15,
    output supply0 id_16,
    output wor id_17,
    output wire id_18,
    input wand id_19,
    input supply1 id_20,
    input tri id_21
);
  logic id_23;
endmodule
module module_1 #(
    parameter id_0 = 32'd77,
    parameter id_4 = 32'd0
) (
    input wand _id_0[-1 : id_0],
    output uwire id_1,
    input tri1 id_2,
    output logic id_3,
    input supply1 _id_4,
    output supply1 id_5
);
  genvar id_7;
  logic id_8;
  assign id_8[id_4 :-1] = 1;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_5,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_5,
      id_5,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_21 = 0;
  always @(1'h0) id_3 = !1;
endmodule
