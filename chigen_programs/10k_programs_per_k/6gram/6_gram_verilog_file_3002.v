// Seed: 2066620430
module module_0;
  always @(posedge 1) $display(id_1);
endmodule
module module_1 (
    input tri0 id_0,
    output logic id_1,
    input tri0 id_2,
    input tri1 id_3,
    input wire id_4,
    input supply0 id_5,
    input tri1 id_6,
    input wand id_7,
    input wor id_8,
    output supply0 id_9,
    output wire id_10
);
  nor primCall (id_1, id_12, id_2, id_3, id_4, id_5, id_6, id_7, id_8);
  wire id_12;
  always @(1 or posedge 1) begin : LABEL_0
    id_1 <= 1;
  end
  module_0 modCall_1 ();
endmodule
