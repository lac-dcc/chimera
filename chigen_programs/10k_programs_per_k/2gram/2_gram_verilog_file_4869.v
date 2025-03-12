// Seed: 854091110
module module_0 (
    input  tri   id_0,
    output tri   id_1,
    input  uwire id_2,
    input  wire  id_3,
    input  tri0  id_4,
    output wire  id_5,
    output tri1  id_6,
    input  tri1  id_7,
    output wire  id_8,
    output tri1  id_9,
    output uwire id_10
);
  assign id_9 = 1 ? id_7 : id_2;
  assign module_1.id_11 = 0;
  wire id_12;
  ;
endmodule
module module_1 (
    input supply0 id_0,
    input tri0 id_1,
    input wire id_2,
    input tri1 id_3,
    input wand id_4,
    output uwire id_5,
    input wor id_6,
    inout tri0 id_7,
    input supply1 id_8,
    input uwire id_9,
    input tri1 id_10,
    input supply1 id_11,
    input tri1 id_12,
    input supply0 id_13,
    output supply1 id_14,
    output supply0 id_15,
    output supply0 id_16,
    input tri1 id_17,
    output logic id_18,
    input wand id_19,
    input tri0 id_20,
    output tri0 id_21,
    output logic id_22,
    output tri0 id_23,
    input wor id_24
);
  initial
    @(1 or id_9 - id_7) begin : LABEL_0
      id_22 <= 1;
      if (-1) begin : LABEL_1
        id_18 <= id_19;
      end
    end
  module_0 modCall_1 (
      id_20,
      id_14,
      id_3,
      id_19,
      id_10,
      id_15,
      id_23,
      id_17,
      id_16,
      id_23,
      id_21
  );
endmodule
