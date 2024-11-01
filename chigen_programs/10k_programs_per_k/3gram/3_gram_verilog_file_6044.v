// Seed: 2368343043
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  id_13(
      .id_0(id_5),
      .id_1(id_3),
      .id_2(1),
      .id_3(1),
      .id_4(1),
      .id_5(1'b0),
      .id_6(1),
      .id_7(id_11),
      .id_8(1)
  );
  wire id_14;
  genvar id_15;
  wire id_16;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1 = 1'b0;
  always @(negedge id_2) $display(1, 1);
  logic [7:0] id_6;
  assign id_6[1'b0-1] = 1;
  assign id_2 = 1 + id_2;
  module_0(
      id_3, id_5, id_2, id_2, id_2, id_3, id_2, id_5, id_3, id_2, id_2, id_2
  );
  assign id_4 = id_6;
  wire id_7;
  assign id_7 = 1;
  logic [7:0] id_8;
  assign id_8 = id_6;
endmodule
