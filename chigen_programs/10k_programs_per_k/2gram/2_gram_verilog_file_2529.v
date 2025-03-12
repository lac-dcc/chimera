// Seed: 2411682249
module module_0 (
    input supply1 id_0,
    output supply0 id_1,
    output tri0 id_2,
    output tri0 id_3,
    output tri id_4,
    input tri1 id_5,
    output tri0 id_6,
    output supply1 id_7,
    input wor id_8
    , id_11,
    output tri1 id_9
);
  id_12 :
  assert property (@(posedge id_0) id_11 - id_0)
  else;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input wand id_0,
    output supply0 id_1,
    input wire id_2
);
  assign id_1 = id_2 && id_0;
  not primCall (id_1, id_0);
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_2,
      id_1
  );
endmodule
