// Seed: 2183188574
module module_0 #(
    parameter id_4 = 32'd32
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5
);
  output wire id_5;
  input wire _id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_5 = id_3;
  wire [-1 : id_4] id_6;
endmodule
module module_1 #(
    parameter id_13 = 32'd98,
    parameter id_16 = 32'd24,
    parameter id_29 = 32'd15,
    parameter id_30 = 32'd70,
    parameter id_33 = 32'd13
) (
    output supply0 id_0,
    output supply0 id_1,
    output logic id_2,
    output supply1 id_3,
    output supply1 id_4,
    input wire id_5,
    output uwire id_6,
    output uwire id_7,
    input tri id_8#(.id_28(-1)),
    input tri id_9,
    input wor id_10,
    input wire id_11,
    output supply1 id_12,
    input wor _id_13,
    input tri0 id_14,
    output uwire id_15,
    input wand _id_16,
    input tri1 id_17,
    output supply0 id_18,
    output tri0 id_19,
    output wire id_20,
    input wire id_21,
    output wire id_22,
    output wire id_23,
    input tri0 id_24,
    input wor id_25,
    output logic id_26
);
  assign id_7 = id_13;
  wire _id_29;
  wire [id_13 : id_29] _id_30;
  wire id_31;
  ;
  logic [1 : -1] id_32;
  ;
  parameter id_33 = -1;
  wire [-1 : id_33] id_34;
  assign id_4 = -1;
  wire [id_30 : id_29] id_35;
  module_0 modCall_1 (
      id_32,
      id_31,
      id_32,
      id_33,
      id_35
  );
  always
    if (-1 ? 1 == id_33 : -1 ? id_33 : (~1))
      @(negedge id_13 - 1) begin : LABEL_0
        logic [id_33  ==  {  -1  *  -1  ,  -1  } : id_16] id_36;
        ;
        id_2 = id_13;
      end
    else assume (id_25 - id_31) id_26 = ("");
endmodule
