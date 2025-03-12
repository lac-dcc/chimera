// Seed: 1715236317
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input supply0 id_2,
    input wor id_3,
    input wire id_4,
    output wand id_5,
    input tri id_6,
    output supply1 id_7,
    output supply0 id_8,
    output supply1 id_9
);
  pulldown id_11 (id_0, -1);
endmodule
module module_1 #(
    parameter id_11 = 32'd92,
    parameter id_2  = 32'd72,
    parameter id_5  = 32'd72,
    parameter id_8  = 32'd50
) (
    output logic id_0,
    output supply0 id_1,
    input wire _id_2,
    output tri0 id_3,
    input wand id_4,
    input wand _id_5,
    output logic id_6
);
  reg [-1 'b0 : id_2] _id_8, id_9;
  always #1 begin : LABEL_0
    if ((1)) id_0 <= "";
  end
  reg  id_10;
  wire _id_11;
  assign id_8 = id_8;
  always @(negedge 1) begin : LABEL_1
    id_0 = id_8;
    fork
      id_10 = id_5;
      if (-1) id_6 <= id_11 - id_2;
    join
  end
  logic [7:0][id_11 : 1 'b0] id_12;
  assign id_12[1] = 1;
  parameter id_13 = 1 - 1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_1,
      id_4,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_5 = 0;
  wire id_14;
  assign id_9 = id_12;
  wire [id_5 : id_8] id_15;
  generate
    for (id_16 = 1; id_15; id_9 = id_8) begin : LABEL_2
      genvar id_17;
    end
  endgenerate
endmodule
