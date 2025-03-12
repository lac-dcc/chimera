// Seed: 3917179644
module module_0 (
    input tri0 id_0,
    input wire id_1,
    input supply0 id_2,
    input tri1 id_3,
    output wand id_4
);
  assign id_4 = 1;
  assign module_1.id_1 = 0;
  bit id_6;
  always id_6 = #id_7 -1;
endmodule
module module_1 (
    input  tri1  id_0,
    inout  logic id_1,
    output uwire id_2,
    input  uwire id_3,
    output logic id_4
);
  integer id_6;
  always @(posedge id_6) begin : LABEL_0
    if ("") id_4 = id_0;
    else id_1 <= "";
  end
  wire id_7;
  always @(posedge -1 + {(1) {id_3}}) id_4 <= id_0 == id_7;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_0,
      id_2
  );
  assign id_4 = id_6;
endmodule
