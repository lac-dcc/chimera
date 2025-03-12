// Seed: 593150021
module module_0 (
    output logic id_0,
    input supply1 id_1,
    input wor id_2
);
  initial forever if (1) id_0 <= id_1;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    output tri id_1,
    input tri id_2,
    output logic id_3
);
  logic [-1 : 1] id_5;
  ;
  initial begin : LABEL_0
    id_5 <= 1'b0;
    if (-1) begin : LABEL_1
      if (1) begin : LABEL_2
        id_3 <= id_5;
      end
    end else begin : LABEL_3
      assume (id_5) $clog2(1);
      ;
    end
  end
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2
  );
endmodule
