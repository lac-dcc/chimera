// Seed: 1835112370
module module_0 (
    input supply0 id_0
    , id_14, id_15,
    input wor id_1,
    input wor id_2,
    input supply0 id_3,
    output wire id_4,
    input supply1 id_5,
    output tri id_6,
    output tri1 id_7,
    input tri0 id_8,
    output supply1 id_9,
    input supply1 id_10,
    input supply0 id_11,
    output supply0 id_12
);
  always @(negedge id_3) begin : LABEL_0
    id_14 <= 1;
    assert (1);
  end
endmodule
module module_1 (
    input uwire id_0,
    input wand id_1,
    output tri0 id_2,
    input tri1 id_3,
    output tri1 id_4,
    input wand id_5,
    input tri0 id_6,
    input supply1 id_7,
    output wand id_8,
    output wor id_9,
    output supply0 id_10,
    input uwire id_11,
    input tri0 id_12,
    output wand id_13,
    output supply0 id_14,
    input wire id_15,
    input wand id_16,
    input wand id_17
);
  wire  id_19;
  uwire id_20 = ("") ? id_19 : (1);
  module_0 modCall_1 (
      id_15,
      id_1,
      id_6,
      id_0,
      id_4,
      id_6,
      id_13,
      id_9,
      id_15,
      id_9,
      id_6,
      id_5,
      id_10
  );
  assign modCall_1.type_17 = 0;
  wire id_21, id_22;
  always @(id_16 or id_16) #1;
endmodule
