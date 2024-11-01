// Seed: 461231116
module module_0 (
    input uwire id_0,
    output tri1 id_1,
    output tri id_2,
    output tri0 id_3,
    input tri id_4,
    input supply0 id_5,
    output wor id_6,
    output tri0 id_7,
    input tri1 id_8,
    output supply1 id_9,
    input wor id_10,
    input uwire id_11
);
  assign id_3 = {id_0, 1};
  assign id_1 = 1;
  wire id_13;
endmodule
module module_1 (
    input wand id_0,
    output tri0 id_1,
    input tri0 id_2,
    input uwire id_3,
    output tri id_4,
    input wor id_5,
    output supply1 id_6,
    output wand id_7,
    input wire id_8,
    input wor id_9,
    input tri0 id_10,
    output logic id_11,
    output logic id_12,
    input supply1 id_13
);
  wire id_15;
  tri1 id_16;
  always @(1 or posedge id_13) begin
    if (id_0) begin
      id_12 = 1 & id_16 & 1 + 1;
      if (id_13) id_11 <= 1'h0;
      else id_12 <= 1'h0;
    end
  end
  module_0(
      id_9, id_1, id_1, id_1, id_5, id_3, id_4, id_4, id_0, id_4, id_3, id_8
  );
endmodule
