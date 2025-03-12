// Seed: 3675205466
module module_0 (
    input tri1 id_0,
    output tri1 id_1,
    input wand id_2,
    input supply0 id_3,
    output supply0 id_4,
    input supply0 id_5,
    input wor id_6,
    input wire module_0,
    input wor id_8,
    output tri0 id_9
);
  timeprecision 1ps;
  assign module_2.id_1 = 0;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input supply0 id_1,
    output supply0 id_2
);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2
  );
endmodule
module module_2 #(
    parameter id_2 = 32'd52
) (
    input wor id_0,
    input wor id_1,
    output uwire _id_2,
    input supply1 id_3,
    output tri id_4,
    input wand id_5,
    output supply0 id_6,
    input wor id_7
);
  logic [1 : id_2] id_9;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_5,
      id_0,
      id_4,
      id_5,
      id_1,
      id_7,
      id_7,
      id_4
  );
endmodule
