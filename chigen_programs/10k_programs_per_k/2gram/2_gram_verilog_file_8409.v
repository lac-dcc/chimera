// Seed: 1014119342
module module_0 (
    output wand id_0,
    input supply1 id_1,
    input wand id_2,
    output tri id_3,
    input tri id_4
    , id_9,
    output supply0 id_5,
    input supply0 id_6,
    output wand id_7
);
  assign id_5 = id_9 <-> id_4;
  assign id_7 = id_4 + 1;
  assign id_3 = id_1;
  assign id_5 = 1'b0 != id_4;
  always id_9 = 1;
  wire id_10;
endmodule
module module_1 #(
    parameter id_6 = 32'd85,
    parameter id_7 = 32'd89
) (
    input tri0 id_0,
    input supply0 id_1,
    output wor id_2,
    input tri1 id_3,
    output supply0 id_4
);
  defparam id_6.id_7 = id_1 - 1;
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3,
      id_2,
      id_3,
      id_4,
      id_1,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
