// Seed: 3438371820
module module_0 (
    input wire id_0,
    input wand id_1,
    input wand id_2,
    output uwire id_3,
    output supply1 id_4,
    output supply0 id_5,
    input tri id_6,
    input tri1 id_7,
    input wand id_8,
    output uwire id_9,
    output tri1 id_10,
    input uwire id_11[-1 'h0 : -1],
    input tri id_12,
    input supply0 id_13,
    output wor id_14,
    output wand id_15,
    input tri1 id_16
);
  parameter id_18 = -1;
  wire id_19, id_20;
  assign id_3 = -1 - id_12;
  parameter id_21 = ~-1;
  parameter id_22 = 1;
  assign id_10 = 1'b0;
endmodule
module module_1 #(
    parameter id_0 = 32'd10,
    parameter id_1 = 32'd28,
    parameter id_2 = 32'd46,
    parameter id_4 = 32'd97
) (
    input tri _id_0,
    input supply0 _id_1,
    input supply1 _id_2,
    output tri id_3,
    input tri _id_4,
    output wor id_5,
    input supply0 id_6,
    input supply0 id_7
);
  assign id_3 = -1;
  assign id_5 = -1;
  wire [id_4 : id_4] id_9[id_4  <=  1  ?  {  id_0  {  1  }  } : id_1 : -1];
  localparam id_10 = -1'd0;
  logic id_11;
  ;
  wire id_12;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_6,
      id_3,
      id_3,
      id_5,
      id_6,
      id_7,
      id_7,
      id_3,
      id_3,
      id_6,
      id_6,
      id_7,
      id_3,
      id_5,
      id_6
  );
  assign modCall_1.id_3 = 0;
  task id_13();
    output [id_2 : 1  ==  id_4] id_14;
  endtask
  assign id_5 = id_6;
endmodule
