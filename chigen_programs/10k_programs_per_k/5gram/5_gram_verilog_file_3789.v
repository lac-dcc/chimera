// Seed: 3927123318
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_4 = 32'd68
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  output logic [7:0] id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  or primCall (id_5, id_8, id_12, id_1, id_7, id_2);
  module_0 modCall_1 (
      id_11,
      id_1,
      id_8,
      id_5
  );
  input wire _id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_10 = "" ==? -1 ? 1 : id_2;
  assign id_9[id_4] = id_1;
endmodule
