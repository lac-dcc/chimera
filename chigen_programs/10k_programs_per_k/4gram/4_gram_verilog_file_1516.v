// Seed: 1178770015
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  always @(posedge 1'b0) id_6 += ~id_1;
  logic [1 'b0 : {  1  ,  1  ,  1  }] id_7 = id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_2,
      id_2,
      id_2
  );
  output wire id_1;
endmodule
