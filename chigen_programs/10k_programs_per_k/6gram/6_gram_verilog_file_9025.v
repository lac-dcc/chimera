// Seed: 871887618
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
    id_16,
    id_17,
    id_18,
    id_19,
    id_20
);
  input wire id_20;
  input wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_4 = id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_7;
  tri  id_8;
  module_0(
      id_8,
      id_7,
      id_7,
      id_4,
      id_7,
      id_7,
      id_2,
      id_7,
      id_4,
      id_4,
      id_4,
      id_8,
      id_7,
      id_4,
      id_4,
      id_6,
      id_1,
      id_8,
      id_4,
      id_7
  );
  always @(1 or posedge id_8) begin
    id_6 = 1'b0;
  end
  nand (id_4, id_3, id_2);
endmodule
