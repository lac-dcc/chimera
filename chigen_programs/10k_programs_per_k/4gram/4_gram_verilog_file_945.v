// Seed: 2471509388
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
    id_14
);
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_15;
  assign module_1.type_5 = 0;
  wire id_16;
  assign id_6 = id_2++;
endmodule
module module_1 (
    input tri0 id_0,
    input wor id_1,
    input tri0 id_2,
    input tri0 id_3
    , id_30,
    output tri0 id_4
    , id_31,
    input wand id_5,
    input uwire id_6,
    input wire id_7,
    input wor id_8,
    input wor id_9,
    input wand id_10,
    input supply0 id_11,
    input wor id_12,
    input wor id_13,
    input supply0 id_14,
    output tri1 id_15,
    input supply1 id_16,
    output wire id_17,
    input tri id_18,
    input wor id_19,
    output tri1 id_20,
    input supply0 id_21,
    output tri0 id_22,
    input tri0 id_23
    , id_32,
    output wand id_24,
    output tri1 id_25,
    output wand id_26,
    output tri0 id_27,
    output wand id_28
);
  assign id_32 = ~id_19;
  id_33 :
  assert property (@(posedge ~id_33) id_5)
  else $display(id_19);
  always @(id_11 or posedge id_0) begin : LABEL_0
    if (id_13) begin : LABEL_0
      id_28 -= 1;
    end
  end
  module_0 modCall_1 (
      id_31,
      id_32,
      id_32,
      id_30,
      id_31,
      id_30,
      id_30,
      id_30,
      id_32,
      id_31,
      id_32,
      id_32,
      id_32,
      id_32
  );
endmodule
