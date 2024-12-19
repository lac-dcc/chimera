// Seed: 1441128647
module module_0 (
    input tri id_0,
    input supply0 id_1,
    output tri0 id_2,
    output wire id_3,
    input wor id_4,
    input wire id_5,
    output wand id_6,
    input supply1 id_7,
    input tri0 id_8
);
  id_10(
      .id_0(), .id_1(id_6)
  );
  wire id_11;
  reg  id_12;
  always begin : LABEL_0
    id_12 <= 1;
  end
endmodule
module module_1 (
    input  supply1 id_0,
    output supply1 id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.type_4 = 0;
  wire id_4, id_5 = id_4;
endmodule
