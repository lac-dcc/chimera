// Seed: 2133108373
module module_0 (
    output logic id_0
);
  always @(posedge 1) begin : LABEL_0
    id_0 = 1;
  end
  assign module_1.id_4 = 0;
  reg id_2 = 1;
  always id_0 <= #1 1;
  always @(posedge 1 * (id_2 || id_2)) begin : LABEL_0
    id_0 <= id_2;
  end
endmodule
module module_1 (
    output supply0 id_0,
    output logic id_1,
    output supply0 id_2,
    input uwire id_3,
    input logic id_4,
    input logic id_5,
    output supply1 id_6,
    output supply1 id_7,
    input wor id_8,
    output logic id_9
);
  always @(negedge id_8) begin : LABEL_0
    wait (1);
    $display(id_3, 1, 1);
    id_1 <= id_4;
  end
  module_0 modCall_1 (id_1);
  tri0 id_11 = 1 ? id_8 : (id_8 > 1);
  assign id_9 = 1 ? id_5 : ((id_8) && id_11) ? id_5 : 1;
  assign id_9 = id_4;
  wire id_12;
endmodule
