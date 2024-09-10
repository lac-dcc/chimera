// Seed: 1305549786
module module_0 #(
    parameter id_11 = 32'd25,
    parameter id_19 = 32'd84,
    parameter id_30 = 32'd27,
    parameter id_5  = 32'd36,
    parameter id_6  = 32'd5
) (
    input logic id_1,
    input reg id_2,
    input logic id_3,
    input logic id_4,
    input _id_5,
    input _id_6,
    input id_7,
    input logic id_8,
    output logic id_9,
    input id_10,
    output logic _id_11,
    input logic id_12
);
  reg   id_13;
  logic id_14;
  logic id_15 = 1;
  logic id_16;
  type_43(
      1'b0, 1'h0, 1
  );
  logic id_17;
  reg   id_18;
  always @(posedge 1) id_11 <= #1 id_13;
  assign id_14 = 1;
  always @(id_12) id_18 = 1;
  type_46(
      1'b0 * id_2, id_8
  );
  integer _id_19 (
      .id_0(id_9 == id_4[~id_11]),
      .id_1(id_7),
      .id_2('b0),
      .id_3(1),
      .id_4(id_12),
      .id_5((1))
  );
  logic id_20 = 1;
  assign id_10 = 1;
  defparam id_21.id_22 = 'b0;
  assign id_22 = 1;
  assign id_1  = id_19;
  reg id_23;
  assign id_19[1'b0] = id_1;
  always begin
    id_2 <= id_18;
    if (1) begin
      SystemTFIdentifier(id_1[1]);
      case (id_6)
        ~id_18: id_1 = 1;
        id_14:  id_23 = id_13[id_19*id_6 : 1];
        id_3:   id_13 = id_18;
        default: begin
          id_22 = id_1;
        end
      endcase
    end
  end
  logic id_24;
  logic id_25;
  assign id_10[id_5] = id_12;
  function id_26;
    input id_27;
    input id_28;
    input id_29;
    input integer _id_30;
    integer id_31;
    begin
      id_11 = id_31;
    end
  endfunction
  assign id_22[id_30[""]] = 1;
  assign id_1 = 1 == 1;
endmodule
`timescale 1ps / 1ps `timescale 1 ps / 1 ps
module module_1 (
    input  id_1,
    output id_2
);
  logic id_3 = 1;
endmodule
