// Seed: 247067545
module module_0 (
    output supply1 id_0,
    input supply0 id_1,
    input tri0 id_2,
    input wire id_3,
    output wire id_4,
    input wor id_5,
    input wand id_6,
    output supply0 id_7,
    output supply1 id_8,
    input tri0 id_9,
    output tri0 id_10,
    input tri1 id_11,
    input tri0 id_12,
    input tri id_13,
    input tri id_14,
    output uwire id_15,
    input uwire id_16,
    output wire id_17,
    input wand id_18,
    output tri id_19,
    output tri1 id_20,
    input supply1 id_21,
    output tri1 id_22
);
  wire  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  =  1  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ;
  assign id_15 = 1;
endmodule
module module_1 (
    input tri id_0,
    input logic id_1,
    input tri0 id_2,
    output wand id_3,
    input tri id_4,
    inout wor id_5,
    input uwire id_6,
    input wor id_7,
    output supply1 id_8,
    input supply0 id_9,
    input wor id_10,
    input tri0 id_11,
    output wand id_12,
    input wire id_13,
    input supply0 id_14,
    output tri0 id_15
    , id_21,
    input wire id_16,
    inout logic id_17,
    output tri0 id_18,
    output tri id_19
);
  initial begin : LABEL_0
    id_17 <= id_1;
  end
  module_0 modCall_1 (
      id_19,
      id_13,
      id_7,
      id_5,
      id_3,
      id_9,
      id_14,
      id_18,
      id_15,
      id_16,
      id_12,
      id_10,
      id_9,
      id_4,
      id_0,
      id_8,
      id_11,
      id_5,
      id_4,
      id_8,
      id_8,
      id_6,
      id_18
  );
  assign modCall_1.id_6 = 0;
  assign id_8 = id_6;
  assign id_17 = 1;
  assign id_19 = id_16;
endmodule
