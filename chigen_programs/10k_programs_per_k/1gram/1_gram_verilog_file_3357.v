// Seed: 1083532587
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
    id_10
);
  input wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign module_1.id_7 = 0;
endmodule
module module_1 #(
    parameter id_15 = 32'd85,
    parameter id_3  = 32'd29,
    parameter id_4  = 32'd43
) (
    output uwire id_0,
    input tri1 id_1,
    input supply1 id_2,
    input wand _id_3,
    input wand _id_4,
    output tri1 id_5,
    input uwire id_6,
    input supply1 id_7,
    output logic id_8,
    output tri0 id_9,
    output tri1 id_10[id_15 : 1],
    input wor id_11,
    output tri id_12,
    inout tri id_13,
    input wor id_14,
    input wand _id_15
);
  wire [id_3  <  id_4 : -1] id_17, id_18;
  wire id_19;
  ;
  assign id_0 = |id_11;
  always begin : LABEL_0
    id_8 = 1;
  end
  logic id_20;
  localparam id_21 = 1;
  wire id_22 = -1 ? id_15 : id_7;
  logic id_23, id_24;
  assign id_20 = (id_4);
  wire  id_25;
  logic id_26;
  wire  id_27;
  ;
  module_0 modCall_1 (
      id_21,
      id_27,
      id_21,
      id_21,
      id_18,
      id_18,
      id_22,
      id_25,
      id_24,
      id_17
  );
endmodule
