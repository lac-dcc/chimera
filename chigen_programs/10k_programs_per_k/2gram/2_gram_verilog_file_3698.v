// Seed: 1952152572
module module_0 (
    input wire id_0,
    input tri1 id_1,
    output wire id_2,
    output supply1 id_3,
    input tri id_4,
    output tri id_5,
    input supply0 id_6,
    input supply1 id_7,
    output tri1 id_8,
    input tri id_9,
    output wand id_10,
    input supply0 id_11,
    input wand id_12,
    input wor id_13,
    input wire id_14
);
  wire id_16;
  always_ff
  fork : id_17
    id_8 = id_7;
  join
  id_18 :
  assert property (@(id_1 or id_0) 1)
  else;
  wire id_19;
  assign id_5 = id_17;
  assign id_2 = id_0;
endmodule
module module_1 (
    input  supply1 id_0,
    output supply0 id_1,
    input  supply1 id_2
);
  assign id_1 = id_2;
  module_0(
      id_2, id_2, id_1, id_1, id_2, id_1, id_2, id_2, id_1, id_2, id_1, id_0, id_0, id_2, id_2
  );
  generate
    wire id_4;
    wire id_5;
  endgenerate
endmodule
