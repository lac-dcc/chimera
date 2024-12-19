// Seed: 1653889368
module module_0 (
    output wand id_0,
    output uwire id_1,
    output wor id_2,
    input tri0 id_3,
    input wand id_4,
    output wire id_5,
    input uwire id_6,
    input supply1 id_7
);
  always @(id_3 or posedge id_7) begin : LABEL_0
    wait (1);
  end
  assign module_1.id_1 = 0;
  supply0 id_9;
  assign id_9 = "" ? id_7 : 1;
  assign id_2 = id_9 & id_7;
endmodule
module module_1 (
    input supply0 id_0,
    input wand id_1,
    input supply1 id_2,
    output wand id_3,
    input wand id_4
);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_4,
      id_0,
      id_3,
      id_0,
      id_4
  );
endmodule
