// Seed: 126856034
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1 = 1;
endmodule
module module_1;
  assign id_1 = 1;
  module_0(
      id_1, id_1, id_1, id_1, id_1
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  generate
    for (id_6 = 1; 1; id_2 = id_3) begin : id_7
      wire id_8 = id_4;
    end
  endgenerate
  module_0(
      id_4, id_6, id_3, id_4, id_6
  );
  wire  id_9;
  uwire id_10;
  or (id_1, id_3, id_6, id_5, id_4);
  always @(*) begin
    if (id_10) begin
      id_1 <= 1;
      id_2 = id_9;
    end
  end
endmodule
