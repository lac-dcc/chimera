// Seed: 150543288
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
  output wire id_13;
  inout wire id_12;
  output wire id_11;
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
  always @(posedge id_8 or posedge id_8) begin : LABEL_0
    if (1)
      assume (1'b0);
      else id_12 = id_7;
  end
  uwire id_14 = id_12 && id_2 ? 1 : 1;
  id_15(
      .id_0(1), .id_1(id_8 == id_10), .id_2(1), .id_3(id_7)
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_16;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_11,
      id_5,
      id_10,
      id_10,
      id_12,
      id_13,
      id_15,
      id_16,
      id_13,
      id_6,
      id_6
  );
  assign id_4 = 1;
  wire id_17 = id_11;
endmodule
