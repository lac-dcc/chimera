// Seed: 1534858812
module module_0 (
    output tri0 id_0,
    input supply1 id_1,
    input tri0 id_2,
    input tri id_3,
    output tri0 id_4,
    input tri id_5,
    input uwire id_6,
    input supply0 id_7,
    input supply1 id_8,
    input wire id_9,
    input wire id_10,
    input tri1 id_11,
    input wor id_12,
    input tri0 id_13
    , id_27,
    input wand id_14,
    input uwire id_15,
    output wire id_16
    , id_28,
    input supply1 id_17,
    input supply1 id_18,
    input supply0 id_19,
    output supply0 id_20,
    input wor id_21,
    input wire id_22,
    output supply1 id_23,
    input wor id_24,
    input tri0 id_25
);
  parameter id_29 = ~~1;
  wire id_30[-1 'b0 : -1];
  ;
  initial id_27 <= id_22;
  for (id_31 = id_3; id_8; id_31 = 1) assign id_31 = id_17;
  logic id_32;
  assign id_16 = id_29;
  wire id_33 = id_32;
  union packed {logic id_34;} id_35;
  wire id_36, id_37, id_38;
  wire id_39;
  if (id_29 << 1) assign id_35 = -1'h0;
endmodule
module module_1 #(
    parameter id_3 = 32'd17,
    parameter id_8 = 32'd46
) (
    output tri0  id_0,
    output tri   id_1,
    output wand  id_2,
    input  tri0  _id_3,
    input  tri1  id_4,
    inout  wand  id_5,
    output logic id_6,
    input  wire  id_7,
    input  tri   _id_8,
    output tri0  id_9
);
  logic id_11[id_8 : id_3];
  module_0 modCall_1 (
      id_2,
      id_5,
      id_4,
      id_7,
      id_5,
      id_5,
      id_5,
      id_4,
      id_7,
      id_4,
      id_4,
      id_5,
      id_5,
      id_4,
      id_7,
      id_5,
      id_1,
      id_4,
      id_4,
      id_5,
      id_5,
      id_4,
      id_7,
      id_5,
      id_4,
      id_7
  );
  final id_6 = id_11;
  logic id_12, id_13, id_14;
endmodule
