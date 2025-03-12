// Seed: 108605065
module module_0 (
    output supply0 id_0,
    output wand id_1,
    output wor id_2,
    input wand id_3,
    input tri id_4,
    output wor id_5
);
  wire id_7;
  wire id_8;
  ;
  wire  id_9;
  logic id_10;
  ;
  wire id_11;
  final $clog2(63);
  ;
  wire id_12;
  ;
endmodule
module module_1 #(
    parameter id_16 = 32'd69,
    parameter id_3  = 32'd63,
    parameter id_9  = 32'd22
) (
    output supply0 id_0,
    input tri id_1,
    input wor id_2,
    output tri _id_3,
    input tri id_4,
    input wor id_5,
    input uwire id_6,
    output uwire id_7,
    input wand id_8,
    input tri0 _id_9,
    output wor id_10,
    output supply1 id_11,
    output tri0 id_12
    , id_15,
    output logic id_13
);
  function void _id_16;
    input [1 : id_9] id_17;
    logic [id_3 : -1] id_18;
    begin : LABEL_0
      if (1) begin : LABEL_1
        $clog2(86);
        ;
        id_13 <= id_16;
      end else begin : LABEL_2
        SystemTFIdentifier(1, id_15[id_16], -1);
        id_13 = #id_19 id_18;
      end
    end
  endfunction
  wire id_20;
  module_0 modCall_1 (
      id_7,
      id_10,
      id_12,
      id_8,
      id_4,
      id_7
  );
  parameter id_21 = -1'b0 / 1;
  always @* {1, -1} = id_1;
  initial begin
    _id_16(id_21);
  end
endmodule
