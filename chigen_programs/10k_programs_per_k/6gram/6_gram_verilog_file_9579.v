// Seed: 143770378
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always @(id_2 or id_3) $unsigned(23);
  ;
endmodule
module module_1 #(
    parameter id_15 = 32'd4,
    parameter id_2  = 32'd56,
    parameter id_26 = 32'd81,
    parameter id_27 = 32'd75
) (
    input supply1 id_0,
    input tri id_1,
    input wor _id_2,
    inout tri0 id_3,
    input wire id_4,
    input uwire id_5,
    input uwire id_6,
    input tri0 id_7,
    input wand id_8,
    output uwire id_9,
    input tri0 id_10,
    input supply1 id_11,
    input tri1 id_12,
    output supply1 id_13,
    input tri0 id_14,
    input tri _id_15,
    output logic id_16,
    input tri id_17,
    output logic id_18,
    input supply0 id_19,
    input uwire id_20,
    input tri id_21,
    output tri1 id_22,
    output uwire id_23,
    output tri1 id_24
);
  wire  _id_26;
  wire  _id_27;
  logic id_28;
  ;
  parameter id_29 = 1;
  assign id_28 = -1'd0 != 1 - id_5 + id_21;
  logic [1 : 1] id_30;
  logic id_31;
  reg [id_2 : id_27  *  id_15] id_32;
  logic [id_26 : 1] id_33;
  ;
  module_0 modCall_1 (
      id_33,
      id_33,
      id_30,
      id_31,
      id_30,
      id_28
  );
  bit  id_34;
  wire id_35;
  always @(-1) begin : LABEL_0
    if (1) begin : LABEL_1
      if (id_29) id_16 <= -1;
      else id_34 <= 1;
    end
    id_18 = 1;
    id_32 <= id_0;
  end
endmodule
