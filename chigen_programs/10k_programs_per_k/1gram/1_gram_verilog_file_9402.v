// Seed: 6872289
module module_0 (
    output uwire id_0,
    input supply1 id_1,
    input uwire id_2,
    input tri id_3
);
  assign id_0 = id_2;
endmodule
module module_1 (
    input supply1 id_0,
    input tri id_1,
    output wand id_2,
    input tri1 id_3,
    input tri id_4,
    input uwire id_5,
    input wor id_6,
    input tri id_7,
    output supply0 id_8,
    output tri id_9
);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 #(
    parameter id_6 = 32'd71
) (
    input tri1 id_0,
    input wor id_1,
    input supply0 id_2[1 : id_6],
    input wand id_3,
    output uwire id_4,
    output tri0 id_5,
    output wor _id_6
);
  wire id_8 = id_2;
  buf primCall (id_4, id_8);
  module_0 modCall_1 (
      id_4,
      id_1,
      id_0,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
