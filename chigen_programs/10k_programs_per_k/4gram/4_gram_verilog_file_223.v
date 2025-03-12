// Seed: 509989280
module module_0 (
    input supply0 id_0,
    input wand id_1,
    input supply1 id_2,
    output supply0 id_3,
    output wor id_4,
    input uwire id_5,
    input uwire id_6,
    output wire id_7,
    input supply1 id_8,
    output wor id_9
    , id_15,
    output tri id_10,
    input supply0 id_11,
    input wand id_12,
    input uwire id_13
);
  assign id_10 = id_15 * id_6;
  logic   id_16;
  integer id_17;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input tri id_0,
    input supply0 id_1,
    input tri id_2,
    output supply1 id_3,
    input wor id_4
);
  always @(id_2 or posedge -1) {1'b0} = id_0;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_4,
      id_3,
      id_3,
      id_1,
      id_0,
      id_3,
      id_1,
      id_3,
      id_3,
      id_1,
      id_4,
      id_0
  );
endmodule
