// Seed: 941002001
module module_0 (
    output supply1 id_0,
    input wor id_1,
    output tri0 id_2
);
  wire id_4;
  assign module_1.type_0 = 0;
  parameter real id_5 = 1'b0;
  bufif0 primCall (id_0, id_5, id_1);
  module_2 modCall_1 (id_4);
  assign modCall_1.id_2 = 0;
endmodule
module module_1 (
    input tri id_0,
    input wor id_1
);
  assign id_3 = id_0;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3
  );
endmodule
module module_2 (
    id_1
);
  output wire id_1;
  assign id_1 = 1;
  wor id_2, id_3;
  always @(posedge -1) if (id_3) $display;
endmodule
module module_3 (
    output wor id_0
);
  wire id_2, id_3;
  module_2 modCall_1 (id_3);
  wire id_4, id_5;
  tri1 id_6 = -1;
endmodule
