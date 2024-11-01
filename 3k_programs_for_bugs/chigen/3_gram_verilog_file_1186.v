// Seed: 3002049638
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0(
      id_1, id_1, id_1
  );
  generate
    if (0) begin
      always @(posedge id_4) begin
        id_3 <= id_4;
      end
    end else begin : id_6
      assign id_2 = id_4;
    end
  endgenerate
endmodule
