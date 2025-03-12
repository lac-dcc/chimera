// Seed: 3150678428
module module_0 #(
    parameter id_2 = 32'd73
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  inout supply1 id_4;
  input wire id_3;
  output wire _id_2;
  output wire id_1;
  localparam id_7 = 1;
  logic [id_2 : -1 'b0] id_8;
  ;
  assign id_4 = 1;
  tri id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16, id_17, id_18, id_19, id_20;
  assign id_13 = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd34,
    parameter id_7 = 32'd59
) (
    id_1,
    _id_2
);
  input wire _id_2;
  input wire id_1;
  localparam id_3 = 1, id_4 = "", id_5 = id_1, id_6 = 1, id_7 = id_3;
  wire id_8;
  bit [1 : {  id_2  {  1  }  }] id_9, id_10, id_11, id_12, id_13;
  assign id_9  = id_8 <= -1'h0;
  assign id_10 = 1 - 1'h0;
  always id_10 <= id_2;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_8,
      id_8,
      id_1,
      id_8
  );
  assign modCall_1.id_9 = 0;
  assign id_10 = 1;
  parameter id_14 = id_6;
  final
    if (id_3[1]) begin : LABEL_0
      id_13 <= id_1;
      id_9  <= id_7;
      id_12 = 1'h0;
    end
  struct packed {
    struct packed {
      logic id_15;
      logic [1 'b0 : -1 'b0] id_16;
    } [id_7 : -1] id_17;
  } id_18;
  id_19 :
  assert property (@(posedge id_4) id_6)
  else;
endmodule
