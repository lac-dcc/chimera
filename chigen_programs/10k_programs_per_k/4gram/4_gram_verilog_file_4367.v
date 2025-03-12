// Seed: 3582361301
module module_0 (
    output tri id_0,
    output supply0 id_1,
    input uwire id_2,
    input tri id_3,
    output wor id_4,
    output wand id_5,
    input supply1 id_6,
    input tri1 id_7,
    input uwire id_8,
    input tri1 id_9
);
  tri0 id_11 = id_2#(.id_9(-1)) | id_7#(.id_6(1 ? 1 : 1));
endmodule
module module_1 #(
    parameter id_0 = 32'd59
) (
    input  tri0 _id_0,
    input  wor  id_1,
    input  wand id_2,
    output wand id_3
);
  assign id_3 = id_0 < id_2;
  logic [id_0 : ""] id_5;
  logic id_6;
  ;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_1,
      id_3,
      id_3,
      id_1,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.id_3 = 0;
  assign id_3 = id_2;
endmodule
