// Seed: 1775059810
module module_0 (
    input supply0 id_0,
    input uwire id_1,
    output wor id_2,
    input uwire id_3,
    input wor id_4,
    input tri0 id_5,
    input tri1 id_6
);
endmodule
module module_1 (
    input  wand  id_0,
    output tri   id_1,
    input  tri1  id_2,
    input  wor   id_3,
    input  uwire id_4,
    input  tri0  id_5,
    output tri0  id_6
    , id_8
);
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_0,
      id_5,
      id_3,
      id_5
  );
  assign modCall_1.id_0 = 0;
endmodule
macromodule module_2 #(
    parameter id_16 = 32'd57,
    parameter id_20 = 32'd15,
    parameter id_21 = 32'd56,
    parameter id_23 = 32'd72,
    parameter id_9  = 32'd47
) (
    input wor id_0,
    output wor id_1,
    input tri0 id_2,
    output tri id_3,
    input supply0 id_4,
    input supply0 id_5
    , id_15,
    input wor id_6,
    input supply0 id_7,
    output tri0 id_8,
    input tri0 _id_9,
    input uwire id_10,
    input supply0 id_11,
    output supply1 id_12,
    input uwire id_13
);
  logic [id_9 : -1] _id_16;
  ;
  bit id_17;
  xor primCall (id_8, id_4, id_6, id_2, id_15, id_19);
  logic [-1 : id_9] id_18;
  logic id_19 = 1;
  module_0 modCall_1 (
      id_5,
      id_11,
      id_3,
      id_4,
      id_13,
      id_4,
      id_7
  );
  logic _id_20;
  ;
  assign id_19 = 1;
  wire _id_21;
  always @({id_20{1}} or posedge id_7) begin : LABEL_0
    id_17 <= -1;
  end
  always id_17 = #id_22 1;
  wire [id_20 : id_16] _id_23;
  logic id_24;
  ;
  wire id_25;
  logic id_26;
  wire [id_23  ==  id_21 : 1] id_27;
  logic id_28;
  ;
endmodule
