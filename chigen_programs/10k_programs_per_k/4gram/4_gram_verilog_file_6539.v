// Seed: 3242777494
module module_0 (
    output tri1 id_0,
    input tri1 id_1,
    input tri id_2,
    output tri1 id_3,
    output wire id_4,
    output uwire id_5,
    input wor id_6,
    input wire id_7,
    input tri0 id_8,
    input supply0 id_9,
    output wand id_10,
    output uwire id_11
);
  initial begin
    $display(1, (id_8));
  end
endmodule
module module_1 (
    output logic id_0,
    input logic id_1,
    output tri0 id_2,
    input tri id_3,
    input tri id_4,
    input wor id_5,
    output supply0 id_6,
    output wor id_7
);
  always @(negedge id_1) id_0 = #1 id_1;
  module_0(
      id_2, id_5, id_5, id_2, id_6, id_6, id_5, id_5, id_3, id_3, id_2, id_7
  );
  assign id_6 = id_3 * (id_1);
endmodule
