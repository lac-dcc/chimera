// Seed: 3250094586
module module_0 (
    input wand id_0,
    output wand id_1,
    input supply0 id_2,
    output wor id_3
);
  assign id_3 = 1 - (id_0);
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    output wand id_0,
    input tri id_1,
    input tri1 id_2,
    output logic id_3,
    input wor id_4,
    output supply1 id_5
);
  always
    if (1'd0) begin : LABEL_0
      if ({1{1}}) begin : LABEL_0
        @(posedge 1'b0) id_3 <= 1;
      end
    end else cover (id_2);
  id_7(
      .id_0(""), .id_1(id_1)
  );
  module_0 modCall_1 (
      id_4,
      id_5,
      id_4,
      id_0
  );
  always begin : LABEL_0
    #(id_4) @(*);
  end
  xnor primCall (id_0, id_1, id_4, id_7);
endmodule
