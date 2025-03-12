// Seed: 1279675821
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  assign module_2.id_4 = 0;
  output wire id_1;
  wire id_4;
  assign id_1 = id_3;
endmodule
module module_1 #(
    parameter id_3 = 32'd21
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6
);
  input logic [7:0] id_6;
  inout wire id_5;
  inout wire id_4;
  output wire _id_3;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_4
  );
  inout wire id_2;
  input wire id_1;
endmodule
module module_2 (
    input supply0 id_0,
    input tri id_1,
    output supply0 id_2,
    input uwire id_3,
    output wand id_4,
    output supply1 id_5
);
  wire id_7;
  assign id_4 = (-1);
  logic id_8;
  ;
  and primCall (id_5, id_7, id_3, id_0, id_1, id_8);
  module_0 modCall_1 (
      id_8,
      id_7,
      id_7
  );
  always @(posedge id_1) force id_2[-1'b0] = 1;
endmodule
