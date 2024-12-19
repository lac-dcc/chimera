// Seed: 3782797616
macromodule module_0 (
    input wor id_0,
    output tri id_1,
    input wire id_2,
    input tri1 id_3,
    output supply0 id_4,
    output tri0 id_5,
    output tri0 id_6,
    input wand id_7,
    input uwire id_8,
    input wand id_9,
    input tri0 id_10,
    input tri0 id_11,
    input tri0 id_12,
    input wor id_13,
    output wand id_14,
    output tri0 id_15,
    input wire id_16,
    output wor id_17,
    input tri1 id_18,
    input wand id_19,
    output tri0 id_20,
    input wand id_21,
    input tri id_22,
    input wire id_23,
    output uwire id_24,
    output wor id_25,
    input uwire id_26,
    output tri0 id_27,
    input tri id_28,
    output wor id_29,
    output supply1 id_30,
    output uwire id_31,
    input tri1 id_32,
    input wire id_33,
    output supply1 id_34
);
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input uwire id_1,
    input wand id_2,
    input tri1 id_3,
    input supply1 id_4,
    input wand id_5,
    output wor id_6,
    output wor id_7,
    input uwire id_8,
    input supply1 id_9
    , id_14,
    input logic id_10,
    output tri id_11,
    output wor id_12
);
  tri0 id_15;
  id_16 :
  assert property (@(id_10) id_14)
  else begin : LABEL_0
    id_14 <= 1;
  end
  wire id_17;
  id_18(
      .id_0(id_14), .id_1('h0), .id_2(~1), .id_3()
  );
  supply0  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  =  id_15  ,  id_24  ,  id_25  ,  id_26  ,  id_27  =  1 'b0 ,  id_28  ,  id_29  ,  id_30  ,  id_31  ;
  assign id_20 = id_30;
  wire id_32;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_2,
      id_3,
      id_7,
      id_7,
      id_12,
      id_2,
      id_3,
      id_0,
      id_3,
      id_9,
      id_0,
      id_5,
      id_6,
      id_6,
      id_4,
      id_6,
      id_1,
      id_1,
      id_11,
      id_5,
      id_0,
      id_8,
      id_11,
      id_7,
      id_1,
      id_7,
      id_0,
      id_7,
      id_12,
      id_6,
      id_4,
      id_9,
      id_7
  );
  wire id_33;
endmodule
