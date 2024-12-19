// Seed: 1343878296
module module_0;
  generate
    if (1) begin : LABEL_0
      always @(negedge 1) begin : LABEL_0
        if ("") begin : LABEL_0
          id_1 <= 1;
        end
      end
    end else begin : LABEL_0
      id_2(
          .id_0(1),
          .id_1(),
          .id_2(id_3),
          .id_3(1),
          .id_4(!id_4),
          .id_5(id_3),
          .id_6(id_3),
          .id_7(1'h0 & 1)
      );
    end
  endgenerate
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    output supply0 id_2,
    input wor id_3,
    output tri1 id_4
);
  initial begin : LABEL_0$display
    ;
  end
  module_0 modCall_1 ();
endmodule
