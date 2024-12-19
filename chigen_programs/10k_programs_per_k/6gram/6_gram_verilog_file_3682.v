// Seed: 2893205338
module module_0 (
    output uwire id_0,
    output tri0  id_1,
    input  tri   id_2,
    input  wire  id_3,
    output tri   id_4,
    output tri0  id_5,
    input  tri0  id_6,
    input  wire  id_7,
    input  uwire id_8,
    output tri0  id_9
);
  assign module_1.id_21 = 0;
  assign id_9 = 1 + 1'b0 ? id_8 : {id_7, 1};
  wire id_11;
  wire id_12;
  assign id_5 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    input tri0 id_2,
    input wor id_3,
    output supply0 id_4,
    input tri id_5,
    input tri id_6,
    output tri0 id_7,
    input wire id_8,
    input wire id_9,
    input uwire id_10,
    output supply0 id_11,
    output wand id_12,
    input tri0 id_13,
    input wor id_14,
    output wire id_15,
    output supply0 id_16,
    input tri1 id_17,
    input uwire id_18,
    output logic id_19,
    input tri1 id_20
    , id_30,
    output tri1 id_21,
    input supply1 id_22,
    input wor id_23,
    input uwire id_24,
    input tri1 id_25,
    input tri id_26,
    input wor id_27,
    output tri1 id_28
);
  always #1 begin : LABEL_0
    id_19 <= id_2 == 1'd0;
  end
  module_0 modCall_1 (
      id_12,
      id_15,
      id_2,
      id_22,
      id_21,
      id_7,
      id_6,
      id_8,
      id_17,
      id_15
  );
endmodule
