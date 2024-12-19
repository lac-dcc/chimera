// Seed: 201856227
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_5;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input tri id_0,
    input wire id_1,
    input supply1 id_2
);
  always @(posedge 1) begin : LABEL_0
    if (id_1) begin : LABEL_0
      #1 id_4 = 1'b0;
      id_4 = 1;
    end else begin : LABEL_0
      if (id_2) id_5[""] <= #id_5 1'd0;
      else id_5[1] <= 1;
    end
  end
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
