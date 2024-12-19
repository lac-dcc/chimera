// Seed: 1863274177
module module_0 (
    input supply1 id_0,
    output wand id_1,
    output uwire id_2,
    output tri0 id_3,
    output wire id_4
);
  always @(id_0) id_3 = {1} - id_0;
  id_6(
      .id_0(1'b0), .id_1(id_3), .id_2(1), .id_3(id_4), .id_4(id_2)
  ); id_7(
      .id_0(1), .id_1(id_0 < id_1), .id_2(1), .id_3(1)
  );
endmodule
module module_1 (
    output wor id_0,
    output supply0 id_1,
    output tri id_2,
    input tri1 id_3,
    input tri1 id_4,
    input tri0 id_5,
    output uwire id_6,
    input supply0 id_7
);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_7,
      id_0,
      id_6,
      id_0,
      id_6
  );
  assign modCall_1.type_9 = 0;
  wire id_9;
endmodule
