// Seed: 2838630512
module module_0 (
    output supply0 id_0,
    output wor id_1
    , id_3
);
  wire id_4;
  wire id_5;
endmodule
module module_1 (
    output wor  id_0,
    input  tri1 id_1,
    output wand id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_2,
      id_2
  );
endmodule
module module_2 (
    input  logic id_0,
    output tri1  id_1,
    output logic id_2
);
  initial id_2 = #1 id_0;
  module_0 modCall_1 (
      id_1,
      id_1
  );
  assign modCall_1.type_1 = 0;
endmodule
module module_3 (
    input tri id_0,
    input supply0 id_1,
    output supply1 id_2,
    input wand id_3,
    input tri id_4,
    input tri0 id_5,
    output tri0 id_6,
    input supply0 id_7,
    output uwire id_8,
    output supply0 id_9,
    output supply1 id_10,
    input tri0 id_11,
    output tri1 id_12
    , id_31,
    output uwire id_13,
    input wor id_14,
    input tri id_15,
    inout wor id_16,
    output wor id_17,
    input tri0 id_18,
    output wor id_19,
    input supply1 id_20,
    input supply1 id_21,
    output uwire id_22,
    input wand id_23,
    output supply0 id_24,
    output supply1 id_25,
    input tri1 id_26,
    input tri id_27,
    output tri id_28,
    output logic id_29
);
  module_0 modCall_1 (
      id_6,
      id_24
  );
  assign modCall_1.id_1 = 0;
  wire id_32 = 1;
  wire id_33;
  tri  id_34;
  wire id_35;
  nor primCall (
      id_24,
      id_14,
      id_5,
      id_16,
      id_15,
      id_20,
      id_21,
      id_27,
      id_7,
      id_23,
      id_0,
      id_18,
      id_31,
      id_3,
      id_4,
      id_11
  );
  assign id_24 = id_27 < id_26 ? 1 : id_1 ? id_32 : id_4;
  always @(posedge 1 or posedge 1'b0) begin : LABEL_0
    assume (id_21 - 1);
    id_29 <= 1;
  end
  assign id_22 = id_0 ? id_26 : 1'b0;
endmodule
