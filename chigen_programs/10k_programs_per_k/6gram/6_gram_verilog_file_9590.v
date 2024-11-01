// Seed: 93920692
module module_0 (
    input  tri0  id_0,
    input  uwire id_1,
    input  wor   id_2,
    output logic id_3,
    output tri1  id_4
);
  always @(negedge id_1 or posedge id_2) id_3 = #1 1;
endmodule
module module_1 (
    input supply1 id_0,
    input wor id_1,
    input tri0 id_2,
    output tri0 id_3,
    input uwire id_4,
    output logic id_5,
    input wire id_6,
    output logic id_7,
    input wire id_8,
    input wand id_9,
    input wand id_10,
    output tri id_11,
    input wand id_12,
    input wand id_13,
    input tri0 id_14,
    input wire id_15,
    input wor id_16
    , id_22,
    input wand id_17,
    input logic id_18,
    input logic id_19,
    input supply1 id_20
);
  wire id_23;
  initial begin
    id_5 <= id_19;
    fork : id_24
      repeat (1'b0 == id_0) begin
        id_7 <= id_18;
      end
    join
  end
  wor id_25 = id_20 * "";
  module_0(
      id_2, id_4, id_13, id_5, id_11
  );
endmodule
