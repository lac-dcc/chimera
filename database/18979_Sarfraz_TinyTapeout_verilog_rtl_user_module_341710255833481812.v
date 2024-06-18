// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

module CodeLUT_339800239192932947(input CLK,  input RST,
  input [3:0] ancilla,
  output [4:0] correction,
  output [1:0] axis);

  // 3 cycle in-to-out delay. fully pipelined.
  reg [3:0] ancilla_r;

  reg [1:0] axis_r;
  reg [4:0] correction_r;
  reg [1:0] axis_calc;

  assign correction = correction_r;
  assign axis = axis_r;

  always @(posedge CLK) begin
    if (RST) begin
      ancilla_r <= 0;
    end else begin
      ancilla_r <= ancilla;
    end
  end

  always @(posedge CLK) begin
    if (RST) begin
      axis_r <= 2'b00;
      correction_r <= 0;
      axis_calc <= 2'b00;
    end else begin
      if (axis_calc == 2'b00) begin
        correction_r <= 0;
        axis_calc <= 2'b01;
        axis_r <= axis_calc;
      end else if (axis_calc == 2'b01) begin // x
        case(ancilla_r)
          4'b0001: correction_r <= 5'b10000;
          4'b1000: correction_r <= 5'b01000;
          4'b1100: correction_r <= 5'b00100;
          4'b0110: correction_r <= 5'b00010;
          4'b0011: correction_r <= 5'b00001;
          default: correction_r <= 5'b00000;
        endcase
        axis_calc <= 2'b10;
        axis_r <= axis_calc;
      end else if (axis_calc == 2'b10) begin // y
        case(ancilla_r)
          4'b1011: correction_r <= 5'b10000;
          4'b1101: correction_r <= 5'b01000;
          4'b1110: correction_r <= 5'b00100;
          4'b1111: correction_r <= 5'b00010;
          4'b0111: correction_r <= 5'b00001;
          default: correction_r <= 5'b00000;
        endcase
        axis_calc <= 2'b11;
        axis_r <= axis_calc;
      end else if (axis_calc == 2'b11) begin // z
        case(ancilla_r)
          4'b1010: correction_r <= 5'b10000;
          4'b0101: correction_r <= 5'b01000;
          4'b0010: correction_r <= 5'b00100;
          4'b1001: correction_r <= 5'b00010;
          4'b0100: correction_r <= 5'b00001;
          default: correction_r <= 5'b00000;
        endcase
        axis_calc <= 2'b01;
        axis_r <= axis_calc;
      end
    end
  end

endmodule

module user_module_341710255833481812(
  input [7:0] io_in,
  output [7:0] io_out
);

wire CLK;
assign CLK = io_in[0];
wire RST;
assign RST = io_in[1];
wire [3:0] ancilla;
assign ancilla = io_in[6:3];

wire [4:0] correction;
wire [1:0] axis;
assign io_out = {1'b0, axis, correction};

  CodeLUT_339800239192932947 codelut(
    CLK, RST,
    ancilla,
    correction,
    axis);

endmodule
