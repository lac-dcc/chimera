// Seed: 4282926057
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    output supply1 id_2,
    input uwire id_3,
    output tri0 id_4,
    input tri1 id_5,
    input uwire id_6,
    input wor id_7,
    output wor id_8,
    input tri1 id_9,
    input tri1 id_10,
    input wand id_11,
    output uwire id_12
);
  always id_12 = id_5;
  assign module_1.id_6 = 0;
  id_14(
      id_0, 1, 1'd0
  );
endmodule
module module_1 (
    input tri1 id_0,
    input supply1 id_1,
    input wor id_2,
    output wor id_3,
    output wire id_4,
    output tri id_5,
    input wand id_6,
    output wire id_7,
    input wire id_8,
    input supply0 id_9,
    input uwire id_10,
    input tri id_11
);
  assign id_5 = 1'd0 - 1'b0 + 1;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_4,
      id_8,
      id_5,
      id_11,
      id_11,
      id_9,
      id_5,
      id_0,
      id_0,
      id_1,
      id_5
  );
endmodule
