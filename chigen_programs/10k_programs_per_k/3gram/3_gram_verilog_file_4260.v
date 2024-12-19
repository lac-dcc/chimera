// Seed: 3004814632
module module_0 (
    input wor  id_0,
    input tri0 id_1
);
  assign id_3 = 1'd0;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    input  wire  id_1,
    input  wand  id_2,
    input  tri   id_3,
    input  uwire id_4,
    output uwire id_5,
    output uwire id_6,
    output wand  id_7
);
  id_9(
      .id_0(id_0), .id_1(id_4), .id_2(1), .id_3(1), .id_4(1)
  );
  assign id_9 = !1;
  nor primCall (id_5, id_0, id_4);
  module_0 modCall_1 (
      id_3,
      id_1
  );
endmodule
