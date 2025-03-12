// Seed: 4071038155
module module_0 (
    output uwire id_0,
    input  uwire id_1,
    output wor   id_2
);
  assign id_2 = id_1;
  assign id_0 = -1;
  logic id_4;
  ;
  wire  id_5  ,  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ;
  wire id_21;
  assign module_1.id_8 = 0;
endmodule
module module_1 #(
    parameter id_21 = 32'd90,
    parameter id_23 = 32'd89,
    parameter id_27 = 32'd9
) (
    input supply0 id_0,
    input supply1 id_1,
    output supply1 id_2,
    output wor id_3,
    input tri id_4,
    input tri1 id_5,
    output tri id_6,
    output supply0 id_7,
    input tri1 id_8,
    input supply0 id_9,
    input uwire id_10,
    output uwire id_11,
    output supply0 id_12
    , id_25,
    input supply0 id_13,
    input tri0 id_14,
    output supply1 id_15,
    input supply1 id_16,
    output uwire id_17,
    output wire id_18
    , id_26,
    output supply0 id_19,
    output wire id_20,
    input uwire _id_21,
    input wand id_22,
    input wand _id_23
);
  wire _id_27;
  logic id_28;
  logic [id_27 : id_21] id_29;
  wire id_30 = id_22;
  module_0 modCall_1 (
      id_20,
      id_16,
      id_6
  );
  assign id_25 = -1;
  and primCall (
      id_6, id_1, id_9, id_4, id_13, id_30, id_28, id_26, id_0, id_25, id_8, id_22, id_16, id_5
  );
  parameter id_31 = 1 ? 1 : -1 ? -1 : 1 ? 1 & 1 : 1 ? 1 : 1'b0;
  logic [id_23 : 1] id_32;
  ;
endmodule
