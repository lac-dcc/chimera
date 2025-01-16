// Seed: 917921440
module module_0 (
    input wor id_0,
    input uwire id_1,
    output wor id_2,
    output wor id_3,
    input tri1 id_4,
    input supply1 id_5
);
  supply1 id_7 = id_0;
  wire id_8;
  assign module_1.id_1 = 0;
  id_9(
      .id_0(1), .id_1(-1), .id_2(1 - (id_7))
  );
  supply1 id_10;
  id_11 :
  assert property (@(posedge -1 or 1) -1) id_3 = id_0 - id_10;
endprogram
module module_1 (
    input tri1 id_0,
    output supply0 id_1,
    input supply0 id_2,
    output supply1 id_3,
    output uwire id_4,
    input tri0 id_5
);
  wire id_7;
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_4,
      id_1,
      id_0,
      id_5
  );
endmodule
