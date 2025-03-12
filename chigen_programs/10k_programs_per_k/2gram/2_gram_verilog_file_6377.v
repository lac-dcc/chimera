// Seed: 1911026691
module module_0 (
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
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20
);
  input wire id_20;
  inout wire id_19;
  output wire id_18;
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_18 = id_17;
  localparam id_21 = -1, id_22 = 1'b0;
endmodule
module module_1 #(
    parameter id_13 = 32'd2,
    parameter id_15 = 32'd13,
    parameter id_7  = 32'd31
) (
    input tri0 id_0,
    input tri0 id_1,
    input tri id_2,
    output tri id_3,
    input uwire id_4,
    input wire id_5,
    input uwire id_6,
    input supply1 _id_7,
    output tri id_8,
    output wire id_9,
    output logic id_10,
    input supply0 id_11,
    input uwire id_12,
    inout wor _id_13,
    input tri0 id_14,
    output wor _id_15
);
  for (genvar id_17 = -1; id_0; id_10 = id_6) begin : LABEL_0
    wire id_18;
    ;
  end
  logic [!  -1 : id_13  /  id_15  - ""] id_19;
  struct packed {
    logic ["" : id_7] id_20;
    integer [-1 : id_15] id_21;
    logic [1 : 1 'b0] id_22;
  } id_23;
  ;
  module_0 modCall_1 (
      id_22,
      id_21,
      id_21,
      id_20,
      id_23,
      id_23,
      id_20,
      id_17,
      id_22,
      id_23,
      id_17,
      id_20,
      id_21,
      id_23,
      id_22,
      id_19,
      id_17,
      id_20,
      id_20,
      id_17
  );
  assign modCall_1.id_22 = 0;
endmodule
