// Seed: 161962204
module module_0 (
    input  supply1 id_0,
    input  supply0 id_1,
    output supply1 id_2
);
  assign id_2 = 1;
  module_2 modCall_1 ();
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input wor id_0,
    input tri0 id_1,
    output supply1 id_2,
    input wire id_3,
    output wor id_4,
    output supply0 id_5
);
  always #(1) force id_5 = 1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2
  );
  assign id_5 = id_1;
endmodule
module module_2;
  wire id_1;
  assign module_3.id_1 = 0;
  assign module_0.id_0 = 0;
endmodule
module module_3 (
    output tri0  id_0,
    output logic id_1
);
  always @(1) begin : LABEL_0
    id_1 <= 1;
    if (1) begin : LABEL_0
      #1 id_0 = id_3;
    end else begin : LABEL_0
      id_1 <= 1 == ~id_4;
      id_1 <= id_4;
    end
  end
  module_2 modCall_1 ();
endmodule
