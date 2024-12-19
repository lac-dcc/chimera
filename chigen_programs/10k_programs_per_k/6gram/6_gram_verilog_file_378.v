// Seed: 1248866093
module module_0;
  wire id_1;
  wire id_2;
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
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  always @(posedge 1 or negedge id_2) begin : LABEL_0
    begin : LABEL_0
      cover (1 || 1);
      id_3 = 1;
    end
  end
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_8;
  module_0 modCall_1 ();
  initial begin : LABEL_0
    assign id_4 = id_6;
    if (1)
      if (id_6 && 1'h0) id_3 <= id_6;
      else begin : LABEL_0
        id_3 = 1'b0;
        id_4 <= 1;
      end
    else begin : LABEL_0
      id_4 = 1;
    end
  end
endmodule
