// Seed: 84619173
module module_0 (
    output tri0 id_0,
    output wire id_1,
    output supply1 id_2,
    input supply0 id_3,
    output wand id_4,
    output wire id_5,
    output tri id_6,
    input wire id_7,
    input wand id_8,
    input supply1 id_9,
    input wor id_10,
    output wire id_11,
    input uwire id_12,
    input tri0 id_13,
    output wand id_14,
    input uwire id_15,
    output supply0 id_16,
    input wand id_17,
    output supply0 id_18
);
  always_latch @(posedge id_13) $display(id_12);
  assign id_18 = id_8;
  supply1 id_20 = id_12 ==? 1;
  wire id_21, id_22;
endmodule
module module_1 (
    output supply0 id_0,
    input wor id_1,
    input tri1 id_2,
    input tri0 id_3,
    input tri0 id_4,
    output uwire id_5,
    input supply1 id_6,
    inout tri id_7,
    input supply0 id_8,
    input uwire id_9,
    output supply0 id_10,
    input tri1 id_11,
    input supply0 id_12,
    input wor id_13
);
  assign id_10 = id_3 >= 1;
  module_0 modCall_1 (
      id_7,
      id_10,
      id_5,
      id_9,
      id_5,
      id_0,
      id_10,
      id_13,
      id_4,
      id_2,
      id_12,
      id_0,
      id_4,
      id_13,
      id_0,
      id_4,
      id_5,
      id_3,
      id_5
  );
  assign modCall_1.type_3 = 0;
endmodule
