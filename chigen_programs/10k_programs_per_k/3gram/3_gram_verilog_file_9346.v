// Seed: 2399666007
module module_0 (
    input wire id_0,
    input supply1 id_1,
    output supply1 id_2
);
  initial begin : LABEL_0
    #(1) begin : LABEL_0$display
      ;
    end
  end
endmodule
module module_1 (
    output logic   id_0,
    input  supply0 id_1,
    output supply0 id_2
);
  supply1 id_4;
  always @(id_4, posedge 1'b0) begin : LABEL_0
    if (id_4)
      @(posedge id_1) begin : LABEL_0
        id_4 = 1 & 1'h0;
      end
    else id_0 = #id_5 1;
  end
  module_0 modCall_1 (
      id_4,
      id_4,
      id_2
  );
  assign modCall_1.type_1 = 0;
endmodule
