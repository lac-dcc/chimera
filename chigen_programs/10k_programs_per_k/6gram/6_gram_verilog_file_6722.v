// Seed: 1635476910
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input wire id_2,
    input tri id_3,
    output tri0 id_4,
    input supply0 id_5,
    output supply1 id_6,
    input supply0 id_7,
    input supply1 id_8,
    output tri0 id_9
);
  assign id_9 = id_1;
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input supply1 id_1,
    input supply1 id_2,
    output tri1 id_3,
    input wor id_4,
    input tri1 id_5,
    input logic id_6,
    output wire id_7
);
  assign id_7 = 1 || id_0 ? id_4 : 1;
  reg  id_9;
  wire id_10;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_4,
      id_1,
      id_3,
      id_5,
      id_3,
      id_1,
      id_1,
      id_7
  );
  wire id_11;
  always @(negedge id_6) begin : LABEL_0
    begin : LABEL_0
      id_9 = #id_12 id_6;
    end
    fork
      #1 id_7 = !id_5;
    join
  end
endmodule
