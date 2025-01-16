// Seed: 1579094709
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    input uwire id_2,
    input tri0 id_3,
    input tri id_4,
    input tri id_5,
    input supply0 id_6,
    input supply1 id_7,
    input wor id_8,
    input uwire id_9
);
  id_11(
      -1, -1'b0, id_1, id_2
  );
endmodule
module module_1 (
    output tri0 id_0,
    input supply1 id_1,
    output uwire id_2,
    input wand id_3,
    input uwire id_4,
    input supply1 id_5
);
  assign id_2 = 1 - id_3;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_3,
      id_1,
      id_1,
      id_3,
      id_4,
      id_4,
      id_3,
      id_5
  );
  assign modCall_1.id_0 = 0;
  wire id_7;
endmodule
