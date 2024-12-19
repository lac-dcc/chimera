// Seed: 3377129406
module module_0 (
    input  tri1  id_0,
    input  wand  id_1,
    output tri1  id_2
    , id_7,
    output tri0  id_3,
    output wand  id_4,
    input  uwire id_5
);
  genvar id_8, id_9;
  always @(posedge id_1 or 1) $display(1, 1);
  assign id_4 = 1'b0;
endmodule
module module_1 (
    input tri1 id_0,
    output tri1 id_1,
    input tri1 id_2,
    input supply1 id_3
    , id_19,
    input supply0 id_4,
    input supply1 id_5,
    output supply0 id_6,
    input tri0 id_7,
    output wor id_8,
    output tri0 id_9,
    input uwire id_10,
    output tri0 id_11,
    input uwire id_12,
    input tri1 id_13,
    output tri0 id_14,
    output supply1 id_15,
    input wor id_16,
    input supply1 id_17
);
  wire id_20;
  nor primCall (
      id_6, id_20, id_2, id_17, id_10, id_7, id_5, id_4, id_3, id_16, id_12, id_0, id_19, id_13
  );
  module_0 modCall_1 (
      id_5,
      id_7,
      id_6,
      id_9,
      id_6,
      id_2
  );
  assign modCall_1.id_1 = 0;
endmodule
