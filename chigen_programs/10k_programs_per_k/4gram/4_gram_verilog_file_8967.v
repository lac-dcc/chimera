// Seed: 252742692
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_6 = !id_9;
endmodule
module module_1 #(
    parameter id_11 = 32'd80
) (
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
    _id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  inout wire id_18;
  output wire id_17;
  input wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  input wire _id_11;
  inout supply0 id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_3,
      id_5,
      id_10,
      id_4,
      id_8,
      id_10,
      id_18
  );
  assign id_10 = id_11 ? 1 : id_11;
  assign id_15 = -1;
  logic [-1 : 1] id_19;
  `define pp_20 0
  wire id_21;
  wire [!  id_11 : `pp_20] id_22;
endmodule
