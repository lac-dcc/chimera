// Seed: 2208668000
module module_0 (
    output wand id_0,
    input uwire id_1,
    input supply1 id_2,
    input supply1 id_3,
    input tri id_4,
    output uwire id_5
);
  assign id_0 = 1 && id_1;
endmodule
module module_1 #(
    parameter id_10 = 32'd88,
    parameter id_3  = 32'd92
) (
    input tri1 id_0,
    input tri0 id_1
    , id_15,
    input tri1 id_2,
    input tri0 _id_3,
    input tri id_4,
    input wor id_5,
    output wor id_6,
    input supply1 id_7,
    output logic id_8,
    input wor id_9,
    input tri0 _id_10,
    output uwire id_11,
    input uwire id_12,
    output logic id_13
);
  always id_8 <= id_15;
  logic id_16;
  module_0 modCall_1 (
      id_6,
      id_4,
      id_5,
      id_9,
      id_5,
      id_6
  );
  assign id_6 = (id_15);
  logic [id_10 : 1] id_17 = -1;
  logic id_18, id_19;
  assign id_17 = -1;
  logic [1 : id_3] id_20 = -1;
  assign id_17 = 1'b0;
  assign id_15[1] = {id_7, -1};
  always
    case (1)
      1: cover (1);
      id_16: id_13 <= -1;
      id_17: begin : LABEL_0
        if (1) begin : LABEL_1
          $clog2(77);
          ;
        end
      end
    endcase
  parameter id_21 = 1;
  wire id_22;
endmodule
