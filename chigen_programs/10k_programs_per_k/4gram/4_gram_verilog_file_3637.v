// Seed: 3697974817
module module_0 (
    output tri id_0,
    input tri0 id_1,
    output tri id_2,
    output tri1 id_3,
    output supply1 id_4,
    input tri0 id_5,
    input wor id_6,
    input wire id_7,
    input uwire id_8,
    output wire id_9,
    input tri0 id_10,
    input tri1 id_11
);
  wire id_13;
  assign module_1.type_3 = 0;
  wire id_14 = id_10;
endmodule
module module_1 (
    output supply0 id_0,
    input wor id_1,
    output wire id_2,
    output wor id_3,
    input tri0 id_4,
    input tri1 id_5
    , id_9,
    output supply0 id_6,
    input supply1 id_7
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_3,
      id_6,
      id_3,
      id_5,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_4
  );
  id_11(
      .id_0(1), .id_1(1), .id_2(id_5 | id_3 | 1), .id_3(id_7), .id_4(1)
  ); id_12(
      id_0, 1'b0
  );
endmodule
