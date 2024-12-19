// Seed: 2013252365
module module_0 (
    input supply0 id_0,
    input wire id_1,
    input tri0 id_2,
    input tri id_3,
    input tri1 id_4,
    input uwire id_5,
    input wire id_6,
    output wand id_7,
    input wor id_8,
    input wand id_9,
    input tri0 id_10,
    input supply1 id_11,
    input tri1 id_12
);
  assign id_7 = 1'd0;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output tri0 id_1#(.id_17("")),
    input wand id_2,
    input tri id_3,
    input wand id_4,
    output wire id_5,
    output wand id_6,
    output tri0 id_7,
    input uwire id_8,
    input wire id_9,
    output wand id_10,
    input supply1 id_11,
    input wor id_12,
    input wire id_13,
    input supply1 id_14,
    output wor id_15
);
  id_18 :
  assert property (@(id_3 or posedge 1) 1)
  else;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_18,
      id_2,
      id_2,
      id_13,
      id_4,
      id_10,
      id_11,
      id_18,
      id_2,
      id_4,
      id_14
  );
  wire id_19;
endmodule
