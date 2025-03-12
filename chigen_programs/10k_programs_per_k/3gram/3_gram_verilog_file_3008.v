// Seed: 2946101311
module module_0 (
    input wor id_0,
    input wor id_1,
    output uwire id_2,
    output wor id_3,
    input wand id_4,
    input tri id_5,
    output logic id_6,
    input tri0 id_7,
    output logic id_8,
    input wand id_9,
    output supply1 id_10
);
  always @(posedge id_0) begin : LABEL_0
    id_6 = -1;
    id_8 = id_7 & -1;
  end
  assign module_1.id_10 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd72
) (
    input tri _id_0,
    output uwire id_1,
    input tri0 id_2,
    input tri0 id_3,
    input wor id_4,
    input uwire id_5,
    output logic id_6,
    input supply0 id_7,
    output tri id_8,
    input wand id_9,
    input tri0 id_10,
    output tri id_11,
    output supply0 id_12,
    output tri0 id_13,
    input tri id_14,
    input tri0 id_15
);
  wire [id_0 : ~  1] id_17;
  always @(*) id_6 <= #id_15 $realtime;
  parameter id_18 = 1;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_11,
      id_13,
      id_10,
      id_5,
      id_6,
      id_10,
      id_6,
      id_7,
      id_12
  );
  logic [1 'b0 : 1] id_19;
  wire id_20;
  assign id_6 = id_14;
  always @(posedge -1'b0) begin : LABEL_0
    $unsigned(21);
    ;
  end
endmodule
