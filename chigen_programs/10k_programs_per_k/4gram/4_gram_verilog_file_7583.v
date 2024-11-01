// Seed: 550305407
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_3 = id_4;
  wire id_6;
  id_7(
      .id_0(1), .id_1(1), .id_2(id_4), .id_3(id_5), .id_4(id_1)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  module_0(
      id_4, id_9, id_5
  ); id_10(
      .id_0(1), .id_1(1)
  );
  xor (id_5, id_1, id_8, id_7, id_3, id_4);
  wire id_11 = id_2;
  generate
    assign id_6 = 1;
  endgenerate
endmodule
