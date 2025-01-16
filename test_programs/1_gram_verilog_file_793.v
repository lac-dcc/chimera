// Seed: 1879258785
module module_0 (
    output wand id_0,
    output tri id_1,
    input supply1 id_2,
    input uwire id_3,
    input tri1 id_4,
    input supply1 id_5,
    input wand id_6,
    input wor id_7,
    input wand id_8
);
  always_ff id_1 = {1'h0 - id_4 ? -1 : 1'b0 - id_2 && 1{-1}};
  tri0 id_10 = id_6;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input wor id_1,
    inout tri0 id_2,
    input supply1 id_3,
    output wor id_4
);
  wire id_6 = ~id_3;
  wire id_7, id_8;
  assign id_6 = id_8;
  wire id_9;
  wire id_10 = -1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1
  );
endmodule
