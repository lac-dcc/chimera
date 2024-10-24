// Seed: 1372647639
`timescale 1 ps / 1ps
module module_0 (
    output id_0,
    output id_1
);
  type_9 id_3 (
      .id_0(1'b0),
      .id_1(1),
      .id_2(id_1)
  );
  logic id_4;
  logic id_5;
  type_10 id_6 (
      .id_0(1),
      .id_1(~id_4),
      .id_2(id_3),
      .id_3(id_0)
  );
  type_11 id_7 (
      .id_0(id_4),
      .id_1("" == 1),
      .id_2(1),
      .id_3(id_6),
      .id_4(1),
      .id_5(id_3),
      .id_6(id_4),
      .id_7(1),
      .id_8(1)
  );
  assign id_4 = 1;
  type_12(
      id_2, id_5, 1
  );
  always @(posedge 1'b0 or posedge id_5) begin : id_8
    id_0 = (1'b0);
    if (1) begin
      SystemTFIdentifier(1);
    end
  end
endmodule
