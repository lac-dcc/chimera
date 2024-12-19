// Seed: 2228391824
module module_0 (
    output tri1 id_0,
    input tri id_1,
    output tri1 id_2,
    output supply1 id_3,
    output uwire id_4,
    input tri1 id_5,
    input supply1 sample,
    output tri1 id_7,
    input supply0 id_8,
    input tri0 id_9,
    input supply1 module_0
    , id_12, id_13
);
  assign id_7 = id_8;
  always_ff @((id_6 == 1))
    if (1) begin : LABEL_0
      id_12 = id_1 - 1;
    end
  assign module_1.type_20 = 0;
endmodule
module module_1 (
    input logic id_0,
    input tri1 id_1,
    output uwire id_2,
    input supply1 id_3,
    input wor id_4,
    input wor id_5,
    output wor id_6,
    output wor id_7,
    output supply0 id_8,
    input tri id_9,
    output tri0 id_10,
    output logic id_11
);
  wire id_13;
  tri0 id_14 = 1'b0 == 1;
  for (id_15 = 1; 1; id_11 = id_15) begin : LABEL_0
    always @(posedge id_0) begin : LABEL_0
      id_15 <= id_15;
    end
  end
  module_0 modCall_1 (
      id_8,
      id_3,
      id_7,
      id_6,
      id_2,
      id_4,
      id_4,
      id_8,
      id_1,
      id_5,
      id_9
  );
  id_16(
      .id_0(id_5)
  );
  wire id_17;
  wire id_18;
  assign id_7 = 1 - id_4;
  wire id_19;
endmodule
