// Seed: 868852435
module module_0 (
    input tri id_0,
    input tri0 id_1,
    output uwire id_2,
    input wand id_3,
    input wand id_4,
    output supply1 id_5,
    output supply0 id_6,
    output wor id_7,
    input uwire id_8,
    input tri1 id_9,
    output tri id_10,
    input uwire id_11,
    output uwire id_12,
    output tri id_13,
    input tri0 id_14,
    input wand id_15,
    input wor id_16
);
  logic id_18 [1 : -1];
  wire  id_19;
endmodule
module module_1 #(
    parameter id_2 = 32'd67,
    parameter id_8 = 32'd97
) (
    input tri1 id_0,
    input wand id_1,
    input wand _id_2,
    output uwire id_3,
    input supply1 id_4,
    output uwire id_5,
    output wire id_6
    , id_11,
    input wire id_7,
    input wor _id_8,
    input tri1 id_9
);
  parameter id_12 = -1'h0;
  wire id_13, id_14;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_3,
      id_4,
      id_1,
      id_6,
      id_3,
      id_6,
      id_1,
      id_0,
      id_6,
      id_1,
      id_5,
      id_6,
      id_0,
      id_0,
      id_4
  );
  assign modCall_1.id_4 = 0;
  logic id_15;
  always begin : LABEL_0
    begin : LABEL_1
      logic [id_2 : id_8  -  -1] id_16;
      id_11 -= id_0;
      begin : LABEL_2
        id_6 -= id_1;
        id_11 <= -1;
      end
      $clog2(51);
      ;
    end : SymbolIdentifier
  end
  assign id_6 = -1'h0 - 1;
  always @(posedge id_13) id_15 <= id_4;
  logic id_17;
  ;
endmodule
