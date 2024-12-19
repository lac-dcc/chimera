// Seed: 1880539563
module module_0 (
    output supply1 id_0,
    output uwire id_1,
    output wand id_2,
    input tri id_3,
    output supply1 id_4,
    output tri id_5,
    input supply0 id_6,
    input uwire id_7
    , id_19,
    output tri0 id_8,
    input tri0 id_9,
    input supply0 id_10,
    output wor id_11,
    input tri0 id_12,
    output tri id_13,
    input supply1 id_14,
    input tri0 id_15,
    output wor id_16,
    input tri1 id_17
);
  always $display(id_19);
  assign module_1.id_13 = 0;
endmodule
module module_1 (
    input tri id_0,
    input logic id_1,
    output supply0 id_2,
    output logic id_3
);
  initial begin : LABEL_0
    id_2 = 1;
  end
  always
    if (1'b0) begin : LABEL_0
      id_3 <= id_1;
    end else #1 id_3 <= 0;
  wire id_5, id_6, id_7, id_8, id_9;
  assign id_6 = id_8;
  assign id_5 = id_7;
  wire id_10;
  always id_3 <= 1;
  tri1 id_11, id_12, id_13;
  assign id_12 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0
  );
endmodule
