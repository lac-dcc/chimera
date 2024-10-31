// Seed: 4234488388
module module_0 #(
    parameter id_3 = 32'd80,
    parameter id_4 = 32'd56
) (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  generate
    if (id_2) begin
      defparam id_3.id_4 = 1 + 1'b0;
    end else begin : id_5
      wire id_6;
    end
  endgenerate
  id_7(
      .id_0(""), .id_1(id_1), .id_2(!1'b0), .id_3(1)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wand id_7;
  assign {id_7 < 1, id_4} = id_4 != 1;
  module_0(
      id_4, id_1
  );
endmodule
