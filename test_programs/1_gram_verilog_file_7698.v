// Seed: 471264652
module module_0 (
    output supply0 id_0,
    output logic id_1,
    input tri id_2,
    input tri id_3,
    output tri1 id_4,
    input supply0 id_5,
    input supply1 id_6,
    output tri0 id_7,
    output tri0 id_8,
    input supply1 id_9,
    output uwire id_10,
    input supply1 id_11
);
  always id_4 = 1;
  always id_0 = (1);
  wire id_13;
  assign id_0 = 1;
  localparam id_14 = id_3 != id_11;
  wire id_15, id_16;
  assign id_13 = ~1;
  always_latch id_1 <= 1;
endmodule
module module_1 (
    input wor id_0,
    output wor id_1,
    output wand id_2,
    output wand id_3,
    id_15,
    id_16 id_17,
    input uwire id_4,
    output tri0 id_5,
    output logic id_6,
    id_18,
    output wor id_7,
    output tri0 id_8,
    input tri id_9,
    output tri id_10,
    input wor id_11,
    input supply0 id_12,
    input wire id_13
);
  always_latch id_6 <= ~id_11;
  wire id_19;
  tran (-1'h0, id_6, -1);
  wire id_20;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_11,
      id_4,
      id_1,
      id_9,
      id_13,
      id_8,
      id_8,
      id_9,
      id_5,
      id_0
  );
  assign modCall_1.type_0 = 0;
  bit \id_21 , id_22, id_23;
  assign id_3 = id_12;
  reg id_24, id_25;
  assign id_22 = id_15;
  id_26 :
  assert property (@* -1) id_25 <= id_22;
endmodule
