// Seed: 1138309820
module module_0 #(
    parameter id_7 = 32'd38,
    parameter id_8 = 32'd6
);
  generate
    if (1'b0)
      id_1(
          .id_0({~id_2, id_2}),
          .id_1(),
          .id_2(id_2),
          .id_3(id_3[1]),
          .id_4(id_2),
          .id_5(id_3),
          .id_6(id_2 - id_4),
          .id_7(id_5),
          .id_8(1),
          .id_9(id_2),
          .id_10(""),
          .id_11(id_4),
          .id_12(),
          .id_13(id_2),
          .id_14(id_2),
          .id_15(1),
          .id_16(1 | 1),
          .id_17(1),
          .id_18(1)
      );
    else begin : id_6
      defparam id_7.id_8 = id_3[1];
    end
  endgenerate
endmodule
module module_1 (
    output logic   id_0,
    input  logic   id_1,
    output supply0 id_2
);
  logic id_4, id_5;
  and (id_0, id_1, id_4, id_5);
  module_0();
  always @(posedge 1'h0) begin
    id_5 <= 1 | id_1 == 1'd0 * 1 | id_4;
    $display();
    id_5 = 1;
    id_0 = #1 1;
    if (1) begin
      $display(1, 1'h0, id_1, id_1, id_5, id_5 - id_1 * "" + 1, 1);
    end else if (1) id_4 = 1;
  end
  wire id_6;
  wire id_7;
endmodule
