// Seed: 458456587
module module_0 (
    input wor id_0,
    output supply1 id_1,
    input supply0 id_2,
    input supply1 id_3,
    output tri id_4,
    input tri1 id_5
);
  wire id_7;
  assign id_1 = 1;
  wire id_8;
  wire id_9;
  wire id_10;
  tri  id_11 = id_3;
  id_12(
      .id_0(id_3), .id_1(1), .id_2(id_1), .id_3(id_7), .id_4(id_1), .id_5(1)
  );
endmodule
module module_1 (
    output tri id_0,
    output logic id_1,
    input tri1 id_2,
    input supply0 id_3,
    output wand id_4
);
  assign id_4 = 1 && 1 && id_2;
  uwire id_6;
  always disable id_7;
  assign id_0 = !1;
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3,
      id_2,
      id_0,
      id_3
  );
  assign modCall_1.type_16 = 0;
  logic id_9;
  always @(posedge id_6) begin : LABEL_0
    #1 id_1 <= 1;
  end
  wire id_10;
  assign id_1 = id_9;
  wor id_11 = id_2;
endmodule
