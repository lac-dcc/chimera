// Seed: 2933293139
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  always @(negedge id_3 - 1 or posedge 1) begin : LABEL_0
    id_2 = id_3;
    id_2 = #id_4 id_3;
    for (id_2 = 1; 1; id_2 = id_3 == module_0) begin : LABEL_0
      id_1 <= id_4;
      disable id_5;
    end
  end
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    id_1
);
  inout wire id_1;
  always @(posedge id_1) begin : LABEL_0
    id_1 <= 1 ? id_1 - 1 : 1;
  end
  reg id_2;
  assign id_1 = id_2;
  wire id_3, id_4, id_5;
  module_0 modCall_1 (
      id_1,
      id_1
  );
endmodule
