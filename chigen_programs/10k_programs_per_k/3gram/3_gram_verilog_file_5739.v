// Seed: 1354781184
module module_0 (
    input tri0 id_0,
    output wand id_1,
    output tri0 id_2,
    output tri0 id_3,
    output wor id_4,
    input tri id_5,
    input tri0 id_6,
    input tri1 id_7,
    output tri0 id_8,
    input wor id_9,
    output uwire id_10,
    output wand id_11,
    input tri1 id_12,
    input wire id_13,
    input supply0 id_14,
    output tri0 id_15,
    input supply1 id_16,
    input tri id_17,
    input supply1 id_18,
    input uwire id_19
);
  assign id_1 = 1'b0 ? 1 : 1'h0;
  tri0 id_21 = 1'b0;
endmodule
module module_1 (
    output wand id_0,
    input supply1 id_1,
    input wire id_2
);
  uwire id_4;
  id_5 :
  assert property (@(posedge id_4) id_4)
  else id_4 = 0;
  tri1 id_6 = 1;
  module_0(
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_1,
      id_2,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_2,
      id_2,
      id_1
  );
endmodule
