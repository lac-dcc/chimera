// Seed: 3921915824
module module_0 (
    output tri1 id_0,
    output tri0 id_1,
    output wor  id_2,
    input  tri  id_3
);
  wire id_5, id_6;
endmodule
module module_1 (
    input wire id_0,
    output tri0 id_1,
    input wand id_2,
    input wor id_3,
    input wor id_4,
    input tri0 id_5,
    output tri0 id_6,
    input wor id_7,
    input supply0 id_8,
    input wor id_9,
    id_17,
    output wor id_10,
    input supply0 id_11,
    input tri1 id_12,
    output supply1 id_13,
    input tri0 id_14,
    input tri0 id_15
);
  always
    if (id_9)
      if (1) id_10 = 1;
      else if (1'h0) $display(id_11);
      else @(id_14 or posedge 1, negedge id_17[-1 : 1]) $display(id_7);
  wire id_18;
  wire id_19;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_6,
      id_5
  );
  assign modCall_1.id_3 = 0;
endmodule
