// Seed: 2532830132
module module_0 (
    input wand id_0,
    input tri1 id_1,
    output wor id_2,
    output supply1 id_3,
    input wire module_0,
    output uwire id_5,
    input wor id_6,
    output supply0 id_7,
    input tri0 id_8,
    output wire id_9,
    input wire id_10,
    output wire id_11
);
  wire id_13, id_14 = id_1;
  wire id_15;
  tri0 id_16;
  wire id_17;
  tri0 id_18;
  supply0 id_19;
  wire id_20;
  supply0 id_21 = 1'b0;
  always @(posedge !id_4 or 1 !=? id_18) begin
    id_19 = 1 == id_16;
  end
endmodule
module module_1 (
    input wire id_0,
    input uwire id_1,
    input wor id_2,
    input tri0 id_3,
    input tri0 id_4,
    output wand id_5,
    input logic id_6,
    output tri0 id_7,
    output tri0 id_8,
    output tri1 id_9,
    input tri0 id_10,
    output supply0 id_11,
    output logic id_12,
    input wor id_13,
    output wand id_14
);
  module_0(
      id_0, id_2, id_11, id_11, id_4, id_11, id_0, id_5, id_1, id_5, id_1, id_7
  );
  assign id_14 = id_4 ? 1'b0 : 1;
  wire id_16;
  always id_12 <= #1 id_6;
endmodule
