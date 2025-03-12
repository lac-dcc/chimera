// Seed: 3910460997
module module_0 (
    output uwire id_0,
    output wand id_1,
    input wor id_2,
    output tri id_3,
    input supply0 id_4,
    input tri0 id_5,
    input tri1 id_6,
    input tri0 id_7,
    input uwire id_8,
    output supply1 id_9,
    input tri0 id_10,
    output supply0 id_11,
    input tri module_0,
    input wire id_13,
    input wire id_14,
    output tri id_15,
    output tri id_16,
    input tri1 id_17
);
endmodule
module module_1 (
    input wor id_0,
    input supply1 id_1,
    input tri id_2,
    input wor id_3,
    input uwire id_4,
    input tri0 id_5,
    input wor id_6,
    input supply1 id_7,
    input tri1 id_8,
    input wire id_9,
    input wor id_10,
    output wire id_11,
    input uwire id_12,
    input tri id_13,
    output logic id_14
);
  parameter id_16 = 1;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_2,
      id_11,
      id_1,
      id_3,
      id_8,
      id_4,
      id_0,
      id_11,
      id_12,
      id_11,
      id_6,
      id_10,
      id_1,
      id_11,
      id_11,
      id_3
  );
  or primCall (id_14, id_12, id_1, id_10, id_9, id_0, id_2, id_4, id_7, id_8, id_5, id_16);
  parameter id_17 = {1, -1};
  parameter id_18 = "";
  always @(negedge id_6) begin : LABEL_0
    id_14 = id_5(1, id_17[-1'b0], id_5 == id_3);
  end
  supply0 id_19 = id_10 + 1'd0;
endmodule
