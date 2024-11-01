// Seed: 549162457
module module_0 (
    inout uwire id_0,
    input uwire id_1,
    output supply1 id_2,
    output supply0 id_3,
    output tri1 id_4,
    output wor id_5,
    input wire id_6,
    output wire id_7
);
  always @(posedge id_6 or posedge 1);
endmodule
module module_1 (
    input tri id_0,
    output wand id_1,
    input wor id_2,
    output tri id_3,
    output supply1 id_4,
    input supply0 id_5,
    input tri1 id_6,
    output tri id_7,
    output wire id_8
);
  tri0 id_10 = id_6 & 1;
  module_0(
      id_10, id_5, id_4, id_8, id_4, id_7, id_6, id_1
  );
  assign id_1 = id_10;
  wire id_11 = id_11;
  wire id_12;
endmodule
