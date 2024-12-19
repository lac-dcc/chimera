// Seed: 3938142192
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  initial $display;
  tri1 id_7;
  assign id_7 = 1'b0;
  initial assert (1);
  wire id_8, id_9, id_10, id_11, id_12, id_13;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_7,
      id_3,
      id_6,
      id_1
  );
  assign id_3 = 1;
  id_8(
      .id_0(1'b0), .id_1(1), .id_2(id_3), .id_3(id_7)
  );
endmodule
