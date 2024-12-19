// Seed: 140768837
module module_0;
  reg id_2;
  reg id_3;
  reg id_4 = 1'h0, id_5;
  assign id_5 = {1, id_2};
  supply1 id_6 = 1'd0;
  task id_7;
    begin : LABEL_0
      id_4 <= (1'h0);
    end
  endtask
  wire id_8;
  generate
    initial
      if ("") begin : LABEL_0
        if ({id_4 + 1}) id_7 <= id_3;
      end
  endgenerate
endmodule
module module_1 (
    output wor id_0,
    input wor id_1,
    output uwire id_2,
    input uwire id_3,
    input uwire id_4,
    input supply0 id_5,
    output tri id_6,
    output tri id_7,
    input uwire id_8,
    output uwire id_9,
    output tri id_10,
    input wand id_11,
    input wire id_12,
    output wor id_13
);
  assign id_6 = 1;
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0;
endmodule
