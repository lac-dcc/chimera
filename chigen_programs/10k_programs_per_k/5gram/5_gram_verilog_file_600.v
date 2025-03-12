// Seed: 1194616882
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic id_4;
  ;
  always_ff @(*)
    if (1) begin : LABEL_0
      disable id_5#(
          .id_6(-1),
          .id_7(-1)
      );
    end
  always @(posedge 1)
    if (1 == -1) begin : LABEL_1
      id_4 <= id_4 - 1;
    end
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
  inout supply1 id_6;
  input wire id_5;
  input wire id_4;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_6
  );
  assign modCall_1.id_5 = 0;
  inout uwire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3 = -1;
  assign id_6 = id_2 ? ~id_4 : -1'h0 ? id_3 - 1 : id_1;
  always force id_1 = 1;
endmodule
