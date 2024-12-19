// Seed: 1958949455
module module_0 (
    input tri1 id_0,
    input tri0 id_1,
    input tri0 id_2,
    input supply0 id_3,
    output tri id_4,
    output supply0 id_5,
    output tri id_6,
    input tri1 id_7
);
  assign id_6 = id_3;
endmodule
module module_1 (
    output tri id_0,
    output tri1 id_1,
    input wor id_2
    , id_6,
    output tri id_3,
    input supply1 id_4
);
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_4,
      id_2,
      id_3,
      id_0,
      id_1,
      id_4
  );
  supply0 id_8, id_9, id_10;
  wand id_11 = id_4;
  id_12 :
  assert property (@(posedge 1 or posedge id_2) id_12);
  always if (id_2) id_9 = 1;
endmodule
