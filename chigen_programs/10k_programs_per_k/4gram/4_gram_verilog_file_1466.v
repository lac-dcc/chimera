// Seed: 3989245192
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  inout logic [7:0] id_2;
  inout wire id_1;
  assign id_1 = id_2[-1];
endmodule
module module_0 #(
    parameter id_11 = 32'd5,
    parameter id_17 = 32'd28,
    parameter id_4  = 32'd27
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
    id_10,
    _id_11,
    id_12,
    id_13,
    id_14,
    module_1,
    id_16,
    _id_17,
    id_18,
    id_19
);
  output wire id_19;
  inout wire id_18;
  input wire _id_17;
  input wire id_16;
  input wire id_15;
  output wire id_14;
  output logic [7:0] id_13;
  input wire id_12;
  input wire _id_11;
  output logic [7:0] id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire _id_4;
  input wire id_3;
  output uwire id_2;
  inout wire id_1;
  assign id_2 = 1;
  assign id_13[-1] = (1);
  logic [7:0] id_20;
  logic [!  id_4 : id_11] \id_21 ;
  ;
  or primCall (id_2, id_3, id_22, id_12, id_18, id_23, id_20, \id_21 , id_8, id_1, id_16);
  assign id_10[id_17 : 1] = id_17;
  wire id_22;
  logic [1 : -1] id_23;
  module_0 modCall_1 (
      \id_21 ,
      id_20,
      id_1,
      id_2
  );
  assign id_2 = -1 * id_20[-1];
  specify
    if (id_11) (posedge id_24 => (id_25 +: -1'b0)) = (id_17, -1);
  endspecify
endmodule
