// Seed: 3513332837
module module_0 (
    input supply0 id_0,
    output tri0 id_1,
    output wor id_2,
    input tri0 id_3,
    output tri id_4,
    output supply1 id_5
    , id_18,
    input tri0 id_6,
    input tri0 id_7,
    input wand id_8,
    input uwire id_9,
    input supply1 id_10,
    input tri id_11,
    input supply1 id_12,
    output tri id_13,
    input supply0 id_14,
    input uwire id_15
    , id_19,
    output wor id_16
);
  assign id_5 = {id_3, 1'h0 < id_8};
  assign id_4 = !id_8;
  always @(posedge 1 == 1) id_4 = id_18;
endmodule
module module_1 #(
    parameter id_6 = 32'd83,
    parameter id_7 = 32'd86
) (
    output wand id_0,
    output tri id_1,
    input wand id_2,
    input wire id_3,
    input supply1 id_4
);
  defparam id_6.id_7 = 1;
  xor (id_1, id_2, id_7, id_3, id_6, id_4);
  module_0(
      id_3,
      id_1,
      id_0,
      id_2,
      id_1,
      id_0,
      id_4,
      id_4,
      id_2,
      id_4,
      id_3,
      id_2,
      id_4,
      id_0,
      id_2,
      id_2,
      id_1
  );
endmodule
