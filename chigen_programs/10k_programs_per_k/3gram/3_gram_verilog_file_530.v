// Seed: 1699692214
module module_0 (
    output supply0 id_0,
    output wand id_1,
    output supply1 id_2,
    input supply0 id_3,
    output supply1 id_4,
    input uwire id_5,
    input supply0 id_6
);
  reg id_8;
  initial
    while (id_6) begin : LABEL_0
      id_8 <= 1;
      $display(id_6 !== 1, 1'b0);
      #1;
    end
  id_9 :
  assert property (@(posedge 1) id_8)
  else assume ({1'b0{id_9}});
  wire id_10 = 1'h0;
  wire id_11;
  always @(posedge id_9) id_9 <= 1;
endmodule
module module_1 (
    output wor id_0,
    input supply0 id_1
);
  task id_3;
  endtask
  assign id_3 = 1'b0;
  wire id_4;
  tri1 id_5;
  assign id_5 = 1;
  wire id_6;
  nand primCall (id_0, id_4, id_5, id_3);
  assign id_0 = 1'd0;
  wire id_7, id_8;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.type_1 = 0;
endmodule
