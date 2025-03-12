// Seed: 2446068040
module module_0 (
    output wire  id_0,
    output wand  id_1,
    input  wand  id_2,
    input  tri   id_3,
    output uwire id_4,
    output uwire id_5,
    input  wire  id_6,
    input  uwire id_7,
    output uwire id_8,
    output wand  id_9
);
  assign id_9 = 1;
  localparam id_11 = 1;
endmodule
module module_1 #(
    parameter id_12 = 32'd5,
    parameter id_13 = 32'd63,
    parameter id_2  = 32'd49,
    parameter id_5  = 32'd44
) (
    output logic id_0,
    input supply0 id_1,
    input tri _id_2,
    output uwire id_3,
    output wire id_4,
    input wand _id_5,
    output tri0 id_6,
    input tri id_7,
    input tri1 id_8,
    input uwire id_9,
    output tri0 id_10,
    input wor id_11,
    input wire _id_12,
    input tri0 _id_13,
    input wor id_14,
    input wand id_15,
    input tri0 id_16,
    output supply1 id_17
);
  parameter id_19 = (-1);
  tri1 [-1 : id_2] id_20 = id_15 | id_8;
  always @(posedge id_11) begin : LABEL_0
    id_0 = !id_19 * id_14;
  end
  module_0 modCall_1 (
      id_6,
      id_10,
      id_16,
      id_1,
      id_4,
      id_3,
      id_11,
      id_14,
      id_4,
      id_17
  );
  assign modCall_1.id_5 = 0;
  parameter id_21 = 1;
  wire [id_12 : {  id_5  {  id_13  }  }] id_22 = id_16;
  assign id_0  = id_11 == 1;
  assign id_22 = id_5;
  logic id_23;
endmodule
