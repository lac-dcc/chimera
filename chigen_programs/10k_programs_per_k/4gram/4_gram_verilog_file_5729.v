// Seed: 1521793635
module module_0 (
    input supply0 id_0,
    output tri id_1
);
  logic [7:0] id_3, id_4, id_5, id_6;
  logic [-1 'b0 : -1] id_7;
  ;
  assign id_6[-1] = -1 - -1;
endmodule
module module_1 (
    input tri0 id_0,
    output supply1 id_1
);
  logic [7:0] id_3;
  assign id_3[-1] = 1;
  reg id_4 = id_0;
  bit id_5;
  module_0 modCall_1 (
      id_0,
      id_1
  );
  assign modCall_1.id_1 = 0;
  reg id_6;
  always_ff @(posedge 1'd0) id_5 = (1);
  wire id_7;
  always_latch @(negedge id_3) begin : LABEL_0
    if ((1 == -1)) begin : LABEL_1
      id_4 = "";
    end else begin : LABEL_2
      id_4 <= id_6;
      id_6 = 1 == {id_3 > id_7, id_4, id_7};
    end
  end
endmodule
