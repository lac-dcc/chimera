// Seed: 3817111791
module module_0 (
    output wor  id_0,
    output wire id_1
);
  wire id_3;
  wire id_4;
endmodule
module module_1 (
    input  uwire id_0,
    output wire  id_1,
    input  uwire id_2
);
  module_0 modCall_1 (
      id_1,
      id_1
  );
  assign modCall_1.id_1 = 0;
  wire [1 : 1] id_4;
  wire id_5 = id_2;
  always @(id_0 or posedge id_5 - id_2) begin : LABEL_0
    $clog2(6);
    ;
  end
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  inout tri0 id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_19 = id_13 && (-1'd0);
endmodule
module module_3 #(
    parameter id_11 = 32'd44,
    parameter id_3  = 32'd2,
    parameter id_6  = 32'd2,
    parameter id_8  = 32'd6
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    _id_8,
    id_9,
    id_10
);
  inout logic [7:0] id_10;
  input wire id_9;
  input wire _id_8;
  output wire id_7;
  inout wire _id_6;
  input wire id_5;
  output wire id_4;
  xor primCall (id_2, id_10, id_5, id_9, id_1);
  output wire _id_3;
  inout wire id_2;
  inout logic [7:0] id_1;
  module_2 modCall_1 (
      id_5,
      id_7,
      id_7,
      id_2,
      id_7,
      id_2,
      id_2,
      id_2,
      id_2,
      id_7,
      id_2,
      id_2,
      id_9,
      id_2,
      id_2,
      id_7,
      id_2,
      id_4,
      id_2
  );
  wire  [id_8 : id_6] _id_11;
  logic [!  id_3 : 1] id_12;
  ;
  assign id_1[&id_11] = id_5;
  id_13 :
  assert property (@(posedge id_2 && id_6 && -1'b0 && id_10['b0] === -1) 1)
  else $signed(49);
  ;
endmodule : SymbolIdentifier
