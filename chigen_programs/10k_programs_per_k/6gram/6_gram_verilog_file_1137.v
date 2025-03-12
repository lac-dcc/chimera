// Seed: 3479084048
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout supply0 id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_4 = id_3 ? 1 : -1;
endmodule
module module_1 #(
    parameter id_1  = 32'd26,
    parameter id_10 = 32'd72
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    _id_10,
    id_11,
    id_12
);
  inout wire id_12;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_12,
      id_12,
      id_6,
      id_6,
      id_12
  );
  output logic [7:0] id_11;
  inout wire _id_10;
  nand primCall (id_12, id_2, id_3, id_9, id_8, id_6);
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire _id_1;
endmodule
