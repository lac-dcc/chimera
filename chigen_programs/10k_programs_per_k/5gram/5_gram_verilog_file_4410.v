// Seed: 1788824016
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  specify
    $setup(id_3, posedge id_4, (-1));
    (id_5 + => id_6) = (-1, id_4);
    (id_7 + => id_8) = (-1 - id_8  : 1'b0 : id_8, id_3 == id_5);
    if (id_4) (id_9 => id_10) = 1;
    (posedge id_11 => (id_12 +: -1 ^ 1)) = (id_8 == id_4, id_5);
    (id_13 => id_14) = (id_5  : id_9  : id_12 == -1, -1'b0 : id_5  : -1 + -1);
  endspecify
endmodule
module module_1 (
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
    id_20
);
  inout wire id_20;
  input wire id_19;
  module_0 modCall_1 (
      id_20,
      id_10
  );
  output wire id_18;
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  inout logic [7:0] id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout tri0 id_2;
  input wire id_1;
  wire id_21;
  ;
  always_latch @(posedge id_11[-1] or posedge 1'b0) begin : LABEL_0
    $unsigned(67);
    ;
  end
  wire id_22;
endmodule
