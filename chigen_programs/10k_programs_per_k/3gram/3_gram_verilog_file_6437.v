// Seed: 1735635332
module module_0 (
    output wand id_0,
    output supply1 id_1,
    output tri1 id_2,
    output tri id_3,
    output tri0 id_4
    , id_12,
    input uwire id_5
    , id_13,
    output wor id_6,
    output tri id_7,
    output wire id_8,
    output supply1 id_9,
    input supply0 id_10
);
  wire id_14 = id_14;
  assign id_6 = 1;
endmodule
module module_1 #(
    parameter id_5 = 32'd92
) (
    output supply0 id_0,
    output supply1 id_1,
    input supply1 id_2,
    output wand id_3,
    output supply1 id_4,
    input supply0 _id_5,
    input wor id_6,
    input tri id_7
);
  wor [id_5 : 1] id_9;
  nor primCall (id_3, id_6, id_7, id_2, id_10);
  wire id_10;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_4,
      id_2,
      id_4,
      id_1,
      id_0,
      id_0,
      id_6
  );
  assign id_9 = 1 - id_6;
  localparam id_11 = 1;
endmodule
