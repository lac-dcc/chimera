// Seed: 1172336818
module module_0 #(
    parameter id_12 = 32'd42
) (
    input wand id_0,
    input wor id_1,
    output logic id_2,
    output supply0 id_3,
    output wor id_4,
    output wor id_5
);
  parameter id_7 = 1;
  logic [7:0] id_8;
  logic id_9;
  ;
  wire id_10;
  assign id_9 = -1;
  assign id_9 = id_10;
  tri1 id_11;
  wire _id_12;
  assign id_11 = 1'h0 ? 1 == id_8 - 1 : id_0 ? id_9 - id_8[-1] : id_11;
  wire [id_12 : -1 'b0] id_13;
  logic id_14;
  assign id_11 = id_13;
  parameter id_15 = id_7;
  assign id_3 = 1'b0;
  always @(id_0) begin : LABEL_0
    id_2 <= id_7;
  end
  assign id_2 = -1'b0;
  localparam id_16 = id_15 == -1;
  assign id_9 = 1;
  assign id_11 = 1;
  assign module_1.id_11 = 0;
endmodule
module module_1 (
    output logic id_0,
    input tri0 id_1,
    input wor id_2,
    output wire id_3,
    input tri id_4,
    input supply0 id_5,
    input tri id_6,
    input tri1 id_7,
    input wire id_8,
    input supply1 id_9,
    input tri1 id_10,
    input wire id_11,
    output wire id_12
);
  wire id_14;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_0,
      id_12,
      id_3,
      id_12
  );
  always @(negedge -1, negedge (1)) begin : LABEL_0
    id_0 <= 1'b0;
  end
endmodule
