// Seed: 2146188776
module module_0 (
    output tri   id_0,
    output uwire id_1,
    input  tri1  id_2,
    input  tri   id_3,
    output wire  id_4
);
  assign id_0 = id_2;
  assign id_1 = id_3;
  parameter id_6 = 1;
  wire id_7, id_8, id_9;
endmodule
module module_1 (
    output supply1 id_0,
    input supply1 id_1,
    output tri0 id_2,
    input wand id_3,
    input wire id_4,
    output uwire id_5,
    input wor id_6
);
  assign id_5 = id_6 ? id_6 : 1;
  assign id_5 = -1;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_6,
      id_3,
      id_5
  );
endmodule
