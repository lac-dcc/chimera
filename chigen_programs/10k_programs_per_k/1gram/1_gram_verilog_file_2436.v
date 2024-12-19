// Seed: 1185105541
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    output uwire id_2,
    input wand id_3
);
  always id_2 = 1'd0;
  tri1 id_5, id_6, id_7;
  assign id_6 = 1;
  assign id_1 = id_7;
  always $display(1'b0 && id_6);
  wire id_8, id_9, id_10, id_11, id_12, id_13;
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    output wire id_2,
    input supply1 id_3,
    output wor id_4,
    input tri0 id_5,
    input supply0 id_6,
    inout supply1 id_7
);
  module_0 modCall_1 (
      id_7,
      id_2,
      id_4,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule
