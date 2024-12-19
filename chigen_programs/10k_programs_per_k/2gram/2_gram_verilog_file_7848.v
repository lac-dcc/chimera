// Seed: 1499583165
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_7;
  id_8(
      .id_0(id_6 | 1), .id_1({id_5, 1}), .id_2(id_6), .id_3(1), .id_4(1), .id_5(1'b0), .id_6(id_1)
  );
  tri0 id_9 = 1;
  assign id_6 = id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_1,
      id_3,
      id_2
  );
  assign modCall_1.id_5 = 0;
endmodule
