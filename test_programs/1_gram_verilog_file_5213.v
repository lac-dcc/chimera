// Seed: 2354934240
module module_0 (
    input tri id_0,
    input wand id_1,
    input wire id_2,
    output uwire id_3,
    input uwire id_4,
    input wor id_5,
    input wor id_6,
    id_16,
    input uwire id_7,
    output wor id_8,
    input supply0 id_9,
    input supply1 id_10,
    output wand id_11,
    output supply1 id_12,
    input supply0 id_13,
    output supply1 id_14
);
endmodule
module module_1 (
    input  supply0 id_0,
    input  supply1 id_1,
    output supply0 id_2,
    input  supply1 id_3,
    output uwire   id_4,
    input  supply0 id_5
);
  tri0 id_7;
  wire id_8;
  assign id_7 = -1'b0;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_2,
      id_3,
      id_1,
      id_5,
      id_5,
      id_4,
      id_3,
      id_0,
      id_4,
      id_2,
      id_3,
      id_2
  );
  assign modCall_1.type_6 = 0;
  always_latch begin : LABEL_0
    @(posedge id_7);
  end
endmodule
