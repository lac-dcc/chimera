// Seed: 2672183291
module module_0 (
    input  tri1 id_0,
    output tri  id_1
);
  supply1 id_3, id_4, id_5;
  supply0 id_6, id_7;
  id_8(
      id_5, 1
  );
  assign id_7 = 1'b0;
  assign module_1.id_7 = 0;
  wor id_9;
  id_10(
      1
  );
  assign id_3 = id_9;
endmodule
module module_1 (
    input tri1 id_0,
    output wor id_1,
    input tri0 id_2,
    input tri1 id_3,
    output supply1 id_4,
    input tri0 id_5
);
  id_7 :
  assert property (@(posedge 1) id_5) for (id_7 = 1; 1; id_7 = id_2) id_1 = id_2;
  tri0 id_8;
  wire id_9;
  assign id_4 = id_2;
  wire id_10 = id_5;
  assign id_4 = id_3;
  assign id_8 = id_10;
  wire id_11;
  module_0 modCall_1 (
      id_0,
      id_7
  );
endmodule
