// Seed: 1048175659
module module_0 (
    input tri1 id_0,
    input tri module_0,
    output wand id_2,
    input supply1 id_3
);
endmodule
module module_1 (
    input tri id_0,
    input tri id_1,
    input tri1 id_2,
    output tri0 id_3,
    input tri0 id_4,
    input logic id_5,
    output supply1 id_6,
    input tri0 id_7,
    input uwire id_8,
    output logic id_9,
    input uwire id_10,
    input wire id_11,
    input supply1 id_12,
    output logic id_13,
    input supply1 id_14,
    input logic id_15,
    input supply0 id_16
);
  always_latch @(posedge 1) begin
    id_9 = id_15;
    fork
      id_9  <= 1 & id_12 + 1;
      id_13 <= id_5;
    join
  end
  module_0(
      id_0, id_11, id_3, id_16
  );
  wire id_18;
endmodule
