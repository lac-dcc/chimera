// Seed: 3453315611
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    output wand id_2,
    input supply1 id_3,
    input wand id_4,
    output wand id_5,
    input supply0 id_6,
    output tri1 id_7,
    input wand id_8,
    input tri id_9,
    output tri0 id_10,
    input wire id_11,
    input wor id_12
);
  assign id_2 = {id_4, id_9 - 1, -1};
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input wire id_1,
    input tri id_2,
    input wor id_3,
    output logic id_4,
    input tri1 id_5,
    output tri0 id_6,
    output wor id_7,
    output wand id_8,
    output tri0 id_9,
    input wand id_10,
    input tri0 id_11,
    input wire id_12,
    output uwire id_13,
    input supply0 id_14,
    output tri0 id_15,
    input tri0 id_16,
    output wand id_17,
    input tri1 id_18,
    input wand id_19
);
  id_21 :
  assert property (@(posedge 1) id_18)
  else;
  parameter id_22 = ~1;
  logic [7:0] id_23;
  ;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_13,
      id_10,
      id_11,
      id_6,
      id_14,
      id_17,
      id_19,
      id_2,
      id_7,
      id_1,
      id_18
  );
  final id_4 = id_0;
  assign id_9  = id_23[1];
  assign id_6  = id_21;
  assign id_17 = -1'b0;
  localparam id_24 = (id_22);
  assign id_13 = -1;
  localparam id_25 = id_24;
endmodule
