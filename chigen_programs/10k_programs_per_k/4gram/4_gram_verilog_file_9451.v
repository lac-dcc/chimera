// Seed: 1312566796
module module_0 (
    input supply0 id_0,
    output wand id_1,
    input wor id_2,
    input wor id_3,
    input wor id_4,
    input tri1 id_5
);
  id_7(
      .id_0(1),
      .id_1(1'b0),
      .id_2(1),
      .id_3(1),
      .id_4(1),
      .id_5(id_1),
      .id_6(1),
      .id_7((id_3)),
      .id_8(1),
      .id_9(id_3),
      .id_10(1 - 1),
      .id_11(1'b0 - 1'b0)
  );
endmodule
module module_1 (
    output supply1 id_0,
    input supply0 id_1,
    input supply0 id_2,
    output tri0 module_1,
    output tri id_4,
    input supply0 id_5,
    output logic id_6,
    input logic id_7,
    input supply0 id_8,
    input wand id_9
);
  assign id_6 = id_7;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_1,
      id_9,
      id_5,
      id_9
  );
  assign modCall_1.type_8 = 0;
  always @(negedge 1 or posedge !id_7) begin : LABEL_0
    id_6 <= 1;
  end
  wire id_11;
  wire id_12;
endmodule
