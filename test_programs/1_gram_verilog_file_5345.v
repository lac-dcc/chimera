// Seed: 2871817001
module module_0 (
    input tri0 id_0,
    input tri id_1,
    input tri0 id_2,
    input tri0 id_3,
    input tri id_4,
    input uwire id_5,
    input tri id_6,
    input supply1 id_7,
    input tri0 id_8,
    input tri id_9,
    input tri0 id_10,
    input supply0 id_11,
    input logic id_12,
    output uwire id_13,
    input wor id_14,
    input uwire id_15,
    input tri0 id_16,
    input wor id_17,
    input tri id_18,
    output wand id_19,
    id_33,
    output wand id_20,
    input supply0 id_21,
    input wand id_22,
    input uwire id_23,
    input tri id_24,
    output logic id_25,
    input wor id_26,
    input wire void id_27,
    output uwire id_28,
    input wire id_29,
    output tri0 id_30,
    input supply0 id_31
);
  always id_25 <= id_12;
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    input wor id_0,
    input tri1 id_1,
    output supply1 id_2,
    output wand id_3,
    output logic id_4,
    input tri id_5,
    input tri1 id_6,
    input logic id_7,
    input wand id_8,
    input tri1 id_9,
    output supply1 id_10,
    output wand id_11,
    input uwire id_12
);
  final id_4 <= -1;
  wire id_14;
  supply1 id_15, id_16;
  logic id_17;
  assign id_16 = -1;
  wire id_18, id_19;
  assign id_4 = id_17;
  logic [7:0] id_20;
  module_0 modCall_1 (
      id_16,
      id_1,
      id_6,
      id_0,
      id_6,
      id_6,
      id_6,
      id_9,
      id_16,
      id_9,
      id_6,
      id_5,
      id_17,
      id_11,
      id_15,
      id_0,
      id_9,
      id_6,
      id_5,
      id_15,
      id_10,
      id_5,
      id_6,
      id_12,
      id_6,
      id_4,
      id_0,
      id_0,
      id_15,
      id_12,
      id_16,
      id_9
  );
  assign id_18 = 1;
  wire id_21;
  id_22 :
  assert property (@(id_8 ? 1 : 1 or posedge id_7) -1) id_20[1'b0] <= id_22;
  wire id_23;
  wire id_24;
  assign id_2 = 1;
  wire id_25;
endmodule
