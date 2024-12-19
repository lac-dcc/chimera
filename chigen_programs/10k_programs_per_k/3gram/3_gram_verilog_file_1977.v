// Seed: 1028085039
module module_0;
  always @(posedge id_1) @(posedge 1);
  assign module_2.type_7 = 0;
endmodule
module module_1 (
    output logic id_0
);
  id_2 :
  assert property (@(posedge 1) id_2)
  else begin : LABEL_0
    id_0 <= id_2;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    output tri1  id_0,
    output wire  id_1,
    input  logic id_2
);
  assign id_0 = 1 - 1;
  logic id_4 = id_2;
  initial begin : LABEL_0
    begin : LABEL_0
      if (id_4) id_4 = #1 id_2;
    end
  end
  module_0 modCall_1 ();
endmodule
