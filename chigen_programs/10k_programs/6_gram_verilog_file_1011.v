// Seed: 3688701828
module module_0 (
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
  input wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(*) $display;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_9;
  module_0(
      id_6, id_9, id_2, id_9, id_6, id_4, id_7, id_1, id_4
  );
  assign id_1#(
      .id_2(id_7 == 1'b0),
      .id_7(1),
      .id_6(1),
      .id_3(id_3),
      .id_2(id_3)
  ) = 1;
  assign id_6 = 1;
endmodule
