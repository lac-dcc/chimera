// Seed: 266955723
module module_0 (
    output supply1 id_0,
    input tri1 id_1,
    input uwire id_2,
    input tri id_3,
    output supply1 id_4,
    input tri1 id_5,
    input supply0 id_6,
    input wor id_7,
    input wand id_8,
    output supply1 id_9
);
  assign id_4 = -1;
endmodule
module module_1 (
    input tri1 id_0,
    output wire id_1,
    input tri id_2,
    output tri0 id_3,
    input tri0 id_4,
    input wand id_5,
    output wand id_6,
    input wand id_7,
    output wire id_8,
    output logic id_9,
    input wand id_10,
    input supply0 id_11,
    input wor id_12
);
  id_14 :
  assert property (@(posedge ~id_4 * id_5) -1)
  else id_9 <= -1;
  wire id_15;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_4,
      id_4,
      id_1,
      id_4,
      id_7,
      id_4,
      id_4,
      id_6
  );
  assign modCall_1.id_4 = 0;
endmodule
