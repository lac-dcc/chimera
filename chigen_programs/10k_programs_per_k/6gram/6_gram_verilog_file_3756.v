// Seed: 4014862243
module module_0 (
    input uwire id_0,
    output tri id_1,
    input tri id_2,
    output uwire id_3,
    input wire id_4,
    output supply1 id_5,
    input supply1 id_6,
    output supply0 id_7,
    output tri0 id_8
);
  tri1 id_10;
  assign id_3 = id_10;
endmodule
module module_1 (
    input tri0 id_0,
    input supply1 id_1,
    output wire id_2,
    output tri id_3,
    output tri0 id_4,
    input tri id_5,
    output wor id_6
);
  always @(posedge id_5) #1;
  or (id_2, id_0, id_5, id_1);
  module_0(
      id_0, id_2, id_5, id_2, id_5, id_3, id_1, id_4, id_2
  ); specify
    specparam id_8 = 1;
  endspecify
endmodule
