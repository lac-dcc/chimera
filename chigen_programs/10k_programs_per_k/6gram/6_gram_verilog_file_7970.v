// Seed: 704529009
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wand id_4 = 1'b0;
  reg  id_5;
  wire id_6;
  generate
    for (id_7 = id_7; 1; id_6 = id_6) begin : LABEL_0
      always @(~id_5 == 1 or posedge 1) begin : LABEL_0
        id_2 <= id_5;
      end
    end
  endgenerate
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
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  always @(negedge id_5) begin : LABEL_0
    begin : LABEL_0
      id_5 <= 1;
      id_5 <= id_2;
    end
  end
  module_0 modCall_1 (
      id_3,
      id_5,
      id_3
  );
endmodule
