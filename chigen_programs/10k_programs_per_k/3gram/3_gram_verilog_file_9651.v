// Seed: 1244968692
macromodule module_0 (
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
    id_17
);
  inout wire id_17;
  inout wire id_16;
  assign module_1.id_8 = 0;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_18;
  assign id_4 = id_8;
  wire id_19;
endmodule
module module_1 #(
    parameter id_4 = 32'd36,
    parameter id_6 = 32'd70
) (
    output wire id_0,
    output wand id_1,
    input wand id_2,
    output tri0 id_3,
    input supply1 _id_4,
    input uwire id_5,
    input tri1 _id_6,
    output tri1 id_7,
    output logic id_8,
    output tri0 id_9
);
  supply1 id_11;
  ;
  logic [7:0] id_12;
  genvar id_13;
  parameter id_14 = -1;
  wire id_15;
  logic [id_6 : 1 'b0] id_16;
  if (id_14) assign id_16 = {1'd0 & 1, id_12} | {id_6(id_16++), id_12, 1'h0, 1, 1};
  module_0 modCall_1 (
      id_16,
      id_11,
      id_13,
      id_13,
      id_14,
      id_15,
      id_14,
      id_14,
      id_11,
      id_15,
      id_11,
      id_16,
      id_15,
      id_14,
      id_15,
      id_13,
      id_14
  );
  always @(posedge id_0++or posedge id_11) id_8 = 1;
  assign id_11 = -1'b0;
  parameter id_17 = (id_14);
endmodule
