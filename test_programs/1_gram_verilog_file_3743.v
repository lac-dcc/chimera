// Seed: 982322312
module module_0 (
    input tri0 id_0,
    output wire id_1,
    input tri1 id_2,
    input wor id_3,
    input tri0 id_4,
    input uwire id_5,
    input supply1 id_6,
    input tri0 id_7
);
  assign id_1 = 1'b0;
  final id_1 = id_3;
  wire id_9;
  assign id_1 = 1'b0 == (id_0 ? id_5 - 1 : 1 * ~1'b0);
endmodule
module module_1 (
    output tri0  id_0,
    input  wire  id_1,
    output wire  id_2,
    output tri1  id_3,
    input  uwire id_4
);
  wire id_6, id_7;
  wire id_8;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4,
      id_1,
      id_4,
      id_4,
      id_1,
      id_4
  );
  assign modCall_1.id_2 = 0;
endmodule
