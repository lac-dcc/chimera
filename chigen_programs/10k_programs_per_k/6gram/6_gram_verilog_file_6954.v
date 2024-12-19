// Seed: 4208284624
module module_0 (
    input tri0 id_0,
    output supply1 id_1,
    input tri0 id_2,
    input uwire id_3,
    output wire id_4,
    output wand id_5,
    input supply1 module_0,
    input wor id_7,
    input wire id_8,
    input wand id_9,
    inout wand id_10,
    output tri id_11,
    input wand id_12,
    input wand id_13,
    input tri0 id_14,
    input wire id_15,
    output wor id_16
);
  wor id_18;
  assign id_10 = id_3;
  wire id_19;
  assign id_1 = 1;
  wire id_20;
  assign id_1 = id_18;
  assign module_1.type_12 = 0;
  always @(*) id_5 = id_0;
endmodule
module module_1 (
    input tri1 id_0,
    input supply1 id_1,
    output supply1 id_2,
    input tri id_3,
    input uwire id_4,
    input supply1 id_5,
    input supply1 id_6,
    inout supply1 id_7,
    input supply1 id_8,
    input uwire id_9,
    input supply0 id_10,
    output uwire id_11,
    input tri0 id_12,
    input supply1 id_13,
    output tri0 id_14,
    output supply1 id_15,
    input tri id_16,
    input supply0 id_17,
    output wor id_18
);
  wire id_20;
  assign id_18 = id_10;
  wire id_21;
  wire id_22;
  module_0 modCall_1 (
      id_9,
      id_2,
      id_1,
      id_4,
      id_14,
      id_2,
      id_4,
      id_12,
      id_17,
      id_13,
      id_7,
      id_15,
      id_10,
      id_5,
      id_8,
      id_10,
      id_2
  );
  wire id_23;
  and primCall (
      id_2,
      id_10,
      id_4,
      id_1,
      id_7,
      id_13,
      id_5,
      id_12,
      id_0,
      id_21,
      id_9,
      id_20,
      id_6,
      id_3,
      id_8,
      id_16,
      id_17
  );
  wire id_24;
  wire id_25;
  assign id_18 = !id_7;
endmodule
