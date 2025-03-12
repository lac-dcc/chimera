// Seed: 1540364983
macromodule module_0 #(
    parameter id_1 = 32'd36,
    parameter id_4 = 32'd10
) (
    _id_1,
    id_2,
    id_3,
    _id_4,
    id_5
);
  input wire id_5;
  output wire _id_4;
  input wire id_3;
  input wire id_2;
  output wire _id_1;
  wire id_6;
  logic [-1 'b0 : id_4] id_7;
  ;
  struct packed {id_8 id_9;} [-1 : id_1] id_10;
  generate
    wire id_11;
    wire id_12;
    always_latch begin : LABEL_0
      id_10.id_9 <= !-1 == id_5;
    end
  endgenerate
  logic [1 : 1] id_13;
  ;
  wire id_14;
endmodule
module module_1 #(
    parameter id_3 = 32'd80,
    parameter id_5 = 32'd18
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  inout wire id_14;
  output wire id_13;
  inout logic [7:0] id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire _id_5;
  input wire id_4;
  inout wire _id_3;
  input wire id_2;
  output wire id_1;
  id_15 :
  assert property (@(-1 || 1) -1)
  else;
  assign id_12 = id_10;
  for (id_16 = id_16; id_9; {-1'h0 - id_9, id_10} = 1'b0) begin : LABEL_0
    always id_12[1] = (1) + id_12 - id_5;
    wire id_17;
    ;
  end
  assign id_5  = id_9;
  assign id_13 = 1;
  logic [id_5 : 1] id_18 = -1'b0;
  wire id_19;
  logic id_20;
  ;
  module_0 modCall_1 (
      id_5,
      id_18,
      id_19,
      id_5,
      id_2
  );
  wire id_21;
  assign id_12 = id_16;
  wire id_22;
  logic [id_3 : 1] id_23;
  ;
  logic [1 : {  1  {  -1  }  }] id_24;
  assign id_20 = id_2;
endmodule
