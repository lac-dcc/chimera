// Seed: 829520422
module module_0 (
    input tri1 id_0,
    input supply1 void id_1
);
  assign module_1.id_8 = 0;
  assign id_3 = 1;
  id_4(
      .id_0(id_0), .id_1(1), .id_2(-1), .id_3(-1'b0)
  );
  wire id_5;
endmodule
module module_1 (
    input tri1 id_0,
    output supply1 id_1,
    output tri1 id_2,
    input uwire id_3,
    output tri1 id_4,
    input supply1 id_5,
    input tri1 id_6,
    output wor id_7,
    input tri id_8,
    input tri1 id_9,
    input supply0 id_10,
    output wand id_11,
    output uwire id_12,
    input supply0 id_13,
    input wire id_14,
    output logic id_15
);
  for (id_17 = id_6 && id_5 - -1; id_5.id_9; id_4 = id_17) begin : LABEL_0
    parameter id_18 = -1;
  end
  assign id_4 = id_5;
  tri id_19 id_20;
  module_0 modCall_1 (
      id_20,
      id_14
  );
  always id_2 = (id_20.id_6);
  id_21 :
  assert property (@(posedge -1 or posedge id_10 or posedge -1'b0 or negedge 1) id_9) id_15 <= 1;
  assign id_17 = id_3;
endmodule
