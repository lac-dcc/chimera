// Seed: 2208079050
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
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_4 = id_6;
endmodule
module module_0 #(
    parameter id_17 = 32'd87,
    parameter id_2  = 32'd31,
    parameter id_3  = 32'd32,
    parameter id_5  = 32'd22
) (
    output wand id_0,
    input uwire id_1,
    input tri1 _id_2,
    input tri1 _id_3,
    output wor id_4,
    input wor _id_5,
    input uwire id_6,
    output tri0 id_7,
    input supply0 id_8,
    output tri1 id_9,
    input supply1 id_10,
    output uwire module_1,
    output logic id_12,
    input uwire id_13,
    output supply0 id_14,
    input tri1 id_15,
    input tri1 id_16,
    input wand _id_17
);
  wire id_19;
  ;
  always_latch @(posedge -1'b0 or posedge 1) begin : LABEL_0
    id_12 = id_3;
  end
  wire [id_5  <=  id_3  +  id_2  &&  1 : id_17] id_20;
  module_0 modCall_1 (
      id_20,
      id_19,
      id_20,
      id_20,
      id_20,
      id_20,
      id_20,
      id_20
  );
  assign id_0 = 1;
endmodule
