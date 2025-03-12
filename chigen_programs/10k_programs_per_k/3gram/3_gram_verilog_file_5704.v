// Seed: 3061670435
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_5;
  pmos (id_3, 1, 1, id_3);
  wire id_6;
endmodule
module module_1 #(
    parameter id_1  = 32'd58,
    parameter id_11 = 32'd98,
    parameter id_3  = 32'd36,
    parameter id_5  = 32'd8,
    parameter id_8  = 32'd53,
    parameter id_9  = 32'd48
) (
    _id_1,
    id_2,
    _id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    _id_8
);
  input wire _id_8;
  input wire id_7;
  inout wire id_6;
  input wire _id_5;
  inout wire id_4;
  input wire _id_3;
  inout wire id_2;
  inout wire _id_1;
  wire _id_9;
  wire id_10;
  logic [id_1 : -1] _id_11 = 1;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_4,
      id_6
  );
  wire [id_5 : id_3] id_12;
  wire id_13;
  struct packed {
    struct packed {
      logic [id_11 : id_8] id_14;
      logic id_15;
    } [id_3 : id_8  -  1  ==  id_8  -  1 'b0] id_16;
    logic [!  1 : id_9] id_17;
  } id_18;
endmodule
