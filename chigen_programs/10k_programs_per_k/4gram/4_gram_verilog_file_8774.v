// Seed: 1336558054
module module_0;
  wire id_2, id_3, id_4, id_5, id_6;
  wire id_7;
  assign id_1 = id_6 == id_3;
endmodule
module module_1 (
    input wire id_0,
    output logic id_1,
    input uwire id_2,
    input tri id_3,
    output supply1 id_4,
    input tri id_5,
    output tri0 id_6
);
  module_0 modCall_1 ();
  always @(posedge 1'b0 or id_5)
    if (1 < 1) begin : LABEL_0
      id_1 <= 1;
    end
  wire id_8;
endmodule
module module_2 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  always_ff @(negedge id_2) begin : LABEL_0
    fork
      id_1 <= 1;
      id_2 <= id_2;
    join
  end
  assign id_2 = id_2;
  always @(posedge 1'b0, posedge id_2) begin : LABEL_0
    id_2 <= #1 1'b0;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule
