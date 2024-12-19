// Seed: 2422884243
module module_0 ();
  reg id_2;
  task automatic id_3;
    begin : LABEL_0
      id_2 <= #1 1'b0;
    end
  endtask
  wand id_4;
  initial begin : LABEL_0
    id_3 = !id_4;
  end
endmodule
module module_1 (
    output tri1 id_0,
    output wor  id_1
);
  module_0 modCall_1 ();
  assign modCall_1.type_5 = 0;
  reg id_3, id_4;
  always @(posedge id_4) begin : LABEL_0
    id_0 = 1 - 1;
  end
  always @({id_4,
    1
  } or posedge id_4)
  begin : LABEL_0
    id_3 <= id_4;
  end
endmodule
