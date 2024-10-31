// Seed: 1939524091
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_4;
  wire id_5;
  assign id_2 = 1'b0;
  wire id_6;
  wire id_7;
  wire id_8;
  wire id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_5 = 1;
  module_0(
      id_4, id_4, id_5
  ); id_6(
      .id_0(1'b0), .id_1(id_2), .id_2(), .id_3(id_2), .id_4(id_7), .id_5(id_7), .id_6(1 + 1)
  );
  generate
    if (id_5) begin : id_8
      assign {1'b0, 1, id_3} = 1;
      wire id_9;
    end else begin
      assign id_3 = id_5;
    end
  endgenerate
endmodule
