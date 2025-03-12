// Seed: 878947285
module module_0 (
    output tri0 id_0,
    input  tri1 id_1
);
  parameter id_3 = (-1'h0);
endmodule
module module_1 #(
    parameter id_9 = 32'd46
) (
    input tri id_0,
    output logic id_1,
    output tri0 id_2,
    input uwire id_3,
    output supply0 id_4,
    output wor id_5,
    input tri0 id_6,
    input supply1 id_7,
    output logic id_8,
    input tri _id_9,
    input supply0 id_10,
    input wire id_11
);
  always
  fork : SymbolIdentifier
  join : SymbolIdentifier
  assign id_8 = id_10;
  parameter id_13 = 1;
  logic id_14 = 1;
  reg [id_9 : 1] id_15;
  always @(1)
    if (-1) begin : LABEL_0
      id_15 = id_13 * -1 + id_13;
    end else begin : LABEL_1
      id_1 <= 1;
    end
  module_0 modCall_1 (
      id_2,
      id_10
  );
  assign modCall_1.SymbolIdentifier.SymbolIdentifier.id_1 = 0;
  logic id_16;
  parameter id_17 = id_13 - id_13;
  assign id_14 = id_17 !=? -1;
  assign id_16 = id_16 ? id_13 : id_17;
  always @(posedge id_3) begin : LABEL_2
    case (-1)
      id_3: begin : LABEL_3
        if (1 & id_13[-1 : 1]) id_16 <= id_16;
        else begin : LABEL_4
          id_16 = 1'b0;
          wait (1'b0);
          id_8 <= #1 id_16 - id_16 !== -1;
          $signed(60);
          ;
        end
      end
      default id_16 = 1'b0;
    endcase
    if (id_13) id_14 <= id_6;
    else begin : LABEL_5
      id_14 <= id_7;
      id_15 <= id_7;
    end
  end
  logic id_18;
  ;
  wire id_19;
endmodule
