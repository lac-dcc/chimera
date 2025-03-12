// Seed: 1924426778
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output logic [7:0] id_1;
  assign id_1[-1] = id_4;
endmodule
module module_1 #(
    parameter id_2 = 32'd8,
    parameter id_5 = 32'd53
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    _id_5,
    id_6
);
  output logic [7:0] id_6;
  inout wire _id_5;
  module_0 modCall_1 (
      id_6,
      id_4,
      id_3,
      id_4
  );
  inout wire id_4;
  inout wire id_3;
  input wire _id_2;
  input wire id_1;
  assign id_6[id_5 : id_2] = 1;
endmodule
