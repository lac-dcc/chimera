// Seed: 56531002
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
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27
);
  output wire id_27;
  output wire id_26;
  output wire id_25;
  output wire id_24;
  output wire id_23;
  input wire id_22;
  inout wire id_21;
  inout wire id_20;
  inout wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wand id_28 = 1;
  wire id_29 = id_19;
  assign id_27[1] = id_21;
  assign id_17[1] = 'b0 == id_3;
  assign module_1.type_28 = 0;
  assign id_10 = id_12;
  always @((id_14 && (1) == id_7)) begin : LABEL_0
    disable id_30;
    $display(1, id_12);
  end
endmodule
module module_1 (
    output supply0 id_0,
    input tri1 id_1,
    input tri1 id_2,
    input wand id_3,
    output uwire id_4,
    input supply1 id_5,
    output uwire id_6,
    input uwire id_7,
    input wand id_8,
    output tri1 id_9,
    output tri1 id_10,
    output wor id_11,
    input wor id_12,
    output uwire id_13
);
  tri0 id_15 = 1;
  supply0 id_16;
  logic [7:0] id_17;
  tri id_18 = id_15;
  wand id_19, id_20;
  module_0 modCall_1 (
      id_16,
      id_15,
      id_16,
      id_18,
      id_15,
      id_18,
      id_18,
      id_16,
      id_16,
      id_16,
      id_15,
      id_15,
      id_18,
      id_15,
      id_15,
      id_16,
      id_17,
      id_15,
      id_15,
      id_15,
      id_18,
      id_18,
      id_16,
      id_15,
      id_15,
      id_15,
      id_17
  );
  assign id_17[1] = id_15;
  wire id_21;
  always @(id_20 or negedge {id_3{1'b0}}) #1 id_6 = id_5;
  supply1 id_22 = 1;
  assign id_16 = id_15;
endmodule
