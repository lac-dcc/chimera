// Seed: 1950714854
module module_0 (
    output wor   id_0,
    input  uwire id_1,
    input  uwire id_2,
    input  uwire id_3
);
  wire id_5, id_6;
  wire id_7;
  id_8(
      .id_0(id_0), .id_1(1), .id_2(1'b0)
  );
  wor id_9 = 1'b0;
  wire id_10, id_11, id_12, id_13, id_14, id_15, id_16, id_17, id_18, id_19, id_20, id_21, id_22;
endmodule
module module_1 (
    input supply1 id_0,
    output supply0 id_1,
    input supply1 id_2,
    input tri id_3
    , id_7,
    input wor id_4,
    input tri1 id_5
);
  tri id_8 = id_3;
  id_9 :
  assert property (@(posedge id_8) (1 && id_0) & id_8 & id_5)
  else $display;
  module_0 modCall_1 (
      id_8,
      id_9,
      id_4,
      id_9
  );
  assign modCall_1.id_1 = 0;
endmodule
