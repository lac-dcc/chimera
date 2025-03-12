// Seed: 277636820
module module_0 (
    input wand id_0,
    input wor id_1,
    input tri id_2,
    output tri id_3,
    output supply1 id_4,
    input wor id_5,
    input tri id_6,
    input tri0 id_7,
    input wand id_8,
    output wand id_9,
    output uwire id_10,
    output tri id_11
);
  assign module_1.id_6 = 0;
  id_13 :
  assert property (@(posedge 'b0 or posedge 1) 1'b0)
  else;
  wire id_14;
  assign id_4 = id_7;
endmodule
module module_1 (
    input uwire id_0,
    input supply1 id_1,
    input tri0 id_2,
    input wire id_3,
    output logic id_4,
    output tri1 id_5,
    output wire id_6,
    input wire id_7
    , id_11, id_12,
    input wor id_8,
    input wor id_9
);
  always_ff id_4 <= id_0;
  module_0 modCall_1 (
      id_8,
      id_0,
      id_8,
      id_5,
      id_6,
      id_7,
      id_3,
      id_7,
      id_1,
      id_5,
      id_5,
      id_6
  );
endmodule
