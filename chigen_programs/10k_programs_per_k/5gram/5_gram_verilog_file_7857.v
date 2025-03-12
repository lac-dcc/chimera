// Seed: 2013424117
module module_0 (
    input wor   id_0,
    input wor   id_1,
    input uwire id_2,
    input wire  id_3,
    input tri   id_4
);
  wire [-1 : (  1  )] id_6, id_7, id_8;
  assign id_6 = id_4;
  wire id_9;
  assign module_1.id_7 = 0;
endmodule
module module_1 #(
    parameter id_0  = 32'd59,
    parameter id_15 = 32'd6,
    parameter id_18 = 32'd10,
    parameter id_2  = 32'd16,
    parameter id_5  = 32'd24,
    parameter id_9  = 32'd9
) (
    input wire _id_0,
    output uwire id_1,
    input wand _id_2,
    input supply1 id_3,
    output logic id_4,
    input wand _id_5,
    input tri id_6,
    output uwire id_7,
    output supply1 id_8,
    input tri1 _id_9,
    output supply0 id_10,
    inout supply1 id_11,
    input wire id_12,
    input supply1 id_13,
    input supply0 id_14,
    input wor _id_15,
    output tri1 id_16
);
  module_0 modCall_1 (
      id_11,
      id_11,
      id_13,
      id_3,
      id_13
  );
  assign id_1 = id_15;
  wire [id_15  **  id_9 : id_0  ==  -1] _id_18;
  wire id_19 = id_13;
  assign id_11 = id_4++ & 1;
  assign id_10 = id_9 ? id_2 : id_13;
  assign id_10 = id_14;
  wire id_20;
  logic [id_2  ==  id_15 : id_5] id_21 = 1'b0;
  logic [id_9 : 1] id_22[id_18];
  assign id_16 = 1 - id_2;
  always @(id_19 or posedge 1) id_4 = 1;
  wire id_23, id_24;
endmodule
