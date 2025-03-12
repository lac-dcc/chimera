// Seed: 2977000485
module module_0 (
    output uwire id_0,
    input tri id_1,
    input tri id_2
    , id_10,
    input uwire id_3,
    input wire id_4,
    output supply1 id_5,
    input supply1 id_6,
    output supply0 id_7,
    output tri0 id_8
);
  logic id_11;
  ;
  wire id_12;
endmodule
module module_1 (
    output tri id_0,
    input supply0 id_1,
    input wand id_2,
    input wire id_3,
    input wire id_4,
    output tri0 id_5,
    input wire id_6,
    input wire id_7,
    input tri1 id_8,
    input tri0 id_9,
    input wire id_10,
    input supply1 id_11,
    input uwire id_12,
    input wand id_13,
    input tri0 id_14,
    input tri0 id_15,
    input supply1 id_16,
    input wire id_17,
    output tri1 id_18,
    input supply0 id_19,
    input supply1 id_20,
    input supply0 id_21
);
  assign id_0 = id_17;
  wire id_23;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_19,
      id_10,
      id_11,
      id_0,
      id_13,
      id_0,
      id_18
  );
  assign modCall_1.id_7 = 0;
  assign #1 id_5 = id_6;
endmodule
