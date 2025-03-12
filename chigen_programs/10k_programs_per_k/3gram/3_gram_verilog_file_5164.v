// Seed: 3567375414
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_3 = id_2;
  assign module_1.id_2 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd86
) (
    id_1,
    _id_2
);
  input wire _id_2;
  output wire id_1;
  wire [id_2 : 1 'b0] id_3;
  wire id_4;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4
  );
  logic id_6 = -1;
  logic [7:0][id_2 : 1] id_7;
  assign id_7[-1 : {1'b0, -1, id_2}] = 1 | id_5;
endmodule
