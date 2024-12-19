// Seed: 175209490
module module_0 (
    output tri0 id_0,
    output tri0 id_1,
    input supply0 id_2,
    input wire id_3,
    output tri1 id_4,
    input uwire id_5
);
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output wand id_0,
    input supply0 id_1,
    input tri0 id_2,
    input wor id_3,
    output logic id_4,
    output tri0 id_5,
    input uwire id_6
);
  always @({{1{1}} {1}} or posedge 1) id_4 <= 1;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_6,
      id_2,
      id_5,
      id_3
  );
endmodule
