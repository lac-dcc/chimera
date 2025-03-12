// Seed: 1985051426
module module_0 (
    input supply1 id_0,
    output tri0 id_1
);
  assign module_1.id_1 = 0;
  wire id_3;
  assign module_2.id_7 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    input  supply1 id_1,
    input  uwire   id_2,
    output logic   id_3
);
  timeunit 1ps;
  always_ff @(negedge id_1) begin : LABEL_0
    id_3 <= #1 id_2;
  end
  module_0 modCall_1 (
      id_2,
      id_0
  );
endmodule
module module_2 #(
    parameter id_3 = 32'd21
) (
    input supply0 id_0,
    input tri id_1,
    input wand id_2,
    input uwire _id_3,
    output wor id_4,
    input tri0 id_5,
    input wand id_6,
    output wor id_7,
    output wor id_8,
    input supply1 id_9,
    output uwire id_10
);
  wire [id_3 : -1] id_12;
  module_0 modCall_1 (
      id_0,
      id_7
  );
endmodule
