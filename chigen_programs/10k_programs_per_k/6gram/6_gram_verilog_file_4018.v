// Seed: 1213182322
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = id_5;
  wire id_7;
  ;
  wire id_8, id_9;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_3,
      id_3,
      id_3
  );
endmodule
module module_2 #(
    parameter id_5 = 32'd38
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  input wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout logic [7:0] id_7;
  inout wire id_6;
  output wire _id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  module_0 modCall_1 (
      id_11,
      id_6,
      id_4,
      id_10,
      id_4,
      id_6
  );
  output wire id_1;
  wire id_12;
  assign id_6 = 1;
  struct packed {logic [-1 : ""] id_13;} [id_5 : -1] id_14;
  assign id_7[-1 : 1] = (id_6) - -1;
endmodule
