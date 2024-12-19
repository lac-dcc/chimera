// Seed: 2433904226
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    output supply1 id_2,
    output supply0 id_3,
    output uwire id_4,
    input supply1 id_5,
    output supply1 id_6,
    input supply1 id_7,
    output tri0 id_8,
    input supply1 id_9,
    input tri id_10,
    output supply0 id_11,
    output uwire id_12,
    input tri0 id_13,
    output wand id_14,
    output wire id_15,
    input wire id_16,
    output wand id_17
    , id_23,
    output tri1 id_18,
    input tri id_19,
    input uwire id_20,
    input supply1 id_21
);
  wire id_24;
  wire id_25;
  wire id_26;
  assign id_17 = {id_1{1}};
endmodule
module module_1 (
    input supply0 id_0,
    output uwire id_1,
    input wand id_2,
    output wire id_3,
    output supply0 id_4,
    output tri0 id_5,
    input uwire id_6
);
  assign id_1 = id_2;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_5,
      id_3,
      id_5,
      id_0,
      id_1,
      id_0,
      id_5,
      id_2,
      id_0,
      id_4,
      id_4,
      id_0,
      id_1,
      id_1,
      id_2,
      id_3,
      id_3,
      id_6,
      id_2,
      id_0
  );
  wire id_8 = id_2;
  wire id_9;
  assign id_4 = id_6;
  assign id_4 = ~id_0 & 1'b0;
endmodule
