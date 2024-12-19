// Seed: 2939955072
module module_0;
  wire id_1;
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    output logic   id_0,
    input  supply0 id_1
);
  supply1 id_3;
  initial begin : LABEL_0
    id_3 = 1;
    begin : LABEL_0
      id_0 <= id_3 + 1'b0;
    end
  end
  module_0 modCall_1 ();
endmodule
module module_2;
  assign id_1 = id_1;
  wor id_2;
  module_0 modCall_1 ();
  generate
    for (id_3 = id_1[1]; id_3; id_3 = id_2) begin : LABEL_0
      always @(posedge 1 or id_2) begin : LABEL_0
        fork
          #1;
        join
      end
    end
  endgenerate
endmodule
