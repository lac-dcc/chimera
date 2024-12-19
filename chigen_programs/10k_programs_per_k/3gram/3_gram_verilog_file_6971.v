// Seed: 4117098323
module module_0 (
    input  tri0  id_0,
    input  wand  id_1,
    input  tri   id_2,
    input  uwire id_3,
    output uwire id_4,
    input  tri   id_5
);
  id_7(
      .id_0(1), .id_1(id_5), .id_2(), .id_3(), .id_4(1'b0)
  );
endmodule
module module_1 (
    input tri id_0,
    input wor id_1,
    input supply0 id_2,
    output wire id_3
);
  wor id_5;
  assign id_5 = 1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_0,
      id_3,
      id_1
  );
  assign modCall_1.id_2 = 0;
endmodule
