// Seed: 2726598244
module module_0;
  string id_2 = "";
  wire   id_3;
  assign module_2.id_3 = 0;
  tri1 id_4, id_5;
  wire id_6;
  id_7(
      .id_0(id_5), .id_1(1), .id_2(id_8), .id_3(1 !=? id_5)
  );
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    input logic   id_2
);
  wire id_4;
  reg  id_5;
  module_0 modCall_1 ();
  assign modCall_1.id_4 = 0;
  always id_5 <= #id_0 id_5;
  always force id_4 = id_2;
endmodule
module module_2 (
    input  tri0  id_0,
    output logic id_1
);
  always @(1 or negedge 1) begin : LABEL_0
    id_1 <= 1;
  end
  assign id_1 = id_0 ? 1 : id_0 ^ 1;
  reg id_3;
  always @* id_1 <= 1'd0;
  assign id_3 = 1;
  always id_3 <= #1 id_3;
  module_0 modCall_1 ();
  assign id_1 = 1;
  always @(1) $display;
endmodule
