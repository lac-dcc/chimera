// Seed: 1426533462
module module_0 (
    input tri1 id_0,
    input supply0 id_1,
    input tri0 id_2,
    input tri1 id_3
    , id_5
);
  id_6(
      .id_0(id_1), .id_1(id_1)
  );
endmodule
module module_1 (
    input uwire id_0,
    input wor id_1
    , id_9,
    input wand id_2,
    output supply1 id_3,
    output wire id_4,
    input wire id_5
    , id_10,
    input wand id_6,
    output uwire id_7
);
  assign id_7 = 1 && id_10 == 1 ? 1 : 'b0 ? 1'b0 : id_9;
  module_0 modCall_1 (
      id_10,
      id_5,
      id_1,
      id_9
  );
  assign modCall_1.type_1 = 0;
endmodule
