// Seed: 2946338573
module module_0 (
    input supply1 id_0,
    output wand id_1,
    output tri id_2,
    input wire id_3,
    output wor id_4
);
  wire id_6;
  assign id_4 = 1;
endmodule
module module_1 (
    output supply0 id_0,
    input tri0 id_1,
    output logic id_2,
    output logic id_3,
    input uwire id_4
);
  always @(1 or negedge (id_4))
    if (id_4)
      if (1'd0) id_2 <= 1;
      else id_3 <= #1 1;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_0,
      id_4,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule
