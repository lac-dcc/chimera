// Seed: 1789335338
module module_0 (
    input supply0 id_0,
    output wire id_1,
    output uwire id_2,
    input wor id_3,
    output tri id_4,
    input tri id_5,
    output tri0 id_6
);
  wor id_8;
  assign module_1.id_6 = 0;
  assign id_8 = id_0;
  wire id_9;
endmodule
module module_1 (
    input tri1 id_0,
    input wire id_1,
    input wor id_2,
    output supply0 id_3
);
  supply0 id_5;
  assign id_5 = 1'b0;
  xnor primCall (id_3, id_1, id_5);
  assign id_3 = 1 & id_1 & id_1;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_3,
      id_0,
      id_3,
      id_1,
      id_3
  );
  supply0 id_6 = id_2;
endmodule
