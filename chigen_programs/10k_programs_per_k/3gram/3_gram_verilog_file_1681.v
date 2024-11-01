// Seed: 2164164716
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    input uwire id_2,
    output tri1 id_3,
    output wor id_4,
    input tri id_5,
    input tri1 id_6,
    input supply0 id_7
);
  wire id_9;
  wire id_10;
  supply1 id_11 = 1;
endmodule
module module_1 (
    output uwire id_0,
    input  tri0  id_1,
    output wor   id_2
);
  module_0(
      id_1, id_2, id_1, id_0, id_2, id_1, id_1, id_1
  );
  tri0 id_4 = id_1 == 1;
  wand id_5;
  assign id_5 = id_4;
endmodule
module module_2 (
    input supply1 id_0,
    output tri0 id_1,
    output tri1 id_2,
    input tri0 id_3,
    input tri0 id_4,
    input wand id_5,
    input wand id_6,
    input tri0 id_7,
    input tri0 id_8,
    input uwire id_9,
    output tri1 id_10,
    output tri0 id_11,
    output wire id_12,
    output tri id_13,
    input tri1 id_14,
    input tri id_15,
    input supply1 id_16,
    input tri id_17,
    output wire id_18,
    output supply0 id_19,
    output uwire id_20,
    input uwire id_21,
    input wire id_22,
    input wand id_23,
    input tri0 id_24,
    input wor id_25,
    output wand id_26,
    input uwire id_27,
    output supply1 id_28,
    output supply0 id_29,
    input wand id_30
);
  id_32 :
  assert property (@(posedge 1) 1)
  else begin
    id_19 = id_32;
  end
  module_0(
      id_4, id_32, id_27, id_29, id_19, id_5, id_14, id_15
  );
endmodule
