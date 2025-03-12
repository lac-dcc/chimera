// Seed: 2898796391
module module_0 (
    input wand id_0,
    input uwire id_1,
    input tri1 id_2,
    input tri1 id_3,
    input supply0 id_4,
    output uwire id_5
);
  logic id_7 = 1;
  assign id_5 = (id_0);
  assign id_5 = -1;
  wire id_8;
  assign module_1.id_4 = 0;
  assign id_5 = {1, ~id_3};
endmodule
module module_1 (
    output tri id_0,
    input supply0 id_1,
    input wor id_2,
    input tri1 id_3,
    input uwire id_4,
    output logic id_5,
    output supply1 id_6
);
  always @(*) id_5 <= -1 & id_4;
  xor primCall (id_0, id_3, id_2, id_1, id_4);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_2,
      id_3,
      id_0
  );
endmodule
