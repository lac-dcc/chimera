// Seed: 3043846368
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output logic [7:0] id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output logic [7:0] id_1;
  assign id_5[-1==-1] = 1;
  assign id_1[-1'b0]  = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output logic [7:0] id_4;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_2,
      id_4
  );
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_4[1] = id_2;
endmodule
