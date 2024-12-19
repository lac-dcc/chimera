// Seed: 3893754505
module module_0 (
    input tri0 id_0,
    input wand id_1
);
  assign id_3 = 1;
  module_2 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    output wand id_2,
    output supply1 id_3,
    output supply1 id_4
);
  if (1) assign id_3 = 1;
  module_0 modCall_1 (
      id_0,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    input tri0 id_0,
    input tri  id_1,
    input tri  id_2,
    input wor  id_3,
    input wand id_4
);
  always_latch @(posedge 1) begin : LABEL_0
    id_6 <= 1;
    fork
      id_7();
    join_any
  end
  assign id_8 = 1;
  assign id_8 = id_0 == 1;
  wire id_9;
  wire id_10;
endmodule
