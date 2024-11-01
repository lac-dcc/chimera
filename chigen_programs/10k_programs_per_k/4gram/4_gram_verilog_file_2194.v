// Seed: 455183644
module module_0 (
    output supply0 id_0,
    output wand id_1,
    input wand id_2,
    output tri1 id_3,
    input wire id_4,
    input wor id_5,
    input wire id_6,
    input tri0 id_7
);
  assign id_1 = 1 - id_6;
  wire id_9;
  wire id_10;
  wire id_11;
endmodule
module module_1 (
    output wire id_0,
    output tri0 id_1,
    input supply0 id_2,
    output logic id_3,
    input tri1 id_4,
    input wand id_5,
    output supply1 id_6,
    input tri1 id_7,
    output tri0 id_8
);
  wire id_10;
  always @(*) begin
    id_3 <= 1;
  end
  always @(1) id_0 = id_4;
  module_0(
      id_6, id_0, id_4, id_8, id_4, id_5, id_2, id_4
  );
endmodule
