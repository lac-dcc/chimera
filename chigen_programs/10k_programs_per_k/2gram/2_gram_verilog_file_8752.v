// Seed: 4292966067
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_8;
endmodule
module module_1 #(
    parameter id_9 = 32'd30
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9
);
  output wire _id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout reg id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  always begin : LABEL_0
    id_5 <= id_1;
  end
  struct packed {
    integer [1 'h0 : -1 'b0] id_10;
    id_11 id_12;
    logic id_13;
    logic id_14;
    logic id_15;
    logic id_16;
    logic id_17;
    logic [1 : (  1  )] id_18;
  } [1 : id_9] id_19 = id_19;
  assign id_8 = id_19.id_10;
  wire  id_20;
  logic id_21;
  ;
  module_0 modCall_1 (
      id_20,
      id_10,
      id_20,
      id_3,
      id_3,
      id_20,
      id_14
  );
  assign id_19 = -1 && -1;
  parameter id_22 = 1;
  wire id_23;
  parameter id_24 = 1'b0;
endmodule
