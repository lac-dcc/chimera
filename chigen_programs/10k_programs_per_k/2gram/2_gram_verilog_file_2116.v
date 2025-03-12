// Seed: 2980093773
module module_0 (
    input supply0 id_0,
    input wire id_1,
    output tri0 id_2,
    input uwire id_3,
    input wand id_4,
    output supply0 id_5,
    input tri1 id_6,
    input tri id_7,
    input tri id_8,
    input wand id_9,
    output tri0 id_10,
    output uwire id_11,
    input tri0 id_12,
    output wor id_13,
    input tri0 id_14,
    output uwire id_15,
    output tri1 id_16,
    output logic id_17,
    output wor id_18,
    output tri1 id_19,
    input supply1 id_20,
    output tri1 id_21,
    output uwire id_22,
    input supply1 id_23,
    output tri1 id_24,
    input tri1 id_25,
    input tri id_26,
    input supply0 id_27,
    input tri0 id_28,
    output supply1 id_29
    , id_38,
    input tri1 id_30,
    output supply0 id_31,
    input wor id_32,
    input wor id_33,
    output supply0 id_34,
    input wor id_35,
    input wor id_36
);
  assign module_1.id_2 = 0;
  always id_17 = id_9;
endmodule
module module_1 #(
    parameter id_1  = 32'd64,
    parameter id_11 = 32'd21,
    parameter id_16 = 32'd20,
    parameter id_2  = 32'd80,
    parameter id_3  = 32'd66,
    parameter id_4  = 32'd94,
    parameter id_5  = 32'd54,
    parameter id_8  = 32'd23
) (
    input supply1 id_0,
    output wor _id_1,
    input supply1 _id_2,
    output supply1 _id_3,
    input supply1 _id_4
    , id_15,
    input uwire _id_5,
    input tri id_6,
    output tri1 id_7,
    output supply1 _id_8,
    input supply1 id_9,
    input tri0 id_10,
    input tri1 _id_11,
    output uwire id_12,
    input tri0 id_13
);
  generate
    assign id_12 = id_0;
  endgenerate
  wire _id_16;
  logic [7:0] id_17;
  class id_18;
    logic [id_2 : id_8  ?  id_3  -  id_4 : id_16  ?  id_3 : -1  ?  1 'h0 : 1] id_19;
    logic [1 : id_11] id_20;
    function new();
      input [1  !=  id_5 : -1] id_21;
    endfunction : new
    real id_22[-1 : id_1];
  endclass : SymbolIdentifier
  generate
    assign id_7 = id_17[1 : (-1)];
    bit id_23, id_24, id_25, id_26, id_27, id_28, id_29, id_30, id_31;
  endgenerate
  always begin : LABEL_0
    id_28 <= 1 + -1;
  end
  module_0 modCall_1 (
      id_0,
      id_13,
      id_12,
      id_13,
      id_13,
      id_12,
      id_0,
      id_13,
      id_0,
      id_9,
      id_7,
      id_7,
      id_6,
      id_7,
      id_6,
      id_12,
      id_12,
      id_21,
      id_12,
      id_7,
      id_6,
      id_12,
      id_12,
      id_10,
      id_7,
      id_9,
      id_6,
      id_6,
      id_13,
      id_7,
      id_10,
      id_12,
      id_6,
      id_10,
      id_7,
      id_10,
      id_13
  );
  wire id_32;
  wire id_33;
  wire id_34;
  ;
endmodule
