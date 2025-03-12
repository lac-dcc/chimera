// Seed: 674086637
module module_0 (
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
    id_19,
    id_20,
    id_21
);
  output wire id_21;
  output wire id_20;
  output wire id_19;
  output reg id_18;
  output wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  initial begin : LABEL_0
    id_18 <= 1'b0;
    $unsigned(98);
    ;
  end
  parameter id_22 = 1;
  assign id_19 = id_5;
  wire id_23;
  wire id_24;
endmodule
module module_1 #(
    parameter id_10 = 32'd35,
    parameter id_14 = 32'd37
) (
    input  tri0  id_0,
    output tri   id_1,
    output logic id_2,
    input  wire  id_3,
    input  wand  id_4,
    output tri0  id_5,
    input  tri1  id_6,
    output logic id_7,
    input  wand  id_8,
    input  tri0  id_9
    , id_12,
    input  wire  _id_10
);
  bit id_13;
  always @(posedge id_2++
  )
  begin : LABEL_0
    if (id_7++) id_13 <= id_0 == id_8;
    else begin : LABEL_1
      id_7 <= -1;
    end
  end
  assign id_7 = id_13;
  assign id_7 = id_0;
  parameter id_14 = !1;
  wire [1  !=  id_10 : id_14] id_15;
  always_ff @((id_0) or posedge -1'b0) begin : LABEL_2
    id_2 <= id_3;
  end
  wire id_16 = id_14, id_17;
  module_0 modCall_1 (
      id_17,
      id_12,
      id_16,
      id_12,
      id_15,
      id_17,
      id_16,
      id_17,
      id_16,
      id_17,
      id_17,
      id_12,
      id_15,
      id_12,
      id_12,
      id_16,
      id_12,
      id_13,
      id_15,
      id_12,
      id_16
  );
endmodule
