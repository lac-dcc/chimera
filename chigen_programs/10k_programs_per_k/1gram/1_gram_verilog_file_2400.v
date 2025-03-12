// Seed: 456855470
module module_0 #(
    parameter id_6 = 32'd67
) (
    id_1["" : 1],
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire _id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output logic [7:0] id_2;
  output logic [7:0] id_1;
  assign id_10.id_5 = id_7;
  assign id_2[id_6] = id_3;
endmodule
program module_1 #(
    parameter id_2 = 32'd95
) (
    id_1,
    _id_2,
    id_3#(
        .id_4(id_5),
        .id_6(1)
    ) [1 : id_2],
    id_7,
    id_8,
    id_9
);
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output logic [7:0] id_3;
  inout wire _id_2;
  inout wire id_1;
  assign id_2 = (id_5);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_7,
      id_1,
      id_8,
      id_2,
      id_7,
      id_8,
      id_4,
      id_4,
      id_1,
      id_9,
      id_7
  );
endprogram
