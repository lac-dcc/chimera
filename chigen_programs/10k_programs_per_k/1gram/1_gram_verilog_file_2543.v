// Seed: 104643637
module module_0 (
    input supply0 id_0,
    output uwire id_1,
    output wire id_2,
    output wire id_3,
    input supply0 id_4,
    input supply1 id_5,
    input tri0 id_6,
    input wor id_7,
    input wand id_8,
    input tri0 id_9,
    input wor id_10,
    input wire id_11,
    output supply0 id_12,
    output tri1 id_13,
    input uwire id_14,
    input tri1 id_15,
    input wire id_16,
    input tri0 id_17
);
  id_19 :
  assert property (@(posedge id_7 or id_9) 1'b0);
  assign id_12 = id_0;
endmodule
module module_1 (
    output wor id_0
    , id_15,
    input wor id_1,
    input supply1 id_2,
    input supply1 id_3,
    output wire id_4,
    input tri1 id_5,
    input uwire id_6,
    output supply1 id_7,
    output tri0 id_8,
    input wor id_9,
    output tri id_10,
    input supply1 id_11,
    input uwire id_12,
    input wor id_13
);
  module_0(
      id_6,
      id_0,
      id_4,
      id_4,
      id_9,
      id_2,
      id_2,
      id_5,
      id_1,
      id_12,
      id_9,
      id_2,
      id_7,
      id_8,
      id_2,
      id_1,
      id_2,
      id_3
  );
endmodule
