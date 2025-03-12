// Seed: 107997433
module module_0 #(
    parameter id_17 = 32'd52
) (
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
    id_14
);
  output wire id_14;
  inout supply0 id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout logic [7:0] id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_15;
  wire id_16;
  ;
  assign id_15 = id_5;
  wire _id_17;
  initial begin : LABEL_0
    $unsigned(96);
    ;
  end
  assign id_13 = id_5 ? 1 : id_5[id_17] ? -1 : -1;
  wire [-1 'b0 : -1 'b0] id_18;
  logic id_19;
  ;
endmodule
module module_0 #(
    parameter id_2 = 32'd24
) (
    id_1,
    _id_2,
    module_1,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  inout logic [7:0] id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_6,
      id_1,
      id_1,
      id_1,
      id_5,
      id_6,
      id_1,
      id_1,
      id_4,
      id_7,
      id_7,
      id_4,
      id_1,
      id_1
  );
  output reg id_3;
  input wire _id_2;
  inout wire id_1;
  wire id_8;
  assign id_8 = (id_6);
  wire id_9;
  wire id_10;
  and primCall (id_1, id_6, id_5, id_7);
  always @(id_5[id_2] * id_5 or posedge id_10) id_3 = 1;
endmodule
