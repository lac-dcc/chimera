// Seed: 4204397591
module module_0 (
    input tri0 id_0,
    output tri0 id_1,
    input wire id_2,
    output wire id_3,
    input tri1 id_4,
    output wor id_5,
    input uwire id_6,
    input supply1 id_7,
    output supply0 id_8,
    input wand id_9,
    input wire id_10,
    input tri id_11,
    output wire id_12,
    input wand id_13
);
  assign id_1 = 1;
  generate
    if (id_4) begin : LABEL_0
      wire id_15;
      id_16(
          id_10, 1, 1
      );
      genvar id_17;
      genvar id_18;
      genvar id_19;
      assign id_8 = 1'b0 <= 1;
      wire id_20;
    end else begin : LABEL_0
      assign id_5 = id_2;
    end
  endgenerate
  assign module_1.id_9 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input wand id_1,
    output logic id_2,
    output logic id_3,
    input tri0 id_4,
    input wor id_5,
    input supply1 id_6,
    input tri1 id_7,
    output supply0 id_8,
    input tri0 id_9,
    input wire id_10,
    input logic id_11,
    input logic id_12,
    output logic id_13
);
  reg   id_15;
  logic id_16;
  assign id_2 = 1 ? id_11 : 1;
  initial begin : LABEL_0
    id_15 = #id_17 1;
    begin : LABEL_0
      id_13 <= 1;
      id_16 <= 1 < 1;
    end
    id_2  <= id_15 ? id_12 : id_16;
    id_16 <= 1;
    id_3  <= 1 ? 1 : 1;
  end
  module_0 modCall_1 (
      id_6,
      id_8,
      id_6,
      id_0,
      id_1,
      id_8,
      id_10,
      id_1,
      id_8,
      id_7,
      id_9,
      id_9,
      id_0,
      id_6
  );
endmodule
