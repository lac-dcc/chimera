// Seed: 52897268
module module_0;
  tri0 id_1 = 1;
endmodule
module module_1 (
    input  tri1 id_0,
    input  wire id_1,
    output tri0 id_2,
    input  wire id_3,
    input  tri  id_4
);
  wire id_6;
  wire id_7;
  module_0 modCall_1 ();
  assign modCall_1.type_2 = 0;
  id_8 :
  assert property (@(id_3) 1) begin : LABEL_0
    @(*) $display(1, 1);
  end
  wire id_9;
endmodule
module module_2 ();
  always begin : LABEL_0
    if (id_1 - 1) id_1 = id_1;
  end
  always begin : LABEL_0
    id_2 = 1;
    id_2 = 1;
    @(id_2 or 1) id_2 = id_2;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  id_3(
      .id_0(id_4)
  );
endmodule
