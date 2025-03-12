// Seed: 2860236424
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    input wire id_2,
    output tri id_3,
    output tri1 id_4,
    input tri id_5,
    input wor id_6,
    input tri id_7
);
  wire id_9;
  genvar id_10;
  wire id_11;
  ;
  wire  id_12;
  logic id_13;
  assign module_1.id_4 = 0;
  assign id_10 = id_12;
endmodule
module module_1 (
    output logic id_0,
    output supply1 id_1,
    output tri1 id_2,
    output wor id_3,
    input uwire id_4
);
  always @(posedge id_4 or negedge id_4) begin : LABEL_0
    `define pp_6 0
    id_0 <= -1'b0;
  end
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_3,
      id_3,
      id_4,
      id_4,
      id_4
  );
endmodule
