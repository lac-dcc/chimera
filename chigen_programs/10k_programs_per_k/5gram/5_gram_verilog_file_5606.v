// Seed: 1460729090
module module_0;
  assign id_1 = id_1;
  module_2 modCall_1 ();
endmodule
module module_1 (
    output tri1  id_0,
    output logic id_1
);
  wand id_3 = id_3, id_4, id_5;
  wire id_6;
  module_0 modCall_1 ();
  wire id_7;
  always @(1'b0 or posedge id_5)
    if (id_5) begin : LABEL_0
      id_1 <= 1'b0;
    end
endmodule
module module_2;
  wire id_2;
  assign module_3.id_4 = 0;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  always @* id_4 <= 1;
  module_2 modCall_1 ();
  always @(1'h0 or 1 & 1) begin : LABEL_0
    id_7 = 1;
    begin : LABEL_0
      id_7 += "";
      id_7 = id_4;
    end
  end
endmodule
