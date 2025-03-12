// Seed: 900190701
module module_0 (
    output tri0 id_0,
    input supply1 id_1,
    output logic id_2,
    input uwire id_3,
    input wire id_4,
    input supply0 id_5,
    output wire id_6
);
  always @(posedge -1'b0) begin : LABEL_0
    $unsigned(1);
    ;
    if (1) begin : LABEL_1
      id_2 = id_5;
    end
  end
endmodule
module module_1 (
    input wire id_0,
    output tri id_1,
    output logic id_2,
    output tri0 id_3,
    output supply1 id_4,
    input wand id_5
    , id_14,
    input wor id_6,
    output tri0 id_7,
    output tri id_8,
    output wire id_9,
    input tri1 id_10,
    input wand id_11,
    output supply0 id_12
);
  assign id_8 = 1;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_2,
      id_11,
      id_5,
      id_11,
      id_4
  );
  assign modCall_1.id_6 = 0;
  initial begin : LABEL_0
    id_2 <= id_10;
  end
endmodule
