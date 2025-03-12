// Seed: 3207835426
program module_0 (
    input tri0 id_0,
    input uwire id_1,
    input tri id_2,
    output wand id_3,
    output wire id_4,
    input supply0 id_5,
    input wand id_6,
    input tri0 id_7,
    input tri1 id_8,
    input supply0 id_9,
    input tri0 id_10,
    input tri id_11,
    output wand id_12,
    output wire id_13,
    output uwire id_14,
    input supply1 id_15,
    input tri id_16,
    output supply1 id_17,
    input uwire id_18,
    input uwire id_19,
    input supply0 id_20,
    input wor id_21,
    output wand id_22
);
  assign module_1.id_12 = 0;
endprogram
module module_1 #(
    parameter id_1 = 32'd53,
    parameter id_4 = 32'd26
) (
    input supply1 id_0,
    input tri _id_1[~|  -1 : id_4],
    inout wire id_2,
    input tri1 id_3,
    input tri0 _id_4
);
  wire id_6;
  ;
  assign id_2 = id_6;
  logic [7:0][id_1] id_7;
  wire id_8 = id_4;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_3,
      id_2,
      id_2,
      id_3,
      id_2,
      id_0,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_0,
      id_2,
      id_3,
      id_0,
      id_3,
      id_0,
      id_2
  );
  assign id_8 = id_2;
  if (1) begin : LABEL_0
    begin : LABEL_1
      parameter id_9 = 1;
    end
  end else begin : LABEL_2
    begin : LABEL_3
      logic id_10;
      ;
      assign id_7 = id_8;
      logic id_11;
      begin : LABEL_4
        assign id_7 = 1;
      end
    end
  end
  supply1 id_12 = 1;
  always $unsigned(33);
  ;
endmodule
