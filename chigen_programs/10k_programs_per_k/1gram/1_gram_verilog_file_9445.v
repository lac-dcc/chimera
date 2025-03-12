// Seed: 2304718968
module module_0 (
    input supply0 id_0,
    input tri id_1,
    input wor id_2,
    input wand id_3,
    input supply1 id_4,
    input tri0 id_5,
    output uwire void id_6
);
  logic id_8;
  wire  id_9;
  assign module_1.id_6 = 0;
endmodule
module module_1 #(
    parameter id_12 = 32'd25,
    parameter id_7  = 32'd88,
    parameter id_9  = 32'd74
) (
    input wire id_0,
    input tri id_1,
    output wand id_2,
    output tri id_3,
    inout wire id_4,
    output tri0 id_5,
    input wand id_6,
    input wand _id_7,
    input supply0 id_8,
    input supply1 _id_9,
    input wand id_10,
    output wand id_11,
    output tri _id_12
);
  wire  id_14 [-1 : id_12];
  logic id_15;
  nor primCall (id_4, id_15, id_10, id_1, id_17, id_14, id_8, id_16, id_0, id_6);
  logic id_16;
  logic id_17 = id_9;
  always
  `define pp_18 0
  module_0 modCall_1 (
      id_6,
      id_10,
      id_4,
      id_8,
      id_8,
      id_8,
      id_4
  );
  generate
    assign id_3 = id_17[-1];
  endgenerate
  assign id_17 = id_16[id_7];
  logic [7:0][-1 : 1] id_19[-1 'b0 : id_9];
endmodule
