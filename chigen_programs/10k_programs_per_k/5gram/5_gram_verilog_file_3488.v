// Seed: 4137591815
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_6;
  assign id_5 = id_3;
endmodule
module module_1 #(
    parameter id_2 = 32'd58
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire _id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_4,
      id_5,
      id_1
  );
  struct packed {
    logic id_7;
    logic [id_2 : 1] id_8;
  } id_9;
endmodule
