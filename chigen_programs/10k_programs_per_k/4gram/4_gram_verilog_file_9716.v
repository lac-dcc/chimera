// Seed: 3875848680
module module_0 #(
    parameter id_1 = 32'd9
) (
    _id_1
);
  input wire _id_1;
  time [-1 'd0 : id_1] id_2;
endmodule
module module_1 #(
    parameter id_1  = 32'd89,
    parameter id_16 = 32'd9,
    parameter id_19 = 32'd31,
    parameter id_4  = 32'd73
) (
    _id_1,
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
    id_13,
    id_14,
    id_15,
    _id_16,
    id_17
);
  output wire id_17;
  inout wire _id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  inout supply0 id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout uwire id_5;
  input wire _id_4;
  output logic [7:0] id_3;
  inout wire id_2;
  inout wire _id_1;
  wire [id_16  >  id_16 : 1 'b0] id_18;
  assign id_5 = 1;
  parameter id_19 = 1;
  assign id_3 = id_12 ? id_4 : id_6;
  wire id_20;
  assign id_9 = id_8++ & id_19 && id_9 == id_19;
  module_0 modCall_1 (id_19);
  assign modCall_1.id_1 = 0;
  struct packed {
    logic [1 : id_1] id_21;
    logic id_22;
  } [1  >  1  *  id_4 : (  id_19  )] id_23;
  ;
  assign id_3[-1] = id_18;
  logic id_24;
  wire  id_25;
  ;
endmodule
