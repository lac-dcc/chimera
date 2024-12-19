// Seed: 2569036227
module module_0 (
    output uwire id_0,
    input tri1 id_1,
    input wire id_2,
    input wire id_3,
    input wor id_4,
    output tri0 id_5,
    input wire id_6,
    input uwire id_7,
    output uwire id_8,
    input tri0 id_9,
    input tri0 id_10,
    input supply0 id_11,
    output uwire id_12,
    output wand id_13,
    input tri id_14,
    input supply1 id_15 id_21,
    input supply0 id_16,
    output supply1 id_17,
    output supply0 id_18,
    input wand id_19
);
  wire id_22;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    inout supply1 id_1,
    input tri0 id_2,
    output tri1 id_3,
    output tri0 id_4,
    inout tri id_5,
    output tri id_6,
    input uwire id_7,
    output supply0 id_8,
    input supply1 id_9
);
  assign id_5 = 1'b0;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_5,
      id_9,
      id_5,
      id_6,
      id_7,
      id_1,
      id_1,
      id_1,
      id_1,
      id_5,
      id_3,
      id_1,
      id_9,
      id_7,
      id_2,
      id_3,
      id_4,
      id_7
  );
  assign id_6 = {1, id_9, 1, 1, 1};
endmodule
