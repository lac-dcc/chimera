// Seed: 2050874214
module module_0;
  id_1(
      .id_0(1'b0 < 1), .id_1(1), .id_2({1, 1}), .id_3({id_2, id_2} | id_2)
  );
endmodule
module module_1 (
    output logic id_0,
    output logic id_1,
    input supply0 id_2,
    output tri0 id_3
);
  always @(negedge 1'b0) begin : LABEL_0
    id_0 <= 1;
  end
  always @(posedge id_2)
    while (id_2)
      @(negedge 1) begin : LABEL_0
        id_1 <= 1;
      end
  module_0 modCall_1 ();
endmodule
