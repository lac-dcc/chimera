// Seed: 1547854287
module module_0 #(
    parameter id_10 = 32'd63
) (
    input supply1 id_0,
    input wor id_1,
    input wand id_2,
    input supply0 id_3,
    input tri1 id_4,
    output supply0 id_5
    , _id_10,
    input uwire id_6,
    output uwire id_7,
    output supply0 id_8
);
  assign module_1.id_3 = 0;
  wire [id_10 : -1] id_11;
  wire id_12;
  wire id_13;
  assign id_13 = -1;
  wire id_14;
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    input wor id_2,
    output tri1 id_3,
    output tri id_4,
    output tri id_5,
    input supply0 id_6,
    output tri0 id_7,
    input uwire id_8,
    inout uwire id_9
    , id_14,
    output logic id_10,
    input tri0 id_11,
    output tri1 id_12
);
  parameter id_15 = 1'b0;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_11,
      id_6,
      id_9,
      id_4,
      id_0,
      id_4,
      id_4
  );
  wire id_16;
  assign id_3 = -1 !=? id_1;
  logic id_17;
  wire  id_18;
  always @(posedge 1'b0 or posedge id_18) begin : LABEL_0
    id_17 <= 1'b0;
  end
  always begin : LABEL_1
    id_10 <= 1;
  end
endmodule
