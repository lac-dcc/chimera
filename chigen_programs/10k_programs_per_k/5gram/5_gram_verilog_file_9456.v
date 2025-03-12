// Seed: 1068863380
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  assign module_1.id_0 = 0;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_5;
endmodule
module module_1 #(
    parameter id_0 = 32'd10
) (
    input supply1 _id_0
);
  wire id_2 = id_0;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2
  );
  reg [id_0 : ""] id_3 = id_3;
  always @* begin : LABEL_0
    if (-1 == 1) begin : LABEL_1
      if (1) id_3 <= #1 id_3++;
    end
  end
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4,
      id_4
  );
  inout wire id_2;
  input wire id_1;
endmodule
