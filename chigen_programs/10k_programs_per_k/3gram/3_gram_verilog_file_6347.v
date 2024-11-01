// Seed: 1157816095
module module_0 #(
    parameter id_28 = 32'd6,
    parameter id_29 = 32'd1
) (
    output uwire id_0,
    input tri0 id_1,
    input wor id_2,
    output tri0 id_3,
    input tri1 id_4,
    input uwire id_5,
    output wand id_6,
    input supply0 id_7,
    input wire id_8,
    output supply1 id_9,
    output uwire id_10,
    output wand id_11,
    output wor id_12,
    output tri0 id_13,
    output supply0 id_14,
    output tri0 id_15,
    input wand id_16,
    output tri id_17,
    output tri0 id_18,
    input wire id_19,
    output supply0 id_20,
    input uwire id_21,
    input wand id_22,
    input supply0 id_23,
    input tri1 id_24,
    input tri id_25
);
  id_27(
      .id_0(~id_8), .id_1(1), .id_2("")
  ); defparam id_28.id_29 = id_1 & 1;
  assign id_13 = id_19;
endmodule
module module_1 (
    input tri0 id_0,
    output wire id_1,
    output supply1 id_2,
    output wire id_3
);
  wor id_5;
  module_0(
      id_3,
      id_0,
      id_5,
      id_3,
      id_0,
      id_5,
      id_2,
      id_5,
      id_0,
      id_5,
      id_2,
      id_1,
      id_3,
      id_3,
      id_3,
      id_5,
      id_5,
      id_3,
      id_2,
      id_0,
      id_5,
      id_0,
      id_5,
      id_5,
      id_5,
      id_5
  );
  always @(1 << id_5 or posedge 1'b0) id_3 = id_5;
endmodule
