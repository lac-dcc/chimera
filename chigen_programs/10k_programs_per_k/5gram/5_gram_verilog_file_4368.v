// Seed: 1297626487
module module_0;
  wire id_1;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output logic id_0,
    output wire id_1,
    input supply0 id_2,
    input tri1 id_3,
    output wand id_4,
    input supply1 id_5
);
  wire id_7;
  always_latch @(posedge 1 or posedge 1 != id_2) id_4 = 1'b0 - id_2;
  always @(posedge {id_2{1 + id_5 - 1}})
    if (1) begin : LABEL_0
      id_0 <= $display(id_4++);
    end
  wire id_8;
  module_0 modCall_1 ();
endmodule
