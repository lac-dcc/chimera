// Seed: 3752020186
module module_0 #(
    parameter id_11 = 32'd34
) (
    input wor id_0,
    input supply0 id_1,
    input uwire id_2,
    input wand id_3,
    output tri id_4,
    input wand id_5,
    input tri1 id_6,
    input wor id_7,
    input wand id_8,
    output wor id_9
);
  logic _id_11;
  wire [id_11 : 1] id_12, id_13, id_14, id_15;
  wire id_16 = id_12;
  wire id_17;
  parameter id_18 = $clog2(97);
  ;
  wire [-1 : -1] id_19, id_20, id_21;
  struct packed {
    logic id_22;
    id_23 id_24;
  } id_25;
  ;
  wire [-1 : 1] id_26, id_27, id_28;
endmodule
module module_1 #(
    parameter id_0  = 32'd36,
    parameter id_17 = 32'd60,
    parameter id_2  = 32'd18,
    parameter id_4  = 32'd43
) (
    input wor _id_0,
    input wand id_1,
    input supply1 _id_2,
    input wire id_3,
    input wor _id_4,
    output tri id_5,
    output logic id_6,
    input supply0 id_7,
    input tri0 id_8,
    output supply1 id_9,
    output logic id_10,
    output tri id_11
);
  initial
    if (-1) id_10 <= (id_2);
    else id_6 = id_7;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_1,
      id_5,
      id_3,
      id_7,
      id_7,
      id_3,
      id_11
  );
  assign modCall_1.id_7 = 0;
  bit id_13;
  struct packed {logic id_14[-1  &  1 'b0 : 1];} id_15;
  ;
  assign id_6 = id_13;
  logic id_16;
  logic _id_17;
  ;
  logic [7:0][id_4][1][{  id_17  ,  id_2  }  *  id_0 : -1] id_18;
  wire id_19;
  always id_13 = -1;
  wire  id_20;
  logic id_21;
endmodule
