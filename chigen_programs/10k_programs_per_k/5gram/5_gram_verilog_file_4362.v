// Seed: 2604988975
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
    id_17
);
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire [1 : -1] id_18;
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
    id_14
);
  inout wire id_14;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_6,
      id_12,
      id_14,
      id_12,
      id_6,
      id_14,
      id_4,
      id_2,
      id_11,
      id_3,
      id_9,
      id_14,
      id_12,
      id_13,
      id_12
  );
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  input logic [7:0] id_8;
  inout logic [7:0] id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  specify
    if (id_7[-1'h0]) (posedge id_15 => (id_16 +: 1 + 1)) = (-1, 1'b0);
    (negedge id_17 => (id_18 +: -1)) = (1 == -1, id_8[-1]);
    (posedge id_19 => (id_20 +: 1)) = (id_7 == id_15, id_2);
  endspecify
endmodule
