// Seed: 4266749623
module module_0 (
    input tri id_0,
    output logic id_1,
    output logic id_2,
    input wor id_3,
    input supply1 id_4
);
  always
    if (1)
      if (1) begin : LABEL_0
        id_1 = id_0;
        @(posedge id_4) begin : LABEL_1
          if (1) id_2 <= -1'b0;
          else id_1 <= -1'b0;
        end
        id_1 <= id_3;
        if (1) #id_6 id_2 = -1;
        else id_6 <= id_0 ? id_3 : id_0;
      end else
        case (id_0)
          -1: id_1 = #1 -1;
          -1: ;
        endcase
    else id_1 <= id_3;
  initial id_1 <= id_4;
endmodule
module module_1 #(
    parameter id_1 = 32'd62,
    parameter id_2 = 32'd70,
    parameter id_3 = 32'd96,
    parameter id_8 = 32'd81
) (
    output logic id_0
    , id_13,
    output wire _id_1,
    input wor _id_2,
    output supply1 _id_3,
    input wor id_4,
    input tri0 id_5,
    input uwire id_6,
    output wand id_7,
    input tri1 _id_8,
    output supply0 id_9,
    output tri0 id_10,
    input wire id_11
);
  logic [id_3  +  id_1 : 1] id_14 = id_6;
  logic [7:0][id_8  <  -1] id_15;
  wire id_16;
  logic id_17;
  ;
  logic [7:0][1] id_18 = -1;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_0,
      id_6,
      id_4
  );
  assign modCall_1.id_3 = 0;
  wire id_19;
  wire id_20 = id_13[-1&&id_2];
  always id_0 <= id_4;
endmodule
