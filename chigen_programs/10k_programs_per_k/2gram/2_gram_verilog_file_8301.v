// Seed: 2579786734
module module_0 (
    id_1
);
  input wire id_1;
  parameter id_2 = -1;
  wire id_3;
  generate
    logic id_4;
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout logic [7:0] id_4;
  input wire id_3;
  output tri id_2;
  input wire id_1;
  assign id_2 = 1;
  assign id_4[1] = 1'h0;
  module_0 modCall_1 (id_3);
  generate
    reg id_5;
  endgenerate
  wire id_6;
  assign id_5 = 1;
  always id_5 <= id_3;
endmodule
module module_2 #(
    parameter id_21 = 32'd14,
    parameter id_23 = 32'd62,
    parameter id_24 = 32'd39,
    parameter id_25 = 32'd56,
    parameter id_28 = 32'd54,
    parameter id_31 = 32'd35,
    parameter id_6  = 32'd15,
    parameter id_7  = 32'd34
) (
    input supply1 id_0,
    output wire id_1,
    output uwire id_2,
    output tri id_3,
    input tri id_4,
    output uwire id_5,
    input wire _id_6,
    input uwire _id_7,
    output supply0 id_8,
    input tri0 id_9,
    input tri0 id_10,
    input wand id_11
    , id_33,
    input tri id_12
    , id_34,
    output supply1 id_13,
    input wire id_14,
    input tri0 id_15,
    output supply1 id_16,
    input wor id_17,
    input wire id_18
    , id_35,
    output wor id_19,
    input wire id_20,
    input wire _id_21,
    output tri0 id_22,
    output wire _id_23,
    output supply0 _id_24,
    input wand _id_25,
    input tri1 id_26,
    output tri1 id_27,
    input wand _id_28,
    input wor id_29,
    output supply0 id_30,
    input wand _id_31
);
  wire [id_24 : -1] id_36;
  wire [{  id_21  ,  1  ,  1 'b0 } : id_7] id_37;
  wire [id_25 : id_6] id_38;
  wire [-1 'b0 : id_31] id_39;
  module_0 modCall_1 (id_34);
  logic id_40[-1 : -1 'b0 ?  id_23 : id_28] = -1;
  nor primCall (
      id_8,
      id_18,
      id_17,
      id_14,
      id_34,
      id_35,
      id_37,
      id_36,
      id_11,
      id_33,
      id_15,
      id_39,
      id_10,
      id_9,
      id_38,
      id_26,
      id_29,
      id_12,
      id_20,
      id_0
  );
  logic id_41;
  ;
endmodule
