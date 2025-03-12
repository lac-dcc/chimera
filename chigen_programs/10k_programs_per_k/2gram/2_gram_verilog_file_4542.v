// Seed: 1164719287
module module_0 (
    output wor id_0,
    input tri1 id_1,
    output supply0 id_2,
    input supply0 id_3,
    input tri0 id_4,
    input supply0 id_5,
    input wor id_6,
    input uwire id_7
);
  wire id_9;
endmodule
module module_1 (
    inout tri0 id_0,
    input wand id_1,
    input wor id_2,
    input supply1 id_3,
    output tri1 id_4,
    input tri0 id_5
);
  logic [-1 'b0 : 1 'b0] id_7 = id_2;
  xor primCall (id_0, id_5, id_3, id_2, id_7);
  module_0 modCall_1 (
      id_0,
      id_5,
      id_4,
      id_2,
      id_5,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.id_6 = 0;
endmodule
