// Seed: 326115811
module module_0 (
    output tri1 id_0
    , id_9,
    output wire id_1,
    output tri0 id_2,
    input uwire id_3,
    input tri id_4,
    input supply1 id_5,
    output uwire id_6,
    output tri1 id_7
);
  assign id_2 = id_9 - 1;
  id_10(
      .id_0(id_5), .id_1(id_7), .id_2(), .id_3(id_4), .id_4(1)
  );
endmodule
module module_1 (
    output tri0 id_0,
    input  wor  id_1,
    input  wand id_2,
    input  tri0 id_3,
    output tri0 id_4
);
  assign id_0 = {id_1 - 1'd0 && id_2 && id_3, id_3, id_2, id_1, id_1, id_2 || id_1, id_3, 1 ^ id_2};
  module_0 modCall_1 (
      id_0,
      id_0,
      id_4,
      id_3,
      id_3,
      id_1,
      id_0,
      id_4
  );
  assign modCall_1.id_2 = 0;
endmodule
