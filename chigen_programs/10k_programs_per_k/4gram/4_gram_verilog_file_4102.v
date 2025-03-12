// Seed: 3304285452
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  logic id_4;
  ;
  wire id_5;
  always @(id_3 or id_3 or posedge 1) id_4 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_4;
  parameter id_5 = -1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5
  );
  assign modCall_1.id_4 = 0;
endmodule
module module_2 (
    input wor id_0,
    output tri1 id_1,
    input wire id_2,
    output tri0 id_3,
    output wire id_4,
    output wire id_5,
    input supply0 id_6,
    output wand id_7,
    input supply0 id_8
);
  case (id_2)
    id_8: assign id_4 = id_0;
    default:
    wire id_10;
  endcase
  nor primCall (id_4, id_10, id_6, id_0, id_8, id_2);
  module_0 modCall_1 (
      id_10,
      id_10,
      id_10
  );
endmodule
