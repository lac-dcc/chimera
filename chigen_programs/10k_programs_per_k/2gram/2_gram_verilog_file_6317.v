// Seed: 3718689158
module module_0 (
    input supply1 id_0,
    output wand id_1,
    input wire id_2
);
  id_4(
      .id_0(id_0), .id_1(1), .id_2(!id_2)
  );
endmodule
module module_1 (
    input supply0 id_0,
    input tri0 id_1,
    output supply1 id_2,
    input tri0 id_3,
    input wand id_4,
    output supply0 id_5,
    input wand id_6,
    input tri0 id_7,
    input tri1 id_8
);
  wire id_10, id_11;
  wire id_12;
  assign id_12 = id_4;
  id_13(
      .id_0(1), .id_1(id_0), .id_2(id_11), .id_3(id_5), .id_4(id_4)
  );
  wire id_14;
  wire id_15;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_3
  );
  assign modCall_1.type_0 = 0;
  wire id_16;
endmodule
