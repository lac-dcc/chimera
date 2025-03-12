// Seed: 2409480499
module module_0 (
    input wor id_0,
    input supply1 id_1,
    input tri id_2
    , id_7,
    input uwire id_3,
    output logic id_4,
    input tri0 id_5
);
  always @(posedge id_1) begin : LABEL_0
    id_4 <= -1;
  end
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    input tri id_2,
    output tri1 id_3,
    output tri0 id_4,
    input tri0 id_5,
    output uwire id_6,
    output supply0 id_7,
    output logic id_8,
    input supply1 id_9
);
  parameter id_11 = 1'b0;
  logic id_12;
  if (id_11) assign id_8 = id_2;
  assign id_4 = ~id_9;
  final begin : LABEL_0
    id_8 <= 1;
  end
  generate
    initial assert (id_12);
  endgenerate
  wire id_13;
  wire [1 : 1] id_14;
  module_0 modCall_1 (
      id_2,
      id_9,
      id_5,
      id_9,
      id_8,
      id_9
  );
  assign modCall_1.id_2 = 0;
endmodule
