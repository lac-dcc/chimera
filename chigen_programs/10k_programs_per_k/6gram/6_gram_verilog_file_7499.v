// Seed: 52684455
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    input wand id_2,
    input wire id_3,
    input wire id_4,
    input supply0 id_5,
    output supply1 id_6,
    output tri0 id_7
);
  initial id_7 = id_3;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    output logic id_0,
    input  wand  id_1,
    output wire  id_2
);
  always @(posedge $display or posedge 1) begin : LABEL_0
    if (id_1)
      if (1'b0) begin : LABEL_0
        id_0 <= 1;
      end
  end
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2
  );
endmodule
