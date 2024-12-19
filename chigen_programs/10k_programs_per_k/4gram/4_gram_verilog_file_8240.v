// Seed: 299052047
module module_0 (
    input supply0 id_0,
    input uwire id_1,
    input tri0 id_2,
    input wire id_3,
    output wire id_4,
    output wire id_5,
    input supply1 id_6,
    input tri1 id_7
    , id_14,
    input tri id_8,
    output wand id_9,
    input tri module_0,
    output tri id_11,
    input supply1 id_12
);
  assign id_5 = id_14;
endmodule
module module_1 (
    input wor id_0,
    input uwire id_1,
    input wor id_2,
    output uwire id_3,
    output uwire id_4,
    output uwire id_5,
    input supply0 id_6,
    input uwire id_7
);
  id_9 :
  assert property (@(posedge id_0) id_6 == 1)
  else $display(id_9++ == 1'b0, (1), 1);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_1,
      id_9,
      id_4,
      id_5,
      id_6,
      id_1,
      id_1,
      id_9,
      id_1,
      id_4,
      id_2
  );
  assign modCall_1.type_1 = 0;
  final $display(1);
  tri id_11, id_12;
  assign id_9 = {id_12, 1, 1, id_6};
endmodule
