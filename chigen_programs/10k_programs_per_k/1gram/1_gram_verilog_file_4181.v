// Seed: 465296605
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
    id_13,
    id_14,
    id_15,
    id_16
);
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  supply0 id_17, id_18;
  always begin
    @(1) id_17 = !id_11.id_8;
    id_6 <= 1;
  end
  wire id_19;
  assign id_17 = 1;
  wire id_20;
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
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  genvar id_8;
  wire id_9;
  module_0(
      id_5, id_9, id_5, id_9, id_6, id_4, id_6, id_9, id_8, id_1, id_9, id_9, id_6, id_5, id_8, id_1
  );
  always id_7['d0] <= id_4;
endmodule
