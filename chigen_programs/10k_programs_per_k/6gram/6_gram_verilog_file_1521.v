// Seed: 3677561794
module module_0 (
    output tri0 id_0,
    input supply0 id_1,
    input tri1 id_2,
    output uwire id_3,
    input supply0 id_4,
    output supply1 id_5
);
  wire id_7;
  localparam id_8 = 1;
  logic id_9;
endmodule
module module_1 (
    output tri0 id_0,
    input wand id_1,
    output supply1 id_2
);
  assign id_2 = id_1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.id_5 = 0;
endmodule
program module_2 (
    input wor id_0,
    output tri1 id_1,
    input supply0 id_2,
    output logic id_3,
    output uwire id_4,
    input wand id_5,
    input tri id_6,
    input wor id_7,
    output wire id_8
);
  generate
    if (-1) begin : LABEL_0
      always @(-1 == -1'd0 or posedge id_6 > -1) begin : LABEL_1
        id_3 <= {-1 << id_5{-1}};
      end
    end else begin : LABEL_2
      wire id_10;
      ;
    end
  endgenerate
  module_0 modCall_1 (
      id_4,
      id_2,
      id_0,
      id_8,
      id_5,
      id_8
  );
  assign modCall_1.id_0 = 0;
endprogram
