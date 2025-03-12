// Seed: 162837536
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  bit id_3;
  initial begin : LABEL_0
    if (-1) id_3 <= (module_0);
  end
  supply1 id_4, id_5, id_6, id_7, id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15;
  assign id_10 = id_2 ==? 1;
  wire id_16;
  assign id_12 = id_14;
  wire id_17;
  ;
endmodule
module module_1 #(
    parameter id_0  = 32'd29,
    parameter id_11 = 32'd2,
    parameter id_12 = 32'd22
) (
    output tri _id_0,
    input tri1 id_1
    , _id_11,
    output wand id_2,
    input supply1 id_3,
    input tri1 id_4,
    input supply0 id_5,
    input wand id_6,
    output wor id_7,
    output logic id_8,
    output logic id_9
);
  wire _id_12;
  bit [1 : id_11] id_13;
  wire id_14;
  initial begin : LABEL_0
    id_13 <= id_6;
    fork : SymbolIdentifier
      repeat (1 == 1) id_9 <= -1;
    join
  end
  wire id_15, id_16;
  assign id_11 = id_16;
  integer [1 'b0 : id_0] id_17[-1 : id_12];
  ;
  wire id_18;
  module_0 modCall_1 (
      id_18,
      id_15
  );
  assign modCall_1.LABEL_0.id_15 = 0;
  always @(id_16 or id_15) id_8 = #1 id_14;
endmodule
