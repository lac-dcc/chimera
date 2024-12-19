// Seed: 1267473402
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_1 = id_2;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1 = 1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_3,
      id_4
  );
endmodule
module module_2 #(
    parameter id_7 = 32'd26,
    parameter id_8 = 32'd86
) (
    output logic id_0,
    input wor id_1,
    output supply1 id_2
);
  always @(*) begin : LABEL_0
    if (id_1) begin : LABEL_0
      id_0#(.id_1(id_1 & id_1)) <= 1;
      if (1 < id_1) disable id_4;
      else begin : LABEL_0
        assert (1);
        for (id_2 = id_4; 1; id_2 = id_4) #1;
        disable id_5;
      end
    end
  end
  wire id_6;
  defparam id_7.id_8 = 1;
endmodule
module module_3 (
    input supply0 id_0,
    input supply1 id_1,
    output supply0 id_2,
    input wor id_3,
    input wire id_4,
    output logic id_5,
    input supply1 id_6,
    input wor id_7,
    input supply1 id_8,
    input wire id_9,
    input uwire id_10,
    input uwire id_11,
    output tri id_12
);
  always id_5 <= #1 1;
  module_2 modCall_1 (
      id_5,
      id_11,
      id_2
  );
  assign modCall_1.type_1 = 0;
endmodule
