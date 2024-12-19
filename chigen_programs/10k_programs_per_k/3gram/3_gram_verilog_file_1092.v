// Seed: 4268389994
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  wire id_3;
  assign module_2.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_2,
      id_1
  );
endmodule
module module_2 ();
  initial begin : LABEL_0
    id_1 <= #1 1;
    if (id_1) begin : LABEL_0
      id_1 <= 1;
    end else if (id_1++) begin : LABEL_0
      #1 begin : LABEL_0
        if (1) id_1 = #1 id_1;
        if (1'b0) $display;
      end
    end else disable id_2;
  end
  module_0 modCall_1 (
      id_2,
      id_2
  );
endmodule
