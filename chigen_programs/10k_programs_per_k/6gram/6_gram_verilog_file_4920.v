// Seed: 3694696742
module module_0 (
    output logic id_0,
    input  logic id_1,
    output wand  id_2
);
  always @(posedge 1 or negedge 1) begin : LABEL_0
    id_0 <= id_1;
    id_0 <= 1;
  end
  tri0 id_4;
  id_5(
      .id_0(1), .id_1(1 != id_4), .id_2(1'd0)
  );
endmodule
module module_1 (
    input logic id_0,
    output tri id_1,
    output logic id_2,
    output supply0 id_3
);
  logic id_5 = id_0;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_3
  );
  always @(posedge id_5 or negedge id_0) begin : LABEL_0
    wait (id_5);
    repeat (id_0) id_2 = #1 id_5;
  end
endmodule
