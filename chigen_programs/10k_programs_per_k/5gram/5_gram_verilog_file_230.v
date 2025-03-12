// Seed: 1558736299
module module_0 (
    output supply0 id_0,
    output supply1 id_1,
    input supply1 id_2,
    input wand id_3,
    input supply1 id_4,
    input supply0 id_5,
    output wor id_6,
    input tri id_7
);
  assign id_1 = 1 ? id_4 : 1 ? 1 : id_7;
endmodule
module module_1 (
    input tri0 id_0,
    input wire id_1,
    input uwire id_2,
    output supply0 id_3,
    output wire id_4,
    input uwire id_5,
    input wand id_6,
    input tri1 id_7,
    input uwire id_8,
    output wand id_9,
    input supply1 id_10
);
  wire id_12;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_8,
      id_5,
      id_6,
      id_5,
      id_4,
      id_7
  );
  assign modCall_1.id_7 = 0;
  wire id_13;
  assign #(-1'b0) id_3 = id_10 == -1 ? -1 : -1 ? 1 : 1'b0 == -1;
endmodule
