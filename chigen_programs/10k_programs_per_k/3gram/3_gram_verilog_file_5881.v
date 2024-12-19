// Seed: 757553991
module module_0 ();
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    input logic id_2,
    input uwire id_3,
    input wor   id_4
);
  if (1) begin : LABEL_0
    wor id_6 = id_0 && id_3;
    always @(id_2 - 1);
    uwire id_7 = 1;
    assign id_6 = 1;
    integer id_8 (
        .id_0 (id_7),
        .id_1 (1),
        .id_2 (id_4),
        .id_3 (id_6),
        .id_4 (1),
        .id_5 (id_1),
        .id_6 (id_7 * 1'b0),
        .id_7 (id_2),
        .id_8 (1),
        .id_9 (),
        .id_10(id_6)
    );
  end else begin : LABEL_0
    wire id_9;
  end
  assign id_10 = 1;
  logic id_11;
  module_0 modCall_1 ();
  always @(posedge 1'b0 < id_3) begin : LABEL_0
    id_11 = id_2;
  end
  assign id_10 = id_11;
  assign id_11 = id_10;
  always @(posedge id_0, posedge 1 - !(id_0)) id_10 <= 1;
endmodule
