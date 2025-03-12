// Seed: 1570207075
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  output logic [7:0] id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_5[1] = 1'b0;
endmodule
module module_1 #(
    parameter id_2 = 32'd21
) (
    id_1,
    _id_2,
    id_3
);
  output wire id_3;
  inout wire _id_2;
  output wire id_1;
  wire id_4;
  logic [7:0] id_5;
  ;
  wire id_6 = (id_5[id_2]);
  module_0 modCall_1 (
      id_6,
      id_4,
      id_6,
      id_6,
      id_5,
      id_4,
      id_1
  );
endmodule
