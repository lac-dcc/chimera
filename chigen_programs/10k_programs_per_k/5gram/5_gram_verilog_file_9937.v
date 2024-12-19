// Seed: 1136276684
module module_0 (
    output supply1 id_0,
    output supply1 id_1,
    output supply0 id_2,
    input tri0 id_3,
    output tri0 id_4,
    input tri id_5,
    output supply0 id_6,
    input wor id_7,
    input tri0 id_8,
    input supply0 id_9,
    input wor id_10,
    input wor id_11,
    input wire id_12,
    input supply0 id_13,
    input tri0 id_14,
    output wire id_15,
    output tri id_16,
    output wire id_17,
    input wire id_18,
    input wor id_19
    , id_25,
    output supply1 id_20,
    input tri1 id_21,
    input uwire id_22,
    input wor id_23
);
  wire id_26;
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    input  tri1  id_0,
    input  tri   id_1,
    output tri1  id_2,
    output tri1  id_3,
    input  wire  id_4,
    input  uwire id_5
);
  initial begin : LABEL_0
    id_2 = 1;
    deassign id_3;
  end
  assign id_3 = (1'b0 == id_0);
  wire id_7;
  assign id_2 = id_5;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_0,
      id_3,
      id_0,
      id_2,
      id_1,
      id_0,
      id_5,
      id_0,
      id_4,
      id_4,
      id_0,
      id_1,
      id_2,
      id_2,
      id_3,
      id_1,
      id_0,
      id_3,
      id_5,
      id_5,
      id_4
  );
endmodule
