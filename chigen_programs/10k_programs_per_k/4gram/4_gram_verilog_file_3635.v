// Seed: 387419369
module module_0 (
    input tri1 id_0,
    output tri0 id_1,
    input tri0 id_2,
    input wor id_3,
    inout supply0 id_4,
    input wire id_5,
    input wor id_6,
    output supply0 id_7,
    output wire id_8,
    output supply0 id_9,
    output tri1 id_10,
    input wand id_11,
    input supply1 id_12,
    output tri1 id_13,
    input wor id_14,
    input supply1 id_15,
    input supply0 id_16,
    input tri0 id_17,
    input supply1 id_18,
    input tri id_19,
    output supply1 id_20,
    input wor id_21,
    output tri id_22,
    input uwire id_23,
    input tri0 id_24,
    output wand id_25
);
  assign id_20 = 1;
  assign module_1.type_24 = 0;
  wire id_27;
  tri0 id_28;
  assign id_10 = id_0;
  assign id_28 = id_17;
endmodule
module module_1 (
    input tri0 id_0,
    input logic id_1,
    input wand id_2,
    output wand id_3,
    output supply0 id_4,
    input wand id_5,
    output tri1 id_6,
    input tri1 id_7
    , id_15,
    input wor id_8,
    input wand id_9,
    output supply0 id_10,
    output logic id_11,
    input wor id_12,
    input wor id_13
);
  tri0 id_16;
  module_0 modCall_1 (
      id_16,
      id_10,
      id_2,
      id_5,
      id_16,
      id_2,
      id_8,
      id_4,
      id_10,
      id_16,
      id_3,
      id_8,
      id_9,
      id_10,
      id_2,
      id_8,
      id_0,
      id_13,
      id_8,
      id_7,
      id_3,
      id_13,
      id_6,
      id_7,
      id_7,
      id_10
  );
  string id_17;
  always @(posedge 1) begin : LABEL_0
    if (id_7)
      if (id_8)
        forever begin : LABEL_0
          id_4  = id_0;
          id_10 = id_16;
          `define pp_18 0
          if (1'b0) begin : LABEL_0
            if (1) id_11 = id_1;
            else id_11 <= 1;
          end
        end
      else begin : LABEL_0
        id_17 = "";
      end
  end
  wire id_19;
  wor id_20, id_21, id_22;
  assign id_20 = 1;
endmodule
