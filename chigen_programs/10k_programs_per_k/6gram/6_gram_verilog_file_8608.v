// Seed: 4122203488
module module_0;
  wire id_1;
  assign id_1 = id_1;
  assign module_1.id_33 = 0;
endmodule
module module_1 #(
    parameter id_12 = 32'd14
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
    _id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27,
    id_28
);
  input wire id_28;
  output wire id_27;
  output wire id_26;
  input wire id_25;
  inout wire id_24;
  inout wire id_23;
  inout wire id_22;
  output wire id_21;
  inout wire id_20;
  input wire id_19;
  input wire id_18;
  input wire id_17;
  input wire id_16;
  module_0 modCall_1 ();
  inout wire id_15;
  input wire id_14;
  inout supply1 id_13;
  input wire _id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  inout logic [7:0] id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  reg id_29;
  assign id_13 = -1;
  wire id_30;
  specify
    $setup(negedge id_31, negedge id_32, id_12);
    (id_33 => id_34) = (-1, id_8[id_12]);
    if (id_33 && id_32 && -1) (id_35 => id_36) = (1, 1);
    (id_37 => id_38) = (-1, id_18 & -1  : !(id_15): 1);
    (id_39 => id_40) = (id_34  : -1'h0 : 1'b0, id_32);
  endspecify
  always @(posedge id_40 == id_13) id_29 <= id_36 == 1;
endmodule
