// Seed: 3449625557
module module_0 (
    input wire id_0,
    output tri0 id_1,
    input wand id_2,
    input supply0 id_3,
    input uwire id_4,
    output uwire id_5
);
  assign module_1.type_6 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input wire id_1,
    input tri1 id_2,
    output logic id_3,
    output wire id_4,
    input tri0 id_5,
    input supply1 id_6,
    input wire id_7,
    input tri id_8,
    input wire id_9,
    output wire id_10,
    input wor id_11,
    inout tri id_12,
    input tri0 id_13,
    input tri id_14,
    input supply1 id_15,
    input tri id_16
);
  assign id_0 = id_8;
  always id_10 = 1;
  always_comb begin : LABEL_0
    id_18(.id_0(1'b0), .id_1(id_10), .id_2(1), .id_3(1), .id_4(id_10), .id_5(id_1),
          .id_6((id_10 + "")), .id_7(id_9));
    if (id_14)
      if (1) id_0 = ~(1);
      else id_3 <= 1;
  end
  module_0 modCall_1 (
      id_15,
      id_12,
      id_6,
      id_2,
      id_2,
      id_12
  );
  wire id_19;
  always
    if (id_1) begin : LABEL_0
      assume (id_11);
    end else begin : LABEL_0
      @(*);
      id_4 = 1;
    end
  assign id_10 = 1;
  assign id_4  = id_6 == 1'b0;
endmodule
