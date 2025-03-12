// Seed: 1299331473
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  assign module_1.id_1 = 0;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wand id_9 = 1;
endmodule
module module_1 #(
    parameter id_10 = 32'd4,
    parameter id_12 = 32'd48,
    parameter id_15 = 32'd11,
    parameter id_9  = 32'd22
) (
    input tri id_0,
    output supply0 id_1,
    input uwire id_2,
    output supply0 id_3,
    output wor id_4,
    input wand id_5,
    output supply0 id_6,
    output wor id_7,
    input wand id_8,
    input supply1 _id_9,
    output tri1 _id_10,
    input uwire id_11,
    input wand _id_12,
    inout supply1 id_13,
    output supply0 id_14,
    input tri1 _id_15,
    output supply1 id_16
);
  assign id_7 = -1;
  reg id_18;
  ;
  struct packed {logic [id_15 : -1] id_19;} [id_10 : {  {  id_12  {  1  ==  id_9  }  }  {  1  }  }]
      id_20, id_21;
  always @(posedge id_0, id_8) begin : LABEL_0
    id_18 = id_0;
  end
  module_0 modCall_1 (
      id_21,
      id_20,
      id_21,
      id_20,
      id_19,
      id_20,
      id_19,
      id_20
  );
endmodule
