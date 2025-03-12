// Seed: 1610758201
module module_0 (
    input tri1 id_0,
    input tri id_1,
    input wand id_2,
    input supply1 id_3,
    input tri0 id_4,
    input tri1 id_5,
    input wor id_6,
    input uwire id_7,
    input wand id_8,
    input uwire id_9,
    input wand id_10,
    input tri1 id_11,
    output logic id_12
);
  logic id_14;
  logic id_15 = id_5;
  assign id_14 = "";
  always @(-1) begin : LABEL_0
    $unsigned(50);
    ;
    id_12 <= id_8;
  end
endmodule
module module_1 (
    output uwire id_0,
    output logic id_1,
    input supply0 id_2,
    input wire id_3,
    output tri1 id_4,
    input wor id_5,
    output tri1 id_6,
    input supply0 id_7,
    output logic id_8
);
  always @(id_7 or posedge ~id_5) begin : LABEL_0
    id_1 <= -1;
    id_8 <= id_7;
  end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_5,
      id_3,
      id_5,
      id_3,
      id_5,
      id_3,
      id_3,
      id_2,
      id_5,
      id_5,
      id_1
  );
  assign modCall_1.id_11 = 0;
  assign id_1 = -1;
  wire id_10;
  wire id_11;
  logic [1 'b0 : 1] id_12;
endmodule
