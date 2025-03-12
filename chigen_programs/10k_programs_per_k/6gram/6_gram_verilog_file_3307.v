// Seed: 2615954456
module module_0 (
    output supply1 id_0,
    input tri1 id_1,
    input tri1 id_2,
    input tri0 id_3,
    input wire id_4,
    input supply0 id_5,
    output tri id_6,
    input tri0 id_7,
    input wand id_8,
    input wand id_9,
    output wire id_10,
    input tri id_11,
    input tri id_12,
    input tri1 id_13,
    input wand id_14,
    input supply0 id_15,
    output supply0 id_16,
    input wire id_17,
    output wand id_18,
    input wand id_19,
    input supply1 id_20
);
  always @(posedge id_20#(.id_20((1 & ~1))
  ))
  begin : LABEL_0
    assign id_18.id_13 = -1 - -1;
  end
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input  tri0  id_0,
    input  uwire id_1,
    input  wor   id_2,
    input  uwire id_3,
    output wire  id_4,
    input  wand  id_5,
    output tri1  id_6
);
  wire id_8;
  or primCall (id_4, id_0, id_8, id_5, id_2, id_1, id_3);
  module_0 modCall_1 (
      id_6,
      id_5,
      id_5,
      id_0,
      id_3,
      id_1,
      id_6,
      id_5,
      id_3,
      id_3,
      id_4,
      id_5,
      id_5,
      id_3,
      id_2,
      id_2,
      id_6,
      id_3,
      id_6,
      id_3,
      id_0
  );
endmodule
