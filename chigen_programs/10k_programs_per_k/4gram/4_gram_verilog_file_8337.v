// Seed: 3425954790
module module_0 (
    input tri0 id_0,
    output tri0 id_1,
    input tri1 id_2,
    output supply1 id_3
);
  assign id_3 = 1;
endmodule
module module_1 (
    output supply1 id_0,
    input wor id_1
    , id_10,
    input wor id_2,
    input supply1 id_3,
    input wire id_4,
    input tri1 id_5,
    input uwire id_6,
    output logic id_7,
    input tri0 id_8
);
  assign id_10 = 1;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_4,
      id_0
  );
  assign modCall_1.id_2 = 0;
  always @(posedge 1'b0)
    if (id_1) begin : LABEL_0
      id_7 <= #id_10 1'b0;
    end else begin : LABEL_0
      id_10 <= (1);
    end
  always_latch @(negedge 1) begin : LABEL_0
    return 1;
  end
endmodule
