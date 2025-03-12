// Seed: 2340212098
module module_0;
  parameter id_1 = -1;
endmodule
module module_1 (
    output supply1 id_0,
    input supply1 id_1,
    output logic id_2,
    output wire id_3,
    input tri0 id_4
);
  always @(id_1 or posedge id_1) id_2 <= id_4 && id_1;
  module_0 modCall_1 ();
endmodule
module module_2 #(
    parameter id_2 = 32'd27
) (
    id_1,
    _id_2,
    id_3,
    id_4
);
  output wire id_4;
  input logic [7:0] id_3;
  input wire _id_2;
  output wire id_1;
  logic id_5;
  module_0 modCall_1 ();
  assign id_5 = id_3[id_2+id_2];
endmodule
