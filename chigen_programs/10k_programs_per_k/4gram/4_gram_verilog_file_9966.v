// Seed: 1509370654
module module_0 (
    input tri1 id_0,
    input wor id_1,
    input wand id_2,
    output logic id_3,
    output supply1 id_4,
    input supply0 id_5,
    output tri0 id_6,
    input tri1 id_7,
    input wand id_8,
    input uwire id_9,
    output tri1 id_10
);
  generate
    assign id_3 = 1;
  endgenerate
  always
  fork : SymbolIdentifier
    id_3 = id_2;
  join : SymbolIdentifier
endmodule
module module_1 #(
    parameter id_8 = 32'd92
) (
    input wor id_0,
    output uwire id_1,
    input wor id_2,
    output wor id_3,
    output supply1 id_4,
    output tri1 id_5,
    output logic id_6,
    input supply1 id_7,
    input tri0 _id_8,
    input tri id_9,
    input tri1 id_10,
    output logic id_11,
    input wor id_12,
    input wand id_13,
    input supply1 id_14,
    input supply1 id_15,
    input tri id_16,
    input supply1 id_17,
    output logic id_18,
    output uwire id_19
);
  wire id_21;
  assign id_6 = id_2 == 1'b0;
  wire ["" : id_8] id_22;
  logic id_23;
  ;
  module_0 modCall_1 (
      id_2,
      id_10,
      id_2,
      id_18,
      id_4,
      id_0,
      id_3,
      id_12,
      id_17,
      id_13,
      id_3
  );
  assign modCall_1.id_3 = 0;
  parameter id_24 = 1;
  nmos (-1, id_8);
  initial begin : LABEL_0
    fork
      if (1'b0) begin : LABEL_1
      end else begin : LABEL_2
        if (-1) begin : LABEL_3
          id_6 = id_15;
        end else begin : LABEL_4
          id_11 <= id_0;
        end
      end
      id_18 <= 1;
    join
  end
  wire id_25;
  wire [-1 : 1 'b0] id_26;
  logic id_27;
endmodule
