// Seed: 2771315819
module module_0 (
    output uwire id_0,
    input tri1 id_1,
    output tri1 id_2,
    output tri id_3,
    input supply1 id_4,
    output supply0 id_5,
    output tri id_6,
    input wor id_7,
    input wand id_8,
    input wand id_9,
    output tri id_10,
    input wire id_11,
    input wor id_12,
    output tri id_13,
    output wor id_14,
    input tri1 id_15,
    output tri1 id_16,
    input uwire id_17,
    output wand id_18,
    input wand id_19,
    input tri id_20,
    input supply0 id_21,
    input wor id_22
);
  wire id_24, id_25;
  assign id_18 = id_7;
  assign module_1.id_9 = 0;
endmodule
program module_1 (
    input supply1 id_0,
    input tri1 id_1,
    input wire id_2,
    input tri0 id_3,
    input tri id_4,
    output uwire id_5,
    input supply0 id_6,
    input supply1 id_7,
    input wor id_8,
    output logic id_9,
    output supply0 id_10
);
  bit [1 'b0 : (  -1  )] id_12;
  initial begin : LABEL_0
    id_12 <= id_8;
  end
  always id_9 <= "";
  module_0 modCall_1 (
      id_10,
      id_4,
      id_5,
      id_5,
      id_6,
      id_5,
      id_5,
      id_7,
      id_1,
      id_0,
      id_10,
      id_1,
      id_1,
      id_5,
      id_10,
      id_0,
      id_5,
      id_8,
      id_5,
      id_3,
      id_2,
      id_0,
      id_2
  );
  assign id_5  = id_0;
  assign id_10 = 1'b0;
  supply0 [-1 'b0 : 1] id_13;
  assign id_13 = 1;
  parameter id_14 = -1;
endprogram
