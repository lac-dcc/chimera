// Seed: 558260939
module module_0 (
    output wand id_0,
    output tri0 id_1,
    input tri1 id_2,
    output wand id_3,
    output tri0 id_4,
    input tri0 id_5,
    output supply0 id_6,
    input wand id_7,
    input tri id_8,
    input wire id_9,
    input uwire id_10,
    input wor id_11
);
  id_13(
      1 - 1, id_9, 1
  );
  wire id_14;
  assign module_1.id_6 = 0;
endmodule
module module_1 #(
    parameter id_6 = 32'd84,
    parameter id_7 = 32'd94
) (
    output tri1 id_0
    , id_5,
    output supply1 id_1,
    input tri0 id_2,
    input supply0 id_3
);
  defparam id_6.id_7 = 1'b0;
  and primCall (id_1, id_7, id_3, id_6);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_3,
      id_0,
      id_1,
      id_3,
      id_1,
      id_3,
      id_2,
      id_2,
      id_3,
      id_2
  );
endmodule
