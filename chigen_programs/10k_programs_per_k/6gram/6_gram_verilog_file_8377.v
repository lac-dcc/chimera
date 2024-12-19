// Seed: 3887150368
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(id_5 or 1'b0)
    if (id_6) begin : LABEL_0
      id_3 <= 1 == 1 - id_1 ? id_6 : 1;
    end else begin : LABEL_0
      release id_7;
      id_4 = #id_8 id_4;
    end
endmodule
module module_1 (
    output supply1 id_0
);
  assign id_0 = 1;
  wire id_2;
  genvar id_3;
  reg id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_4,
      id_3,
      id_4,
      id_3
  );
  assign modCall_1.id_1 = 0;
  uwire id_5;
  always @(posedge 1'h0 or posedge id_5) begin : LABEL_0
    id_4 <= 1'b0;
  end
endmodule
