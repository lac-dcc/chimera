// Seed: 3902170302
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  parameter id_7 = (-1'b0) * -1'b0;
endmodule
module module_1 #(
    parameter id_18 = 32'd21,
    parameter id_20 = 32'd19,
    parameter id_7  = 32'd84
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    _id_18,
    id_19,
    _id_20,
    id_21,
    id_22
);
  output wire id_22;
  output wire id_21;
  output wire _id_20;
  output wire id_19;
  input wire _id_18;
  inout wire id_17;
  inout wire id_16;
  inout wire id_15;
  output logic [7:0] id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire _id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_6 = id_3;
  always force id_16 = id_3;
  assign id_12 = id_4;
  logic [id_18  &  id_20  |  1 'b0 : id_7] id_23;
  ;
  module_0 modCall_1 (
      id_16,
      id_10,
      id_16,
      id_1,
      id_2,
      id_5
  );
  always @(posedge id_6 == id_15) begin : LABEL_0
    release id_17;
  end
  assign id_14[-1] = 1'b0, id_17 = 1 ? id_11 : id_16;
endmodule
