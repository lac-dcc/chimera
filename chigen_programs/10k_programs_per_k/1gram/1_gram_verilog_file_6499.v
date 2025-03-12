// Seed: 769536925
module module_0 (
    output supply1 id_0,
    input wand id_1,
    output supply1 id_2,
    input wor id_3,
    input wire id_4,
    input wand id_5,
    input tri id_6,
    output uwire id_7,
    input supply0 id_8,
    input supply0 id_9,
    input supply1 id_10,
    input tri id_11,
    input wor id_12
    , id_14
);
  wire id_15[-1 : -1];
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_14 = 32'd91
) (
    input supply0 id_0,
    input tri0 id_1,
    input uwire id_2,
    input wire id_3,
    input wor id_4,
    input supply1 id_5,
    input wor id_6,
    output tri0 id_7,
    input wire id_8,
    input wand id_9,
    input wire id_10,
    input tri0 id_11
);
  wire id_13;
  parameter id_14 = 1;
  nor primCall (id_7, id_5, id_6, id_13, id_10, id_8);
  module_0 modCall_1 (
      id_7,
      id_10,
      id_7,
      id_9,
      id_5,
      id_9,
      id_6,
      id_7,
      id_4,
      id_2,
      id_10,
      id_3,
      id_4
  );
  wire [-1 'd0 : id_14] id_15, id_16;
endmodule
