// Seed: 2780683812
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(1 or negedge 1) begin : LABEL_0$display
    ;
  end
  id_4(
      .id_0(id_2)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  uwire id_5;
  assign id_5 = 1'd0;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_5
  );
  always @(posedge id_5) force id_3 = 1;
endmodule
