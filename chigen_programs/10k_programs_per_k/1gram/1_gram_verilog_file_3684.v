// Seed: 152197316
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign module_1.id_9 = 0;
  logic id_5;
  ;
endmodule
module module_1 (
    input tri1 id_0,
    output supply0 id_1,
    output logic id_2,
    output logic id_3,
    input tri0 id_4,
    input supply1 id_5,
    input uwire id_6,
    input uwire id_7,
    output logic id_8,
    input uwire id_9,
    input wire id_10,
    output tri0 id_11,
    input supply0 id_12
);
  always @(id_9(id_9 == id_4,
      id_5
  ))
  begin : LABEL_0
    @(posedge -1 ? 1 : 1) id_8 = 1;
  end
  assign id_11 = -1;
  always if (1) id_2 <= "";
  parameter id_14[-1 : -1  &&  -1] = 1;
  reg id_15, id_16;
  wire id_17;
  module_0 modCall_1 (
      id_14,
      id_17,
      id_14,
      id_17
  );
  wire id_18;
  ;
  initial begin : LABEL_1
    id_8 = 1;
    if (id_14)
      if ("") id_8 <= id_6;
      else
        @(id_14 or posedge 1'h0) begin : LABEL_2
          id_2 <= id_16;
          id_8 = -1;
          @(posedge id_15) @(id_0 ? id_18 : -1) wait (id_14.id_17) id_15 <= id_6;
          id_3 <= id_16;
        end
  end
  wire id_19;
endmodule
