// Seed: 2467819
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  integer id_5;
  ;
  logic id_6;
  ;
endmodule
module module_1 #(
    parameter id_18 = 32'd21,
    parameter id_19 = 32'd57
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
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    _id_18,
    _id_19
);
  input wire _id_19;
  input wire _id_18;
  inout wire id_17;
  output wire id_16;
  inout wire id_15;
  output wire id_14;
  input wire id_13;
  module_0 modCall_1 (
      id_6,
      id_17,
      id_3,
      id_17
  );
  output logic [7:0] id_12;
  inout uwire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout logic [7:0] id_2;
  output wire id_1;
  assign id_12[1'b0>id_19^1'b0] = -1;
  wand id_20 = 1;
  assign id_2[-1'b0] = id_2;
  wire [id_18 : 1] id_21;
  xor primCall (id_17, id_13, id_10, id_2, id_4, id_8, id_3, id_15, id_6, id_9, id_11);
  assign id_11 = {1, id_17};
  assign id_11 = -1;
  wire id_22;
  always @(1) @(negedge id_11);
endmodule
