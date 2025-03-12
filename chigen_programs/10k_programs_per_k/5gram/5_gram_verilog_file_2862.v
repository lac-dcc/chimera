// Seed: 2077849429
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  assign module_2.id_1 = 0;
  input wire id_1;
  assign module_1.id_1 = 0;
  wire id_3;
endmodule
module module_1 (
    input  wand id_0,
    input  wor  id_1,
    output tri0 id_2,
    output tri0 id_3
);
  wire id_5;
  nor primCall (id_3, id_0, id_5, id_1);
  module_0 modCall_1 (
      id_5,
      id_5
  );
endmodule
module module_2 (
    input supply1 id_0,
    output tri id_1,
    input supply0 id_2,
    input tri id_3
);
  wire id_5;
  localparam id_6 = 1;
  logic [1 : -1 'b0] id_7 = 1;
  reg id_8;
  wire id_9;
  ;
  module_0 modCall_1 (
      id_5,
      id_9
  );
  always_comb @(id_8 or -1) id_8 = -1 - id_9;
endmodule
