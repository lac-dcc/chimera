// Seed: 1662377669
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
    id_15
);
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout tri1 id_1;
  parameter id_16 = 1 >= 1;
  logic id_17;
  ;
  assign id_1 = -1'd0 == id_7;
  logic id_18;
  logic id_19;
endmodule
module module_1 #(
    parameter id_8 = 32'd23
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
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
  inout wire id_18;
  input wire id_17;
  input wire id_16;
  output wire id_15;
  input wire id_14;
  inout logic [7:0] id_13;
  input wire id_12;
  inout logic [7:0] id_11;
  inout wire id_10;
  output wire id_9;
  inout wire _id_8;
  input wire id_7;
  output wire id_6;
  inout logic [7:0] id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_18,
      id_17,
      id_10,
      id_3,
      id_7,
      id_10,
      id_17,
      id_16,
      id_3,
      id_9,
      id_3,
      id_1,
      id_10
  );
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  logic id_19;
  ;
  assign id_18 = id_11[id_8];
  specify
    (id_20 => id_21) = (1  : ~&id_5[1 :-1&-1] : -1'd0, id_1 < -1  : id_11 != id_11  : 1);
  endspecify
endmodule
