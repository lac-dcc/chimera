// Seed: 601273687
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
    id_10,
    id_11,
    id_12
);
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  logic id_13;
endmodule
module module_1 #(
    parameter id_13 = 32'd56,
    parameter id_8  = 32'd60
) (
    output tri0 id_0,
    input uwire id_1,
    input wor id_2,
    input tri1 id_3,
    output logic id_4,
    output logic id_5
    , id_21,
    input tri id_6,
    input tri id_7,
    input tri0 _id_8,
    input uwire id_9,
    output logic id_10,
    output wor id_11,
    input tri id_12,
    input supply0 _id_13,
    input uwire id_14,
    input supply0 id_15[-1 : id_8  .  id_13],
    input tri1 id_16,
    input supply0 id_17,
    input tri id_18,
    input tri1 id_19
);
  struct packed {id_22 id_23;} id_24 = id_24.id_23;
  module_0 modCall_1 (
      id_21,
      id_21,
      id_21,
      id_23,
      id_22,
      id_22,
      id_23,
      id_24,
      id_24,
      id_21,
      id_21,
      id_22
  );
  assign id_24 = id_8;
  assign id_10 = 1 && id_19;
  always_latch #(-1'b0) begin : LABEL_0
    @(id_2 or -1) begin : LABEL_1
      #1;
      begin : LABEL_2
        if (1) begin : LABEL_3
          id_5 = 1;
        end
        begin : LABEL_4
          wait (1'b0) id_10 <= 1;
        end
      end
    end
    disable id_25;
  end
  assign id_10 = 1;
  wire [1 : -1] id_26;
  if (-1) always id_24.id_22 = -1'b0;
  else always id_4 = -1;
  logic id_27;
  and primCall (id_10, id_22, id_17, id_21, id_19, id_14, id_15, id_12, id_24, id_23, id_9, id_18);
endmodule
