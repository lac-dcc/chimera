// Seed: 3953127315
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout supply0 id_1;
  assign module_1.id_10 = 0;
  assign id_1 = -1'b0;
  logic [7:0] id_7, id_8, id_9, id_10, id_11, id_12, id_13;
  wire id_14;
  assign id_10[1] = -1;
endmodule
module module_1 #(
    parameter id_10 = 32'd24
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
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  input wire id_18;
  input wire id_17;
  inout wire id_16;
  output wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  module_0 modCall_1 (
      id_16,
      id_18,
      id_12,
      id_5,
      id_9,
      id_16
  );
  output wire id_11;
  inout wire _id_10;
  inout wire id_9;
  inout logic [7:0] id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  and primCall (id_5, id_16, id_9, id_18, id_7, id_2, id_14, id_12, id_17, id_8, id_3);
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_8[id_10] = 1;
  integer id_19;
endmodule
