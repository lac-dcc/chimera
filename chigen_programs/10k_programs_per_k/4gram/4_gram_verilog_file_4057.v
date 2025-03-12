// Seed: 1213807976
module module_0 (
    output tri0  id_0,
    input  uwire id_1,
    input  uwire id_2,
    output tri0  id_3,
    input  wor   id_4
);
  assign id_0 = -1;
endmodule
module module_1 (
    input tri0 id_0,
    output tri id_1,
    input tri1 id_2,
    input tri1 id_3,
    input tri id_4,
    output tri id_5,
    input uwire id_6,
    input supply1 id_7
);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4,
      id_1,
      id_6
  );
  assign modCall_1.id_0 = 0;
  assign id_5 = 1;
endmodule
module module_2 (
    input tri0 id_0,
    input wire id_1,
    input wor id_2,
    input supply0 id_3,
    inout tri id_4,
    output wand id_5,
    input uwire id_6,
    input wor id_7,
    input wand id_8,
    input uwire id_9,
    input tri1 id_10,
    input uwire id_11,
    input wor id_12,
    input uwire id_13,
    input wand id_14,
    input tri0 id_15
    , id_19,
    input wor id_16,
    output supply1 id_17
);
  wire id_20;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_6,
      id_4,
      id_6
  );
  assign modCall_1.id_1 = 0;
  always @(negedge -1) $signed(28);
  ;
  and primCall (
      id_4,
      id_19,
      id_1,
      id_10,
      id_3,
      id_11,
      id_0,
      id_8,
      id_2,
      id_13,
      id_14,
      id_15,
      id_16,
      id_9,
      id_12,
      id_7,
      id_20
  );
endmodule
