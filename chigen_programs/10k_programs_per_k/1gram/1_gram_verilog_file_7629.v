// Seed: 828934070
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  assign module_1.id_43.id_40 = 0;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_0  = 32'd22,
    parameter id_22 = 32'd28,
    parameter id_23 = 32'd99,
    parameter id_27 = 32'd43,
    parameter id_31 = 32'd46,
    parameter id_32 = 32'd68
) (
    input tri1 _id_0,
    output supply1 id_1,
    input uwire id_2,
    input wor id_3,
    output wand id_4,
    input supply0 id_5,
    input wand id_6,
    input wor id_7,
    output tri id_8,
    input uwire id_9,
    input supply0 id_10,
    input supply0 id_11,
    input wand id_12,
    input tri1 id_13,
    input wor id_14,
    output uwire id_15,
    input supply1 id_16,
    input tri id_17,
    input wor id_18,
    input tri0 id_19,
    output supply1 id_20[id_32 : 1],
    input wor id_21,
    input wor _id_22,
    input supply1 _id_23,
    output wire id_24,
    input tri1 id_25,
    output uwire id_26,
    input supply1 _id_27,
    input wor id_28,
    input tri id_29,
    output tri0 id_30,
    output uwire _id_31,
    input wor _id_32,
    input uwire id_33
);
  wire id_35 [id_27 : id_0];
  wire id_36;
  assign id_31 = id_33;
  struct packed {
    logic id_37[1 'd0 : id_22];
    id_38 id_39;
    logic id_40;
    logic id_41;
    logic id_42;
  } id_43 = 1;
  assign id_43.id_40 = id_10 - -1;
  assign id_43.id_39 = 1'h0;
  logic [id_23 : id_31] id_44;
  ;
  logic id_45;
  module_0 modCall_1 (
      id_43.id_40,
      id_36,
      id_38,
      id_43.id_39,
      id_44,
      id_43.id_39,
      id_36
  );
endmodule
