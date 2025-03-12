// Seed: 463712437
module module_0 (
    input supply0 id_0,
    output wand id_1,
    input tri id_2,
    input uwire id_3,
    output wire id_4,
    input uwire id_5,
    output uwire id_6,
    input tri id_7,
    output uwire id_8,
    input wand id_9,
    output tri1 id_10,
    input wire id_11,
    input uwire module_0,
    output supply0 id_13,
    input tri0 id_14,
    input supply0 id_15,
    output tri1 id_16,
    input wire id_17,
    input uwire id_18,
    output wire id_19
);
  wire id_21;
endmodule
module module_1 (
    input  uwire id_0,
    output wand  id_1
);
  logic [7:0][1 : 1] id_3;
  or primCall (id_1, id_0, id_3);
  assign id_3[-1] = id_0 * -1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_16 = 0;
endmodule
