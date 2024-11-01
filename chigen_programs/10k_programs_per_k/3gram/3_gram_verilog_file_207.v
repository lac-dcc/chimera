// Seed: 3994350706
module module_0 (
    input uwire id_0,
    input wor id_1,
    output wor id_2,
    input supply1 id_3,
    input tri1 id_4,
    output wor id_5,
    output tri0 id_6,
    input uwire id_7,
    input wand id_8,
    input supply1 id_9,
    input wor id_10,
    input supply1 id_11,
    input tri0 id_12,
    input wor id_13,
    input tri0 id_14,
    input wire id_15,
    input wire id_16,
    output wire id_17
);
  assign id_6 = 1;
endmodule
module module_1 (
    output logic id_0,
    output wor   id_1,
    input  tri1  id_2,
    input  wand  id_3,
    input  uwire id_4
);
  always @(posedge id_4 or posedge 1) begin
    id_0 <= 'd0;
  end
  wire id_6;
  module_0(
      id_2,
      id_4,
      id_1,
      id_3,
      id_2,
      id_1,
      id_1,
      id_4,
      id_2,
      id_3,
      id_4,
      id_3,
      id_2,
      id_3,
      id_3,
      id_4,
      id_4,
      id_1
  );
endmodule
