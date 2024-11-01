// Seed: 2788837660
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  output wire id_1;
  tri1 id_4;
  id_5(
      .id_0(id_4),
      .id_1(1 == 1'b0 - id_2),
      .id_2(id_2),
      .id_3(id_2),
      .id_4(id_1),
      .id_5(1'd0),
      .id_6(1 < id_3),
      .id_7({1'd0{1}}),
      .id_8(id_2),
      .id_9(id_4 & 1'b0),
      .id_10(1 < 1),
      .id_11(id_1),
      .id_12(1)
  );
  wire id_6;
endmodule
module module_1 #(
    parameter id_10 = 32'd94,
    parameter id_11 = 32'd97,
    parameter id_13 = 32'd99,
    parameter id_14 = 32'd43
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(posedge id_6) begin
    id_1 <= id_2;
  end
  generate
    if (id_9) begin
      defparam id_10.id_11 = id_9; id_12(
          .id_0(id_5),
          .id_1(1'b0),
          .id_2(id_10),
          .id_3(1),
          .id_4(id_6 < id_2),
          .id_5(1),
          .id_6(1),
          .id_7(id_10),
          .id_8(1'b0)
      );
    end else begin
      defparam id_13.id_14 = 1;
    end
  endgenerate
  and (id_5, id_1, id_6, id_8, id_9, id_7, id_4);
  module_0(
      id_4, id_4, id_5
  );
endmodule
