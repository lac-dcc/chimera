// Seed: 891824268
module module_0 (
    output uwire id_0,
    output logic id_1
);
  wire id_3 = id_3;
  tri0 id_4;
  always @(*) begin : LABEL_0
    fork
      #1;
    join
    id_1 <= id_4 !=? "";
  end
  wire id_5;
endmodule
module module_1 (
    output logic id_0,
    input  logic id_1,
    output logic id_2,
    output tri   id_3
);
  logic [7:0] id_5;
  assign id_2 = 1;
  wire id_6;
  assign id_2 = 1;
  always @(id_5 or $display)
    if (id_5[1'b0] & id_1) id_0 <= 1'd0 !=? "";
    else begin : LABEL_0
      id_0 <= 1;
      id_2 <= id_1;
      id_0 <= 1;
    end
  module_0 modCall_1 (
      id_3,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
