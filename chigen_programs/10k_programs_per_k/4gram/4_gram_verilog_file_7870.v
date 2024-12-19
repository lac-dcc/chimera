// Seed: 1291011291
module module_0 (
    output tri0 id_0,
    input  tri1 id_1,
    input  wor  id_2,
    input  wire id_3,
    input  tri0 id_4
);
  wire id_6;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output tri   id_0,
    output tri   id_1,
    output logic id_2,
    input  wor   id_3,
    input  uwire id_4,
    output logic id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_4,
      id_3,
      id_3
  );
  always @(posedge 1 or posedge 1)
    if (1) begin : LABEL_0
      id_5 <= 1;
    end else begin : LABEL_0
      id_5 = #1 1;
      id_2 <= 1;
    end
endmodule
