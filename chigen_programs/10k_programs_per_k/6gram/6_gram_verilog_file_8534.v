// Seed: 3442588498
module module_0 (
    input wor id_0,
    input tri1 id_1,
    output supply1 id_2,
    output logic id_3,
    input supply0 id_4,
    input tri id_5,
    output supply1 id_6
);
  parameter id_8 = 1;
  wire id_9;
  always @(*) begin : LABEL_0
    id_3 = 1'b0;
  end
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    input uwire id_2,
    input wor id_3,
    input wor id_4,
    input tri0 id_5,
    output tri1 id_6,
    input tri id_7,
    input wire id_8,
    inout tri1 id_9,
    input wire id_10,
    output logic id_11,
    output wire id_12
);
  wire  id_14;
  logic id_15;
  wire  id_16;
  genvar id_17;
  bit id_18, id_19, id_20, id_21;
  assign id_11 = id_9;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_12,
      id_11,
      id_3,
      id_3,
      id_6
  );
  assign modCall_1.id_3 = 0;
  always @* begin : LABEL_0
    id_21 <= id_10;
    if (-1) begin : LABEL_1
      id_11 <= id_4 & 1 & 1;
    end
  end
endmodule
