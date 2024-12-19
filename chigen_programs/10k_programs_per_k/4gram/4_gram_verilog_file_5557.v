// Seed: 205538196
module module_0 (
    output tri id_0,
    input supply1 id_1,
    input tri id_2,
    input tri1 id_3,
    input tri id_4,
    input wire id_5,
    output uwire id_6,
    input uwire id_7,
    output wor id_8,
    output uwire id_9,
    input wor id_10,
    input tri id_11,
    input tri id_12,
    output supply0 id_13
);
  assign id_0 = 1;
  final begin : LABEL_0
    id_0 = 1;
  end
  id_15 :
  assert property (@(posedge id_11) 1)
  else $display(1 & 1);
endmodule
module module_1 (
    input tri1 id_0,
    input wor id_1,
    output supply0 id_2,
    input supply0 id_3,
    output tri1 id_4
    , id_6
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_1,
      id_0,
      id_3,
      id_4,
      id_3,
      id_2,
      id_2,
      id_3,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.type_6 = 0;
endmodule
