// Seed: 1261304516
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    input wand id_2,
    output tri1 id_3,
    input wor id_4
    , id_16,
    input tri0 id_5,
    input supply1 id_6,
    input tri id_7,
    input wire id_8,
    output wire id_9,
    input tri0 id_10,
    output tri1 id_11,
    input uwire id_12,
    output tri0 id_13,
    output tri1 id_14
);
  wire id_17, id_18;
  logic [7:0] id_19;
  initial $display(id_16, id_10, id_5, id_0, 1, 1, id_19['b0-{1, 1}]);
endmodule
module module_1 (
    input tri1 id_0,
    input tri0 id_1,
    output tri0 id_2,
    input wire id_3,
    input supply0 id_4,
    input tri1 id_5,
    output wand id_6,
    input supply1 id_7,
    input wor id_8,
    input supply0 id_9,
    input wire id_10,
    input wor id_11,
    input supply0 id_12,
    input supply1 id_13,
    output logic id_14
);
  wire id_16;
  wire id_17;
  module_0(
      id_0, id_2, id_3, id_2, id_1, id_5, id_8, id_12, id_8, id_2, id_9, id_2, id_10, id_2, id_6
  );
  always @(negedge 1)
    if (1'b0) begin
      id_14 <= 1'h0;
    end
endmodule
