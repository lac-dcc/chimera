// Seed: 226577464
module module_0 (
    input  tri0 id_0,
    output wire id_1
);
  if (id_0) assign id_1 = id_0;
  else begin : LABEL_0
    localparam id_3 = id_3;
  end
endmodule
program module_1 (
    input supply1 id_0,
    input uwire id_1,
    input tri1 id_2,
    output logic id_3,
    input logic id_4,
    input wor id_5,
    input wor id_6,
    input logic id_7,
    input wor id_8,
    input wand id_9
);
  assign id_3 = id_7;
  supply1 id_11;
  always_ff
    if (1) id_3 <= id_4;
    else begin : LABEL_0
      @(posedge id_5 or id_1) $display;
    end
  module_0 modCall_1 (
      id_2,
      id_11
  );
  assign modCall_1.id_1 = 0;
  for (id_12 = -1; 1; id_3 = id_12 !== id_9) begin : LABEL_0
    begin : LABEL_0
      assign id_11 = -1;
      assign id_11 = id_5;
    end
  end
endmodule
