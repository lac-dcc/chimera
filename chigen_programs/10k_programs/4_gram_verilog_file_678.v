// Seed: 2034089671
module module_0 (
    input uwire id_0,
    input tri0  id_1
);
endmodule
module module_1 (
    input wand id_0,
    output uwire id_1,
    output supply0 id_2,
    input supply0 id_3,
    input tri1 id_4,
    input tri id_5,
    input wor id_6,
    output tri1 id_7,
    output wire id_8,
    output tri0 id_9,
    input tri id_10,
    output wand id_11,
    input tri0 id_12,
    input uwire id_13,
    output tri0 id_14,
    output wor id_15,
    input tri0 id_16
);
  wire id_18;
  xor (id_2, id_12, id_10, id_0, id_4, id_13, id_18, id_5, id_6, id_3);
  module_0(
      id_4, id_16
  );
  assign id_15 = 1'd0 ? id_10 : id_3 ? 1'b0 : 1;
endmodule
