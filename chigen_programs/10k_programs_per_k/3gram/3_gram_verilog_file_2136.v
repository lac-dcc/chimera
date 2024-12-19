// Seed: 1077843522
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  id_8(
      .id_0(1), .id_1(id_5), .id_2(1), .id_3(id_2)
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
    id_9,
    id_10
);
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    id_3 = 1;
  end
  wire id_11;
  assign id_2 = id_6[1'b0 : 1];
  module_0 modCall_1 (
      id_2,
      id_7,
      id_10,
      id_2,
      id_2,
      id_10,
      id_11
  );
  uwire id_12 = id_8;
  id_13(
      .id_0(),
      .id_1(id_8),
      .id_2(),
      .id_3(1'b0),
      .id_4(id_7),
      .id_5(id_7),
      .id_6(id_9),
      .id_7(1),
      .id_8(1 & 1),
      .id_9(1'b0)
  );
  assign id_12 = 1;
endmodule
