// Seed: 3292110066
module module_0 (
    input uwire id_0,
    input tri1 id_1,
    output wor id_2,
    input wor id_3,
    input tri0 id_4,
    input wor id_5,
    input uwire id_6,
    output uwire id_7,
    input supply0 id_8,
    output wand id_9,
    input tri0 id_10
    , id_12
);
  assign {1, (1), id_6} = 1;
endmodule
module module_1 (
    output tri id_0,
    output tri1 id_1,
    input supply0 id_2,
    input wand id_3,
    output uwire id_4
);
  id_6 :
  assert property (@(posedge 1) id_2)
  else $display(1'b0 << 1);
  id_7(
      .id_0(id_0), .id_1(1), .id_2({id_6{1}}), .id_3(id_6), .id_4(id_2)
  );
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_2,
      id_6,
      id_3,
      id_6,
      id_1,
      id_2,
      id_6,
      id_3
  );
  assign modCall_1.type_17 = 0;
endmodule
