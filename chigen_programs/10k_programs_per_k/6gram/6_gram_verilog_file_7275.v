// Seed: 1383689619
module module_0 (
    input supply1 id_0,
    output supply0 id_1,
    output supply0 id_2,
    input supply1 id_3,
    output wire id_4
);
  always @(posedge id_0) begin : LABEL_0
    fork
      begin : LABEL_0
      end
      #1;
    join
  end
endmodule
module module_1 (
    input supply0 id_0,
    input supply0 id_1,
    output supply1 id_2,
    output wor id_3,
    input logic id_4,
    input wor id_5,
    output wire id_6
);
  wire id_8;
  wire id_9;
  reg id_10, id_11;
  assign id_10 = 1;
  initial begin : LABEL_0
    id_11 <= id_4;
  end
  module_0 modCall_1 (
      id_0,
      id_6,
      id_6,
      id_1,
      id_6
  );
endmodule
