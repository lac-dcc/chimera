// Seed: 3475947303
module module_0 (
    output wor id_0,
    input tri1 id_1,
    output tri id_2,
    input supply1 id_3,
    output supply0 id_4,
    input supply1 id_5,
    output wand id_6,
    output supply1 id_7,
    input tri id_8,
    input wand id_9,
    output supply1 id_10,
    input wand id_11,
    output wire id_12
);
  wand id_14 = id_1;
  wire id_15;
  wire id_16;
  wire id_17;
endmodule
module module_1 (
    output uwire id_0,
    output uwire id_1,
    input supply1 id_2,
    input supply1 id_3,
    input supply0 id_4,
    input wire id_5,
    output supply0 id_6,
    input tri id_7,
    output logic id_8,
    input tri id_9
);
  reg id_11;
  assign id_8 = 1;
  wire id_12, id_13;
  always @(posedge id_3) id_8 <= id_11;
  assign id_0 = 1'b0 & 1;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_1,
      id_5,
      id_1,
      id_9,
      id_0,
      id_6,
      id_4,
      id_5,
      id_1,
      id_5,
      id_6
  );
  assign modCall_1.id_9 = 0;
endmodule
