// Seed: 295189925
module module_0;
  logic [7:0] id_2;
  id_3(
      .id_0(id_1[1'b0] - ~id_2[1]),
      .id_1(id_4),
      .id_2(id_4 == 1'b0),
      .id_3(id_2),
      .id_4(id_2),
      .id_5(id_1),
      .id_6(1),
      .id_7(id_4),
      .id_8()
  );
endmodule
module module_1 (
    input  logic   id_0,
    output logic   id_1,
    output supply1 id_2
);
  assign id_2 = 1;
  module_0 modCall_1 ();
  assign id_1 = id_0;
  id_4(
      1, 1, 1, id_1, 1, 1'b0
  );
  assign id_2 = 1;
  always begin : LABEL_0
    assume (1);
  end
  always @(negedge 1) begin : LABEL_0
    id_1 <= id_0;
  end
endmodule
