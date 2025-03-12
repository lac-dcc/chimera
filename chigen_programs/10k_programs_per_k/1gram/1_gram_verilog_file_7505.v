// Seed: 3451426294
module module_0 (
    output uwire id_0,
    output tri1 id_1,
    input uwire id_2,
    input supply1 id_3,
    input tri1 id_4,
    input supply1 id_5,
    input wire id_6,
    input tri1 id_7,
    output supply1 id_8,
    input supply1 id_9,
    output wand id_10,
    input supply1 id_11,
    input wand id_12,
    input tri0 id_13
);
  assign id_8 = id_3;
  logic [1 : -1] id_15;
  union packed {
    logic id_16;
    logic id_17;
  } id_18;
  assign module_1.id_16 = 0;
  assign id_8 = id_13;
  wire id_19, id_20;
  assign id_18.id_16 = id_18.id_16;
endmodule
module module_1 #(
    parameter id_10 = 32'd62,
    parameter id_11 = 32'd25,
    parameter id_4  = 32'd45,
    parameter id_5  = 32'd13,
    parameter id_6  = 32'd66
) (
    output supply1 id_0,
    output logic id_1,
    input supply1 id_2,
    output uwire id_3,
    input tri _id_4,
    input tri _id_5,
    input wand _id_6,
    output uwire id_7,
    input wor id_8,
    output supply1 id_9,
    input wand _id_10,
    output supply0 _id_11,
    output supply0 id_12[id_11 : id_4],
    output tri id_13,
    output tri id_14,
    input wand id_15,
    output tri1 id_16
);
  wire [1 : id_5  -  id_6  .  id_10] id_18;
  module_0 modCall_1 (
      id_13,
      id_13,
      id_8,
      id_2,
      id_15,
      id_8,
      id_8,
      id_2,
      id_12,
      id_8,
      id_13,
      id_2,
      id_15,
      id_8
  );
  assign id_7 = id_6;
  wire id_19[(  1 'h0 ==  id_5  ) : 1];
  assign id_1 = 1 - id_5;
  logic [7:0][1 'b0] id_20 = -1;
  assign id_13 = (id_2);
  always @(posedge id_15) id_1 <= $unsigned(13);
  ;
  wire id_21;
  wire id_22, id_23;
  logic id_24;
endmodule
