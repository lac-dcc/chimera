// Seed: 3516127478
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input wand id_2,
    input wor id_3,
    input uwire id_4,
    input tri1 id_5,
    output tri0 id_6,
    input supply1 id_7
);
  assign id_6 = -1;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    output uwire id_1,
    output tri1 id_2,
    input tri id_3,
    output uwire id_4,
    input tri id_5,
    output supply1 id_6,
    input wor id_7,
    output supply0 id_8
);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_0,
      id_5,
      id_3,
      id_6,
      id_0
  );
  wire id_10;
  ;
  assign id_2 = id_3;
endmodule
