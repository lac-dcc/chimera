// Seed: 3560530231
module module_0 (
    output supply0 id_0,
    output supply0 id_1,
    output wor id_2,
    input tri id_3,
    input supply1 id_4,
    input tri0 id_5,
    input uwire id_6,
    input supply0 id_7,
    output tri0 id_8
);
  wire id_10;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output tri  id_0,
    input  tri1 id_1,
    output wand id_2,
    output wire id_3,
    output wor  id_4
);
  assign id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_3
  );
endmodule
module module_2 #(
    parameter id_10 = 32'd51,
    parameter id_11 = 32'd32
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wand id_9;
  output wire id_8;
  inout wire id_7;
  output logic [7:0] id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_9 = -1;
  logic _id_10;
  logic _id_11, id_12 = id_11;
  bit id_13, id_14;
  wire [-1 'b0 -  id_10 : id_11] id_15;
  wire id_16;
  always @(id_10) id_14 = "";
  assign id_6[id_10] = 1;
  assign id_7 = id_9;
  assign id_3#(.id_7(-1 == 1)) = id_14;
endmodule
module module_3 #(
    parameter id_12 = 32'd17,
    parameter id_2  = 32'd66
) (
    id_1,
    _id_2,
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
    id_18
);
  output wire id_18;
  output logic [7:0] id_17;
  input wire id_16;
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  input wire _id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  module_2 modCall_1 (
      id_6,
      id_3,
      id_3,
      id_5,
      id_10,
      id_17,
      id_15,
      id_4,
      id_3
  );
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire _id_2;
  output wire id_1;
  wand \id_19 ;
  parameter id_20 = -1;
  logic id_21;
  assign \id_19 = 1'b0;
  always @(posedge -1) begin : LABEL_0
    disable id_22;
  end
  assign id_17[id_12==id_2] = -1 == id_14;
  wire id_23;
endmodule
