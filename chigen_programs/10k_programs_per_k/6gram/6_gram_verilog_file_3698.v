// Seed: 1674217601
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
    id_18
);
  output wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
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
  uwire id_19 = id_10;
  always @(posedge id_19 == 1 or posedge id_15) id_4 <= 1;
  uwire id_20 = id_10;
  always force id_14 = 1'h0;
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
    id_16
);
  output wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_17;
  wire id_18;
  assign id_5 = 1;
  logic [7:0] id_19;
  always id_13 <= #1 id_4;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_18,
      id_6,
      id_1,
      id_2,
      id_18,
      id_9,
      id_2,
      id_2,
      id_7,
      id_18,
      id_14,
      id_18,
      id_12,
      id_16,
      id_5,
      id_7
  );
  initial begin : LABEL_0
    #1;
    id_6 <= id_10;
    id_15#(.id_8(id_17)) <= 1;
  end
  supply1 id_20 = 1 && id_5;
  assign id_19[(1)] = id_20;
  assign id_1 = 'h0;
endmodule
