// Seed: 1068785464
module module_0 #(
    parameter id_23 = 32'd59
) (
    input tri1 id_0,
    input wire id_1,
    output logic id_2,
    input supply0 id_3,
    output tri1 id_4,
    output logic id_5,
    input tri0 id_6,
    output logic id_7,
    input tri id_8
    , id_19,
    input tri0 id_9,
    input tri0 id_10,
    input wand id_11,
    input tri1 id_12,
    input tri0 id_13,
    input wand id_14,
    input supply1 id_15,
    input supply1 id_16,
    input supply1 id_17
);
  always @(id_12 & id_11 or posedge -1) begin : LABEL_0
    $unsigned(87);
    ;
    id_19 = id_3;
    id_5  = -1'b0 - -1 == id_1;
    if (1) begin : LABEL_1
      do begin : LABEL_2
        id_7 <= id_19;
      end while (-1);
    end
    id_2 <= -1;
  end
  localparam id_20 = 1;
  logic [7:0] id_21;
  logic [7:0] id_22;
  assign id_22#(
      .id_22(id_20),
      .id_13(-1),
      .id_21(id_20 - id_20),
      .id_16(1),
      .id_13(1)
  ) = id_13;
  assign id_4 = 1;
  wire _id_23;
  assign id_2 = 1;
  wire id_24;
  assign id_2 = id_10;
  assign module_1.id_0 = 0;
  always @(posedge id_21[1 : 1] or posedge -1 - -1) begin : LABEL_3
    id_22[id_23] = 1'h0;
  end
  assign id_2 = id_16;
endmodule
module module_1 (
    input wor id_0,
    output wire id_1,
    input wire id_2,
    output uwire id_3,
    input tri id_4,
    input tri id_5,
    output tri1 id_6,
    output logic id_7,
    output supply1 id_8,
    input wor id_9
);
  assign id_6 = -1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_7,
      id_9,
      id_6,
      id_7,
      id_2,
      id_7,
      id_2,
      id_9,
      id_4,
      id_0,
      id_2,
      id_0,
      id_9,
      id_4,
      id_4,
      id_4
  );
  id_11 :
  assert property (@(posedge id_5 - id_2) id_2)
  else begin : LABEL_0
    id_7 = id_4;
  end
  wire id_12;
endmodule
