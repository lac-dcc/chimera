// Seed: 2162633043
module module_0 (
    input wor id_0,
    input supply0 id_1,
    input supply0 id_2,
    input uwire id_3,
    input uwire id_4,
    input wire id_5,
    input uwire id_6,
    input tri0 id_7,
    input wand id_8,
    input supply1 id_9,
    output logic id_10
);
  always @(negedge id_2) id_10 = -1'b0;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input  wor   id_0,
    input  uwire id_1,
    input  uwire id_2,
    output logic id_3,
    input  uwire id_4,
    input  wor   id_5
);
  assign id_3 = id_0;
  assign id_3 = id_4;
  always @("", posedge 1) begin : LABEL_0
    if (-1'b0 - -1'b0)
      if (1 || 1 + 1) begin : LABEL_1
        id_3 <= id_0;
      end
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_2,
      id_4,
      id_4,
      id_2,
      id_5,
      id_3
  );
  initial begin : LABEL_2
    id_3 <= 1'h0;
    $signed(72);
    ;
    if (1) begin : LABEL_3
      id_3 = id_1;
    end else id_3 = ~id_4;
  end
endmodule
