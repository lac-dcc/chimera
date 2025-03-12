// Seed: 2132396830
module module_0 #(
    parameter id_3 = 32'd27,
    parameter id_4 = 32'd34
) (
    id_1,
    id_2,
    _id_3,
    _id_4
);
  inout wire _id_4;
  inout wire _id_3;
  input wire id_2;
  inout wire id_1;
  always @(posedge !id_2 or posedge -1'b0) #1;
  wire id_5;
  logic [-1  !=  -1 : id_4] id_6;
  ;
  logic [id_3 : 1] id_7;
endmodule
module module_1 #(
    parameter id_13 = 32'd50,
    parameter id_18 = 32'd48,
    parameter id_2  = 32'd56,
    parameter id_22 = 32'd2,
    parameter id_23 = 32'd94,
    parameter id_3  = 32'd97,
    parameter id_30 = 32'd99
) (
    input tri0 id_0,
    input tri1 id_1,
    output tri1 _id_2,
    output tri0 _id_3,
    input tri id_4,
    input tri0 id_5,
    output wand id_6,
    input wor id_7,
    input tri id_8,
    output wand id_9,
    input supply0 id_10,
    output supply1 id_11,
    output wire id_12,
    input tri1 _id_13,
    output tri0 id_14,
    output wand id_15,
    input supply1 id_16,
    output supply1 id_17,
    output supply1 _id_18,
    input wand id_19,
    output wire id_20,
    output uwire id_21,
    input uwire _id_22,
    output tri0 _id_23,
    output wor id_24,
    input tri1 id_25,
    input uwire id_26,
    output uwire id_27,
    output tri id_28
);
  localparam [id_13 : 1  -  (  id_22  )  &  -1] id_30 = -1;
  logic [id_2 : id_3] id_31;
  logic [id_18  *  id_30 : id_23] id_32;
  ;
  assign id_20 = (id_1) < (1 || -1);
  xnor primCall (
      id_9,
      id_5,
      id_26,
      id_7,
      id_10,
      id_1,
      id_25,
      id_32,
      id_16,
      id_30,
      id_0,
      id_8,
      id_4,
      id_19,
      id_31
  );
  module_0 modCall_1 (
      id_32,
      id_31,
      id_30,
      id_30
  );
endmodule
