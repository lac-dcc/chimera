// Seed: 3356463339
module module_0 ();
  always
    repeat (1'd0 != id_1) begin : LABEL_0
      id_1 = 1;
      $display(1, 1, module_0);
    end
  assign module_1.type_14 = 0;
  wire id_2;
endmodule
module module_1 (
    input supply1 id_0,
    output wand id_1,
    input tri1 id_2,
    output logic id_3,
    input wor id_4,
    input supply1 id_5,
    input supply0 id_6,
    input tri1 id_7,
    input logic id_8
);
  always @(1 or posedge id_6) begin : LABEL_0
    if (id_5)
      #(1) begin : LABEL_0
        wait (id_8 - (1'b0));
      end
    else id_3 <= id_8;
  end
  module_0 modCall_1 ();
endmodule
