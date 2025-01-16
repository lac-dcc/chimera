// Seed: 1279474719
module module_0 (
    input wand id_0
);
  uwire id_2 = 1, id_3;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input  wire  id_1,
    output uwire id_2,
    input  wor   id_3
);
  wire id_5;
  module_0 modCall_1 (id_3);
endmodule
module module_2 (
    output tri0 id_0,
    input uwire id_1,
    input tri0 id_2,
    input tri0 id_3,
    input supply1 id_4,
    input wor id_5,
    output wand id_6,
    output supply1 id_7,
    output tri1 id_8,
    input supply0 id_9,
    output supply0 id_10,
    output supply0 id_11,
    output supply1 id_12,
    output tri id_13,
    input wire id_14,
    output wire id_15
);
  tri1 id_17, id_18;
  tri0 id_19;
  module_0 modCall_1 (id_4);
  assign modCall_1.id_0 = 0;
  always
    if (id_14.id_19)
      if (-1)
        #1 begin : LABEL_0
          id_0 = 1;
        end
      else id_18 = id_9 & 1;
endmodule
