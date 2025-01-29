// Seed: 203176828
module module_0 (
    input supply1 id_0,
    output supply1 id_1,
    input tri0 id_2,
    inout wand id_3,
    output wire id_4,
    id_13,
    input uwire id_5,
    input wor id_6,
    output supply1 id_7,
    input tri id_8,
    output tri id_9,
    input uwire id_10,
    input wire id_11
);
  assign id_9 = {1'b0, -1, id_8, -1'b0, id_8} * 1'h0;
  assign {~"", id_6, id_3, id_13, -1, -1} = -1 + id_8;
endmodule
program module_1 (
    output tri1 id_0,
    inout tri1 id_1,
    input tri id_2,
    input tri id_3,
    input tri0 id_4,
    input uwire id_5,
    input supply1 id_6,
    output wor id_7
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_5,
      id_1,
      id_0,
      id_4,
      id_5,
      id_0,
      id_3,
      id_0,
      id_3,
      id_5
  );
  assign modCall_1.type_19 = 0;
endmodule
