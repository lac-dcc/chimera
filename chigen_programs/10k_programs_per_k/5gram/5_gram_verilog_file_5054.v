// Seed: 3883313158
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  bit id_11;
  ;
  always @(-1 or posedge 1) id_11 = id_5;
  wire id_12;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output logic [7:0] id_4;
  inout wire id_3;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_5,
      id_5,
      id_1,
      id_3,
      id_1,
      id_5,
      id_2,
      id_5
  );
  output wire id_2;
  inout wire id_1;
  assign id_4[1] = -1;
endmodule
