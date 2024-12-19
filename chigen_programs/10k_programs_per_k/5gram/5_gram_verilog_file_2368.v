// Seed: 139023740
module module_0 (
    input supply1 id_0,
    output wire id_1,
    input supply1 id_2,
    input supply0 id_3,
    output supply1 id_4,
    input wand id_5
);
  assign module_1.id_7 = 0;
  id_7(
      .id_0(id_2),
      .id_1(id_3),
      .id_2(1),
      .id_3(id_4),
      .id_4(1),
      .id_5((1'b0)),
      .id_6(id_3 <= 1'b0),
      .id_7(1'b0),
      .id_8(1),
      .id_9(1)
  );
endmodule
module module_1 (
    output tri id_0,
    input supply1 id_1,
    input wor id_2,
    input tri1 id_3,
    input tri id_4
);
  wand id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_3
  );
  supply1 id_7 = id_2 < id_6;
  bufif0 primCall (id_0, id_6, id_4);
endmodule
