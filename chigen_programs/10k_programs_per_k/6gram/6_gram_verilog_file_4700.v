// Seed: 3101471567
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output logic [7:0] id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_7[1] = id_1 ? -1'b0 : id_3#(
      .id_1(1),
      .id_6(-1)
  );
endmodule
module module_1 #(
    parameter id_3 = 32'd48
) (
    id_1,
    id_2,
    _id_3,
    id_4
);
  input wire id_4;
  input wire _id_3;
  output logic [7:0] id_2;
  inout wire id_1;
  logic [1 : id_3] id_5;
  ;
  initial assume (id_3);
  module_0 modCall_1 (
      id_5,
      id_1,
      id_5,
      id_5,
      id_5,
      id_5,
      id_2
  );
endmodule
