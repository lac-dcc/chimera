// Seed: 3518584422
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  assign module_1.id_3 = 0;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  logic id_9;
  ;
endmodule
module module_1 #(
    parameter id_3 = 32'd24,
    parameter id_4 = 32'd9
) (
    id_1,
    id_2
);
  output logic [7:0] id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign id_2[1] = ~id_1;
  wire [1 'b0 : 1] _id_3;
  tri1 _id_4 = -1;
  wire [id_4 : {  id_3  }] id_5[1 : -1];
endmodule
