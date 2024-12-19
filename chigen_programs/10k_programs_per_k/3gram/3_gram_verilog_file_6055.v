// Seed: 4284067152
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  tri1 id_4;
  id_5 :
  assert property (@(posedge 1'd0 - {id_5, id_3, 1'h0, id_4}) 1 - id_1)
  else id_5 = id_4;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2
  );
  assign modCall_1.id_1 = 0;
endmodule
macromodule module_2 (
    input supply0 id_0,
    input wand id_1,
    output uwire id_2,
    input tri1 id_3
);
  assign module_3.id_11 = 0;
  wire id_5;
endmodule
module module_3 (
    input wire id_0,
    input wire id_1,
    input wire id_2,
    input tri0 id_3,
    input supply0 id_4,
    output tri1 id_5,
    input wand id_6,
    output uwire id_7,
    input wire id_8,
    input tri0 id_9,
    output wor id_10,
    input tri0 id_11,
    input supply1 id_12,
    input wor id_13,
    output supply1 id_14,
    output wand id_15,
    output wor id_16,
    input wor id_17,
    input tri0 id_18
);
  module_2 modCall_1 (
      id_4,
      id_18,
      id_7,
      id_9
  );
  always_latch @(posedge id_1 or posedge id_1 << id_8) fork join_none
  wire id_20;
endmodule
