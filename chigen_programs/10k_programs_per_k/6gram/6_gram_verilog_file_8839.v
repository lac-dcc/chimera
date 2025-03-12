// Seed: 2318905133
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout logic [7:0] id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3[1] = 'b0 | id_2;
  assign module_1.id_3 = 0;
  wire id_4;
endmodule
module module_1 #(
    parameter id_3 = 32'd49
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  module_0 modCall_1 (
      id_7,
      id_1,
      id_2
  );
  input wire id_6;
  output tri1 id_5;
  input wire id_4;
  input wire _id_3;
  inout logic [7:0] id_2;
  input wire id_1;
  assign id_5 = {1 & id_4, id_7} ? -1'd0 : id_3;
  wire  id_8;
  logic id_9;
  ;
  assign id_2[id_3] = -1;
endmodule
