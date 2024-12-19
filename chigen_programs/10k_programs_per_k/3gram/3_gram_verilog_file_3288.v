// Seed: 3492643088
module module_0 (
    output wor id_0,
    input supply0 id_1,
    input tri0 id_2,
    input tri1 id_3,
    input supply0 id_4,
    input tri1 id_5
);
  assign id_0 = id_4;
  assign module_1.type_7 = 0;
endmodule
module module_1 (
    input wire id_0
    , id_13,
    input supply0 id_1,
    output tri id_2,
    input wor id_3,
    input tri0 id_4,
    output uwire id_5,
    input wand id_6,
    output tri id_7,
    input tri id_8#(.id_14(1)),
    output wor id_9,
    input supply1 id_10
    , id_15,
    output tri0 id_11
);
  assign id_14[1] = id_1;
  nor primCall (id_2, id_0, id_1, id_14, id_13, id_8, id_3, id_6, id_15, id_10);
  module_0 modCall_1 (
      id_5,
      id_6,
      id_4,
      id_4,
      id_4,
      id_4
  );
  specify
    if (({1{1 ? id_3 : 1'b0}}) - 1) (posedge id_16 => (id_17 +: id_1)) = (1  : 1  : id_1, 1);
  endspecify
endmodule
