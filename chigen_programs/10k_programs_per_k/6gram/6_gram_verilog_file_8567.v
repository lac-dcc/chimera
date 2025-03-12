// Seed: 3021475274
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
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_3 = 32'd78,
    parameter id_6 = 32'd53
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_8,
      id_1,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8
  );
  input wire id_7;
  output wire _id_6;
  output wire id_5;
  input wire id_4;
  output wire _id_3;
  input wire id_2;
  output wire id_1;
  struct {
    id_11 id_12;
    struct packed {
      logic id_13;
      logic [id_6 : -1 'b0] id_14;
    } id_15;
  } [id_3 : -1] id_16;
endmodule
