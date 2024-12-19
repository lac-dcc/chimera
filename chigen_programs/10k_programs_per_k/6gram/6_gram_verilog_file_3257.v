// Seed: 2604667630
module module_0 (
    input  tri0  id_0,
    output wire  id_1,
    output uwire id_2,
    input  tri0  id_3,
    output tri   id_4,
    input  wire  id_5,
    input  tri   id_6,
    output tri0  id_7,
    input  uwire id_8,
    input  tri0  id_9,
    output tri1  id_10
);
  wire id_12;
  wire id_13;
  assign module_1.type_10 = 0;
  wire id_14 = id_12;
endmodule
module module_1 (
    input tri0 id_0,
    input supply1 id_1,
    input supply0 id_2,
    input tri id_3,
    input tri id_4,
    output wire id_5
);
  id_7(
      .id_0(~id_1),
      .id_1(id_5),
      .id_2(id_5 == id_0),
      .id_3(id_3),
      .id_4(id_5),
      .id_5(1 - 1),
      .id_6(1),
      .id_7(id_2 >= 1'b0),
      .id_8(id_0),
      .id_9(1'b0)
  );
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_2,
      id_5,
      id_0,
      id_1,
      id_5,
      id_2,
      id_4,
      id_5
  );
endmodule
