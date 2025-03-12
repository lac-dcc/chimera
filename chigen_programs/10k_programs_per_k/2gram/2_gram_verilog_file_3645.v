// Seed: 2524600293
module module_0 (
    input wand id_0,
    output wor id_1,
    output uwire id_2,
    input supply1 id_3,
    input tri id_4,
    input supply1 id_5,
    output tri1 id_6,
    input wand id_7,
    input tri1 id_8,
    input tri0 id_9,
    input tri1 id_10,
    output supply1 id_11,
    output wor id_12,
    input wand id_13,
    input wire id_14,
    input supply1 id_15,
    output wire id_16,
    input wand id_17,
    output wor id_18
);
  id_20 :
  assert property (@(posedge id_14 or posedge id_13) id_17 == id_13)
  else;
  parameter id_21 = -1;
endmodule
module module_1 #(
    parameter id_12 = 32'd69,
    parameter id_18 = 32'd10,
    parameter id_19 = 32'd60,
    parameter id_5  = 32'd90,
    parameter id_8  = 32'd2
) (
    input wire id_0,
    output uwire id_1,
    output tri0 id_2,
    output tri id_3,
    input uwire id_4,
    input wand _id_5,
    input wire id_6,
    input supply0 id_7,
    input wand _id_8,
    output wor id_9,
    output wand id_10,
    output tri id_11,
    output supply0 _id_12,
    output wand id_13,
    output wire id_14,
    output tri1 id_15,
    output wor id_16
);
  wire [!  -1 : -1  >>  1 'd0] _id_18;
  assign id_13 = id_6;
  wire _id_19;
  wire id_20;
  assign id_13 = 1;
  logic [7:0] id_21;
  assign id_1 = -1;
  assign id_21[~{1, 1, id_19} : id_19] = -1;
  logic [id_12 : id_8] id_22 = id_18;
  assign id_21[1'b0] = 1;
  wire [id_5 : id_18] id_23;
  module_0 modCall_1 (
      id_6,
      id_2,
      id_10,
      id_4,
      id_7,
      id_6,
      id_14,
      id_6,
      id_4,
      id_0,
      id_0,
      id_16,
      id_16,
      id_6,
      id_0,
      id_7,
      id_1,
      id_6,
      id_11
  );
endmodule
