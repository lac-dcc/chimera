// Seed: 772655683
module module_0 #(
    parameter id_1 = 32'd71,
    parameter id_3 = 32'd58,
    parameter id_5 = 32'd77
) (
    _id_1,
    id_2,
    _id_3,
    id_4[id_3 : id_5],
    _id_5,
    id_6[1 : ""]
);
  input logic [7:0] id_6;
  input wire _id_5;
  input logic [7:0] id_4;
  output wire _id_3;
  inout supply0 id_2;
  output wire _id_1;
  logic id_7;
  wire  id_8;
  localparam id_9[id_1 : 1] = "", id_10 = 1;
  assign id_2 = 1 + id_5;
  wire id_11;
  ;
endmodule : SymbolIdentifier
module module_1 #(
    parameter id_1 = 32'd72,
    parameter id_6 = 32'd36
) (
    output wor   id_0,
    input  uwire _id_1,
    input  wor   id_2,
    input  uwire id_3,
    output uwire id_4
);
  generate
    wire _id_6, id_7, id_8;
    assign id_6.id_1 = (id_7);
    logic [7:0] id_9;
    ;
    logic [7:0] id_10, id_11, id_12, id_13;
  endgenerate
  localparam id_14[id_1 : {  ~  id_6  }] = 1'b0;
  wire [1 : -1] id_15;
  wire id_16;
  logic id_17;
  module_0 modCall_1 (
      id_6,
      id_16,
      id_6,
      id_12,
      id_1,
      id_13
  );
  wire id_18;
  nand primCall (
      id_4,
      id_3,
      id_14,
      id_13,
      id_9,
      id_16,
      id_7,
      id_1,
      id_6,
      id_17,
      id_11,
      id_12,
      id_10,
      id_15,
      id_8,
      id_2
  );
  wire id_19;
endmodule
