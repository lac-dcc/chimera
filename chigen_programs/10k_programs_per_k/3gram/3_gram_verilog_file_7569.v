// Seed: 2671596025
module module_0;
  wire id_1;
  wire id_2;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output tri id_0,
    input supply1 id_1,
    input tri0 id_2,
    input uwire id_3,
    input tri0 id_4
    , id_6
);
  assign id_6 = 1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    input  logic id_0,
    input  wand  id_1,
    input  logic id_2,
    output logic id_3
);
  logic id_5 = id_2;
  always @(negedge id_0) begin : LABEL_0
    id_5 <= id_0;
  end
  always_ff @(id_1) cover ('b0);
  wire id_6;
  initial begin : LABEL_0
    #1 id_5 = id_5 ^ id_1;
  end
  tri id_7;
  always @(posedge ~{id_0, 1}) id_3 <= 1;
  module_0 modCall_1 ();
  assign id_7 = 1;
endmodule
