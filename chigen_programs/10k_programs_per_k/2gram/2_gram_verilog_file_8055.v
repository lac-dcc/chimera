// Seed: 776817112
module module_0 (
    input  tri0  id_0,
    output wire  id_1,
    input  tri0  id_2,
    input  tri1  id_3,
    output wor   id_4,
    output tri0  id_5,
    output uwire id_6,
    input  wire  id_7,
    input  wor   id_8
);
  id_10(
      .id_0(1), .id_1(id_3)
  );
  assign id_5 = 1;
endmodule
module module_1 (
    output tri id_0,
    input  wor id_1
);
  assign id_0 = 1;
  tri1 id_3;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1
  );
  id_4(
      .id_0(1'b0),
      .id_1(id_3#(
          .id_2(1 && id_1),
          .id_3(1),
          .id_4(1)
      )),
      .id_5(1'd0)
  );
  assign id_0 = id_3 ? 1 & 1 : 1 * 1;
  wire id_5;
endmodule
