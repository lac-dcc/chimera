// Seed: 364244492
module module_0 (
    input  wand  id_0,
    output uwire id_1,
    input  tri   id_2,
    input  uwire id_3,
    input  tri1  id_4,
    input  wor   id_5
);
  bit [-1 : (  -1  )] id_7 = 1;
  assign module_1.id_3 = 0;
  always @(posedge 1) begin : LABEL_0
    id_7 <= -1;
    $clog2(83);
    ;
    fork
      repeat (!(id_4)) begin : LABEL_1
        disable id_8;
        id_7 = id_2;
      end
      id_9(~id_0);
    join : SymbolIdentifier
  end
endmodule
module module_1 #(
    parameter id_1  = 32'd17,
    parameter id_17 = 32'd58,
    parameter id_23 = 32'd38
) (
    input tri0 id_0,
    input tri0 _id_1,
    output wor id_2,
    input tri1 id_3,
    input uwire id_4,
    output uwire id_5,
    input tri id_6,
    input supply0 id_7,
    input tri id_8,
    output wand id_9,
    input tri0 id_10,
    input tri id_11,
    output supply0 id_12,
    input tri0 id_13,
    input uwire id_14,
    input wand id_15,
    input tri1 id_16
    , id_22, _id_23,
    input tri0 _id_17,
    inout wand id_18,
    input tri id_19,
    output wand id_20
);
  assign id_18 = -1;
  wire [id_17 : -1] id_24;
  wire [id_23 : id_1] id_25;
  wire id_26;
  logic id_27;
  module_0 modCall_1 (
      id_7,
      id_2,
      id_14,
      id_14,
      id_18,
      id_18
  );
  wire id_28;
  wire id_29 = id_18;
  wire id_30, id_31, id_32, id_33, id_34, id_35, id_36;
  always @(posedge id_13 or posedge "") begin : LABEL_0
    #1;
  end
endmodule
