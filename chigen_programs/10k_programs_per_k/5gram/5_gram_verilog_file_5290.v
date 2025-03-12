// Seed: 1060523518
module module_0 #(
    parameter id_4 = 32'd72
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  input wire _id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  logic [1 : id_4] id_5;
  assign id_2 = id_3;
endmodule
module module_1 #(
    parameter id_1 = 32'd64,
    parameter id_3 = 32'd42
) (
    _id_1,
    id_2
);
  output logic [7:0] id_2;
  input wire _id_1;
  parameter [id_1 : -1  <<  1] id_3 = -1'b0;
  assign id_2[-1] = 1;
  assign id_2[id_3==-1] = 1;
  wire id_4;
  parameter id_5 = id_3;
  wire [1 'b0 : 1 'b0] id_6;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_3
  );
endmodule
