// Seed: 144241156
module module_0 (
    output uwire id_0,
    input uwire id_1
    , id_13,
    input supply0 id_2,
    input wire id_3,
    input tri0 id_4,
    input wand id_5,
    input wand id_6,
    input tri0 id_7,
    input wire id_8,
    input wand id_9,
    input tri0 id_10
    , id_14,
    output wor id_11
);
  initial
  fork : SymbolIdentifier
    begin : LABEL_0
      id_13 <= -1 % 1'b0 == -1;
    end
    $clog2(89);
    ;
  join
  assign module_1.SymbolIdentifier._id_2 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd76,
    parameter id_2 = 32'd99
) (
    input tri1 id_0,
    input uwire _id_1,
    input supply0 _id_2,
    output tri1 id_3,
    output tri0 id_4,
    output tri id_5
);
  assign id_3 = 1;
  logic [1 : id_2] id_7;
  ;
  assign id_7 = 1;
  parameter id_8 = -1'b0;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_3
  );
  assign id_5 = id_1;
  always @(id_1 or posedge 1) begin : LABEL_0
    {id_8[1'b0==1 : id_1], id_0} <= id_8;
  end
endmodule
