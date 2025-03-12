// Seed: 406758954
module module_0 (
    input  tri0 id_0,
    output wor  id_1,
    output wand id_2
    , id_5,
    input  tri0 id_3
);
  assign id_1 = id_3;
  assign module_2._id_8 = 0;
endmodule
module module_1 (
    input  wire id_0,
    output wand id_1
);
  always deassign id_1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 #(
    parameter id_0  = 32'd62,
    parameter id_10 = 32'd82,
    parameter id_11 = 32'd90,
    parameter id_12 = 32'd92,
    parameter id_8  = 32'd91
) (
    input uwire _id_0,
    input wand id_1,
    output logic id_2,
    input wand id_3,
    output tri id_4,
    output uwire id_5,
    input wire id_6,
    output uwire id_7,
    input wire _id_8,
    output wand id_9,
    input uwire _id_10,
    input uwire _id_11,
    input tri0 _id_12,
    input supply1 id_13,
    output wor id_14,
    input tri0 id_15
);
  logic [1 : id_0] id_17 = id_3;
  wire [id_12 : id_10  <=  -1 'h0] id_18;
  wire id_19;
  always @(id_11 or posedge 1) id_2 = 1 & id_17[id_11 : 1];
  assign id_5 = id_18;
  module_0 modCall_1 (
      id_6,
      id_14,
      id_5,
      id_6
  );
  logic [-1 : (  id_8  )] id_20 = id_3 !=? id_6;
  logic [1 : 1] id_21;
  assign id_18 = id_12;
endmodule
