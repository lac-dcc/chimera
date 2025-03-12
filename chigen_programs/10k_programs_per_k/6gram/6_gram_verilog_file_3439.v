// Seed: 3189304644
module module_0 (
    output supply0 id_0,
    input tri1 id_1,
    output tri id_2,
    input uwire id_3,
    output supply0 id_4,
    output wire id_5,
    input tri0 id_6,
    output tri id_7,
    input wand id_8,
    output wor id_9
);
  logic id_11;
endmodule
module module_1 (
    input wor id_0,
    input wor id_1,
    output supply1 id_2,
    output tri0 id_3,
    output tri1 id_4
);
  assign id_2 = id_0;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_4,
      id_0,
      id_3,
      id_3,
      id_0,
      id_4,
      id_1,
      id_4
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 (
    input supply1 id_0,
    output uwire id_1,
    output tri1 id_2,
    input wire id_3,
    input tri0 id_4
    , id_9, id_10,
    input tri0 id_5,
    output wor id_6,
    output wand id_7
);
  always @(posedge -1 or -1) #1;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_1,
      id_4,
      id_1,
      id_7,
      id_0,
      id_1,
      id_0,
      id_1
  );
  assign modCall_1.id_7 = 0;
endmodule
