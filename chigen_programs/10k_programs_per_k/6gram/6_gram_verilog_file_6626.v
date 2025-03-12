// Seed: 2740801086
module module_0 (
    input uwire id_0,
    input wor id_1,
    output logic id_2,
    input supply1 id_3,
    output tri id_4,
    input wor id_5,
    output tri0 id_6,
    output tri1 id_7,
    input wand id_8
);
  assign module_1.id_6 = 0;
  assign id_4 = (id_0);
  assign id_6 = id_0;
  always @(1'h0 or negedge 1) begin : LABEL_0
    id_2 <= id_1;
  end
endmodule
module module_1 (
    output logic id_0,
    output wor id_1,
    input tri1 id_2,
    output supply0 id_3,
    output supply0 id_4,
    input supply0 id_5,
    input wor id_6,
    inout logic id_7,
    output tri1 id_8,
    output wand id_9
);
  logic id_11 = id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_7,
      id_2,
      id_9,
      id_2,
      id_8,
      id_8,
      id_5
  );
  wire id_12;
  always @(-id_11 or posedge 1) begin : LABEL_0
    if (1 | 1) begin : LABEL_1
      id_7 <= -1;
    end else id_0 <= -1;
  end
endmodule
