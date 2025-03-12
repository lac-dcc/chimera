// Seed: 1638815207
module module_0 (
    input wand id_0,
    input tri0 id_1,
    output supply1 id_2,
    input tri0 id_3,
    output wire id_4,
    input supply0 id_5,
    output tri id_6,
    input tri1 id_7,
    input wor id_8,
    input tri1 id_9,
    output tri0 id_10
);
  wire id_12;
  wire id_13;
  assign module_1.id_9 = 0;
  genvar id_14;
endmodule
module module_1 #(
    parameter id_13 = 32'd0,
    parameter id_2  = 32'd59
) (
    input wire id_0,
    input tri1 id_1,
    input tri1 _id_2,
    input tri id_3,
    input tri id_4,
    input tri0 id_5,
    output wire id_6,
    output wand id_7,
    output wand id_8,
    output wand id_9,
    input supply0 id_10,
    input supply1 id_11,
    input wand id_12,
    inout wand _id_13[1 : id_13  -  -1],
    inout tri0 id_14,
    output tri id_15,
    input wand id_16,
    input supply1 id_17
);
  logic id_19;
  ;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_14,
      id_5,
      id_14,
      id_5,
      id_8,
      id_12,
      id_17,
      id_16,
      id_9
  );
  assign id_15 = -1;
  logic id_20;
  wire [id_2 : 1] id_21;
  xnor primCall (
      id_9, id_17, id_4, id_5, id_11, id_0, id_10, id_16, id_3, id_19, id_14, id_12, id_1
  );
endmodule
