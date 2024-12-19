// Seed: 1232808316
module module_0 (
    output wor id_0,
    output uwire id_1,
    input wire id_2,
    input uwire id_3,
    input supply0 id_4,
    input wire id_5,
    output wand id_6,
    input supply0 id_7,
    output supply1 id_8
);
  always #1 begin : LABEL_0
    id_0 = id_7 - 1;
  end
  assign module_1.type_7 = 0;
endmodule
module module_1 (
    input logic id_0,
    output logic id_1,
    output tri id_2,
    input supply0 id_3
);
  always_latch @(id_3 or posedge 1) begin : LABEL_0
    if (id_0) begin : LABEL_0
      if (1'b0) id_1 <= id_0;
    end
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3,
      id_2,
      id_3,
      id_2
  );
endmodule
