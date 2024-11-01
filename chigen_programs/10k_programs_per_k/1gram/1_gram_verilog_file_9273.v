// Seed: 2118762252
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
    id_13
);
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_10 = id_9 & 1;
endmodule
module module_1 #(
    parameter id_32 = 32'd94,
    parameter id_33 = 32'd60
) (
    input tri0 id_0,
    input supply0 id_1,
    output wor id_2,
    input tri1 id_3,
    input wor id_4,
    input wor id_5,
    input wire id_6,
    output supply0 id_7,
    input tri id_8,
    output tri1 id_9,
    input tri1 id_10,
    output supply1 id_11
    , id_31,
    input supply1 id_12,
    output uwire id_13,
    input supply0 id_14,
    input tri1 id_15,
    output tri0 id_16,
    input wand id_17,
    output wor id_18,
    output tri0 id_19,
    input tri0 id_20,
    input tri0 id_21,
    input wand id_22,
    input uwire id_23,
    input wire id_24,
    output tri id_25,
    input wor id_26,
    input tri1 id_27,
    input supply0 id_28,
    output tri0 id_29
);
  defparam id_32 = 1, id_33 = id_32;
  wire id_34;
  generate
    tri0 id_35 = 1;
    wand id_36;
    assign id_19 = id_36;
  endgenerate
  assign id_13 = id_5 && id_22 ^ id_14;
  module_0(
      id_35, id_31, id_34, id_34, id_31, id_34, id_34, id_34, id_31, id_34, id_34, id_34, id_34
  );
  wire id_37;
  wire id_38;
  tri1 id_39;
  assign (supply1, weak0) id_39 = id_23;
  wor id_40 = id_26;
endmodule
