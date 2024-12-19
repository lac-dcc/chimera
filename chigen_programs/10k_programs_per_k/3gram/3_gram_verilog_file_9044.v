// Seed: 177485915
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
    id_20,
    id_21,
    id_22,
    id_23,
    id_24
);
  input wire id_24;
  output wire id_23;
  output wire id_22;
  output wire id_21;
  output wire id_20;
  output wire id_19;
  input wire id_18;
  input wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_15 = id_3;
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
    id_12
);
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(posedge id_10) begin : LABEL_0
    id_1 = id_10;
  end
  wire id_13;
  assign id_3[1'b0-1] = id_12;
  xor primCall (id_7, id_11, id_6, id_9, id_2, id_14, id_10, id_5, id_13, id_12, id_4, id_3);
  assign id_2 = id_10;
  wire id_14;
  module_0 modCall_1 (
      id_2,
      id_11,
      id_13,
      id_13,
      id_5,
      id_9,
      id_6,
      id_14,
      id_4,
      id_2,
      id_11,
      id_2,
      id_4,
      id_14,
      id_12,
      id_4,
      id_6,
      id_10,
      id_14,
      id_4,
      id_1,
      id_13,
      id_11,
      id_8
  );
  wire id_15;
endmodule
