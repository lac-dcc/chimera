// Seed: 1402805195
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    output wor id_2
);
  always @(-1) begin : LABEL_0
    $unsigned(68);
    ;
  end
endmodule
module module_1 (
    input  wor  id_0,
    input  tri0 id_1,
    output wand id_2
);
  always @(posedge id_0 != 1) begin : LABEL_0
    $clog2(27);
    ;
  end
  module_0 modCall_1 (
      id_0,
      id_1,
      id_2
  );
  assign modCall_1.id_2 = 0;
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
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27,
    id_28,
    id_29,
    id_30,
    id_31,
    id_32,
    id_33,
    id_34,
    id_35,
    id_36,
    id_37
);
  inout wire id_37;
  input wire id_36;
  output wire id_35;
  input wire id_34;
  output wire id_33;
  output wire id_32;
  input wire id_31;
  input wire id_30;
  output wire id_29;
  input wire id_28;
  input wire id_27;
  output wire id_26;
  inout wire id_25;
  output wire id_24;
  input wire id_23;
  input wire id_22;
  inout wire id_21;
  inout wire id_20;
  input wire id_19;
  inout wire id_18;
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_38;
  ;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output reg id_9;
  output wire id_8;
  module_2 modCall_1 (
      id_1,
      id_7,
      id_2,
      id_1,
      id_7,
      id_6,
      id_7,
      id_2,
      id_7,
      id_7,
      id_5,
      id_1,
      id_7,
      id_7,
      id_4,
      id_2,
      id_7,
      id_7,
      id_5,
      id_7,
      id_7,
      id_5,
      id_7,
      id_3,
      id_7,
      id_3,
      id_7,
      id_7,
      id_4,
      id_1,
      id_6,
      id_3,
      id_2,
      id_7,
      id_7,
      id_6,
      id_7
  );
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  logic [7:0] id_10;
  always @(-1'b0 == 1 or posedge 1) begin : LABEL_0
    id_9 <= 1;
  end
  always @(posedge id_1) id_10[1 :-1'b0] = id_10;
endmodule
