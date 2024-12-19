// Seed: 3127259615
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    output tri id_2,
    input tri0 id_3,
    output supply1 id_4,
    output tri0 id_5,
    input wor id_6,
    input tri0 id_7,
    output wand id_8,
    input uwire id_9,
    input supply1 id_10,
    input tri id_11,
    input supply1 id_12,
    input tri id_13,
    input supply0 id_14,
    output uwire id_15,
    output wor id_16
    , id_23,
    input tri1 id_17,
    output supply0 id_18,
    input tri0 id_19,
    input wand id_20,
    input wire id_21
);
  wire id_24 = id_12;
  wire id_25;
  assign id_5 = 1;
  tri0 id_26;
  wire id_27;
  assign id_18 = 1;
  assign id_8  = id_13;
  logic [7:0] id_28;
  assign id_23 = 1'b0;
  assign id_28[1] = ~(1'b0);
  wire id_29;
  assign id_26 = 1;
endmodule
module module_1 (
    input tri id_0,
    output tri id_1,
    output supply1 id_2,
    input supply0 id_3
);
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_1,
      id_3,
      id_2,
      id_1,
      id_3,
      id_3,
      id_2,
      id_0,
      id_0,
      id_0,
      id_3,
      id_3,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0,
      id_3,
      id_3
  );
endmodule
