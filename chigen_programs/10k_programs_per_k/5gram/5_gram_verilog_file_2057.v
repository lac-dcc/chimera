// Seed: 2624330056
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  id_9(
      .id_0(1), .id_1(1)
  );
  assign module_1.id_17 = 0;
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
    id_15,
    id_16,
    id_17
);
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_5  = id_9;
  assign id_13 = 1;
  module_0 modCall_1 (
      id_6,
      id_12,
      id_14,
      id_5,
      id_16,
      id_15,
      id_8,
      id_15
  );
  always @(posedge id_17 - 1) begin : LABEL_0
    id_13 <= id_2;
  end
  assign id_8 = 1;
endmodule
