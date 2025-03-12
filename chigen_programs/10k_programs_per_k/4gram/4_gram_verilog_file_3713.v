// Seed: 1302775673
module module_0 (
    input tri0 id_0,
    output tri1 id_1,
    output uwire id_2,
    input uwire id_3
    , id_9,
    output tri0 id_4,
    input tri1 id_5,
    output supply0 id_6,
    input tri id_7
);
  logic id_10;
  ;
  wire id_11;
  ;
  wire id_12;
  assign id_9 = -1;
  wire [-1 : 1] id_13;
  assign {id_9, 1, -1, id_11, id_0, id_3, id_5, ~id_7} = id_7;
endmodule
module module_1 #(
    parameter id_1 = 32'd59
) (
    input uwire id_0,
    input wor _id_1,
    input wor id_2,
    input uwire id_3,
    input uwire id_4,
    input uwire id_5,
    input uwire id_6,
    output tri id_7,
    input wand id_8,
    input wire id_9,
    output wor id_10,
    input supply0 id_11,
    input supply1 id_12
);
  module_0 modCall_1 (
      id_11,
      id_10,
      id_7,
      id_5,
      id_10,
      id_5,
      id_7,
      id_9
  );
  assign modCall_1.id_0 = 0;
  wire [-1 : (  -1  )  &&  id_1] id_14;
  assign id_10 = id_6 ? id_1 : 1;
endmodule
