// Seed: 1615348846
module module_0 (
    input  wand  id_0,
    output tri   id_1,
    input  uwire id_2,
    input  wor   id_3,
    input  wire  id_4,
    input  tri0  id_5
);
  wand id_7 = id_4;
endmodule
module module_1 (
    input wor id_0,
    input supply0 id_1,
    input wand id_2,
    input tri1 id_3,
    input uwire id_4,
    input wor id_5,
    input tri0 id_6,
    inout wor id_7
);
  id_9 :
  assert property (@(posedge id_5 or posedge 1) {1, id_1})
  else;
  module_0(
      id_3, id_9, id_1, id_9, id_5, id_3
  );
endmodule
