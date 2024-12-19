// Seed: 2823635175
module module_0 (
    output tri0 id_0,
    input supply1 id_1,
    input tri0 id_2,
    input tri1 id_3,
    input tri0 id_4,
    input uwire id_5,
    output tri1 id_6,
    input tri0 id_7
);
  always_latch @(id_2, posedge id_5) #1;
  assign module_1.type_1 = 0;
  assign id_0 = 1 ? 1 : 1;
  assign module_2.type_34 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output tri id_1
    , id_3
);
  wire id_4;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0
  );
  wire id_5;
endmodule
module module_2 (
    output wand id_0,
    input tri0 id_1,
    output tri1 id_2,
    output tri1 id_3,
    input supply0 id_4,
    output wand id_5,
    input tri id_6,
    output uwire id_7,
    input wand id_8,
    input wire id_9,
    input wand id_10,
    output tri0 id_11,
    input wand id_12,
    input tri1 id_13,
    output tri1 id_14,
    output tri0 id_15,
    input wor id_16,
    input uwire id_17,
    input uwire id_18,
    output wire id_19,
    input uwire id_20
);
  wire id_22;
  assign id_3 = 1;
  wire id_23;
  module_0 modCall_1 (
      id_0,
      id_10,
      id_13,
      id_10,
      id_4,
      id_12,
      id_14,
      id_17
  );
  assign id_11 = id_13;
  xnor primCall (
      id_19,
      id_17,
      id_20,
      id_6,
      id_1,
      id_4,
      id_18,
      id_23,
      id_10,
      id_12,
      id_13,
      id_22,
      id_16,
      id_9,
      id_8
  );
  id_24(
      .id_0((id_11)), .id_1(id_22), .id_2(id_15), .id_3("")
  );
  wire id_25;
endmodule
