// Seed: 1879522856
module module_0 (
    input tri id_0#(.id_27(1)),
    output wire id_1,
    input wand id_2,
    input wire id_3,
    input tri1 id_4,
    input tri1 id_5,
    input wire id_6,
    output tri1 id_7,
    output uwire id_8,
    input wand id_9,
    input tri1 id_10,
    output supply1 id_11,
    output tri1 id_12,
    output wand id_13,
    output wor id_14,
    input wor id_15,
    input tri1 id_16,
    output tri1 id_17,
    input supply0 id_18,
    output tri0 id_19,
    output supply0 id_20,
    input uwire id_21,
    output wire void id_22,
    input tri1 id_23,
    output wand id_24,
    input tri id_25
);
  wire id_28, id_29, id_30, id_31, id_32, id_33;
  assign id_11 = 1;
  assign id_11 = 1;
  id_34 :
  assert property (@({1{id_5}}) 'b0) wait (1);
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    input tri id_2,
    output logic id_3,
    input wand id_4,
    output wire id_5,
    input wor id_6,
    input wor id_7,
    output wor id_8,
    output logic id_9,
    input uwire id_10,
    output uwire id_11,
    input uwire id_12,
    input supply0 id_13,
    output tri id_14,
    input tri id_15,
    input supply0 id_16,
    input supply1 id_17,
    output logic id_18
);
  assign id_5 = 1;
  always begin : LABEL_0
    id_9 = 1;
    id_3 <= 1;
    $display(id_4, id_1, 1'b0 == id_16, id_12);
    id_8 = id_10;
    $display(id_13);
  end
  module_0 modCall_1 (
      id_4,
      id_11,
      id_6,
      id_17,
      id_1,
      id_6,
      id_4,
      id_14,
      id_5,
      id_2,
      id_4,
      id_8,
      id_14,
      id_8,
      id_11,
      id_10,
      id_16,
      id_8,
      id_10,
      id_8,
      id_14,
      id_16,
      id_5,
      id_12,
      id_8,
      id_15
  );
  assign modCall_1.id_2 = 0;
  time id_20, id_21;
  initial id_9 <= #1 1;
  always begin : LABEL_0
    id_18 <= 1;
  end
  always id_3 <= 1;
endmodule
