// Seed: 2524156699
module module_0 (
    output uwire id_0,
    input wand id_1,
    input tri id_2,
    input wor id_3,
    input supply0 id_4,
    input wor id_5,
    output wand id_6,
    output wor id_7,
    input wand id_8,
    input tri1 id_9
);
  tri1 id_11;
  wire id_12;
  wire id_13;
  assign id_6 = id_11;
  assign module_1.id_4 = 0;
  wire id_14;
  wire id_15;
  wire id_16;
endmodule
module module_1 (
    output supply0 id_0,
    input  supply0 id_1,
    input  supply1 id_2
);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_0,
      id_0,
      id_2,
      id_2
  );
  supply1 id_4;
  assign id_4 = 1 == 1'b0;
  always @(1) begin : LABEL_0
    id_0 += 1 <= 1;
    wait (1);
  end
endmodule
