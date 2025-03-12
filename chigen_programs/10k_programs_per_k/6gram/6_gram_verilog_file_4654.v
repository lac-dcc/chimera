// Seed: 188428696
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    input uwire id_2,
    input tri0 id_3,
    output wire id_4,
    input tri1 id_5,
    input uwire id_6,
    input wire id_7,
    input wand id_8,
    output supply1 id_9,
    input tri1 id_10,
    input supply1 id_11,
    input supply0 id_12,
    output wand id_13,
    output supply0 id_14,
    input tri0 id_15,
    input uwire id_16,
    output wand id_17
);
  assign id_13 = -1'b0 != id_1;
  wire id_19;
  supply1 id_20[-1 : 1 'b0];
  assign id_20 = 1;
endmodule
module module_1 #(
    parameter id_22 = 32'd4,
    parameter id_3  = 32'd54
) (
    output tri id_0,
    input wand id_1
    , id_24,
    output uwire id_2,
    input tri1 _id_3,
    input supply0 id_4,
    input wire id_5,
    output tri1 id_6,
    input tri1 id_7,
    input tri1 id_8,
    output wire id_9,
    output uwire id_10,
    input wor id_11,
    input wire id_12,
    input wand id_13,
    input tri0 id_14,
    output logic id_15,
    input supply1 id_16,
    output tri id_17,
    input supply0 id_18,
    input tri0 id_19,
    input tri1 id_20,
    input supply1 id_21,
    inout wire _id_22
);
  wire [id_22 : (  1  )] id_25;
  module_0 modCall_1 (
      id_20,
      id_11,
      id_19,
      id_20,
      id_2,
      id_12,
      id_13,
      id_19,
      id_19,
      id_9,
      id_14,
      id_8,
      id_7,
      id_2,
      id_6,
      id_16,
      id_12,
      id_6
  );
  wire [id_3  &  -1 : 1  !=  -1] id_26;
  always begin : LABEL_0
    @(posedge 1) id_15 = id_11;
  end
endmodule
