// Seed: 743568916
module module_0 (
    input tri id_0,
    input uwire id_1,
    input tri0 id_2,
    output supply0 id_3,
    input tri1 id_4,
    input tri0 id_5,
    input uwire id_6,
    input wand id_7,
    output wor id_8,
    input supply1 id_9,
    output tri0 id_10
);
  assign id_3 = 1 ? 1'b0 : (1);
  id_12 :
  assert property (@(negedge id_0) id_0)
  else $display(id_12, 1);
  wire id_13;
  wire id_14;
  wire id_15, id_16;
  wire id_17;
  assign module_1.id_3 = 0;
  uwire id_18 = id_0;
endmodule
module module_1 (
    input supply1 id_0,
    input supply1 id_1,
    output tri0 id_2,
    output wire id_3,
    output supply1 id_4,
    input uwire id_5,
    input uwire id_6
);
  module_0 modCall_1 (
      id_0,
      id_5,
      id_6,
      id_2,
      id_5,
      id_0,
      id_1,
      id_1,
      id_2,
      id_5,
      id_3
  );
endmodule
