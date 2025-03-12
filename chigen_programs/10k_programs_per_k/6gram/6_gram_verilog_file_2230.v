// Seed: 18707298
module module_0 (
    input  wor  id_0
    , id_3,
    output tri1 id_1
);
  parameter id_4 = 1;
  assign id_1 = id_3;
  assign id_3 = "";
endmodule
module module_1 (
    inout tri1 id_0,
    input supply1 id_1,
    input supply0 id_2,
    input tri id_3,
    input tri id_4,
    output wire id_5,
    input tri id_6,
    input supply0 id_7,
    input wand id_8,
    input uwire id_9,
    output logic id_10,
    input supply1 id_11,
    output supply1 id_12,
    input wor id_13,
    input tri0 id_14,
    output wor id_15,
    output wor id_16,
    output tri id_17
);
  always @(id_4) begin : LABEL_0
    id_10 <= id_11;
  end
  nor primCall (id_16, id_2, id_11, id_9, id_8, id_14, id_0, id_1, id_4, id_13, id_7, id_6, id_3);
  module_0 modCall_1 (
      id_4,
      id_16
  );
  assign modCall_1.id_1 = 0;
endmodule
