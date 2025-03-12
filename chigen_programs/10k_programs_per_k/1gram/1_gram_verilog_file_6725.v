// Seed: 3863077121
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input supply1 id_2
);
  wire id_4;
  always begin : LABEL_0
    $signed(12);
    ;
  end
  parameter id_5 = (1);
  wire id_6;
  assign id_4 = id_5;
  logic id_7[1 : -1];
  ;
  logic id_8;
  ;
  logic id_9;
endmodule : SymbolIdentifier
module module_1 #(
    parameter id_14 = 32'd99,
    parameter id_8  = 32'd52
) (
    input tri1 id_0,
    output uwire id_1,
    input tri0 id_2,
    output supply0 id_3,
    input tri1 id_4,
    input supply0 id_5
);
  reg id_7, _id_8;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_5
  );
  assign modCall_1.id_1 = 0;
  wire [-1 : 1] id_9;
  logic id_10;
  ;
  buf primCall (id_3, id_2);
  assign id_10 = -1'b0 ==? 1;
  assign id_3  = id_5;
  always id_7 = 1'b0;
  assign id_7 = id_4;
  logic id_11;
  wire id_12, id_13, _id_14;
  assign id_1  = id_11;
  assign id_1  = id_14;
  assign id_14 = {id_9{id_2}};
  wire [id_8 : id_14] id_15;
endmodule
