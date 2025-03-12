// Seed: 1609667230
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_5 = 32'd50
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output logic [7:0] id_3;
  output wire id_2;
  inout wire id_1;
  wire _id_5;
  wire id_6;
  assign id_3[id_5==-1] = id_1 ? -1 : id_1 - 1'b0;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_6,
      id_4,
      id_1,
      id_6,
      id_1
  );
endmodule
