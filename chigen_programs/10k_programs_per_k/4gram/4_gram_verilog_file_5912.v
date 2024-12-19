// Seed: 3434441072
module module_0 (
    output wor id_0,
    input tri id_1,
    output supply1 id_2
    , id_5,
    input supply0 id_3
);
  generate
    always @(negedge id_1) id_5 = 1'b0;
  endgenerate
  wire id_6;
  id_7(
      .id_0(1'b0), .id_1(1), .id_2(id_5)
  );
endmodule
module module_1 (
    output logic id_0,
    input logic id_1,
    output supply1 id_2,
    input supply1 id_3,
    input supply0 id_4,
    input supply0 id_5,
    output wire id_6,
    input uwire id_7,
    output uwire id_8
);
  assign id_6 = ~id_7;
  tri  id_10 = id_4;
  reg  id_11;
  wire id_12;
  wire id_13;
  module_0 modCall_1 (
      id_6,
      id_4,
      id_2,
      id_4
  );
  tri id_14 = 1 & (id_10);
  always @(posedge id_4) begin : LABEL_0
    id_0  <= 1'b0 == "" ? 1 - id_10 : id_1;
    id_11 <= 1;
  end
  wire id_15;
endmodule
