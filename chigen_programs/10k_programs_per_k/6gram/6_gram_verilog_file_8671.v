// Seed: 2926124059
module module_0 (
    input wor id_0,
    input tri1 id_1,
    input tri id_2,
    input supply1 id_3,
    input supply0 id_4,
    input supply1 id_5,
    input wand id_6,
    input supply1 id_7,
    output tri id_8,
    output wand id_9,
    input supply1 id_10,
    output wand id_11
);
  assign id_9 = 1;
  always @(1 - 1'h0 or posedge 1) begin : LABEL_0
    deassign id_9.id_0;
  end
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input logic id_0,
    output logic id_1,
    input wor id_2,
    output supply0 id_3,
    input wire id_4
);
  always #0
    #1 begin : LABEL_0
      id_1 <= id_0;
    end
  module_0 modCall_1 (
      id_4,
      id_2,
      id_4,
      id_4,
      id_4,
      id_2,
      id_2,
      id_4,
      id_3,
      id_3,
      id_2,
      id_3
  );
endmodule
