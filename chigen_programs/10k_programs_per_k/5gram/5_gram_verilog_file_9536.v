// Seed: 4237937792
module module_0 (
    output uwire id_0,
    output tri id_1,
    output tri0 id_2,
    input tri1 id_3,
    input supply1 id_4,
    output tri0 id_5,
    output logic id_6,
    input wor id_7,
    input tri id_8,
    output wire id_9,
    input tri0 id_10,
    input tri1 id_11,
    input wire id_12,
    input wand id_13,
    input tri id_14
);
  always @(posedge id_11) id_6 = -1;
  assign module_1.id_3 = 0;
  timeunit 1ps;
endmodule
module module_1 (
    input wand id_0,
    input uwire id_1,
    input wor id_2,
    output supply1 id_3,
    output logic id_4
);
  always_comb @(posedge "" == -1 or posedge id_1) begin : LABEL_0
    #1 id_4 = id_2;
  end
  xor primCall (id_3, id_0, id_1, id_2);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_0,
      id_0,
      id_3,
      id_4,
      id_0,
      id_1,
      id_3,
      id_2,
      id_1,
      id_0,
      id_0,
      id_0
  );
endmodule
