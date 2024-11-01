// Seed: 4272669034
module module_0 (
    output tri id_0,
    input tri1 id_1,
    output supply0 id_2,
    input tri1 id_3,
    input supply1 id_4,
    input tri1 id_5,
    input wor id_6,
    input uwire id_7,
    output wand id_8,
    output uwire id_9,
    input supply0 id_10,
    input wire id_11,
    output tri0 id_12,
    input tri id_13,
    input wand id_14,
    output tri0 id_15,
    output uwire id_16,
    input tri0 id_17,
    output supply1 id_18,
    input tri1 id_19,
    input tri1 id_20,
    input tri id_21,
    input supply0 id_22,
    output tri0 id_23
);
  wire id_25;
  assign id_15 = 1 == id_6;
endmodule
module module_1 (
    output logic id_0,
    input  wire  id_1,
    output tri   id_2,
    output logic id_3
);
  reg id_5;
  always @(1 or id_5) begin
    id_0 <= id_5;
    if (id_5)
      casez (id_1 == 1)
        1'b0: id_3 = 1;
        id_1: id_3 <= id_5;
        id_1, 1, 1: id_0 <= {1};
      endcase
  end
  module_0(
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2
  );
endmodule
