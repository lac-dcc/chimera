// Seed: 3794833964
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
    id_14
);
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  integer id_15;
  assign id_9 = id_4;
  id_16(
      id_9, 1'b0, id_14
  );
  wire id_17;
endmodule
module module_1 #(
    parameter id_38 = 32'd86,
    parameter id_39 = 32'd41,
    parameter id_8  = 32'd65
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5#(
        .id_6 (id_7[_id_8]),
        .id_9 (1),
        .id_10(id_11),
        .id_12(id_13)
    ),
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
    id_24,
    id_25
);
  inout wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  input wire _id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  xor primCall (
      id_1,
      id_16,
      id_28,
      id_26,
      id_29,
      id_33,
      id_23,
      id_20,
      id_31,
      id_2,
      id_5,
      id_32,
      id_35,
      id_19,
      id_34,
      id_17,
      id_4,
      id_27,
      id_10,
      id_22,
      id_30,
      id_21,
      id_18
  );
  wire id_26;
  assign id_4 = id_16;
  supply1 id_27 = 1;
  wire id_28, id_29;
  assign id_4 = id_5;
  always id_1 <= #1 id_22;
  wire id_30, id_31, id_32, id_33, id_34, id_35;
  module_0 modCall_1 (
      id_4,
      id_29,
      id_35,
      id_18,
      id_16,
      id_25,
      id_28,
      id_30,
      id_4,
      id_25,
      id_28,
      id_24,
      id_24,
      id_24
  );
  wire id_36;
  wire id_37;
  defparam id_38 = 1'h0, id_39 = id_23;
  assign #id_40 id_40 = id_10;
  wire id_41, id_42;
endmodule
