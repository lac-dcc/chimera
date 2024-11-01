// Seed: 3820778473
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
    id_12,
    id_13
);
  input wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_4 = 1;
  wire id_14;
  always id_8 = #1 id_13;
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
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  nand (id_6, id_2, id_9, id_4, id_7, id_10, id_8);
  wire id_10;
  always @(1) begin
    id_6 <= id_3;
  end
  module_0(
      id_2, id_2, id_5, id_9, id_9, id_8, id_7, id_6, id_2, id_10, id_10, id_1, id_3
  );
  wire id_11 = id_9;
endmodule
