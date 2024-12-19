// Seed: 3761721993
module module_0 (
    input tri1 id_0,
    output uwire id_1,
    input wand id_2,
    output tri1 id_3,
    output uwire id_4,
    output supply1 id_5,
    input tri0 id_6,
    output supply1 id_7,
    input wand id_8,
    input tri id_9,
    input wor id_10,
    output wand id_11,
    input tri0 id_12
);
  assign id_5 = id_2;
  id_14 :
  assert property (@(id_9) 1)
  else;
  always if (id_0) #1;
  assign module_1.id_0 = 0;
  id_15 :
  assert property (@(posedge 1) id_2 + 1'b0)
  else;
  tri id_16 = id_6;
endmodule
module module_1 (
    input tri1 id_0
);
  wor id_2 = 1;
  assign id_2 = id_0;
  tri0 id_3;
  assign id_3 = 1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0
  );
endmodule
