// Seed: 1883019952
module module_0 (
    output wor id_0,
    input uwire id_1,
    input tri0 id_2,
    input tri id_3,
    output uwire id_4,
    input tri1 id_5,
    input supply0 id_6,
    input wire id_7,
    output tri id_8
    , id_15,
    input wand id_9
    , id_16,
    input supply1 id_10,
    input tri1 id_11,
    input tri id_12,
    input wire id_13
);
  localparam id_17 = 1;
endmodule
module module_1 (
    output tri1 id_0,
    input supply1 id_1,
    output tri id_2,
    input supply0 id_3
);
  assign id_0 = id_3;
  assign id_2 = 1'b0;
  or primCall (id_0, id_7, id_5, id_1, id_3, id_6);
  wire id_5, id_6, id_7;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_3,
      id_3,
      id_2,
      id_3,
      id_1,
      id_1,
      id_2,
      id_1,
      id_3,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_4 = 0;
endmodule
