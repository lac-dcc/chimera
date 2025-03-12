// Seed: 3556224577
module module_0 #(
    parameter id_15 = 32'd78
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_13;
  logic [7:0] id_14;
  wire _id_15;
  logic id_16 = id_14[id_15 :-1];
endmodule
module module_1 #(
    parameter id_3 = 32'd77
) (
    id_1,
    id_2,
    _id_3,
    id_4
);
  inout wire id_4;
  inout wire _id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_1,
      id_1,
      id_4,
      id_1,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_1
  );
  inout wire id_1;
  logic [id_3 : 1 'b0] id_5 = $unsigned(79);
  ;
endmodule
