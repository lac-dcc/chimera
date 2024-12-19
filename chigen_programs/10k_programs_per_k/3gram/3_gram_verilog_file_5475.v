// Seed: 2698263353
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
    id_19
);
  inout wire id_19;
  input wire id_18;
  inout wire id_17;
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = 1'b0;
  wire id_20;
  wire id_21 = id_17;
  assign id_9 = id_21;
  id_22(
      .id_0(1), .id_1(id_6), .id_2(id_19), .id_3(id_7), .id_4(1'h0), .id_5(id_1), .id_6(id_7)
  );
  wire id_23;
  wire id_24, id_25;
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
    id_11
);
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
  always_ff @(*) begin : LABEL_0
    if (id_9) begin : LABEL_0
      id_3 <= id_4++;
      id_4 = id_2[1'b0];
    end else id_5 <= 1'b0;
  end
  module_0 modCall_1 (
      id_9,
      id_6,
      id_10,
      id_10,
      id_6,
      id_10,
      id_11,
      id_6,
      id_10,
      id_6,
      id_11,
      id_11,
      id_6,
      id_6,
      id_8,
      id_9,
      id_10,
      id_7,
      id_6
  );
  wire  id_12;
  uwire id_13 = 1'b0 - id_9;
  wire  id_14;
endmodule
