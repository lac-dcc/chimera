// Seed: 3462903033
module module_0 (
    input tri0 id_0,
    input supply0 id_1,
    input tri1 id_2,
    input tri id_3,
    input supply0 id_4,
    output tri id_5,
    input wire id_6,
    input uwire id_7,
    input uwire id_8,
    output uwire id_9,
    output supply1 id_10,
    input tri1 id_11,
    input supply0 id_12,
    input tri0 id_13
);
  id_15(
      .id_0(~1),
      .id_1(id_9),
      .id_2(id_10),
      .id_3(1 - 1),
      .id_4(1'd0),
      .id_5(id_2),
      .id_6(1),
      .id_7(id_0)
  );
endmodule
module module_1 (
    output tri id_0,
    input tri0 id_1,
    output supply0 id_2,
    input wand id_3,
    output uwire id_4,
    input tri1 id_5
);
  id_7(
      .id_0(1)
  );
  assign id_2 = id_5;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_3,
      id_5,
      id_0,
      id_1,
      id_1,
      id_5,
      id_4,
      id_0,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.type_2 = 0;
  assign id_2 = id_3;
endmodule
