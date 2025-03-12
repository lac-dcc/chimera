// Seed: 30822278
module module_0 (
    id_1,
    id_2,
    id_3#(
        .id_4(id_2++),
        .id_5(1),
        .id_6(-1),
        .id_7({1, -1})
    ),
    id_8
);
  inout wire id_4;
  input wire id_3;
  output tri0 id_2;
  input wire id_1;
  assign id_6 = -1;
  wire id_9;
endmodule
module module_1 #(
    parameter id_3 = 32'd6,
    parameter id_7 = 32'd60,
    parameter id_8 = 32'd49
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    _id_8,
    id_9
);
  input wire id_9;
  input wire _id_8;
  inout wire _id_7;
  output logic [7:0] id_6;
  output wire id_5;
  output uwire id_4;
  input wire _id_3;
  output wire id_2;
  input wire id_1;
  assign id_4 = id_1 - id_7;
  wire [id_8  &  id_7 : id_7] id_10;
  assign id_6 = id_7;
  assign id_6[id_3] = id_8;
  module_0 modCall_1 (
      id_1,
      id_10,
      id_9,
      id_10
  );
endmodule
