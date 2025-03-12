// Seed: 736548614
module module_0 (
    output wor id_0,
    output tri0 id_1,
    input uwire id_2,
    output tri1 id_3,
    input tri1 id_4,
    input tri1 id_5,
    input supply1 id_6
);
  assign id_1 = -1;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    input tri1 id_2,
    output logic id_3,
    output supply0 id_4,
    input wand id_5
);
  always id_3 = -1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_2,
      id_4,
      id_0,
      id_2,
      id_5
  );
endmodule
module module_2 #(
    parameter id_3 = 32'd2
) (
    input wand id_0,
    input tri1 id_1,
    output wand id_2,
    output wire _id_3,
    output tri id_4,
    output tri id_5[id_3 : -1]
    , id_8 = 1 - 1,
    input supply1 id_6
);
  assign id_4 = id_8[-1 :-1];
  module_0 modCall_1 (
      id_4,
      id_2,
      id_6,
      id_2,
      id_6,
      id_0,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
