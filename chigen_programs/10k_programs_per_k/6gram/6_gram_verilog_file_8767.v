// Seed: 561060568
module module_0 (
    input tri id_0,
    input tri id_1,
    output supply0 id_2,
    input wire id_3,
    input wire id_4,
    output tri1 id_5,
    output supply1 id_6,
    input tri1 id_7,
    output supply1 id_8,
    output uwire id_9,
    input uwire id_10,
    input uwire id_11
    , id_18,
    input wor id_12,
    output wor id_13,
    input uwire id_14,
    output uwire id_15,
    output tri id_16
);
  logic id_19;
  ;
  assign module_1.id_11 = 0;
endmodule
module module_1 #(
    parameter id_18 = 32'd62
) (
    input supply1 id_0
    , id_14,
    output wor id_1,
    output supply0 id_2,
    output supply0 id_3,
    output wire id_4,
    input supply1 id_5,
    input wor id_6,
    output tri0 id_7,
    input uwire id_8,
    output logic id_9,
    input wand id_10,
    output tri1 id_11
    , id_15,
    output supply0 id_12
);
  wire id_16;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_2,
      id_5,
      id_5,
      id_3,
      id_11,
      id_5,
      id_12,
      id_11,
      id_8,
      id_8,
      id_6,
      id_11,
      id_10,
      id_11,
      id_12
  );
  parameter id_17 = -1;
  wire _id_18;
  always @(~id_15 or posedge id_5 or id_17[(1) : id_18]) if (id_17) id_9 <= -1;
endmodule
