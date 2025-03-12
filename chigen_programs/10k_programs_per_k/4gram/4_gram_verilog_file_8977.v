// Seed: 1071669780
module module_0 (
    input tri1 id_0,
    output tri0 id_1,
    output supply1 id_2,
    output tri0 id_3,
    input wand id_4,
    input supply1 id_5,
    input supply0 id_6,
    input supply1 id_7,
    input tri1 id_8,
    input wire id_9,
    output wand id_10,
    input wor id_11,
    input tri0 id_12,
    input wire id_13,
    input tri id_14
);
  assign id_3 = id_11 ? id_8 : id_3++;
  assign module_1.id_16 = 0;
  wire id_16;
endmodule
module module_1 #(
    parameter id_14 = 32'd39,
    parameter id_6  = 32'd51
) (
    input supply1 id_0,
    input wand id_1,
    input uwire id_2,
    output logic id_3,
    output uwire id_4,
    input tri0 id_5
    , id_23,
    output wire _id_6,
    output wor id_7,
    output tri1 id_8,
    input wand id_9,
    output wor id_10,
    output supply0 id_11,
    output supply0 id_12,
    input uwire id_13,
    input tri0 _id_14,
    output tri1 id_15,
    output tri1 id_16,
    input wor id_17,
    input supply0 id_18
    , id_24,
    output logic id_19,
    output tri id_20,
    input uwire id_21
);
  assign id_16 = id_9;
  always @(posedge id_2) begin : LABEL_0
    id_3 = -1;
  end
  module_0 modCall_1 (
      id_9,
      id_10,
      id_20,
      id_8,
      id_9,
      id_2,
      id_0,
      id_17,
      id_18,
      id_13,
      id_12,
      id_1,
      id_9,
      id_0,
      id_0
  );
  if (1'b0) begin : LABEL_1
    struct packed {
      struct packed {id_25 id_26;} [(  -1  !=  id_14  ) : 1] id_27;
      logic [id_6 : -1] id_28;
    } id_29 = id_23;
  end else begin : LABEL_2
    assign id_16 = id_0;
    assign id_16 = -1'b0;
    if (~1) begin : LABEL_3
      assign id_20 = -1 ? id_13 : id_18;
    end else begin : LABEL_4
      assign id_24 = "";
    end
    always @(posedge id_18 or posedge id_9) begin : LABEL_5
      if (-1'b0) begin : LABEL_6
        ;
      end else if (-1) id_19 <= id_2;
      id_19 = -1'b0;
    end
    logic id_30;
  end
endmodule
