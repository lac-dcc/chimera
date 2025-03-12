// Seed: 3475800670
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
    id_17,
    id_18
);
  output wire id_18;
  input wire id_17;
  input wire id_16;
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_19;
endmodule
module module_1 #(
    parameter id_20 = 32'd82,
    parameter id_23 = 32'd82,
    parameter id_4  = 32'd23,
    parameter id_7  = 32'd69
) (
    output tri id_0,
    input supply1 id_1,
    input uwire id_2,
    output tri1 id_3,
    input tri1 _id_4,
    input tri id_5,
    output tri0 id_6,
    input wand _id_7,
    input supply1 id_8,
    input tri id_9,
    output tri id_10,
    input wire id_11,
    output wor id_12,
    input wor id_13,
    input wor id_14,
    output uwire id_15,
    input tri id_16,
    output uwire id_17,
    input supply0 id_18,
    input tri id_19,
    input tri _id_20,
    output tri0 id_21,
    output wor id_22,
    input wire _id_23,
    input supply0 id_24
);
  wire id_26;
  wire [id_7  |  id_23  ||  id_4  ||  !  id_20  ||  id_7 : -1] id_27;
  assign id_12 = id_26 ? id_4 : id_14;
  module_0 modCall_1 (
      id_27,
      id_26,
      id_26,
      id_26,
      id_26,
      id_27,
      id_27,
      id_27,
      id_26,
      id_26,
      id_26,
      id_26,
      id_27,
      id_26,
      id_27,
      id_27,
      id_26,
      id_27
  );
  assign id_15 = -1;
  localparam id_28 = 1;
  assign id_15 = id_7;
  wire id_29;
  nand primCall (id_10, id_24, id_27, id_8, id_14, id_13, id_11, id_19, id_26, id_9, id_2);
endmodule
