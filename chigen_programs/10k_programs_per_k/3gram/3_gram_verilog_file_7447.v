// Seed: 102709313
module module_0;
  string id_2;
  assign id_2 = "";
  tri0 id_3 = id_1 == 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_4 = !id_2 == id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = (id_4);
  module_0 modCall_1 ();
  always @(posedge 1) begin : LABEL_0
    if (1) begin : LABEL_0
      #1;
    end
  end
  always @(posedge 1) begin : LABEL_0
    id_1 = id_2;
  end
endmodule
