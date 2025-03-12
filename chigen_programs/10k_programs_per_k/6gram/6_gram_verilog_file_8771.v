// Seed: 2425164060
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
    id_19
);
  input wire id_19;
  inout wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  assign module_1.id_5 = 0;
  input wire id_2;
  output wire id_1;
  logic id_20;
endmodule
module module_1 #(
    parameter id_11 = 32'd64,
    parameter id_16 = 32'd24,
    parameter id_7  = 32'd14
) (
    output logic id_0,
    input wand id_1,
    output wire id_2,
    output supply0 id_3,
    output supply0 id_4,
    input uwire id_5,
    output uwire id_6,
    input tri _id_7,
    input supply1 id_8,
    input tri0 id_9,
    input tri1 id_10,
    output wand _id_11,
    input uwire id_12,
    output wand id_13,
    output tri0 id_14,
    input wire id_15,
    input wor _id_16,
    input uwire id_17,
    output supply1 id_18
);
  wire [id_7 : id_16] id_20;
  logic [1 : id_11] id_21;
  ;
  module_0 modCall_1 (
      id_21,
      id_20,
      id_21,
      id_20,
      id_20,
      id_21,
      id_21,
      id_20,
      id_20,
      id_20,
      id_20,
      id_21,
      id_21,
      id_20,
      id_20,
      id_20,
      id_21,
      id_20,
      id_21
  );
  always @(id_12, id_20) begin : LABEL_0
    id_0 = id_12;
  end
endmodule
