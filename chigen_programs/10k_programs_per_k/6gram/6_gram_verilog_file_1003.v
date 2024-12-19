// Seed: 158501655
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_11;
endmodule
module module_1 (
    input tri1 id_0,
    output tri0 id_1,
    output tri0 id_2,
    output tri0 id_3,
    input supply1 id_4,
    input tri0 id_5,
    input tri0 id_6,
    input uwire id_7,
    input tri1 id_8,
    output wire id_9
    , id_18,
    output tri id_10,
    input tri1 id_11,
    input tri id_12,
    input supply1 id_13,
    input tri id_14,
    input uwire id_15,
    output uwire id_16
);
  wire id_19;
  module_0 modCall_1 (
      id_19,
      id_19,
      id_19,
      id_18,
      id_18,
      id_18,
      id_18,
      id_19,
      id_19,
      id_19
  );
  wire id_20;
  always @(negedge 1)
    if (1) begin : LABEL_0
      if (id_12) begin : LABEL_0
        id_16 = 1;
      end
    end else if (id_4 && id_15)
      if (id_5) begin : LABEL_0
        if ((id_18 + id_5 || 1)) disable id_21;
        else $display(id_5);
      end
endmodule
