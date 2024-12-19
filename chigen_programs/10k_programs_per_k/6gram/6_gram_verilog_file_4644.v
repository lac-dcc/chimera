// Seed: 1612181942
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    output uwire id_2,
    input tri1 id_3,
    input wire id_4,
    output tri1 id_5,
    input wire id_6,
    input wand id_7,
    output supply0 id_8
);
endmodule
module module_1 (
    input wire id_0,
    output uwire id_1,
    output tri id_2,
    input supply1 id_3,
    input uwire id_4,
    input tri id_5,
    output logic id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_1,
      id_0,
      id_3,
      id_1,
      id_5,
      id_5,
      id_2
  );
  assign modCall_1.id_3 = 0;
  always @(negedge 1 == 1 * id_5) id_6 <= 1;
endmodule
