// Seed: 3318452454
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input wand id_2,
    input wire id_3,
    input uwire id_4,
    output wor id_5
);
  logic id_7 = 1;
  wire  id_8;
  assign module_1.id_13 = 0;
  assign id_5 = id_0;
endmodule
module module_1 (
    input supply1 id_0,
    output logic id_1,
    inout wor id_2,
    input wire id_3,
    output wire id_4,
    input wor id_5,
    output uwire id_6,
    input uwire id_7,
    input wand id_8,
    input tri0 id_9,
    output wand id_10,
    input supply1 id_11,
    output tri id_12,
    input tri id_13,
    output supply1 id_14,
    input tri id_15
);
  wire [1 : 1] id_17, id_18;
  wire id_19;
  wire id_20, id_21;
  module_0 modCall_1 (
      id_0,
      id_15,
      id_7,
      id_8,
      id_3,
      id_14
  );
  always_latch @(posedge -1 or posedge id_21) if (1) id_1 <= #(id_20) 1 * 1;
  logic id_22;
  ;
endmodule
