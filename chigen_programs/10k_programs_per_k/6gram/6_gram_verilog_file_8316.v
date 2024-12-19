// Seed: 3646040257
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = 1;
  wire id_5;
  always force id_5 = 1;
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(*) begin : LABEL_0
    id_3  <= id_14 == 1;
    id_13 <= id_14;
    id_5  <= id_12;
  end
  module_0 modCall_1 (
      id_8,
      id_6,
      id_4,
      id_4
  );
  assign modCall_1.id_2 = 0;
endmodule
