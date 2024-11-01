// Seed: 581265273
module module_0 (
    output uwire id_0,
    input supply1 id_1,
    input tri0 id_2,
    input tri id_3,
    inout wor id_4,
    input tri id_5,
    input supply1 id_6,
    input supply1 id_7,
    output wand id_8,
    output uwire id_9,
    output supply1 id_10
);
  assign id_10 = id_2 ? id_1 : 1;
endmodule
module module_1 (
    output supply1 id_0,
    input tri id_1,
    input wor id_2,
    output supply1 id_3,
    input wand id_4,
    output wor id_5
);
  assign id_0 = id_4;
  assign id_5 = id_2;
  wor id_7;
  assign id_5 = id_2;
  assign id_7 = 1 ? 1'b0 : id_2;
  always @(posedge id_7) $display;
  module_0(
      id_3, id_1, id_7, id_2, id_7, id_2, id_1, id_1, id_0, id_5, id_3
  );
endmodule
