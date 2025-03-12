// Seed: 1780165028
module module_0 (
    input wor id_0,
    input tri1 id_1,
    input wand id_2,
    output tri1 id_3,
    output supply0 id_4,
    output uwire id_5,
    output wire id_6,
    input wire id_7
);
  assign id_4 = -1;
  wire id_9;
  parameter id_10 = 1;
  logic id_11;
  parameter id_12 = id_10;
  wire id_13;
  wire id_14;
  ;
endmodule
module module_1 #(
    parameter id_3 = 32'd99,
    parameter id_9 = 32'd97
) (
    output uwire id_0,
    input wor id_1,
    input supply0 id_2,
    input tri0 _id_3
);
  parameter id_5 = 1;
  wire id_6;
  ;
  logic id_7;
  logic id_8;
  ;
  assign id_7 = id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_7 = 0;
  always @(negedge 1) $clog2(66);
  ;
  logic _id_9 = -1;
  if ("") begin : LABEL_0
    assign id_9 = id_8[-1 :-1];
    assign id_8[id_9 : 1] = 1'b0;
  end else begin : LABEL_1
    assign id_0 = -1'b0;
  end
  assign id_8[1'd0&&1'b0]  = 1;
  assign id_8[-1+id_3 : 1] = id_7;
endmodule
