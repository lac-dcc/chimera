// Seed: 1953265367
module module_0 (
    input  tri  id_0,
    input  wand id_1,
    input  wand id_2,
    input  wand id_3,
    output wand id_4,
    input  wire id_5
);
  assign id_4 = id_3 ? -1'h0 : -1;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    output wand id_1,
    input tri1 id_2,
    output logic id_3,
    input wire id_4,
    input tri1 id_5,
    input wor id_6,
    input tri id_7,
    input tri id_8,
    output wire id_9,
    input wand id_10,
    input wand id_11,
    output tri1 id_12
);
  wire id_14;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_6,
      id_7,
      id_9,
      id_8
  );
  always @(-1 or posedge id_5) id_3 = id_6;
  xor primCall (id_9, id_8, id_11, id_2, id_0, id_14, id_6, id_10, id_7, id_5, id_4);
endmodule
