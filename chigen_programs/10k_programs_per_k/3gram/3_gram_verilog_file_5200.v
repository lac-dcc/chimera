// Seed: 1576244525
module module_0 (
    output supply1 id_0,
    output tri0 id_1,
    output tri1 id_2
);
  assign id_1 = id_4;
endmodule
module module_1 (
    input tri1 id_0,
    input tri1 id_1,
    input supply1 id_2,
    input wor id_3,
    input uwire id_4,
    output tri1 id_5,
    input uwire id_6,
    output tri0 id_7,
    output tri id_8,
    input tri id_9,
    output supply0 id_10,
    output logic id_11,
    output wor id_12,
    output tri0 id_13,
    input supply1 id_14,
    input tri id_15,
    output wor id_16,
    input tri1 id_17,
    input uwire id_18,
    input tri id_19,
    output tri id_20,
    output wor id_21
);
  id_23(
      .id_0(1'b0), .id_1(id_16), .id_2(1), .id_3(id_12)
  );
  always_latch @(1) id_11 <= 1 / {id_9{1 ^ id_17}};
  wire id_24;
  wire id_25;
  module_0(
      id_20, id_20, id_12
  );
  always @(posedge 1) begin
    if (1) begin
      id_8 = !id_6 < 1;
    end
  end
endmodule
