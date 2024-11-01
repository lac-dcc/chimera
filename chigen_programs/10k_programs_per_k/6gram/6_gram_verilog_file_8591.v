// Seed: 242600277
module module_0 (
    output supply1 id_0,
    output tri id_1,
    input wor id_2,
    output tri id_3,
    input tri1 id_4,
    input tri0 id_5,
    output wand id_6
);
  assign id_6 = id_2;
endmodule
module module_1 (
    input tri id_0,
    input tri1 id_1,
    output tri id_2,
    input wire id_3,
    output wand id_4,
    input wand id_5,
    input tri1 id_6,
    output wand id_7,
    input supply0 id_8,
    input wire id_9,
    input tri1 id_10,
    input wor id_11,
    output logic id_12,
    output logic id_13,
    output tri0 id_14,
    output wire id_15,
    input wire id_16,
    input supply1 id_17,
    output supply0 id_18,
    output supply0 id_19
);
  assign id_14 = id_3 | id_10;
  assign id_14 = id_3;
  always @(posedge id_3 > id_10) begin
    if (1) begin
      id_12 <= 1;
      id_13 <= ~id_9;
    end
  end
  module_0(
      id_2, id_14, id_6, id_4, id_6, id_6, id_18
  );
endmodule
