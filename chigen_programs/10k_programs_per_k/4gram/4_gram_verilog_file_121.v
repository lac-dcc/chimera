// Seed: 2624913563
module module_0 (
    output wire id_0,
    input tri0 id_1,
    output tri1 id_2,
    input wand id_3,
    input supply1 id_4,
    input supply0 id_5,
    input tri1 id_6,
    input wor id_7,
    output tri1 id_8,
    input tri0 id_9,
    input wor id_10,
    output supply0 id_11
);
  assign id_11 = -1'b0;
  wire id_13;
  ;
  wire id_14;
  assign module_1.id_4 = 0;
  parameter id_15 = -1;
endmodule
module module_1 #(
    parameter id_11 = 32'd33,
    parameter id_9  = 32'd75
) (
    output tri0 id_0,
    input supply1 id_1,
    output wor id_2,
    output uwire id_3,
    output wor id_4,
    output uwire id_5,
    input wand id_6
    , _id_11,
    input uwire id_7,
    output wor id_8,
    input uwire _id_9
    , id_12
);
  wire [(  id_11  ) : -1 'd0] id_13;
  and primCall (id_5, id_7, id_14, id_6, id_13);
  logic [7:0][id_11  &  -1  &  -1 : id_9  -  1] id_14;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_8,
      id_7,
      id_1,
      id_6,
      id_7,
      id_6,
      id_5,
      id_7,
      id_1,
      id_5
  );
  assign id_5 = id_14[-1] ? id_6 : id_11;
endmodule
