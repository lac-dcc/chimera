// Seed: 3417004583
module module_0 (
    output tri0 id_0,
    input wor id_1,
    input wand id_2,
    input tri0 id_3,
    output wand id_4,
    input supply0 id_5,
    output supply0 id_6,
    output logic id_7,
    input wire id_8,
    input supply0 id_9,
    input wand id_10,
    input uwire id_11,
    input uwire id_12,
    output logic id_13
);
  always @(posedge {1'b0{1}}) begin : LABEL_0
    $signed(78);
    ;
    if (1 && 1) begin : LABEL_1
      id_13 <= -1 - id_12;
    end else begin : LABEL_2
      id_7 <= id_9 - 1'b0;
    end
  end
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input wire id_1,
    input tri0 id_2,
    input tri1 id_3,
    input wand id_4,
    inout uwire id_5,
    input wire id_6,
    input supply0 id_7,
    input tri1 id_8,
    output tri id_9,
    output supply1 id_10,
    input uwire id_11,
    output logic id_12,
    input tri0 id_13,
    output supply0 id_14,
    output tri id_15
);
  logic id_17;
  module_0 modCall_1 (
      id_14,
      id_11,
      id_3,
      id_5,
      id_15,
      id_5,
      id_10,
      id_12,
      id_2,
      id_7,
      id_4,
      id_2,
      id_3,
      id_12
  );
  always @(posedge id_11) begin : LABEL_0
    id_12 <= id_2;
  end
endmodule
