// Seed: 2711849714
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  id_5(
      .id_0(~id_1), .id_1(1), .id_2(1), .id_3(1), .id_4(1), .id_5(id_3), .id_6(id_3), .id_7(id_2)
  ); id_7(
      .id_0(), .id_1(1'b0 + 1), .id_2(id_4), .id_3(1)
  );
  always id_3 <= #id_3  !id_3;
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
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(posedge id_3 or id_4) begin : LABEL_0
    if ((1 == {id_3, id_3, 1})) $display(1, 1'h0);
    else id_2 <= 1;
  end
  module_0 modCall_1 (
      id_1,
      id_6,
      id_2,
      id_1
  );
endmodule
