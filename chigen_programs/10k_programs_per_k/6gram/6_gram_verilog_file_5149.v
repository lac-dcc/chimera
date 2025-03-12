// Seed: 4093959140
module module_0 (
    input wand id_0,
    input tri0 id_1,
    output wand id_2,
    input tri0 id_3,
    output tri0 id_4,
    input supply1 id_5,
    input tri0 id_6,
    output wire id_7
);
  always @((id_3) or posedge id_3) release id_7;
  localparam id_9 = 1;
  assign id_4 = -1;
endmodule
module module_1 (
    input tri id_0,
    output uwire id_1,
    input uwire id_2,
    input supply0 id_3,
    output tri id_4
);
  xnor primCall (id_4, id_0, id_2, id_3);
  assign id_1 = (id_3);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_4,
      id_3,
      id_0,
      id_4
  );
  assign modCall_1.id_4 = 0;
  assign id_4 = -1;
  assign id_1 = id_0 & id_0 & id_3 & id_2;
endmodule
