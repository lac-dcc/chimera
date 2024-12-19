// Seed: 212197113
module module_0 (
    input wand id_0,
    input supply1 id_1,
    output wand id_2,
    input tri id_3,
    input tri1 id_4,
    input wor id_5,
    input tri id_6,
    input supply1 id_7,
    input wire id_8,
    output wand id_9
);
  assign id_9 = 1;
endmodule
module module_1 (
    input wire id_0,
    output wor id_1,
    input supply0 id_2,
    output wand id_3,
    input tri id_4,
    output uwire id_5,
    input uwire id_6,
    input wor id_7,
    input supply1 id_8,
    output wand id_9
);
  assign id_9 = id_4;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_7,
      id_6,
      id_6,
      id_7,
      id_2,
      id_2,
      id_1
  );
  assign modCall_1.id_6 = 0;
  always @(1 or posedge 1) begin : LABEL_0
    wait (1);
  end
endmodule
