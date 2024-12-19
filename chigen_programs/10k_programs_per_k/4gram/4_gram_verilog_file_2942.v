// Seed: 2797314840
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    output uwire id_2,
    output supply0 id_3,
    input tri1 id_4,
    output wire id_5,
    output tri1 id_6,
    input wire id_7,
    output wire id_8,
    input tri1 id_9,
    output wand id_10,
    output tri id_11,
    input wand id_12
);
  assign id_2 = (1);
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output supply0 id_1
    , id_5,
    input supply1 id_2,
    input tri id_3
);
  id_6(
      .id_0(id_5),
      .id_1(1'd0),
      .id_2(id_2),
      .id_3(id_1),
      .id_4(1),
      .id_5(id_5),
      .id_6(1 / id_3),
      .id_7(1),
      .id_8({1, 1, id_5}),
      .id_9(1'b0),
      .id_10(id_2),
      .id_11(1'b0),
      .id_12(id_1)
  );
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_3,
      id_1,
      id_3,
      id_1,
      id_1,
      id_2
  );
endmodule
