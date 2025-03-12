// Seed: 826106099
module module_0 (
    input tri1 id_0,
    input supply0 id_1,
    input wor id_2,
    output tri0 id_3,
    input supply1 id_4,
    input tri id_5,
    output tri0 id_6,
    input wor id_7,
    output logic id_8
);
  logic id_10;
  wire id_11;
  wire [1 : -1] id_12;
  always @(posedge -1'h0) begin : LABEL_0
    id_8 = -1;
  end
endmodule
module module_1 (
    output tri1 id_0,
    output tri id_1,
    input tri0 id_2,
    output wire id_3,
    output wire id_4,
    output tri id_5,
    input tri1 id_6,
    input tri0 id_7,
    input tri id_8,
    output logic id_9
    , id_18,
    input supply1 id_10,
    input tri id_11,
    output uwire id_12,
    output wire id_13,
    output uwire id_14,
    input wor id_15,
    output uwire id_16
);
  initial id_9 = -1'h0;
  module_0 modCall_1 (
      id_15,
      id_2,
      id_6,
      id_4,
      id_2,
      id_10,
      id_4,
      id_10,
      id_9
  );
  assign modCall_1.id_1 = 0;
endmodule
