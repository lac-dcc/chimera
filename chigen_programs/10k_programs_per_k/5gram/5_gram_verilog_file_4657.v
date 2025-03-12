// Seed: 4105029572
module module_0 (
    output tri id_0,
    input supply1 id_1,
    input uwire id_2,
    input tri id_3,
    input tri0 id_4,
    input tri0 id_5,
    output tri0 id_6,
    input tri id_7
);
  assign id_0 = id_2;
  wire id_9;
  assign module_1.id_24 = 0;
  assign id_0 = -1;
endmodule
module module_1 #(
    parameter id_19 = 32'd95,
    parameter id_23 = 32'd10,
    parameter id_3  = 32'd5,
    parameter id_5  = 32'd79
) (
    output wor id_0,
    input tri0 id_1,
    output wire id_2,
    input uwire _id_3,
    output supply0 id_4,
    input uwire _id_5,
    output wire id_6,
    input uwire id_7,
    output tri1 id_8,
    output wire id_9,
    input tri0 id_10,
    output tri0 id_11,
    output supply0 id_12,
    input uwire id_13,
    output wand id_14,
    input wand id_15,
    input wor id_16,
    input tri1 id_17,
    input supply0 id_18,
    output supply0 _id_19,
    input wire id_20,
    output wire id_21,
    input tri id_22,
    output wor _id_23,
    input supply0 id_24
);
  logic [id_5 : id_23  (  id_19  ==  id_3  )] id_26;
  xnor primCall (
      id_11, id_24, id_10, id_26, id_16, id_7, id_20, id_18, id_22, id_13, id_15, id_17, id_1
  );
  assign id_11 = -1;
  module_0 modCall_1 (
      id_9,
      id_10,
      id_20,
      id_18,
      id_17,
      id_7,
      id_0,
      id_24
  );
endmodule
