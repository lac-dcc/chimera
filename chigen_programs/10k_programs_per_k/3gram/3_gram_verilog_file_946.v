// Seed: 1942578325
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  reg id_3;
  always @(posedge 1) id_3 <= id_3;
  module_2 modCall_1 ();
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_3
  );
endmodule
module module_2 ();
  assign id_1 = 1'b0;
  reg id_2;
  assign module_0.type_5 = 0;
  assign id_2 = id_1;
  assign id_1 = 1;
  reg id_3;
  always @(posedge 1) begin : LABEL_0
    if (id_1) id_3 = #1 1'b0;
    else begin : LABEL_0
      id_2 <= id_3++;
    end
  end
endmodule
