// Seed: 1379936420
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1 = id_3++;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  id_4(
      .id_0(1), .id_1({1, id_2} * 1), .id_2(1), .id_3(id_5), .id_4(id_2++ - 1)
  );
  assign id_4 = id_1;
  assign id_3 = id_5 == 1;
  tri id_6;
  assign id_6 = 1'b0;
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_6
  );
endmodule
