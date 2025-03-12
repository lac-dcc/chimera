// Seed: 3407617376
module module_0 (
    input wor id_0,
    output wand id_1,
    input tri id_2,
    output wand id_3,
    inout supply1 id_4
);
  struct packed {
    id_6 id_7;
    logic id_8;
    logic [-1 : -1 'b0] id_9;
    logic id_10;
    logic id_11;
    logic id_12;
  } id_13 = -1;
  logic id_14 = 1;
endmodule
module module_1 #(
    parameter id_5 = 32'd57,
    parameter id_6 = 32'd23
) (
    input supply1 id_0,
    input wand id_1,
    output tri0 id_2,
    input wor id_3,
    input wire id_4,
    input wire _id_5,
    input uwire _id_6,
    output tri1 id_7,
    output tri id_8,
    inout supply0 id_9,
    input wor id_10
);
  logic id_12;
  wire [id_6 : 1] id_13[id_5 : 1], id_14;
  logic id_15;
  assign id_12 = id_13;
  wire id_16;
  always_ff $clog2(38);
  ;
  assign id_14 = id_4;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_4,
      id_9,
      id_9
  );
  assign modCall_1.id_2 = 0;
endmodule : SymbolIdentifier
