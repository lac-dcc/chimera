// Seed: 3976725242
module module_0 #(
    parameter id_2 = 32'd53,
    parameter id_3 = 32'd69
) (
    id_1
);
  output logic [7:0] id_1;
  logic _id_2;
  wire  _id_3;
  ;
  assign id_1[id_3 : id_2] = id_2;
  wire  id_4;
  logic id_5;
  specify
    $setup(negedge id_6, posedge id_7, id_5);
    (posedge id_8 => (id_9 +: 1)) = (id_6[1] : id_6[-1 :-1] : id_6, id_2);
  endspecify
endmodule
module module_1 #(
    parameter id_13 = 32'd65,
    parameter id_17 = 32'd94,
    parameter id_4  = 32'd99
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10#(
        .id_11(id_12[1'h0 : _id_13]),
        .id_14(-1),
        .id_15(id_16[1'b0 : _id_17])
    ),
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27
);
  inout wire id_20;
  input wire id_19;
  output wire id_18;
  output wire _id_17;
  input logic [7:0] id_16;
  inout wire id_15;
  inout wire id_14;
  output wire _id_13;
  inout logic [7:0] id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire _id_4;
  input logic [7:0] id_3;
  module_0 modCall_1 (id_26);
  inout wire id_2;
  inout wire id_1;
  uwire \id_28 = (-1);
  assign id_24 = id_26['d0] | id_3[id_4];
endmodule
