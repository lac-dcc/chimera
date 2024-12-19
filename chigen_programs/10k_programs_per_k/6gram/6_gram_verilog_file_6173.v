// Seed: 14780245
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_6;
  assign id_1 = 1;
  assign id_4 = 1;
  wire id_7;
  id_8(
      .id_0(), .id_1(1'b0), .id_2(~1), .id_3(1'b0)
  );
endmodule
module module_1 (
    input  tri1  id_0,
    output uwire id_1,
    input  tri1  id_2,
    input  tri1  id_3,
    output wor   id_4
);
  wire id_6;
  id_7(
      .id_0(1), .id_1(1), .id_2(1), .id_3(1'b0)
  );
  and primCall (id_4, id_8, id_2, id_6);
  assign id_6 = 1'b0;
  wire id_8;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_6,
      id_6,
      id_8
  );
  assign modCall_1.id_1 = 0;
endmodule
