// Seed: 2294639848
module module_0 (
    input supply0 id_0,
    output uwire id_1,
    input wire id_2,
    input tri0 id_3
);
endmodule
module module_1 (
    input  tri0  id_0,
    input  wand  id_1,
    output logic id_2,
    input  tri0  id_3,
    output tri1  id_4
);
  logic id_6;
  parameter id_7 = -1'b0;
  always @(1'h0) id_2 = -1;
  wire  id_8;
  logic id_9;
  ;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_1,
      id_0
  );
endmodule
module module_2 (
    output uwire id_0,
    input wire id_1,
    output supply1 id_2,
    output tri1 id_3,
    output supply1 id_4
);
  logic id_6;
  ;
  nor primCall (id_2, id_1, id_6, id_7);
  wire [-1 : -1 'b0] id_7;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_1
  );
  assign modCall_1.id_2 = 0;
endmodule
