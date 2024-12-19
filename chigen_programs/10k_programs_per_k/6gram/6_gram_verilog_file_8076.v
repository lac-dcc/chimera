// Seed: 1219712862
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
  wire id_5;
  wire id_6;
endmodule
module module_1 (
    input tri0 id_0,
    output supply1 id_1,
    input tri0 id_2,
    input tri1 id_3,
    output logic id_4,
    output logic id_5,
    output tri0 id_6,
    input supply0 id_7
);
  supply1 id_9;
  tri0 id_10;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_10
  );
  always @(posedge ~id_9 or negedge 1'b0) begin : LABEL_0
    id_5 <= 1;
    if (1) begin : LABEL_0
      disable id_11;
      if (id_10) id_4 <= 1'b0;
      else if (1) begin : LABEL_0
        assume (1);
      end
    end else id_4 <= 1;
  end
endmodule
