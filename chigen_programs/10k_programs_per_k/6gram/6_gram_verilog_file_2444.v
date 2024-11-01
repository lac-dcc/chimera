// Seed: 2845243989
module module_0 (
    input  tri1  id_0,
    input  wor   id_1,
    input  tri0  id_2,
    input  uwire id_3,
    input  logic id_4,
    input  tri1  id_5,
    output logic id_6
);
  always #0 begin
    id_6 <= 1;
    id_6 <= id_4;
  end
endmodule
module module_1 (
    inout tri0 id_0,
    input tri id_1,
    input tri1 id_2,
    input supply0 id_3,
    input tri0 id_4,
    input tri1 id_5,
    input wire id_6,
    output logic id_7,
    output tri0 id_8,
    input wand id_9,
    input wor id_10,
    output tri id_11,
    input wand id_12,
    output logic id_13,
    input supply1 id_14,
    input uwire id_15,
    input logic id_16,
    output logic id_17,
    output tri1 id_18,
    input tri0 id_19,
    input wand id_20
);
  assign id_13 = id_16;
  reg id_22;
  always @(*) begin
    id_13 <= "";
    id_17 <= 1;
  end
  module_0(
      id_2, id_10, id_2, id_19, id_16, id_19, id_17
  );
  always @(1)
    if (id_19) id_7 <= 1;
    else id_13 <= id_9 == id_20;
  supply1 id_23;
  wire id_24;
  wire id_25;
  initial begin
    id_22 <= id_22;
    id_23 = 1'b0 > "";
  end
endmodule
