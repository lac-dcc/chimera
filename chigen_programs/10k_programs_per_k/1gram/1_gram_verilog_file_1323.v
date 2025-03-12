// Seed: 1616450452
module module_0 (
    output tri0  id_0,
    input  tri0  id_1,
    output uwire id_2,
    input  uwire id_3,
    output tri1  id_4
);
  if (1) begin : LABEL_0
    assign id_0 = 1;
  end else wire id_6, id_7, id_8;
endmodule
module module_1 (
    input tri1 id_0,
    output wor id_1,
    input uwire id_2,
    input supply0 id_3,
    input supply0 id_4,
    output logic id_5,
    input uwire id_6,
    input tri0 id_7,
    output logic id_8,
    output logic id_9,
    input tri id_10,
    output tri id_11,
    output tri0 id_12,
    input uwire id_13,
    input wor id_14,
    input tri id_15
);
  wire id_17;
  assign id_5 = id_3;
  module_0 modCall_1 (
      id_12,
      id_14,
      id_12,
      id_0,
      id_1
  );
  assign modCall_1.id_2 = 0;
  logic id_18 = id_17;
  always begin : LABEL_0
    id_8 <= 1'b0;
    id_8 <= id_7;
    id_9 <= id_3;
    @(1'b0) begin : LABEL_1
      $clog2(47);
      ;
    end
    id_5 <= -1;
  end
  integer id_19;
endmodule
