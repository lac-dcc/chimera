// Seed: 56831806
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input uwire id_2,
    input wand id_3,
    output tri1 id_4,
    input uwire id_5,
    output tri0 id_6,
    output supply1 id_7
);
  parameter id_9 = 1;
  wire id_10;
  ;
  assign id_4 = id_2;
  wand id_11 = 1, id_12 = 1;
endmodule
module module_1 (
    input uwire id_0,
    input tri1 id_1,
    input tri id_2,
    input supply1 id_3,
    input tri1 id_4,
    input tri1 id_5,
    output uwire id_6,
    output tri0 id_7,
    input wor id_8,
    input wor id_9,
    output tri1 id_10
);
  wire [1 : -1] id_12;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_8,
      id_5,
      id_6,
      id_5,
      id_7,
      id_7
  );
  assign modCall_1.id_3 = 0;
endmodule
