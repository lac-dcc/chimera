// Seed: 4213536263
module module_0 (
    input wand id_0,
    output tri1 id_1,
    input tri1 id_2,
    output tri id_3,
    input wand id_4,
    input uwire id_5,
    input wor id_6,
    output supply0 id_7,
    output tri id_8
);
  always @(id_4 or negedge 1'b0) #1;
endmodule
module module_1 (
    input wand id_0,
    input wor id_1,
    input supply1 id_2,
    input tri0 id_3,
    input uwire id_4,
    output wor id_5
);
  wire id_7;
  assign id_5 = 1;
  xor (id_5, id_7, id_1, id_3, id_4);
  module_0(
      id_3, id_5, id_4, id_5, id_3, id_0, id_1, id_5, id_5
  );
endmodule
