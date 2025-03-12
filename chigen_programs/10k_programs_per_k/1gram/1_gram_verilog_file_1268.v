// Seed: 3075030766
module module_0 (
    id_1,
    id_2,
    id_3[1 :-1'b0]
);
  inout logic [7:0] id_3;
  inout wire id_2;
  assign module_1.id_3 = 0;
  output wire id_1;
  wire id_4;
  wire id_5;
endmodule
module module_1 #(
    parameter id_2 = 32'd71,
    parameter id_3 = 32'd74
) (
    id_1,
    _id_2,
    _id_3,
    id_4
);
  inout wire id_4;
  input wire _id_3;
  input wire _id_2;
  inout logic [7:0] id_1;
  assign id_1 = id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_1
  );
  wire id_5;
  wire id_6;
  wire [id_2 : -1] id_7, id_8;
  always id_1[{id_3}] = 1;
  wire  id_9;
  logic id_10;
endmodule
