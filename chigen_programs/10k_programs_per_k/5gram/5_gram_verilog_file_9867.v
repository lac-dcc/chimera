// Seed: 307822485
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
  assign module_1.id_4 = 0;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout supply1 id_4;
  inout wire id_3;
  input wand id_2;
  output wire id_1;
  localparam id_11 = 1;
  logic   id_12;
  integer id_13;
  assign id_4 = id_6 - id_2;
  rnmos (id_8, 1, id_1 == id_8);
endmodule
module module_1 #(
    parameter id_4 = 32'd7
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3
  );
  inout wire id_3;
  output logic [7:0] id_2;
  input wire id_1;
  assign id_2[""&id_4-(1)] = id_3;
endmodule
