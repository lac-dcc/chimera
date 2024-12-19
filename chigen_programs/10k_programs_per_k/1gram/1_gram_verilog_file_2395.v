// Seed: 2724924693
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7, id_8, id_9;
  wire id_10, id_11;
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
  output wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_7,
      id_3,
      id_2,
      id_9,
      id_5,
      id_3
  );
  assign id_10 = 1'd0;
  logic [7:0][1] id_11 (
      .id_0(),
      .id_1((1)),
      .id_2(id_3),
      .id_3(1),
      .id_4(1),
      .id_5(1'b0),
      .id_6(1),
      .id_7(id_1),
      .id_8(id_8),
      .id_9(1)
  );
  assign id_10 = id_9;
  wire id_12;
endmodule
