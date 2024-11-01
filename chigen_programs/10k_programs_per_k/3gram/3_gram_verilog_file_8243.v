// Seed: 284485915
module module_0 (
    output tri0 id_0,
    input tri id_1,
    input tri1 id_2,
    output wor id_3,
    input tri id_4,
    input tri id_5,
    input uwire id_6,
    input tri1 id_7,
    output tri1 id_8,
    input wire id_9,
    input wor id_10,
    input wor id_11,
    input supply0 id_12,
    input wand id_13,
    input wor id_14,
    output tri1 id_15,
    output tri1 id_16
);
  wand id_18 = 1;
endmodule
module module_1 (
    input  wor  id_0,
    output wand id_1,
    input  wire id_2
);
  id_4 :
  assert property (@(posedge id_0) (id_0) + 1)
  else id_4 = id_2 || 1'b0;
  module_0(
      id_4,
      id_2,
      id_4,
      id_4,
      id_2,
      id_4,
      id_2,
      id_4,
      id_4,
      id_0,
      id_0,
      id_0,
      id_4,
      id_4,
      id_0,
      id_1,
      id_4
  );
endmodule
