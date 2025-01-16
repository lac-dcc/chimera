// Seed: 1673747349
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    output tri0 id_2,
    output wor id_3,
    input supply0 id_4,
    input tri id_5,
    output tri id_6,
    input wire id_7,
    input wire id_8,
    input uwire id_9,
    input supply0 id_10,
    input wand id_11,
    input tri0 id_12,
    output wor id_13,
    output wire id_14,
    output supply0 id_15,
    inout tri0 id_16,
    input uwire id_17,
    output tri1 id_18,
    output tri1 id_19,
    input supply1 id_20,
    input wor id_21
);
  id_23(
      .id_0(id_9), .id_1(id_9), .id_2((1))
  ); id_24(
      id_19 ? -1 : -1
  );
  assign module_1.type_12 = 0;
  wire id_25;
  wire id_26;
  wire id_27;
endmodule
program module_1 (
    input wire id_0,
    output wire id_1#(.id_8(-1)),
    input tri0 id_2,
    input supply0 id_3,
    output tri1 id_4,
    inout wand id_5,
    input wor id_6
);
  wire id_9;
  assign id_5 = 1'b0;
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_1,
      id_5,
      id_5,
      id_1,
      id_5,
      id_0,
      id_2,
      id_3,
      id_2,
      id_2,
      id_1,
      id_4,
      id_5,
      id_5,
      id_2,
      id_5,
      id_1,
      id_6,
      id_0
  );
endmodule
