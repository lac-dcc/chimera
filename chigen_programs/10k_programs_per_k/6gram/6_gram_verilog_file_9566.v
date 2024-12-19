// Seed: 1231654241
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  assign id_2 = 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  id_8(
      .id_0(id_4), .id_1(), .id_2(id_3), .id_3(~id_7), .id_4(1)
  );
  wire id_9;
  module_0 modCall_1 (
      id_4,
      id_2
  );
  assign modCall_1.id_2 = 0;
  wire id_10 = id_6;
endmodule
