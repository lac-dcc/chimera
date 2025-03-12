// Seed: 2077913736
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  logic ["" : -1] id_7;
  ;
  wire id_8;
  parameter id_9 = -1'b0 === 1 - $clog2(64);
  ;
  parameter id_10 = -1'd0;
  assign module_1.id_0 = 0;
  wire  [  |  1  :  (  -1  )  ]  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ;
  logic id_32;
  wire  id_33;
endmodule
module module_1 #(
    parameter id_3 = 32'd64
) (
    input wand id_0,
    output wand id_1,
    output tri id_2
    , id_24,
    input tri1 _id_3,
    input tri0 id_4,
    input tri id_5,
    inout supply0 id_6,
    input uwire id_7,
    input uwire id_8,
    output logic id_9,
    output wor id_10,
    input tri id_11,
    input wand id_12,
    input wor id_13,
    input tri0 id_14,
    output supply0 id_15,
    input wor id_16,
    input uwire id_17,
    input tri1 id_18,
    input uwire id_19,
    input uwire id_20
    , id_25,
    input tri1 id_21,
    output tri1 id_22
);
  wire id_26;
  or primCall (
      id_9,
      id_11,
      id_25,
      id_0,
      id_26,
      id_24,
      id_7,
      id_4,
      id_16,
      id_19,
      id_13,
      id_20,
      id_5,
      id_8,
      id_6,
      id_21,
      id_14
  );
  module_0 modCall_1 (
      id_26,
      id_24,
      id_26,
      id_26,
      id_24,
      id_25
  );
  assign id_24 = (1'b0);
  always @(*) id_9 = -1;
  assign id_6 = id_0;
  parameter id_27 = -1;
  assign id_10 = 1;
  wire id_28;
  ;
  wire [1 : -1  ==  id_3] id_29;
endmodule
